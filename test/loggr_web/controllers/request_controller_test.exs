defmodule LoggrWeb.RequestControllerTest do
  use LoggrWeb.ConnCase
  require IEx

  alias LoggrWeb.LogRequest

  import Mock

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "endpoint" do
    test "parses request and creates new log", %{conn: conn} do
      with_mock LogRequest, [post: fn(params) -> LogRequestMock.post(params) end] do
        conn = get(conn, Routes.request_path(conn, :log))
        assert %{
                 "id" => id,
                 "request_body" => "some request_body",
                 "request_verb" => "some request_verb",
               } = json_response(conn, 201)["data"]
      end
    end
  end
end
