defmodule LoggrWeb.Router do
  use LoggrWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LoggrWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api/", LoggrWeb do
    pipe_through :api

    resources "/logs", LogController
    get "/request", RequestController, :log
    post "/request", RequestController, :log
    patch "/request", RequestController, :log
    put "/request", RequestController, :log
    delete "/request", RequestController, :log
  end

  # Other scopes may use custom stacks.
  # scope "/api", LoggrWeb do
  #   pipe_through :api
  # end
end
