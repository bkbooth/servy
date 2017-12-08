defmodule Cards do
  @ranks ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  @suits ["♣", "♦", "♥", "♠"]

  def generate_deck do
    for rank <- @ranks, suit <- @suits, do: { rank, suit }
  end

  def generate_hand do
    deck = generate_deck
    |> Enum.shuffle
    |> Enum.take(13)
  end

  def generate_four_hands do
    deck = generate_deck
    |> Enum.shuffle
    |> Enum.chunk_every(13)
  end
end

IO.puts "Deck:"
IO.inspect Cards.generate_deck()

IO.puts "Hand:"
IO.inspect Cards.generate_hand()

IO.puts "Hands:"
IO.inspect Cards.generate_four_hands()
