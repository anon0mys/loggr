defmodule LoggrWeb.LogClient do
  @log_request Application.get_env(:loggr, :log_request)

  def send_log(conn) do
    payload = cast_to_log_params(conn) |> Jason.encode!()
    case @log_request.post(payload) do
      {:ok, %HTTPoison.Response{status_code: 201, body: body}} ->
        Jason.decode!(body)
        |> format_response(201)
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        format_response(404)
      {:ok, %HTTPoison.Response{status_code: 500}} ->
        format_response(500)
      {:error, %HTTPoison.Error{reason: reason}} ->
        format_response(reason, 403)
    end
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

  defp format_response(body \\ "", status_code)

  defp format_response(_, 404) do
    { :not_found, request: "Not Found" }
  end

  defp format_response(_, 500) do
    { :error, request: "Server Error" }
  end

  defp format_response(content, 403) do
    { :error, request: content }
  end

  defp format_response(content, 201) do
    { :ok, request: content["data"] }
  end
end
