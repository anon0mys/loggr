defmodule LoggrWeb.RequestController do
  use LoggrWeb, :controller
  require IEx

  alias LoggrWeb.Router.Helpers, as: Routes
  alias LoggrWeb.Endpoint

  def log(conn, _params) do
    url = Endpoint.url() <> Routes.log_path(Endpoint, :index)
    payload = cast_to_log_params(conn) |> Jason.encode!()
    case HTTPoison.post(url, payload, [{"Content-Type", "application/json"}]) do
      {:ok, %HTTPoison.Response{status_code: 201, body: body}} ->
        request = Jason.decode!(body) |> format_body()
        conn
        |> put_status(:created)
        |> render("show.json", request: request)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        conn
        |> put_status(:not_found)
        |> send_resp(:not_found, "Page not Found")
      {:ok, %HTTPoison.Response{status_code: 500}} ->
        conn
        |> put_status(:bad_request)
        |> send_resp(:bad_request, "Server Error")
      {:error, %HTTPoison.Error{reason: reason}} ->
        conn
        |> put_status(:bad_request)
        |> send_resp(:bad_request, reason)
    end
  end

  defp format_body(body) do
    body["data"]
  end

  defp cast_to_log_params(conn) do
    %{
      log: %{
        request_body: inspect(conn.body_params),
        request_verb: conn.method,
        response_body: conn.resp_body,
        request_code: conn.status,
      }
    }
  end
end
