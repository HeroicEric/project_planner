defmodule ProjectPlanner.ProjectController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    projects = ProjectPlanner.Project.all |> ProjectPlanner.Repo.all

    render conn, :index, projects: projects
  end
end
