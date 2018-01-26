use Mix.Config

config :web_delivery, ecto_repos: []

config :web_delivery, WebDelivery.Endpoint,
  pubsub: [name: WebDelivery.PubSub, adapter: Phoenix.PubSub.PG2],
  render_errors: [view: WebDelivery.ErrorView, accepts: ~w(json)],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  url: [host: "localhost"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :rollbax,
  access_token: System.get_env("ROLLBAR_ACCESS_TOKEN"),
  environment: System.get_env("DEPLOY_TAG") || Mix.env()

import_config "#{Mix.env()}.exs"
