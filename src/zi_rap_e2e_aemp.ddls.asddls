@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View for ZRAP_E2E_AEMP'
define root view entity ZI_RAP_E2E_aEMP
  as select from zrap_e2e_aemp as Employee
  composition [0..*] of ZI_RAP_E2E_AEMPL as _Employment

{
  key emp_uuid              as EmployeeUUID,
      empid                 as EmployeeID,
      first_name            as FirstName,
      last_name             as LastName,
      dob                   as DateOfBirth,
      active                as Active,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      /*Association*/
      _Employment
}
