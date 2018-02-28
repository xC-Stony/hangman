defmodule Hangman do
  use Application

  def start(_type, _args) do
    Super.play()
  end
end
