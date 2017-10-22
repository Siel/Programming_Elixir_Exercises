#Codigo tomado de 8.collect/exercises.exs
defmodule TaxCalculator do
  def tax_rates do
    [NC: 0.075, TX: 0.08]
  end

  def raw_orders do
    [[ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 130, ship_to: :NC, net_amount:  50.00 ] ] 
  end

  def calc_orders_total(orders, taxes) do
    for order <- orders, do: check_taxes(order, taxes)#esto tambien se podria hacer con un map
  end

  defp check_taxes(order=[id: _id, ship_to: st, net_amount: nt], taxes) do
    Keyword.put(order, :total_amount, nt+nt*Keyword.get(taxes,st,0))
  end

end

defmodule Csv do
  def parse_csv!(file) do
		File.stream!(file)
		|> Stream.drop(1)#Elimina la primera línea
		|> Stream.map(&parse_line/1)
		|> Stream.map(&convert_line/1)
    |> Stream.map(&put_labels/1) #Linea no genérica
		|> Enum.to_list
	end

	defp parse_line(line) do
		line 
		|> String.trim
		|> String.split(",")
	end

	defp convert_line([id, state, amount]) do
		[id |> String.to_integer,
		state |> String.trim_leading(":") |> String.to_atom,
		amount |> String.to_float]
	end
  #Esta funcion deberia llamarse desde parse_csv, solo que quiero dejarla genérica
  defp put_labels([id, state, amount]), do: [id: id, ship_to: state, net_amount: amount]

end


"taxes.csv" 
|> Csv.parse_csv!
|> TaxCalculator.calc_orders_total(TaxCalculator.tax_rates)
|> IO.inspect

#"taxes.csv" 
#|> Csv.parse_csv!
#|> Stream.map(&Csv.put_labels/1)
#|> Enum.to_list
#|> IO.inspect