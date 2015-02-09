defmodule ProjectPlanner.ProjectView do
  use ProjectPlanner.View

  def render("index.json", %{projects: projects}) do
    %{projects: projects}
  end

  def render("show.json", %{project: project}) do
    %{project: project}
  end

  def render("errors.json", %{errors: errors}) do
    %{errors: convert_errors_to_map(errors) }
  end

  defp convert_errors_to_map(errors) do
    Enum.reduce(errors, %{}, fn({k, v}, map) -> Map.put(map, k, v) end)
  end
end
