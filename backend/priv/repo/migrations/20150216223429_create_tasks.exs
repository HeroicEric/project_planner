defmodule ProjectPlanner.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def up do
    create table(:tasks) do
      add :project_id, :integer, null: false
      add :title, :string, null: false
      add :description, :text
    end

    create index(:tasks, [:project_id])
  end

  def down do
    drop index(:tasks, [:project_id])
    drop table(:tasks)
  end
end
