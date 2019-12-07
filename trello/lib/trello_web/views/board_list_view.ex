defmodule TrelloWeb.BoardListView do
  use TrelloWeb, :view

  def render("list_with_cards.json", %{board_list: board_list}) do
    %{
      id: board_list.id,
      title: board_list.title,
      cards: []
    }
  end
end
