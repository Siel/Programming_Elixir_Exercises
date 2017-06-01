# the idea of comprehensions is given a set of colelctions,
# extract all the combinations of values and potentially 
# filter the results

#result = for generator or filter ..[, into: value], do: expression

IO.inspect for x <- [1,2,3,4,5], do: x*x
#[1, 4, 9, 16, 25]
IO.inspect for x <- [1,2,3,4,5],x<4, do: x*x
#[1, 4, 9]
IO.inspect for x <- [1,2], y <- [5,6], do: x*y
#[5, 6, 10, 12]
# pattern <- enumerable : esto es un generator

#se pueden usar variables de generadores previos en los posteriores
min_maxes=[{1,4},{2,3},{10,15}]

IO.inspect for {min,max} <- min_maxes, n<-min..max, do: n

first8=[1,2,3,4,5,6,7,8]
IO.inspect for x<-first8, y<-first8,x>=y,rem(x*y,10)==0, do: {x,y}

#IO.inspect for x<-2..100, i<-2..(x-1),rem(x,i)==0, do: x

#The generator lets deconstruct the structured data

reports = [dallas: :hot, minneapolis: :cold, dc: :muggy, la: :smoggy]

IO.inspect for {city, weather} <- reports, do: {weather, city}

#Bitstrings
for <<ch <- "Hello">>, do: ch
#[72, 101, 108, 108, 111]#retorna una lista
for << ch <- "Hello">>, do: <<ch>>
#["H", "e", "l", "l", "o"]# en este caso cada caracter se vuelve
#a convertir en string
#En la palabra Hello hay 40 bits, el quiere coger de a 8 en cada iteracion
#size(3) significa octal, el size(2) sería base 4 pero los caracteres no superarian es valor
#tiene que sumar 8 porque o si no solo habria 4 elementos en la lista
#Easy stuff!
for << << b1::size(2), b2::size(3), b3::size(3)>> <- "Hello">>, do: "0#{b1}#{b2}#{b3}"
