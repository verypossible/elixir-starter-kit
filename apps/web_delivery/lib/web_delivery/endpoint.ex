defmodule WebDelivery.Endpoint do
  use Phoenix.Endpoint, otp_app: :web_delivery

  socket "/socket", WebDelivery.UserSocket

  if code_reloading?, do: plug Phoenix.CodeReloader

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    json_decoder: Poison,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"]

  plug Plug.Head

  plug WebDelivery.Router
end
