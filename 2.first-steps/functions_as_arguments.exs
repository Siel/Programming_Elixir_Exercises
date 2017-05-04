times_2 = fn n -> 2*n end

apply = fn (fun,value) -> fun.(value) end

IO.puts apply.(times_2,2)


#example

example = [1,3,5,7,9]
Enum.map example,times_2 