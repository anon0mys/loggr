defmodule Loggr.Repo.Migrations.RemoveResponseColumnsFromLogs do
  use Ecto.Migration

  def change do
    alter table(:logs) do
      remove :response_code
      remove :response_body
    end
  end
end
