#Collectable are pretty low level
#we access it throught Enum.into

#Empty list
Enum.into(1..5, []) |> IO.inspect
#[1, 2, 3, 4, 5]

#non empty list
Enum.into(1..5, [100,101]) |> IO.inspect
#[100, 101, 1, 2, 3, 4, 5]

Enum.into IO.stream(:stdio, :line), IO.stream(:stdio, :line)
