defmodule HiredHand.Employees.Department do
  @enfore_keys [:name]
  defstruct [:id, :name, employees: []]

  def new(%{name: name}) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name
    }
  end

  def add_employee(department, employee) do
    %{department | employees: department.employees ++ [employee]}
  end

  def remove_employee(department, employee) do
    %{department | employees: department.employees -- [employee]}
  end
end
