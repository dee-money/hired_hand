defmodule HiredHand.Storage.Base do
  defmacro __using__(options) do
    module = Keyword.get(options, :module)

    quote do
      use Agent

      def start_link(_) do
        Agent.start_link(fn -> [] end, name: __MODULE__)
      end

      def add(%unquote(module){} = resource) do
        employees = all()
        add_to_storage(is_map(Enum.find(employees, fn map -> map.id == resource.id end)), resource)
      end

      defp add_to_storage(_is_already_exist = true, _resource) do
        "Already exist"
      end

      defp add_to_storage(_is_not_already_exist = false, resource) do
        Agent.update(__MODULE__, fn state -> [resource | state] end)
      end


      def all do
        Agent.get(__MODULE__, fn state -> state end)
      end

      def get(resource_id) do
        Agent.get(__MODULE__, fn state ->
          Enum.find(state, fn resource ->
            resource.id == resource_id
          end)
        end)
      end
    end
  end
end
