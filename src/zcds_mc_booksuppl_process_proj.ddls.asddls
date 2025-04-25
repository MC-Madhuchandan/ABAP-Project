@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS projection view for booking supplement'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_MC_booksuppl_PROCESS_PROJ as projection on zcds_mc_book_suppl
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    @Semantics.amount.currencyCode: 'currencycode'
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _booking : redirected to parent ZCDS_MC_booking_PROCESS_PROJ,
    _suppl,
    _suppl_text,
    _travel 
}
