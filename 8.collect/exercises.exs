defmodule MyList do
    def span(from, to) when from <= to do
        _span(from, to, [from])
    end
    
    def span(from, to) do
        span(to, from)
    end
    
    defp _span(from, to, acc) when from  == to do
        acc |> :lists.reverse
    end
    
    defp _span(from, to, acc) do
        x = from + 1
        _span(x, to, [x | acc])
    end

    def primes_upto(n) do
      range = span(2,n)
      range -- for x<-range, y<-range, y<x, rem(x,y)==0, do: x
    end
end

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

  defp check_taxes(order=[id: id, ship_to: st, net_amount: nt], taxes) do
    Keyword.put(order, :total_amount, nt+nt*Keyword.get(taxes,st,0))
  end

end