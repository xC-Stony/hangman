defmodule Hangman.Display do
  @art_map %{
    5 => "/home/stony/Hangman/data/art1",
    4 => "/home/stony/Hangman/data/art2",
    3 => "/home/stony/Hangman/data/art3",
    2 => "/home/stony/Hangman/data/art4",
    1 => "/home/stony/Hangman/data/art5",
    0 => "/home/stony/Hangman/data/art6"
  }

  def show(chances, _game_list) when chances < 0 or chances > 5, do: raise(ArgumentError)

  def show(_chances, []), do: raise(ArgumentError)

  def show(chances, game_list) do
    art = File.read!(@art_map[chances])
    IO.puts(art)
    IO.puts("\t\t\t\t\t\t\t\t\t#{game_list}")
    IO.puts("\t\t\t\t\t\t\t\t   #{chances} chances left")
  end

  def show(0, game_list, check_list) do
    art = File.read!(@art_map[0])
    IO.puts(art)

    original =
      Enum.map(0..(length(game_list) - 1), fn x ->
        if Enum.at(game_list, x) == "_", do: Enum.at(check_list, x), else: Enum.at(game_list, x)
      end)

    IO.puts("\n\t\t\t\t\t\t\t\t\t   #{original}")
    IO.puts("\n\t\t\t\t\t\t\t\t\tYOU ARE A LOSER")
  end
end
