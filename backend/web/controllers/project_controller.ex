defmodule ProjectPlanner.ProjectController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    projects = ProjectPlanner.Project.all |> ProjectPlanner.Repo.all

    render conn, :index, projects: projects
  end

  def show(conn, %{"id" => id}) do
    project = ProjectPlanner.Repo.get(ProjectPlanner.Project, id)

    if project do
      render conn, :show, project: project
    else
      conn |> put_status(:not_found) |> text ""
    end
  end
end
