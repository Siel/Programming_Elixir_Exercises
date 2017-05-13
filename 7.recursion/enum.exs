#Technically, things that can be iterated are said to implement
# the Enumerable protocol.

#Elixir provides two modules for iteration:
  #The Enum module, is the workhorse for collections
  #The Stream module, enumerate collections lazily.
    #The next value is only calculated when it's needed

  #http://elixir-lang.com/docs <- READ IT!
  #The power of elixir comes from these libraries

#The Enum module is probabily the most used of all Elixir libraries
#Employ it to: iterate, combine, filter, split or manipulate 
#collections

#Convert any collection to a list

IO.inspect list=Enum.to_list 1..5
IO.inspect Enum.to_list %{saludo: "Hola", who: "Mundo"}

#Concatenate Collections

Enum.concat([1,2,3],[4,5,6])
[1,2,3]++[4,5,6]
Enum.concat([1,2,3],'abc')
[1,2,3]++'abc'#Warning: Single quotes!!

#Create a collection whose elements are a function of the original
#'*' no es un string, "*" si
Enum.map(list,&String.duplicate("*",&1))

#Seleccionar elementos por posición o algun criterio

Enum.at(10..20,3)#13
Enum.at(10..20,20)#nil
Enum.at(10..20,20,:no_one_here)#:no_one_here
Enum.filter(list,&(&1>2))#[3,4,5]

Require Integer #importo el módulo Integer
Enum.filter(list,&Integer.is_even/1)
Enum.reject(list,&Integer.is_even/1)

#Sort and compare elements

Enum.sort(["there","was","a","crooked","man"])
#["a", "crooked", "man", "there", "was"]
Enum.sort(["there","was","a","crooked","man"],
            fn(a,b)-> String.length(a)<=String.length(b) end)
#["a", "was", "man", "there", "crooked"]
#En sort es importante que el condicional sea <=
#ya que dejar opcione slibres puede provocar resultados inesperados
Enum.max(["there","was","a","crooked","man"])
#was
Enum.max_by(["there","was","a","crooked","man"],&String.length/1)
#crooked

#split a collection

Enum.take(list,3)#toma los primeros tres
Enum.take_every(list,2)#toma cada dos
Enum.take_while(list,&(&1<4))#toma mientras
Enum.split(list,3)#retorna una tupla con dos listas
Enum.split_while(list,&(&1<4))

#Join a collection

Enum.join(list)
Enum.join(list,", ")

#predicate operations

Enum.all?(list,&(&1<4))
Enum.any?(list,&(&1<4))
Enum.member?(list,4)
Enum.empty?(list)

#Merge collections

Enum.zip([:a, :b, :c, :d],list)
Enum.with_index([:once, :upon, :a, :time])

Enum.with_index(["once", "upon", "a", "time"])

#Fold elements into a single value

Enum.reduce(1..100,&(&1+&2))#             
Enum.reduce(["Julian", "David", "Otalvaro"],fn(val,acc)->val<>acc end)
#Leer la función del reduce: el nuevo valor se pone a la izquierda del anterior
# "Julian" es el primer valor y el acumulador comienza vacio
# "Julian"
# "DavidJulian"
# "OtalvaroDavidJulian"

Enum.reduce(["Julian", "David", "Otalvaro"],fn(val,acc)->acc<>val end)

Enum.reduce(["now", "is", "the", "time"], fn(word,longest)->
  if String.length(word)>String.length(longest) do
    word
  else
    longest
  end
end)

Enum.reduce(["now", "is", "the", "time"],0, fn(word,longest)->
  if String.length(word)>longest do
    String.length(word)
  else
    longest
  end
end)
#Asegurarse que longest inicie como 0.

#Deal a hand of cards
#for es una funcón y tiene retorno :D
deck = for rank <- 'A23456789TJQK', suit <- 'CDPT', do: [suit,rank]
deck |> Enum.shuffle |> Enum.take(13)#toma 13
deck |> Enum.shuffle |> Enum.chunk(13)#divide en grupos de 13
