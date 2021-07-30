defmodule HiredHand.Organization.Employees.Employment do
  @enfore_keys [:id, :date_of_joining, :employment_type, :employment_status]

  defstruct [:id, :date_of_joining, :employment_type, :employment_status]

  def new(%{
        id: id,
        date_of_joining: date_of_joining,
        employment_type: employment_type,
        employment_status: employment_status
      }) do
    %__MODULE__{
      id: id,
      date_of_joining: date_of_joining,
      employment_type: employment_type,
      employment_status: employment_status
    }
  end
end
