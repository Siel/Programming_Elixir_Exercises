#Stream.cycle 
Stream.cycle(~w{green blue}) #["green", "blue"]
|> Stream.zip(1..5)
|> Enum.map(fn{class,value} -> 
  ~s{<tr class="#{class}"><td>#{value}</td></tr>\n} end)
|> IO.puts