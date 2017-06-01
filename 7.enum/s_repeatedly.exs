#Takes a function and invoques it every time a new value is wanted

Stream.repeatedly(fn -> true end)
|>Enum.take(3)
|>IO.inspect

Stream.repeatedly(&:random.uniform/0)
|>Enum.take(3)
|>IO.inspect
