defmodule HiredHand.Employees.Contact do
  @enfore_keys [:employee_id, :contact_number, :email]
  defstruct [:employee_id, :contact_number, :email]

  def new(%{employee_id: employee_id, contact_number: contact_number, email: email}) do
    %__MODULE__{
      employee_id: employee_id,
      contact_number: contact_number,
      email: email
    }
  end
end
