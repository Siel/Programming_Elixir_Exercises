#Miremos un ejemplo de nested access con selección de los elementos de forma dinámica
#con la versión función en vez de la macro

nested = %{
  buttercup: %{
    actor: %{
      first: "Robin",
      last:  "Wright"
    },
    role: "princess"
  },
  westley: %{
    actor: %{
      first: "Cary",
      last:  "Ewles"     # typo!
    },
    role: "farm boy"
  }
}

IO.inspect get_in(nested,[:buttercup])
IO.inspect get_in(nested,[:buttercup, :actor])
IO.inspect get_in(nested,[:buttercup, :actor, :first])
IO.inspect put_in(nested,[:westley, :actor, :last],"Elwes")
