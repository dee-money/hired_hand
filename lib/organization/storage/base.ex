defmodule HiredHand.Storage.Base do
  defmacro __using__(options) do
    module = Keyword.get(options, :module)

    quote do
      use Agent

      def start_link(_) do
        Agent.start_link(fn -> HiredHand.Storage.Persistence.load(unquote(module)) end,
          name: __MODULE__
        )
      end

      def add(%unquote(module){id: resource_id} = resource) do
        case get(resource_id) do
          nil ->
            Agent.update(__MODULE__, fn state ->
              new_state = [resource | state]

              unquote(module)
              |> HiredHand.Storage.Persistence.persist(new_state)

              new_state
            end)

          %unquote(module){} ->
            {:error, :already_exists}
        end
      end

      def update(%unquote(module){id: resource_id} = resource, params) do
        sanitized_params = Map.delete(params, :id)

        case get(resource_id) do
          %unquote(module){} = resource ->
            updated_resource = Map.merge(resource, sanitized_params)

            Agent.update(__MODULE__, fn state ->
              without_resorce =
                state
                |> Enum.reject(fn r ->
                  r.id == resource_id
                end)

              [updated_resource | resource]
            end)

          nil ->
            {:error, :not_found}
        end
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

      def preload(resource) do
        preloaded =
          resource
          |> Map.from_struct()
          |> Enum.filter(fn {key, value} ->
            case value do
              %m{} ->
                m == HiredHand.Storage.Association

              _ ->
                false
            end
          end)
          |> Enum.map(fn {key, value} ->
            module = Module.safe_concat(value.module, Store)

            {key, module.get(value.resource_id)}
          end)
          |> Enum.into(%{})

        Map.merge(resource, preloaded)
      end
    end
  end
end
