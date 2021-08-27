defmodule HiredHand.Organization.Departments do
  @enfore_keys [:name]
  defstruct [:id, :name]

  defmodule Store do
    use HiredHand.Storage.Base, module: HiredHand.Organization.Departments
  end

  def new(%{name: name}) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name
    }
  end
end
