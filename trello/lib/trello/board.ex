defmodule Trello.Board do
  use Ecto.Schema
  import Ecto.Changeset

  alias Trello.{Board, BoardList, Repo}

  @default_lists ["To do", "Doing", "Done"]

  schema "boards" do
    field :name, :string
    has_many :board_lists, BoardList
    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end

  def create(name) do
    %Board{}
    |> changeset(%{name: name})
    |> Repo.insert()
    |> after_insertrion()
  end

  def list_boards() do
    boards = Repo.all(Board)
  end

  # el signo ! es la convencsion de las funciones que me devuelcen
  def get_board!(id) do
    board = Repo.get!(Board, id)
    Repo.preload(board, :board_lists)
  end

  def after_insertrion({:ok, board}), do: create_default_lists(board)
  def after_insertrion({:error, _changeset} = result), do: result

  # private
  defp create_default_lists(board) do
    list =
      Enum.map(@default_lists, fn title ->
        %{
          title: title,
          board_id: board.id,
          # Hay que hacerlo porque el insert_all de Repo no actualiza estos valores
          inserted_at: time_now(),
          updated_at: time_now()
        }
      end)

    Repo.insert_all(BoardList, list)

    {:ok, board |> Repo.preload(:board_lists)}
  end

  defp time_now() do
    NaiveDateTime.utc_now()
    |> NaiveDateTime.truncate(:second)
  end
end
