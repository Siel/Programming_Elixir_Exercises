defmodule HotelRoom do
    
    def book(%{name: name, height: height})
    when height >1.9 do
        IO.puts "Need extra long bed for #{name}"
    end
    def book(%{name: name, height: height})
    when height < 1.3 do
        IO.puts "Need low shower controls for #{name}"
    end
    def book(person) do
        IO.puts "Need regular bed for #{person.name}"
    end
end

people = [
  %{ name: "Grumpy",    height: 1.24 },
  %{ name: "Dave",      height: 1.88 },
  %{ name: "Dopey",     height: 1.32 },
  %{ name: "Shaquille", height: 2.16 },
  %{ name: "Sneezy",    height: 1.28 }
]

people
|> Enum.each(&HotelRoom.book/1)

#Pattern matching can´t bind keys:
##You can do this:
%{2 => state} = %{1=> :ok, 2=> :error}
#state => :error

##but you can't to this:
%{item => :ok} = %{1=> :ok, 2=> :error}
#Error

#Matching keys (lo mismo de arriba pero dinamico)

data = %{name: "Dave", likes: "elixir"}
for key <- [:name,:likes] do#este for retorna una lista
    %{^key=>value}=data#recordar que ^usa un valor previo existente
    value#retorno
end