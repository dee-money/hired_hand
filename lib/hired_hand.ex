defmodule HiredHand do
  alias HiredHand.Organization.{
    Employees.Profile,
    Branches
  }

  defdelegate create_employee(branch, department, params),
    to: Profile,
    as: :new

  defdelegate create_branch(params),
    to: Branches,
    as: :new
end
