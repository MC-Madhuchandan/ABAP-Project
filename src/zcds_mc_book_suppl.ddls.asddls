@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Booking'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_mc_book_suppl
  as select from /dmo/booksuppl_m
  association        to parent zcds_mc_booking as _booking    on  $projection.BookingId = _booking.BookingId
                                                              and $projection.TravelId  = _booking.TravelId
  association [1..1] to ZCDS_MC_TRAVEL         as _travel     on  $projection.TravelId = _travel.TravelId
  association [1..1] to /DMO/I_Supplement      as _suppl      on  $projection.SupplementId = _suppl.SupplementID
  association [1..*] to /DMO/I_SupplementText  as _suppl_text on  $projection.SupplementId = _suppl_text.SupplementID
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'Currencycode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,

      //Expose Assosciation
      _travel,
      _suppl,
      _suppl_text,
      _booking
}
