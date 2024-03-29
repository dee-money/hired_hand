defmodule HiredHand.Organization.Employees.Contact do
  @derive Jason.Encoder
  @enfore_keys [:contact_number, :email, :employee]
  defstruct [:id, :contact_number, :email, :employee]

  alias HiredHand.{
    Organization,
    Storage.Association
  }

  alias Organization.Employees.Profile

  defmodule Store do
    use HiredHand.Storage.Base, module: HiredHand.Organization.Employees.Contact
  end

  def new(%Profile{} = employee, %{contact_number: contact_number, email: email}) do
    %__MODULE__{
      id: UUID.uuid4(),
      contact_number: contact_number,
      email: email,
      employee: Association.new(employee)
    }
  end
end
