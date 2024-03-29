defmodule HiredHand.Storage.Persistence do
  def load(module) do
    path(module)
    |> File.read()
    |> case do
      {:ok, content} ->
        content
        |> Jason.decode!()
        |> IO.inspect()
        |> Enum.map(fn param ->
          param
          |> Enum.map(fn {key, value} ->
            value = maybe_parse_association(value)
            {String.to_atom(key), value}
          end)
          |> Enum.into(%{})
        end)
        |> Enum.map(fn param ->
          struct(module, param)
        end)

      {:error, _} ->
        []
    end
  end

  def persist(module, content) do
    path(module)
    |> File.write!(Jason.encode!(content))
  end

  defp path(module) do
    module_name =
      Macro.underscore(module)
      |> String.split("/")
      |> List.last()

    Application.app_dir(:hired_hand)
    |> Path.join("priv/stores/#{module_name}.json")
  end

  defp maybe_parse_association(%{
    "module" => module,
    "resource_id" => resource_id
  }) do
    module = String.to_atom(module)

    %HiredHand.Storage.Association{
      module: module,
      resource_id: resource_id
    }
  end

  defp maybe_parse_association(value), do: value
end
