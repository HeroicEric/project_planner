defmodule ProjectPlanner.Project do
  use Ecto.Model

  schema "projects" do
    field :name, :string
    field :description, :string
  end
end
