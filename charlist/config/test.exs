import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :charlist, Charlist.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "charlist_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :charlist, CharlistWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "hQe0hg4lkmMK5GjEl3svqsfR5lroJQ8qbqhHEoJN80a7oNntC/g8KhMDxGR6aMdd",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :charlist, Charlist.Accounts.Services.Guardian,
  secret_key: "HxdiegBPdfAM4StbEYdtcT7B2k/n/+eux1D6172e/eEdLBepO7QVTM76FFtGTKrp"
