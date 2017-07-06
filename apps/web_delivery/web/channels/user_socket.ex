defmodule WebDelivery.UserSocket do
  use Phoenix.Socket

  transport :websocket, Phoenix.Transports.WebSocket, timeout: 45_000

  @impl Phoenix.Socket
  def connect(_params, socket), do: {:ok, socket}

  @impl Phoenix.Socket
  def id(_socket), do: nil
end
