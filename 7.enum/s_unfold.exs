#Unfold is like iterate but you have more control about what's
#streaming and what's the next state (in interation both are the same)

#fn state -> {stream_value, next_state}

#in this case the state ys a tuple with two elements
fib_s=Stream.unfold({0,1},fn{v1,v2}->{v1, {v2,v1+v2} } end)

fib_s |> Enum.take(10)
#[0, 1, 1, 2, 3, 5, 8, 13, 21, 34]