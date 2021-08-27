defmodule HiredHand.Organization do
  alias HiredHand.Organization.{
    Employees,
    Branches,
    Department
  }

  alias Employees.{
    Profile,
    Contact,
    Employment
  }

  defdelegate add_employee_profile_details(branch, department, params),
    to: Profile,
    as: :new

  defdelegate add_employee_contact_details(employee, params),
    to: Contact,
    as: :new

  defdelegate add_employee_employment_details(employee,params),
    to: Employment,
    as: :new

  defdelegate create_branch(params),
    to: Branches,
    as: :new

  defdelegate create_department(params),
    to: Department,
    as: :new
end
