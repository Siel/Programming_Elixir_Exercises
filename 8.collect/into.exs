#Las comprehensions por defecto retornan listas, esto puede ser
#modificado con la expresión into

IO.inspect for x <- ~w{cat dog}, into: %{},
               do: {x, String.upcase(x)}
IO.inspect for x <- ["cat", "dog"], do: {x, String.upcase(x)}

IO.inspect for x <- ~w{cat dog}, into: Map.new,
               do: {x, String.upcase(x)}
#The collection does not have to be empty
IO.inspect for x <- ~w{cat dog}, into: %{"ant"=>"ANT"},
               do: {x, String.upcase(x)}

#for recibe todo tipo de colecciones

for x <- ~w{cat dog}, into: IO.stream(:stdio, :line),
                do: "--#{x}--\n"