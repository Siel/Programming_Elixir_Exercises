defmodule Exercise do
  def ascii_printable?(str) do
    Enum.all? str, &(&1 in ?\s..?~)
  end
  def anagram?(word1, word2) do
    word1 -- word2 == [] and word2 -- word1 == []
  end

  def calculate(expr) do
    expr
    |> skip_spaces()
    |> parse_numbers()
    |> parse_operation()
  end

  #mejora: quitar los especios con regex
  defp skip_spaces(str), do: do_skip_spaces(str, [])
  defp do_skip_spaces([?\s | tail], acc), do: do_skip_spaces(tail, acc)
  defp do_skip_spaces([head | tail], acc), do: do_skip_spaces(tail, [head |acc])
  defp do_skip_spaces(_tail, acc), do: Enum.reverse acc

  defp parse_numbers(expr), do: do_parse_numbers(expr,{0,'',0})
  defp do_parse_numbers([h|t],{n1,'',n2}) when h in ?0..?9, do: do_parse_numbers(t,{n1*10+h-?0,'',n2})
  defp do_parse_numbers([h|t],{n1,'',n2}) when h in '+-*/', do: do_parse_numbers(t,{n1,h,n2})
  defp do_parse_numbers([h|t],{n1,op,n2}) when h in ?0..?9, do: do_parse_numbers(t,{n1,op,n2*10+h-?0})
  defp do_parse_numbers([],acc), do: acc

  defp parse_operation({n1, ?+, n2}), do: n1 + n2
  defp parse_operation({n1, ?-, n2}), do: n1 - n2
  defp parse_operation({n1, ?*, n2}), do: n1 * n2
  defp parse_operation({n1, ?/, n2}), do: n1 / n2


  def center(list), do: _center(list, list,0)

  def _center([],[],_), do: []

  def _center([h|t],[],max) do
    len = String.length(h)
    h
    |> String.pad_leading(div(max-len,2)+len)
    |> IO.puts
    _center(t,[], max)
  end

  # Mejora!
  #max = lista |> Enum.map &String.length/1 |> Enum.max
  def _center(list,[h|t], max) when byte_size(h) > max do
    _center(list,t,String.length(h))
  end

end

IO.puts Exercise.ascii_printable?('hola')
IO.puts Exercise.ascii_printable?('añadir')
IO.puts Exercise.anagram?('cat', 'tac')
IO.inspect Exercise.calculate(' 123 + 27 ')
IO.inspect Exercise.calculate('25 / 5')

