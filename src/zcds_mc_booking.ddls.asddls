@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_mc_booking
  as select from /dmo/booking_m
  //composition
  
  composition[0..*] of zcds_mc_book_suppl as _book_suppl
  
  association        to parent ZCDS_MC_TRAVEL    as _travel      on  $projection.TravelId = _travel.TravelId
  association [1..1] to /DMO/I_Customer          as _customer    on  $projection.CustomerId = _customer.CustomerID
  association [1..1] to /DMO/I_Carrier           as _carrier     on  $projection.CarrierId = _carrier.AirlineID
  association [1..1] to /DMO/I_Connection        as _connection  on  $projection.CarrierId    = _connection.AirlineID
                                                                 and $projection.ConnectionId = _connection.ConnectionID
  association [1..1] to /DMO/I_Booking_Status_VH as _bookingstat on  $projection.BookingStatus = _bookingstat.BookingStatus

{
  key /dmo/booking_m.travel_id       as TravelId,
  key /dmo/booking_m.booking_id      as BookingId,
      /dmo/booking_m.booking_date    as BookingDate,
      /dmo/booking_m.customer_id     as CustomerId,
      /dmo/booking_m.carrier_id      as CarrierId,
      /dmo/booking_m.connection_id   as ConnectionId,
      /dmo/booking_m.flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'Currencycode'
      /dmo/booking_m.flight_price    as FlightPrice,
      /dmo/booking_m.currency_code   as CurrencyCode,
      /dmo/booking_m.booking_status  as BookingStatus,
      @Semantics.systemDateTime.lastChangedAt: true
      /dmo/booking_m.last_changed_at as LastChangedAt,

      //Expose Association
      _customer,
      _carrier,
      _connection,
      _bookingstat,

      _travel,
      _book_suppl


}
