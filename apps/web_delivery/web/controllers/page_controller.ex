defmodule WebDelivery.PageController do
  use WebDelivery.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
