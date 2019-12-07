defmodule Trello.BoardList do
  use Ecto.Schema
  import Ecto.Changeset

  alias Trello.Board

  schema "board_lists" do
    field :title, :string
    belongs_to :board, Board

    timestamps()
  end

  @doc false
  def changeset(board_list, attrs) do
    board_list
    |> cast(attrs, [:title, :board_id])
    |> validate_required([:title, :board_id])
    |> foreign_key_constraint(:board_id)
  end
end
