defmodule WebDelivery.StatusControllerTest do
  use WebDelivery.ConnCase

  test "GET /api", %{conn: conn} do
    conn = get conn, "/api"
    assert json_response(conn, 200) == %{ "status" => "OK" }
  end
end
