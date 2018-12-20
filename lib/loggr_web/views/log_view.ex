defmodule LoggrWeb.LogView do
  use LoggrWeb, :view
  alias LoggrWeb.LogView

  def render("index.json", %{logs: logs}) do
    %{data: render_many(logs, LogView, "log.json")}
  end

  def render("show.json", %{log: log}) do
    %{data: render_one(log, LogView, "log.json")}
  end

  def render("log.json", %{log: log}) do
    %{id: log.id,
      request_verb: log.request_verb,
      request_body: log.request_body,
      response_code: log.response_code,
      response_body: log.response_body}
  end
end
