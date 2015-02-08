defmodule ProjectPlanner.Queries do
  import Ecto.Query

  def all_projects do
    query = from project in ProjectPlanner.Project,
            select: project

    ProjectPlanner.Repo.all(query)
  end
end
