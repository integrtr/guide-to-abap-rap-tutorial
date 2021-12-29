@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface View for ZRAP_E2E_AEMPL'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_RAP_E2E_AEMPL
  as select from zrap_e2e_aempl as Employement
  association to parent ZI_RAP_E2E_aEMP as _Employee on $projection.EmployeeUUID = _Employee.EmployeeUUID
  association to ZI_RAP_E2E_APOS as _Position on $projection.PositionId = _Position.PositionId 
{
  key employment_uuid as EmploymentUUID,
      emp_uuid        as EmployeeUUID,
      position_id     as PositionId,
      e_position      as EmployeePosition,
      active_doj      as ActiveDateOfJoining,
      salary          as Salary,
      local_last_changed_at as LocalLastChangedAt,
      /*Association*/
      _Employee,
      _Position
}
