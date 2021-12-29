@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption view for ZI_RAP_E2E_AEMPL'
@Metadata.allowExtensions: true
define view entity ZC_RAP_E2E_AEMPL
  as projection on ZI_RAP_E2E_AEMPL
{
      @EndUserText.label: 'EmploymentUUID'
  key EmploymentUUID      as EmploymentUUID,
      @EndUserText.label: 'EmployeeUUID'
      EmployeeUUID        as EmployeeUUID,
      @EndUserText.label: 'PositionID'
      @Consumption.valueHelpDefinition: [{ entity: { element: 'PositionId',
                                                     name : 'ZI_RAP_E2E_APOS' } }]
      PositionId          as PositionId,
      @EndUserText.label: 'Position Text'
      EmployeePosition    as EmployeePosition,
      @EndUserText.label: 'Date Of Joining'
      ActiveDateOfJoining as DateOfJoining,
      @EndUserText.label: 'Salary'
      Salary              as salary,
      LocalLastChangedAt as LocalLastChangedAt,
      
      /* Associations */
      _Employee : redirected to parent ZC_RAP_E2E_AEMP
}
