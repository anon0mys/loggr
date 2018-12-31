defmodule LoggrWeb.LogRequest do
  @callback post(params :: Map.t) :: %HTTPoison.Response{}
end
