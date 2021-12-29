CLASS zcm_rap_e2e DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .
    CONSTANTS:
      BEGIN OF age_less,
        msgid TYPE symsgid VALUE 'ZRAP_E2E_MSG',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF age_less ,
      BEGIN OF pos_assgn,
        msgid TYPE symsgid VALUE 'ZRAP_E2E_MSG',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF pos_assgn .
    METHODS constructor
      IMPORTING
        severity TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid   LIKE if_t100_message=>t100key OPTIONAL
        previous LIKE previous OPTIONAL .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCM_RAP_E2E IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.
  ENDMETHOD.
ENDCLASS.
