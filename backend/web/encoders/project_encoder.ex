defimpl Poison.Encoder, for: ProjectPlanner.Project do
  def encode(project, _options) do
    %{
      id: project.id,
      name: project.name,
      description: project.name
    } |> Poison.Encoder.encode([])
  end
end
