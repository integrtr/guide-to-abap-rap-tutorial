CLASS lhc_Employee DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS validateAge FOR VALIDATE ON SAVE
      IMPORTING keys FOR Employee~validateAge.
    METHODS assignIDs FOR DETERMINE ON SAVE
      IMPORTING keys FOR Employee~assignIDs.

    METHODS hireEmployee FOR MODIFY
      IMPORTING keys FOR ACTION Employee~hireEmployee RESULT result .
    METHODS retireEmployee FOR MODIFY
      IMPORTING keys FOR ACTION Employee~retireEmployee RESULT result.
    METHODS get_features FOR FEATURES
      IMPORTING keys REQUEST requested_features FOR Employee RESULT result.
ENDCLASS.

CLASS lhc_Employee IMPLEMENTATION.
  METHOD validateAge.
    DATA: lv_years TYPE int4.
    " Read DOB
    READ ENTITIES OF ZI_RAP_E2E_aEMP IN LOCAL MODE
      ENTITY Employee
        FIELDS ( DateOfBirth ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_emp).

    LOOP AT lt_emp INTO DATA(ls_emp).
      DATA(lv_days) = sy-datum - ls_emp-DateOfBirth.
      lv_years = lv_days DIV 365.
      IF lv_years < 18.
        APPEND VALUE #( %tky = ls_emp-%tky ) TO failed-employee.

        APPEND VALUE #( %tky        = ls_emp-%tky
                        %state_area = 'VALIDATE_AGE'
                        %msg        = NEW zcm_rap_E2E(
                                          severity = if_abap_behv_message=>severity-error
                                          textid = Zcm_rap_e2e=>age_less
                                           ) )
          TO reported-employee.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
  METHOD assignids.
    READ ENTITIES OF ZI_RAP_E2E_aEMP IN LOCAL MODE
        ENTITY Employee
          FIELDS ( EmployeeID ) WITH CORRESPONDING #( keys )
        RESULT DATA(lt_employee).

    " Select max  ID
    SELECT SINGLE
        FROM  zrap_e2e_aemp
        FIELDS MAX( empid ) AS employeeid
        INTO @DATA(lv_max_empid).

    IF lv_max_empid IS INITIAL OR lv_max_empid < 10000000. "Just a starting number
      lv_max_empid = 10000000.
    ENDIF.

    " Set the travel ID
    MODIFY ENTITIES OF ZI_RAP_E2E_aEMP IN LOCAL MODE
    ENTITY Employee
      UPDATE
        FROM VALUE #( FOR emp IN lt_employee INDEX INTO i (
          %tky              = emp-%tky
          EmployeeID          = lv_max_empid + i
          %control-EmployeeID = if_abap_behv=>mk-on ) )
    REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).
  ENDMETHOD.
  METHOD hireEmployee.
    " Set the new overall status
    MODIFY ENTITIES OF ZI_RAP_E2E_aEMP IN LOCAL MODE
      ENTITY Employee
         UPDATE
           FIELDS ( Active )
           WITH VALUE #( FOR key IN keys
                           ( %tky         = key-%tky
                             Active = abap_true ) )
      FAILED failed
      REPORTED reported.

    " Fill the response table
    READ ENTITIES OF ZI_RAP_E2E_aEMP IN LOCAL MODE
      ENTITY Employee
        ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_employee).

    result = VALUE #( FOR ls_employee IN lt_employee
                        ( %tky   = ls_employee-%tky
                          %param = ls_employee ) ).
  ENDMETHOD.
  METHOD retireEmployee.
    " Set the new overall status
    MODIFY ENTITIES OF ZI_RAP_E2E_aEMP IN LOCAL MODE
      ENTITY Employee
         UPDATE
           FIELDS ( Active )
           WITH VALUE #( FOR key IN keys
                           ( %tky         = key-%tky
                             Active = abap_false ) )
      FAILED failed
      REPORTED reported.

    " Fill the response table
    READ ENTITIES OF ZI_RAP_E2E_aEMP IN LOCAL MODE
      ENTITY Employee
        ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_employee).

    result = VALUE #( FOR ls_employee IN lt_employee
                        ( %tky   = ls_employee-%tky
                          %param = ls_employee ) ).
  ENDMETHOD.
  METHOD get_features.
    READ ENTITIES OF ZI_RAP_E2E_AEMP IN LOCAL MODE
       ENTITY Employee
         FIELDS ( Active ) WITH CORRESPONDING #( keys )
       RESULT DATA(lt_employee)
       FAILED failed.

    result =
      VALUE #(
        FOR ls_employee IN lt_employee
          LET is_active =   COND #( WHEN ls_employee-Active = abap_true
                                      THEN if_abap_behv=>fc-o-disabled
                                      ELSE if_abap_behv=>fc-o-enabled  )
              is_not_active =   COND #( WHEN ls_employee-Active = abap_false
                                      THEN if_abap_behv=>fc-o-disabled
                                      ELSE if_abap_behv=>fc-o-enabled )
          IN
            ( %tky                 = ls_employee-%tky
              %action-hireEmployee = is_active
              %action-retireEmployee = is_not_active
             ) ).
  ENDMETHOD.
ENDCLASS.

CLASS lhc_Employment DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS assignAdditonalInfo FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Employment~assignAdditionalInfo.

    METHODS checkPositionAssigned FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Employment~checkPositionAssigned.

ENDCLASS.

CLASS lhc_Employment IMPLEMENTATION.

  METHOD assignadditonalinfo.
    READ ENTITIES OF ZI_RAP_E2E_aEMP
    ENTITY Employment
    FIELDS ( PositionId )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_employment).

    READ TABLE lt_employment INTO DATA(ls_employment) INDEX 1.
    SELECT SINGLE * FROM zi_rap_e2e_apos WHERE PositionId = @ls_employment-PositionId INTO @DATA(ls_positionInfo).


    MODIFY ENTITIES OF ZI_RAP_E2E_aEMP IN LOCAL MODE
    ENTITY Employment
    UPDATE FIELDS ( EmployeePosition Salary )
    WITH VALUE #( FOR ls_emp IN lt_employment
    ( %key = ls_emp-%key
    EmployeePosition = ls_positioninfo-EmployeePosition
    Salary = ls_positioninfo-Salary
     )
    ) REPORTED DATA(modReported).
    reported = CORRESPONDING #( DEEP modReported ).

  ENDMETHOD.
  METHOD checkpositionassigned.
    READ ENTITIES OF zi_rap_e2e_aemp IN LOCAL MODE
    ENTITY Employment
    FIELDS ( EmployeeUUID )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_emp_poschk).
    READ TABLE lt_emp_poschk INTO DATA(ls_emp_poschk) INDEX 1.
    SELECT SINGLE * FROM zrap_e2e_aempl WHERE emp_uuid = @ls_emp_poschk-EmployeeUUID INTO @DATA(ls_e2e_aempl).
    IF sy-subrc EQ 0.
      "APPEND VALUE #( %tky = ls_emp_poschk-%tky ) TO failed-employment.

      APPEND VALUE #( %tky        = ls_emp_poschk-%tky
                      %state_area = 'CHECK_POSITION_ASSIGNED'
                      %msg        = NEW zcm_rap_E2E(
                                        severity = if_abap_behv_message=>severity-error
                                        textid = Zcm_rap_e2e=>pos_assgn
                                         ) )
        TO reported-employment.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
