defmodule Trello.Repo.Migrations.CreateBoardLists do
  use Ecto.Migration

  def change do
    create table(:board_lists) do
      add :title, :string
      add :board_id, references(:boards, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:board_lists, [:board_id])
  end
end
