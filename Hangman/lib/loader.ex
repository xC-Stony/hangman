defmodule Hangman.Loader do
  @path "/home/stony/Hangman/data/words.txt"

  def load() do
    # read file
    # generate list of strings
    {res, contents} = File.read(@path)
    # select one word randomly from the list or return error if 
    case res do
      :error ->
        raise ArgumentError

      :ok ->
        string_list = String.split(contents, "\n", trim: true)

        Enum.at(string_list, :rand.uniform(length(string_list) - 1))
        |> String.upcase()
    end
  end
end
