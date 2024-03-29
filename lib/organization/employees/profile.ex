defmodule HiredHand.Organization.Employees.Profile do
  @derive Jason.Encoder
  # @enfore_keys [:first_name, :last_name, :age, :date_of_birth, :gender]
  defstruct [:id, :first_name, :last_name, :age, :date_of_birth, :gender, :department, :branch]

  defmodule Store do
    use HiredHand.Storage.Base, module: HiredHand.Organization.Employees.Profile
  end

  def new(branch, department, %{
        # first_name: first_name,
        # last_name: last_name,
        age: age,
        # date_of_birth: date_of_birth,
        # gender: gender
        # department: department,
        # branch: branch,
      }) do
    %__MODULE__{
      id: UUID.uuid4(),
      # first_name: first_name,
      # last_name: last_name,
      age: age,
      # date_of_birth: date_of_birth,
      # gender: gender
      department: department,
      branch: branch,
    }
  end
end

# add association for branch and deparment in the profile
