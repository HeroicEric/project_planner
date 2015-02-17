import Ecto.Model

alias ProjectPlanner.Project
alias ProjectPlanner.Repo
alias ProjectPlanner.Task

defimpl Poison.Encoder, for: Project do
  def encode(project, _options) do
    %{
      id: project.id,
      name: project.name,
      description: project.description,
      task_ids: task_ids(project)
    } |> Poison.Encoder.encode([])
  end

  defp task_ids(project) do
    assoc(project, :tasks) |> Repo.all |> Enum.map(&(&1.id))
  end
end
