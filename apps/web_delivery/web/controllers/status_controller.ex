defmodule WebDelivery.StatusController do
  use WebDelivery.Web, :controller

  def index(conn, _params) do
    json conn, %{status: "OK"}
  end
end
