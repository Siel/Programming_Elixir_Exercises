defmodule Customer do
  defstruct name: "",company: ""
end

defmodule BugReport do
  defstruct owner: %Customer{}, details: "", severity: 1
end

report = %BugReport{owner: %Customer{name: "Siel", company: "Nimbus"},
                    details: "Muy grave", severity: 3}

#vamos a editar el nombre del cliente

#normalmente sería

report = %BugReport{report|owner: %Customer{report.owner| name: "Julian"}}
#Horrible!!
# y muy propenso a errores

#la mejor alternativa es:
report = put_in(report.owner.name, "Julián")

#Update_in aplica una función sobre un valor
update_in(report.owner.name, &("Sr. #{&1}"))
update_in(report.owner.name, fn a -> "Sr. #{a}" end )
#Existen otras dos funciones get_in y get_and_update_in

#nested accessors
#si si usan maps, se puede acceder a través de atoms
#iex(74)> report = %{ owner: %{ name: "Dave", company: "Pragmatic" }, severity: 1}
#%{owner: %{company: "Pragmatic", name: "Dave"}, severity: 1}
#iex(75)> report[:owner]
#%{company: "Pragmatic", name: "Dave"}
#iex(76)> report[:owner][:name]
#"Dave"
#iex(77)>wner.name = report[:owner][:name]

#Estos 4 nested accessors que hemos vistos son macros, por lo que se reemplazan en
#tiempo de compilación


