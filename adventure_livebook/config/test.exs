import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :adventure_livebook, AdventureLivebook.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "adventure_livebook_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :adventure_livebook, AdventureLivebookWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "SW7r6bCuOgF0m4ycxe2Re7dyIj0mxIJMy6W5H6Hns5D96m1oFdnHSs4kvn//XTsc",
  server: false

# In test we don't send emails.
config :adventure_livebook, AdventureLivebook.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
