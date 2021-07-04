# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :linkeshare, LinkeshareWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9BMRxvyamkAMtENSQINAekd07P/SNk48uYw9Yf9dHVxsc5LOFq3KjOixX74NaJ0B",
  render_errors: [view: LinkeshareWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Linkeshare.PubSub,
  live_view: [signing_salt: "BhZ9w4Qh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :linkeshare, :linkedin,
  author_id: System.get_env("LINKEDIN_AUTHOR_ID"),
  access_token: System.get_env("LINKEDIN_ACCESS_TOKEN")

config :tesla, LinkedinApi.Client, adapter: LinkedinApi.Client.Adapter.Mock

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
