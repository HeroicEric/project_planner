defmodule ProjectPlanner.Project do
  use Ecto.Model
  import Ecto.Query

  schema "projects" do
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
