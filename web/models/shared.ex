defmodule Amazon.Shared do
  use Amazon.Web, :model

    alias __MODULE__
    alias Amazon.{Shared}

  def raw_query(%{query: query, params: params}) do
    {:ok, result} = Ecto.Adapters.SQL.query(Amazon.Repo, query, params)
    
    Enum.map result.rows, fn(row) ->
            Enum.reduce(Enum.zip(result.columns, row), %{}, fn({key, value}, map) ->
            Map.put(map, key, value)
          end)
        end
  end
end
