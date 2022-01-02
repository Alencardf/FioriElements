@EndUserText.label: 'Travel'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define root  view entity zc_travel_hb as projection on zi_travel_hb {
  key TravelId,
  AgencyId,
  CustomerId,
  BeginDate,
  EndDate,
  BookingFee,
  TotalPrice,
  CurrencyCode,
  Description,
  Status,
  
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_CALC_VIEW_HB'
  virtual data_hba : abap.dats(8)
  
}
