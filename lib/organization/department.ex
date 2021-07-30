defmodule HiredHand.Organization.Department do
  @enfore_keys [:name]
  defstruct [:id, :name]

  alias HiredHand.Organization.{
    Employees.Detail,
    Storage.Association
  }

  defmodule Store do
    use HiredHand.Storage.Base, module: HiredHand.Organization.Department
  end



  def new(%{name: name}) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name, 
    }
  end

end
