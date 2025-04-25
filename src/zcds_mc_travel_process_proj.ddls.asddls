@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS projection view for travel'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zcds_mc_travel_process_proj
  as projection on ZCDS_MC_TRAVEL
{
      @ObjectModel.text.element: [ 'Description' ]
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Consumption.valueHelpDefinition: [{
      entity.name: '/DMO/I_Agency',
      entity.element: 'AgencyID'
       }]
      AgencyId,
      @Semantics.text: true
      _AGENCY.Name       as AgencyName,

      @ObjectModel.text.element: [ 'Customername' ]
      @Consumption.valueHelpDefinition: [{
       entity.name: '/DMO/I_Customer',
       entity.element: 'CustomerID'
      }]
      CustomerId,
      @Semantics.text: true
      _CUSTOMER.LastName as Customername,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      @Semantics.text: true
      Description,
      Criticality,
      @Semantics.text: true
      StatusText,

      @ObjectModel.text.element: [ 'StatusText' ]
      @Consumption.valueHelpDefinition: [{
          entity.name: '/DMO/I_Overall_Status_VH',
          entity.element: 'OverallStatus'
       }]
      OverallStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _AGENCY,
      _booking,
      _CURRENCY,
      _CUSTOMER,
      _OVERALL_STAT
}
