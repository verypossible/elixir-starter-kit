use Mix.Config

config :web_delivery, WebDelivery.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: System.get_env("HOST_NAME"), port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json"

# Do not print debug messages in production
config :logger, backends: [Rollbax.Logger, :console]

config :logger, Rollbax.Logger,
  level: :error,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]
