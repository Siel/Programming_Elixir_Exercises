File.read!("/usr/share/dict/words")
|>String.split
|>Enum.max_by(&String.length/1)#Este retorna un solor valor -> no Stream
|>IO.puts