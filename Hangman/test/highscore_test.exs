defmodule HighScoreTest do
  use ExUnit.Case
  doctest Hangman

  test "Properly Initiaized" do
    assert elem(HighScore.start_link(), 0) == :ok
  end

  test "init works correctly" do
    assert HighScore.init({}) |> elem(1) |> is_tuple == true
  end
end
