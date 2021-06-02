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
end
