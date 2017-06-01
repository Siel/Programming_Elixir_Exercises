#Servers line by line
File.stream!("/usr/share/dict/words")
|>Enum.max_by(&String.length/1)
|>IO.puts

#Se demora toda la vida
#tiene que esperar que todos los datos 
#estén listos par envirlos a la siguiente funcion
Enum.map(1..1_000_000_000,&(&1+1))|> Enum.take(5)

#instantaneo
#Va enviando los datos a medida que los tiene disponibles
Stream.map(1..1_000_000_000,&(&1+1))|> Enum.take(5)
