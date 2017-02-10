use Mix.Config

config :web_delivery, WebDelivery.Endpoint, http: [port: 4001], server: false

config :logger, level: :warn

config :rollbax, enabled: false
