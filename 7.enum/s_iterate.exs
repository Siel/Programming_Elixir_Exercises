#Creates a infinite stream in which the first value is
#passed into the function to generate the second and so on.

Stream.iterate(0,&(&1+1)) |> Enum.take(5)
#[0, 1, 2, 3, 4]
Stream.iterate(2,&(&1*&1)) |> Enum.take(5)
#[2, 4, 16, 256, 65536]
Stream.iterate([],&([&1])) |> Enum.take(5)
#[[], [[]], [[[]]], [[[[]]]], [[[[[]]]]]]