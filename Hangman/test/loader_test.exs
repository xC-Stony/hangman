defmodule Hangman.LoaderTest do
  use ExUnit.Case
  doctest Hangman

  test "Valid File" do
    assert Hangman.Loader.load() |> is_binary
  end
end
