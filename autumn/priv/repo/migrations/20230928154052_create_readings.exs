defmodule Autumn.Repo.Migrations.CreateReadings do
  use Ecto.Migration

  def change do
    create table(:readings) do
      add :name, :string
      add :steps, :integer
      add :phrase, :text

      timestamps()
    end
  end
end
