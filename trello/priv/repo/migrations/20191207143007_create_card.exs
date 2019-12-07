defmodule Trello.Repo.Migrations.CreateCard do
  use Ecto.Migration

  def change do
    create table(:card) do
      add :text, :text
      add :board_list_id, references(:board_lists, on_delete: :nothing)

      timestamps()
    end

    create index(:card, [:board_list_id])
  end
end
