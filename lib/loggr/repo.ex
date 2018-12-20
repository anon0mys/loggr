defmodule Loggr.Repo do
  use Ecto.Repo,
    otp_app: :loggr,
    adapter: Ecto.Adapters.Postgres
end
