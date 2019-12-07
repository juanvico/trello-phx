use Mix.Config

# Configure your database
config :trello, Trello.Repo,
  username: "postgres",
  password: "postgres",
  database: "trello_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :trello, TrelloWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
