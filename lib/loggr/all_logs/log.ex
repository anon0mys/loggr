defmodule Loggr.AllLogs.Log do
  use Ecto.Schema
  import Ecto.Changeset


  schema "logs" do
    field :request_body, :string
    field :request_verb, :string

    timestamps()
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:request_verb, :request_body])
    |> validate_required([:request_verb])
  end
end
