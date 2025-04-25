@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS projection view for booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_MC_booking_PROCESS_PROJ as projection on zcds_mc_booking
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _bookingstat,
    _book_suppl,
    _carrier,
    _connection,
    _customer,
    _travel : redirected to parent zcds_mc_travel_process_proj
}
