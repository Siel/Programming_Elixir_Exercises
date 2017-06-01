[1,2,3,4,5]
|> Stream.map(&(&1*&1))
|> Stream.with_index #cada elemento se vuelve una tupla con su index
|> Stream.map(fn({val,index})-> val-index end)
|> Enum.to_list
|> IO.inspect
#[1, 3, 7, 13, 21]