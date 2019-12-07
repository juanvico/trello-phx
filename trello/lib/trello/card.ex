defmodule Trello.Card do
  use Ecto.Schema
  import Ecto.Changeset

  alias Trello.{Card, BoardList, Repo}

  schema "card" do
    field :text, :string
    belongs_to :board_list, BoardList

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:text, :board_list_id])
    |> validate_required([:text, :board_list_id])
  end

  def create(text, board_list_id) do
    %Card{}
    |> changeset(%{text: text, board_list_id: board_list_id})
    |> Repo.insert()
  end
end
