defmodule LoggrWeb.LogRequest do
  alias LoggrWeb.Router.Helpers, as: Routes
  alias LoggrWeb.Endpoint

  @headers [{"Content-Type", "application/json"}]

  def post(params) do
    HTTPoison.post(url(), params, @headers)
  end

  def url do
    Endpoint.url() <> Routes.log_path(Endpoint, :index)
  end
end
