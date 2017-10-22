defmodule Utf8 do
  def each(str, func) when is_binary(str), do: _each(str, func)
  defp _each(<< head :: utf8, tail :: binary >>, func) do
    func.(head)
    _each(tail, func)
    end
  defp _each(<<>>, _func), do: []

  def capitalize_sentences(sentence) do
    sentence
    |> String.split(". ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(". ")
  end
end

Utf8.each "∂og", fn char -> IO.puts char end
IO.inspect Utf8.capitalize_sentences("oh. a DOG. woof. ")