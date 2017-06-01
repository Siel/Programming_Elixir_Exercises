[1,2,3,4,5]
|> Stream.map(&(&1*&1))
|> Stream.map(&(&1+1))
|> Stream.filter(fn x-> rem(x,2)==1 end)#dejo los impares
|> Enum.to_list
|> IO.inspect