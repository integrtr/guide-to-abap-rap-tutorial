@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View for ZRAP_E2E_APOS'
define view entity ZI_RAP_E2E_APOS
  as select from zrap_e2e_apos
{
  key position_id as PositionId,
      e_position  as EmployeePosition,
      salary      as Salary
}
