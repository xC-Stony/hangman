defmodule GameTest do
  use ExUnit.Case
  doctest Hangman

  test "Properly Initiaized" do
    assert elem(Game.start_link(), 0) == :ok
  end

  # test "Cast handled properly" do
  #   assert Game.play() == :ok
  #  end
end
