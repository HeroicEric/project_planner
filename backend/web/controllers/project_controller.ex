defmodule ProjectPlanner.ProjectController do
  use Phoenix.Controller

  alias ProjectPlanner.Project
  alias ProjectPlanner.Repo

  plug :action

  def index(conn, _params) do
    projects = Project.all |> Repo.all

    render conn, :index, projects: projects
  end

  def show(conn, %{"id" => id}) do
    project = Repo.get(Project, id)

    if project do
      render conn, :show, project: project
    else
      conn |> put_status(:not_found) |> text ""
    end
  end
end
