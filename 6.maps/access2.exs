#The Elem func tion works on tuples

cast =[
  %{
    character: "Buttercup",
    actor: {"Robin", "Wright"},
    role: "Princess"
  },
  %{
    character: "Westley",
    actor: {"Carey","Elwes"},
    role: "Farm boy"
  }
]
IO.inspect get_in(cast,[Access.all(),:actor])
#[{"Robin", "Wright"}, {"Carey", "Elwes"}]
IO.inspect get_in(cast,[Access.all(),:actor,Access.elem(1)])
#["Wright", "Elwes"]
#este me devuelve una tupla, con los valores antes de cambiar
#y con la nueva lista
a=get_and_update_in(cast,[Access.all(),
                :actor,Access.elem(1)], 
                fn(val) -> {val,String.reverse(val)} end )
#este solo me devuelve la lista
a1=update_in(cast,[Access.all(),
                :actor,Access.elem(1)], 
                fn(val) -> String.reverse(val) end)

