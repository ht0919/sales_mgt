# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sales_mgt,
  ecto_repos: [SalesMgt.Repo]

# Configures the endpoint
config :sales_mgt, SalesMgt.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "STQ9+QD+soFGCGWeW0qHcv2kRUGZ36SUwED1mRmHvYnpz+Fp+c98sHAQDE/Ydh1J",
  render_errors: [view: SalesMgt.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SalesMgt.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
