#mapas con una estructura definida
defmodule Suscriber do
    defstruct name: "",paid: false, over_18: true
end

#Compilar esto directamente da error ya que el modulo no existiría
s1=%Suscriber{}
s2=%Suscriber{name: "Julian"}
IO.puts s2.name
s3 = %Suscriber{name: "Siel", paid: true, over_18: true}
#s4 = %Suscriber{hola: "mundo"}#Error
#iex(5)> %Suscriber{name: a_name}=s2
#%Suscriber{name: "Julian", over_18: true, paid: false}
#iex(6)> a_name
#"Julian"
#iex(7)> %{name: b_name}=s2
#%Suscriber{name: "Julian", over_18: true, paid: false}
#iex(8)> b_name
#"Julian"
#iex(9)> s3 = %Suscriber{s2|name: "Siel"}
#%Suscriber{name: "Siel", over_18: true, paid: false}
#iex(9)> s3 = %{s2|name: "Siel"} #Viable
