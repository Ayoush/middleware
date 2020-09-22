# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :middleware,
  ecto_repos: [Middleware.Repo]

# Configures the endpoint
config :middleware, MiddlewareWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MUSAm9jkRJmwsDateedg7yBLZcXmn+6WcvRNO0zcXo9fRwxq+vkhX9XBCUHX2Bx3",
  render_errors: [view: MiddlewareWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Middleware.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :middleware, :pow,
  user: Middleware.Users.User,
  repo: Middleware.Repo,
  web_module: MiddlewareWeb,
  extensions: [PowResetPassword],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: MiddlewareWeb.PowMailer
