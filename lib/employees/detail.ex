defmodule HiredHand.Employees.Detail do
  @enfore_keys [:first_name, :last_name, :age, :date_of_birth, :gender]
  defstruct [:id, :first_name, :last_name, :age, :date_of_birth, :gender]

  def new(%{
        first_name: first_name,
        last_name: last_name,
        age: age,
        date_of_birth: date_of_birth,
        gender: gender
      }) do
    %__MODULE__{
      id: UUID.uuid4(),
      first_name: first_name,
      last_name: last_name,
      age: age,
      date_of_birth: date_of_birth,
      gender: gender
    }
  end
end
