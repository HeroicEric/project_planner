defmodule ProjectPlanner.Task do
  use Ecto.Model
  import Ecto.Query

  alias ProjectPlanner.Project

  schema "tasks" do
    belongs_to :project, Project

    field :title, :string
    field :description, :string
  end

  def changeset(project, params \\ nil) do
    params
    |> cast(project, ~w(title project_id), ~w(description))
  end

  def all(query) do
    from task in query
  end

  def with_id(query, ids) do
    from task in query,
    where: task.id in ^ids
  end
end
