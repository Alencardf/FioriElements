CLASS zcl_calc_view_hb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
    methods:
      read_entity_travel
        importing travelid type /dmo/travel_id
        returning value(result) type /dmo/travel,
      calculate_days
        importing begin_date type /dmo/begin_date
        returning value(result) type i.
ENDCLASS.



CLASS zcl_calc_view_hb IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    data: travels type table of zc_travel_hb.

    travels = corresponding #( it_original_data ).

    loop at travels assigning field-symbol(<travel>).

      data(travel) = me->read_entity_travel( <travel>-travelid ).

      <travel>-data_hba = me->calculate_days( travel-Begin_Date ).

    endloop.

    ct_calculated_data = corresponding #( travels ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.

  method read_entity_travel.
    select single *
      from /dmo/travel
      where
        travel_id eq @travelid
      into
        @data(travel).

    result = travel.
  endmethod.

  method calculate_days.

    data(actual_day) = cl_abap_context_info=>get_system_date( ).

    result = actual_day - begin_date.

  endmethod.
ENDCLASS.