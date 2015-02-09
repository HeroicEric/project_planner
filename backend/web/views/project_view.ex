defmodule ProjectPlanner.ProjectView do
  use ProjectPlanner.View

  def render("index.json", %{projects: projects}) do
    %{projects: projects}
  end

  def render("show.json", %{project: project}) do
    %{project: project}
  end
end
