defmodule LoggrWeb.PageController do
  use LoggrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
