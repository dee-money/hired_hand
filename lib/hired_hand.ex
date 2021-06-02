defmodule HiredHand do
  alias HiredHand.{Employee.Detail}

  defdelegate create_employee(params),
    to: Detail,
    as: :new
end
