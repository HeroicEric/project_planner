defmodule ProjectPlanner.TaskController do
  use Phoenix.Controller

  alias ProjectPlanner.Repo
  alias ProjectPlanner.Task

  plug :action

  def index(conn, %{"ids" => ids}) do
    tasks = Task
    |> Task.with_id(ids)
    |> Repo.all

    render conn, :index, tasks: tasks
  end

  def index(conn, _params) do
    tasks = Task |> Task.all |> Repo.all

    render conn, :index, tasks: tasks
  end

  def show(conn, %{"id" => id}) do
    task = Repo.get(Task, id)

    if task do
      render conn, :show, task: task
    else
      conn |> put_status(:not_found) |> text ""
    end
  end

  def create(conn, params) do
    changeset = Task.changeset(%Task{}, params["task"])

    if changeset.valid? do
      task = Repo.insert(changeset)

      conn
      |> put_status(:created)
      |> render :show, task: task
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render :errors, errors: changeset.errors
    end
  end
end
