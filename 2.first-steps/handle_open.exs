handle_open = fn 
 {:ok, file}  -> "First line: #{IO.read(file, :line)}"#El segundo parametro le dice que ejcutar :line :all
 {_,  error}  -> "Error: #{:file.format_error(error)}"
end
IO.puts handle_open.(File.open("HolaMundo.txt"))      # call with a file that exists
IO.puts handle_open.(File.open("nonexistent"))   # and then with one that doesn't