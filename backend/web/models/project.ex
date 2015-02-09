defmodule ProjectPlanner.Project do
  use Ecto.Model
  import Ecto.Query

  schema "projects" do
    field :name, :string
    field :description, :string
  end

  def all do
    from project in ProjectPlanner.Project
  end
end
