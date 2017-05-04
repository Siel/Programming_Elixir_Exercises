
result  =  with {:ok, file}   =  File.open("passwd"),
                content       =  IO.read(file, :all),
                :ok           =  File.close(file),
                [a, uid, gid] <- Regex.run(~r{xxx:.*?:(\d+):(\d+)}, content)
           do
                "Group: #{gid}, User: #{uid}"
                IO.puts a
                IO.puts content
                IO.puts "-----------"
           end

IO.puts inspect(result)       #=> nil