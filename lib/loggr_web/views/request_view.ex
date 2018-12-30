defmodule LoggrWeb.RequestView do
  use LoggrWeb, :view
  alias LoggrWeb.RequestView
  require IEx

  def render("show.json", %{request: request}) do
    %{data: render_one(request, RequestView, "request.json")}
  end

  def render("request.json", %{request: request}) do
    %{
      request_verb: request["request_verb"],
      request_body: request["request_body"],
    }
  end
end
