defmodule HighScore do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, {}, name: :high_score)
  end

  def init({}) do
    file_content = File.read!("/home/stony/Hangman/data/highscore")
    words = file_content |> String.split()

    if Enum.empty?(words) do
      {:ok, {"", "0"}}
    else
      {:ok, {Enum.at(words, 0), Enum.at(words, 1)}}
    end
  end

  def win(score, game_list) do
    GenServer.cast(:high_score, {:play, score, game_list})
  end

  def handle_cast({:play, score, game_list}, stored_score) do
    IO.puts("\t\t\t\t\t\t\t\t\t   #{game_list}\n\t\t\t\t\t\t\t\t\t  CONGRATS")

    if score > String.to_integer(elem(stored_score, 1)) do
      name = IO.gets("\t\t\t\t\t\t\t\tEnter your name: ") |> String.trim()
      new_high_score(name, score)
      {:noreply, {name, to_string(score)}}
    else
      high = elem(stored_score, 1)
      name = elem(stored_score, 2)
      IO.puts("\t\t\t\t\t\t\tYou haven't beaten the high score of #{high} by #{name}\n")
      {:noreply, stored_score}
    end
  end

  def new_high_score(name, score) do
    IO.puts("\t\t\t\t\t\t\tExcellent! You have beaten the High Score\n")
    File.write("/home/stony/Hangman/data/highscore", name <> " " <> to_string(score))
  end
end
