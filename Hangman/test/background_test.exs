defmodule Hangman.BackgroundTest do
  use ExUnit.Case
  alias Hangman.Background
  doctest Hangman

  test "replace single letter" do
    assert Background.find(["A", "B", "C"], "A", ["_", "_", "_"]) ==
             {["A", "_", "_"], ["_", "B", "C"]}
  end

  test "replace multiple letters" do
    assert Background.find(["A", "A", "C"], "A", ["_", "_", "_"]) ==
             {["A", "A", "_"], ["_", "_", "C"]}
  end

  test "replace all letters" do
    assert Background.find(["C", "C", "C"], "C", ["_", "_", "_"]) ==
             {["C", "C", "C"], ["_", "_", "_"]}
  end

  test "replace in partially solved list" do
    assert Background.find(["C", "_", "T"], "C", ["_", "A", "_"]) ==
             {["C", "A", "_"], ["_", "_", "T"]}
  end

  test "no match" do
    assert Background.find(["C"], "S", ["_"]) == {["_"], ["C"]}
  end

  test "modfy game list" do
    assert Background.set_game_list(["A", "_", "_"], ["_", "B", "C"], 2) == ["A", "_", "C"]
  end

  test "modfy check list" do
    assert Background.set_check_list(["A", "B", "_"], 0) == ["_", "B", "_"]
  end
end
