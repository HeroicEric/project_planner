defmodule ProjectPlanner.TaskView do
  use ProjectPlanner.View

  def render("index.json", %{tasks: tasks}) do
    %{tasks: tasks}
  end

  def render("show.json", %{task: task}) do
    %{task: task}
  end

  def render("errors.json", %{errors: errors}) do
    %{errors: convert_errors_to_map(errors) }
  end

  defp convert_errors_to_map(errors) do
    Enum.reduce(errors, %{}, fn({k, v}, map) -> Map.put(map, k, v) end)
  end
end
