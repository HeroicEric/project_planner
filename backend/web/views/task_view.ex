defmodule ProjectPlanner.TaskView do
  use ProjectPlanner.View

  def render("index.json", %{tasks: tasks}) do
    %{tasks: tasks}
  end
end
