defmodule WebDelivery.UserSocket do
  use Phoenix.Socket

  transport :websocket, Phoenix.Transports.WebSocket, timeout: 45_000

  ## Callbacks

  def connect(_params, socket), do: {:ok, socket}

  def id(_socket), do: nil
end
