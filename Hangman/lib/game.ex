defmodule Game do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, "", name: :game)
  end

  def init("") do
    word = Hangman.Loader.load() |> String.upcase()
    Hangman.Play.start(word)
    {:ok, word}
  end

  def play() do
    GenServer.cast(:game, {:play})
  end

  def handle_cast({:play}, state) do
    Hangman.Loader.load()
    |> String.upcase()
    |> Hangman.Play.start()

    {:noreply, state}
  end
end
