import Ecto.Model

alias ProjectPlanner.Project
alias ProjectPlanner.Repo

tasks_attrs = [
  %{
    title: "Implement pagination",
    description: "I need to paginate all the things."
  },
  %{
    title: "User can sign in",
    description: "This app is useless unless users can sign in."
  },
  %{
    title: "User can sign out",
    description: ""
  }
]

# alias ProjectPlanner.Task

projects = Project.all |> Repo.all

for project <- projects do
  for task_attrs <- tasks_attrs do
    task = build(project, :tasks)
    task = Map.merge(task, task_attrs)
    Repo.insert(task)
  end
end
