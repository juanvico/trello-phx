defmodule TrelloWeb.CardView do
  use TrelloWeb, :view

  def render("card.json", %{card: card}) do
    %{
      id: card.id,
      text: card.text
    }
  end
end
