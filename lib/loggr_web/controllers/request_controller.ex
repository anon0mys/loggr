defmodule LoggrWeb.RequestController do
  use LoggrWeb, :controller
  alias LoggrWeb.LogClient

  def log(conn, _params) do
    with {:ok, request: request} <- LogClient.send_log(conn) do
      conn
      |> put_status(:created)
      |> render("show.json", request: request)
    end
  end
end
