use Mix.Config

config :web_delivery, WebDelivery.Endpoint,
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: System.get_env("HOST_NAME"), port: 443]

config :logger, backends: [Rollbax.Logger, :console]

config :logger, Rollbax.Logger,
  format: "$time $metadata[$level] $message\n",
  level: :error,
  metadata: [:request_id]
