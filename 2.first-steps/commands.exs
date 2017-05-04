#fn
#    parameter-list -> body
#    parameter-list -> body
#end

#funciones anonimas

sum = fn a,b -> a+b end

IO.puts sum.(1,2)

#exercises

list_concat = fn a,b -> a++b end
list_concat.([:a, :b], [:c, :d])

sum = fn a,b,c -> a+b+c end
sum.(1,2,3)

pair_tuple_to_list = fn {a,b} -> [a,b] end # ejemplo perfecto del matching!
pair_tuple_to_list.({1234,5678}) 

