defmodule LoggrWeb.LogRequest.Mock do
  @behaviour LoggrWeb.LogRequest
  
  def post(_params) do
    { :ok, success() }
  end

  defp success do
    %HTTPoison.Response{
      status_code: 201,
      body: "{\"data\":{\"request_body\":\"%{}\",\"request_verb\":\"GET\"}}"
    }
  end
end

defmodule HTTPoison.Response do
  defstruct body: nil, headers: nil, status_code: nil
end
