defmodule Hangman.DisplayTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias Hangman.Display
  doctest Hangman

  test "negative chances" do
    catch_error(Display.show(-1, ["d"]))
  end

  test "empty game_list" do
    catch_error(Display.show(2, []))
  end

  test "More than allowed chances" do
    catch_error(Display.show(6, ["dsa"]))
  end

  test "Losing condition" do
    out = capture_io(fn -> Display.show(0, ["A", "_", "E"], ["_", "L", "_"]) end)

    assert String.split(out, "\n", trim: true) |> List.last() ==
             "\t\t\t\t\t\t\t\t\tYOU ARE A LOSER"
  end

  test "Normal condition" do
    out = capture_io(fn -> Display.show(2, ["sample", "list"]) end)

    assert String.split(out, "\n", trim: true) |> List.last() ==
             "\t\t\t\t\t\t\t\t   2 chances left"
  end
end
