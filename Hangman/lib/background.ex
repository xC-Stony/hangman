defmodule Hangman.Background do
  def find(check_list, guess, game_list) do
    index = Enum.find_index(check_list, fn x -> x == guess end)

    if index do
      game_list = set_game_list(game_list, check_list, index)

      set_check_list(check_list, index)
      |> find(guess, game_list)
    else
      {game_list, check_list}
    end
  end

  def set_game_list(game_list, check_list, index) do
    len = length(game_list)

    Enum.map(0..(len - 1), fn x ->
      if x != index, do: Enum.at(game_list, x), else: Enum.at(check_list, x)
    end)
  end

  def set_check_list(check_list, index) do
    len = length(check_list)
    Enum.map(0..(len - 1), fn x -> if x == index, do: "_", else: Enum.at(check_list, x) end)
  end
end
