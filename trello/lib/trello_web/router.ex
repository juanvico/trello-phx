defmodule TrelloWeb.Router do
  use TrelloWeb, :router

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

  scope "/", TrelloWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", TrelloWeb do
    pipe_through :api

    resources "/boards", BoardController, only: [:create, :index, :show]
    resources "/lists/:list_id/cards", CardController, only: [:create]
  end
end
