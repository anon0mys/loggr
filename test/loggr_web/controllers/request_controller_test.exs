defmodule LoggrWeb.RequestControllerTest do
  use LoggrWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "request endpoint" do
    test "parses get request and creates new log", %{conn: conn} do
      conn = get(conn, Routes.request_path(conn, :log))
      assert %{"request_body" => "%{}", "request_verb" => "GET"} = json_response(conn, 201)["data"]
    end
  end
end
