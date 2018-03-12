defmodule ToStruct do
  @moduledoc """
  Transform map to struct
  """
  def transform(nil, attrs), do: attrs

  def transform(schema, attrs) when is_list(schema) and length(schema) > 0 do
    schema |> hd() |> transform(attrs)
  end

  def transform(schema, attrs) when is_list(schema), do: attrs

  def transform(schema, attrs) when is_list(attrs) do
    Enum.map(attrs, &transform(schema, &1))
  end

  def transform(schema, attrs) do
    struct = struct(schema)

    Enum.reduce(Map.to_list(struct), struct, fn {k, _}, acc ->
      case Map.fetch(attrs, Atom.to_string(k)) do
        {:ok, v} when is_map(v) or is_list(v) ->
          v1 = schema |> Map.get(k) |> transform(v)
          %{acc | k => v1}

        {:ok, v} ->
          %{acc | k => v}

        :error ->
          acc
      end
    end)
  end
end
