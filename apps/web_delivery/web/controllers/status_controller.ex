defmodule WebDelivery.StatusController do
  use WebDelivery.Web, :controller

  @spec index(conn, params) :: conn
  def index(conn, _params), do: json(conn, %{status: "OK"})
end
