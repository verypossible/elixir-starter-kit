defmodule WebDelivery.StatusControllerTest do
  use WebDelivery.ConnCase

  test "GET /api", %{conn: conn} do
    conn = get conn, "/api"
    assert %{"status" => "OK"} === json_response(conn, 200)
  end
end
