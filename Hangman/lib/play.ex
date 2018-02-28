defmodule Hangman.Play do
  alias Hangman.Display

  def start(word) do
    check_list = String.graphemes(word)
    game_list = Enum.map(check_list, fn _ -> "_" end)
    play(check_list, game_list, 5)
  end

  def next_turn({game_list, check_list}, 0), do: Display.show(0, game_list, check_list)

  def next_turn({game_list, check_list}, chances),
    do:
      if(
        "_" in game_list,
        do: play(check_list, game_list, chances),
        else: HighScore.win(chances, game_list)
      )

  defp play(check_list, game_list, chances) do
    Display.show(chances, game_list)
    guess = input()

    if guess in check_list do
      Hangman.Background.find(check_list, guess, game_list)
      |> next_turn(chances)
    else
      next_turn({game_list, check_list}, chances - 1)
    end
  end

  def input() do
    letter =
      IO.gets("\n\t\t\t\t\t\t\t\t    Make Your Guess: ") |> String.trim("\n") |> String.upcase()

    if String.length(letter) != 1, do: input(), else: letter
  end
end
