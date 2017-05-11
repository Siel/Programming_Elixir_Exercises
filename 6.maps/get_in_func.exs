#Se puede crear una función que retorne las llaves a buscar
#y pasarla como parámetro de las nested functions

authors = [
  %{name: "José", language: "Elixir"},
  %{name: "Matz", language: "Ruby"},
  %{name: "Larry", language: "Perl"}
]
#La clave es el symbol :get, get_in llama a la función anónima,
#pasa como primer parámetro el :get, luego la coleccón,
#finalmente next_fn es el mismo get_in, pero de un solo parámetro
#pues ya leyó el elemento siguiente de la lista
languages_with_an_r = fn(:get, collection, next_fn) ->
  for row <- collection do
    if String.contains?(row.language, "r") do
      IO.inspect next_fn
      next_fn.(row)#get_in(row,[:name])
    end
  end
end

IO.inspect get_in(authors, [languages_with_an_r,:name])
#IO.inspect languages_with_an_r.(:get,authors,get_in/2)

#Reescritura propia para entender que es lo que pasa.
languages = fn(collection)->
  for row <- collection do
    if String.contains?(row.language,"r") do
      get_in(row,[:name])
    end
  end
end

IO.inspect languages.(authors) #Funciona!
