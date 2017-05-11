#El módulo Acces da ciertas funciones para trabajar con get y get_and_update_in
#Ejm: All and at functions
cast = [
  %{
    character: "Buttercup",
    actor: %{
      first: "Robin",
      last: "Wright"
    },
    role: "Princess"
  },
  %{
    character: "Westley",
    actor: %{
      first: "Cary",
      last: "Elwes"
    },
    role: "farm boy"
  }
]
IO.inspect get_in(cast, [Access.all(), :actor, :first])#["Robin", "Cary"]
IO.inspect get_in(cast, [Access.at(0), :actor, :first])#"Robin"
IO.inspect get_and_update_in(cast,[Access.all(), :role],
                                fn(val)->{val,String.upcase(val)} end)
#Hay que retornar el valor sin editar y el valor editado en un tupla
