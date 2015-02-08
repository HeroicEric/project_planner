defmodule ProjectPlanner.ProjectController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    projects = ProjectPlanner.Queries.all_projects

    render conn, "index.html", projects: projects
  end
end
