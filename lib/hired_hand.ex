defmodule HiredHand do
  alias HiredHand.{
    Employee.Detail
  }

  alias HiredHand.Branches.Detail, as: BranchDetail

  defdelegate create_employee(params),
    to: Detail,
    as: :new

  defdelegate create_branch(params),
    to: BranchDetail,
    as: :new

  defdelegate add_employee_to_branch(branch, employee),
    to: BranchDetail,
    as: :add_employee

end
