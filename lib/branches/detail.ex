defmodule HiredHand.Branches.Detail do
  @enfore_keys [:name]
  defstruct [:id, :name, :employees]

  def new(%{name: name}) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name
    }
  end

  def add_employee(branch, employee) do
    %{branch | employee: employee}
  end
end
