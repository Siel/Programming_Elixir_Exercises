IO.puts "Hello World!"

#Matching
#import_file "file.exs"
#c "file.exs"
#elixir "file.exs"

list = [1,2,[3,4,5]]
[a,b,c] = list
IO.puts a
IO.puts b
IO.puts c

#Concatenacion
[1,2,3]++[1,2,3]
[1,2,3,4]--[2,4]#=>[1,3] Diferencia
1 in [1,2,3] #=> true

#Listas con keyvalue

[nombre: "julian", profesion: "ingeniero", edad: 26]
a[:nombre]
#Maps

#%{key => value, key => value}
#si el key es un atom, entonces
#a=%{key: value, key: value}
#a.key o a[:key]

