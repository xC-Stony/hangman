defmodule Hangman.PlayTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "input" do
    # assert Hangman.Play.input() |> is_binary
  end

  test "single char" do
    # assert Hangman.Play.input() |> String.length() == 1
  end

  test "lose" do
    out = capture_io(fn -> Hangman.Play.next_turn({["A", "_"], ["_", "S"]}, 0) end)

    assert String.split(out, "\n", trim: true) |> List.last() ==
             "\t\t\t\t\t\t\t\t\tYOU ARE A LOSER"
  end
end
