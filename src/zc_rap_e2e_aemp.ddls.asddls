@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption view for ZI_RAP_E2E_AEMP'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['EmployeeID']
define root view entity ZC_RAP_E2E_AEMP
  as projection on ZI_RAP_E2E_aEMP
{
      @EndUserText.label: 'EmployeeUUID'
  key EmployeeUUID,
      @EndUserText.label: 'EmployeeID'
      EmployeeID,
      @EndUserText.label: 'First Name'
      FirstName,
      @EndUserText.label: 'Last Name'
      LastName,
      @EndUserText.label: 'Date of Birth'
      DateOfBirth,
      @EndUserText.label: 'IsActive'
      Active,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _Employment : redirected to composition child ZC_RAP_E2E_AEMPL
}
