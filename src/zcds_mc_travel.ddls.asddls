@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS VEW FOR TRAVEL'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_MC_TRAVEL
  as select from /dmo/travel_m
  --composition child for travel which is booking
  composition [0..*] of zcds_mc_booking          as _booking

  association [1]    to /DMO/I_Agency               as _AGENCY    on $projection.AgencyId = _AGENCY.AgencyID
  association [1]    to /DMO/I_Customer             as _CUSTOMER  on $projection.CustomerId = _CUSTOMER.CustomerID
  association [1]    to I_Currency                  as _CURRENCY  on $projection.CurrencyCode = _CURRENCY.Currency
  association [1..1] to /DMO/I_Overall_Status_VH as _OVERALL_STAT on $projection.OverallStatus = _OVERALL_STAT.OverallStatus
{

  key travel_id       as TravelId,
      agency_id       as AgencyId,
      customer_id     as CustomerId,
      begin_date      as BeginDate,
      end_date        as EndDate,
      @Semantics.amount.currencyCode: 'Currencycode'
      booking_fee     as BookingFee,
      @Semantics.amount.currencyCode: 'Currencycode'
      total_price     as TotalPrice,
      currency_code   as CurrencyCode,
      description     as Description,
      overall_status  as OverallStatus,

      // This will fill system variables by default
      @Semantics.user.createdBy: true
      created_by      as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at      as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      // Local ETag Field
      last_changed_at as LastChangedAt,

      case overall_status
      when 'O' then 'Open'
      when 'A' then 'Approved'
      when 'R' then 'Rejected'
      when 'X' then 'Cancelled'
      end             as StatusText,

      case overall_status
      when 'O' then 2
      when 'A' then 3
      when 'R' then 1
      when 'X' then 1
      end             as Criticality,
      //Expose associsation
      _AGENCY,
      _CUSTOMER,
      _CURRENCY,
      _OVERALL_STAT,
      _booking
}
