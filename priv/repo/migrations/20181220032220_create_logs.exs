defmodule Loggr.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :request_verb, :string
      add :request_body, :string
      add :response_code, :string
      add :response_body, :string

      timestamps()
    end

  end
end
