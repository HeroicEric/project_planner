defmodule ProjectPlanner.TaskController do
  import Ecto.Model

  use Phoenix.Controller

  alias ProjectPlanner.Project
  alias ProjectPlanner.Repo
  alias ProjectPlanner.Task

  plug :action

  def index(conn, %{"project_id" => project_id}) do
    project = Repo.get(Project, project_id)
    tasks = assoc(project, :tasks) |> Repo.all

    render conn, :index, tasks: tasks
  end

  def index(conn, _params) do
    tasks = Task.all |> Repo.all

    render conn, :index, tasks: tasks
  end
end
