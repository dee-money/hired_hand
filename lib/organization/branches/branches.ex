defmodule HiredHand.Organization.Branches do
  @enfore_keys [:name]
  defstruct [:id, :name]

  def new(%{name: name}) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name
    }
  end
end
