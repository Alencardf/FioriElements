CLASS zcl_calc_view_hb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_calc_view_hb IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA(lv_today) = ( cl_abap_context_info=>get_system_date( ) ) + 10.

    DATA tl_saida TYPE TABLE OF zc_travel_hb.

    tl_saida = CORRESPONDING #( it_original_data ).

    LOOP AT tl_saida ASSIGNING FIELD-SYMBOL(<fs_saida>).
      <fs_saida>-data_hba = lv_today.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( tl_saida ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.