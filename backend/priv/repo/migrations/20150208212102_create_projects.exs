defmodule ProjectPlanner.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def up do
    create table(:projects) do
      add :name, :string, null: false
      add :description, :text
    end

    create index(:projects, [:name])
  end

  def down do
    drop index(:projects, [:name])
    drop table(:projects)
  end
end
