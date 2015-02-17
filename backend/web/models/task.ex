defmodule ProjectPlanner.Task do
  use Ecto.Model
  import Ecto.Query

  alias ProjectPlanner.Project

  schema "tasks" do
    belongs_to :project, Project

    field :title, :string
    field :description, :string
  end

  def all do
    from task in ProjectPlanner.Task
  end
end
