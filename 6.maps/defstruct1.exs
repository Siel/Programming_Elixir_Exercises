#Why are struct wrapped in a module?
#Because is intendeed to have some struct-specific behavior
defmodule Attendee do
  defstruct name: "", paid: false, over_18: true

  def may_attend_after_party(attendee = %Attendee{}) do
    attendee.paid && attendee.over_18
  end

  def print_vip_badge(%Attendee{}) do
    raise "Missing name for badge"
  end

  def print_vip_badge(%Attendee{name: name}) do
    IO.puts "Very cheap badge to #{name}"
  end
end

#iex(16)> j=%Attendee{name: "Julian"}
#%Attendee{name: "Julian", over_18: true, paid: false}
#iex(17)> Attendee.may_attend_after_party(j)
#false
#iex(18)> j=%{j|paid: true}
#%Attendee{name: "Julian", over_18: true, paid: true}
#iex(19)> Attendee.may_attend_after_party(j)
#true
#iex(20)> Attendee.print_vip_badge(j)
#Very cheap badge to Julian
#:ok
#iex(44)> a3 = %Attendee{}
#%Attendee{name: "", over_18: true, paid: false}
#iex(45)> Attendee.print_vip_badge(a3)
#** (RuntimeError) Missing name for badge
#    defstruct1.exs:11: Attendee.print_vip_badge/1