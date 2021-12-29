CLASS zcl_generate_e2e_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GENERATE_E2E_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_e2e_apos TYPE STANDARD TABLE OF Zrap_e2e_apos.
    lt_e2e_apos = VALUE #(
    ( position_id = 00891922  e_position = 'Frontend Developer' salary = 90000 )
    ( position_id = 00891923  e_position = 'Backend Developer' salary = 90000 )
    ( position_id = 00891924  e_position = 'Full Stack Developer' salary = 100000 )
    ( position_id = 00891925  e_position = 'Product Manager' salary = 85000 )
    ( position_id = 00891926  e_position = 'Senior Developer' salary = 110000 )
    ( position_id = 00891927  e_position = 'VP Development ' salary = 150000 ) ).

    MODIFY zrap_e2e_apos FROM TABLE @lt_e2e_apos.
  ENDMETHOD.
ENDCLASS.
