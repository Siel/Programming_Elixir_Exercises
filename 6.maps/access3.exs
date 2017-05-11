#Access.pop remueve una entrada de un contenedor dado:
#un map, una lista...

Access.pop(%{name: "Elixir", creator: "Valim"},:name)
#{"Elixir", %{creator: "Valim"}}
Access.pop([name: "Elixir", creator: "Valim"],:name)
#{"Elixir", [creator: "Valim"]}
Access.pop(%{name: "Elixir", creator: "Valim"},:year)
#{nil, %{creator: "Valim", name: "Elixir"}}
