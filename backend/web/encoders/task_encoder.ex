defimpl Poison.Encoder, for: ProjectPlanner.Task do
  def encode(task, _options) do
    %{
      description: task.description,
      id: task.id,
      project_id: task.project_id,
      title: task.title
    } |> Poison.Encoder.encode([])
  end
end
