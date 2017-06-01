#No solo el modulo Enum soporta Streams
#Otros modulos han venido implementando esta funcionalidad

File.open!("/usr/share/dict/words")
|> IO.stream(:line)
|> Enum.max_by(&String.length/1)
|> IO.puts