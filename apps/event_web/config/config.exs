# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :event_web, EventWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GDMLNCkwVR/To3rMYXv3sj5opUxPje/IyrjRcVDXuh9l7m7Ah38e57XMTEc4PIDS",
  render_errors: [view: EventWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EventWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512", "HS384"],
  issuer: "MyApp",
  ttl: { 30, :days },
  serializer: EventWeb.GuardianSerializer,
  secret_key: "lksjdlkjsdflkjsdf"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
