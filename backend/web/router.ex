defmodule ProjectPlanner.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", ProjectPlanner do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "projects", ProjectController, only: [:index]
  end

  scope "/api/v1", alias: ProjectPlanner do
    pipe_through :api

    resources "projects", ProjectController, only: [:index, :show, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", ProjectPlanner do
  #   pipe_through :api
  # end
end
