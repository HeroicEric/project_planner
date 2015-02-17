defmodule ProjectPlanner.Project do
  use Ecto.Model
  import Ecto.Query

  alias ProjectPlanner.Task

  schema "projects" do
    has_many :tasks, Task

    field :name, :string
    field :description, :string
  end

  def changeset(project, params \\ nil) do
    params
    |> cast(project, ~w(name), ~w(description))
  end

  def all do
    from project in ProjectPlanner.Project
  end
end
