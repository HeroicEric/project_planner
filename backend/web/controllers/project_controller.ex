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

  def create(conn, params) do
    changeset = Project.changeset(%Project{}, params["project"])

    if changeset.valid? do
      project = Repo.insert(changeset)

      conn
      |> put_status(:created)
      |> render :show, project: project
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render :errors, errors: changeset.errors
    end
  end
end
