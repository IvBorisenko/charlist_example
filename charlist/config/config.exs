# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :charlist,
  ecto_repos: [Charlist.Repo]

# Configures the endpoint
config :charlist, CharlistWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: CharlistWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Charlist.PubSub,
  live_view: [signing_salt: "UrofDdr/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :charlist, Charlist.Accounts.Services.Guardian, issuer: "charlist"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
