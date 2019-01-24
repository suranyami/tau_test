defmodule TauTest.Repo.Migrations.CreateHello do
  use Ecto.Migration

  def change do
    create table(:hello) do
      add :name, :string

      timestamps()
    end

  end
end
