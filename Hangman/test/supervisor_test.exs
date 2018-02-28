defmodule SuperTest do
  use ExUnit.Case
  doctest Hangman

  test "Properly Initiaized" do
    assert elem(Super.play(), 0) == :ok
  end
end
