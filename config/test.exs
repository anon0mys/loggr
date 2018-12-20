use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :loggr, LoggrWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :loggr, Loggr.Repo,
  uusername: System.get_env("DB_USER"),
  password: System.get_env("DB_PASSWORD"),
  database: System.get_env("TEST_DB_NAME"),
  hostname: System.get_env("DB_HOST"),
  pool: Ecto.Adapters.SQL.Sandbox
