use Mix.Config

# Configure your database
config :luppiter_auth, LuppiterAuth.Repo,
  username: "postgres",
  password: "postgres",
  database: "luppiter_auth_test",
  hostname: System.get_env("DB_HOST", "localhost"),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :luppiter_auth, LuppiterAuthWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :error

config :goth,
  disabled: true
