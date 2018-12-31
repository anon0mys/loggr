defmodule HTTPoison.Response do
  defstruct body: nil, headers: nil, status_code: nil
end

defmodule LogRequestMock do
  def post(_params) do
    { :ok, success() }
  end

  defp success do
    %HTTPoison.Response{
      status_code: 201,
      body: "json"
    }
  end
end
