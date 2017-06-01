[1,2,3,4,5]
|> Enum.map(&(&1*&1))
|> Enum.with_index #cada elemento se vuelve una tupla con su index
|> Enum.map(fn({val,index})-> val-index end)
|> IO.inspect
#[1, 3, 7, 13, 21]