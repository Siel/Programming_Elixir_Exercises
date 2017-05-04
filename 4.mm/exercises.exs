defmodule Ex do
    #sum(n)
    def sum(0), do: 0
    def sum(n), do: n + sum(n-1) 

    #gcd(x,y) maximo comun divisor
    def gcd(x,0), do: x 
    def gcd(x,y), do: gcd(y,rem(x,y))

    def greet(name), do: "Hi #{name}"

end

defmodule Chop do
    def guess(actual, low..high) do
        guess = div(low+high,2)
        IO.inspect guess
        _guess(actual,low..high,guess)
    end

    defp _guess(actual,_,actual), do: actual

    defp _guess(actual, _..high, guess) when actual>guess do
        guess(actual,guess..high)
    end

    defp _guess(actual, low.._, guess) when actual<guess do
        guess(actual,low..guess)
    end
end

#libraries
#convert float to string
b=3.141592685
a= :io_lib.format("~.2f",[b])
IO.puts a

#get a value of an operating system environment variable
use Mix.Config
System.get_env("PATH")

#return the extension component of a file
[_,ext]=Regex.run(~r{(\.\w+)$},"dave/test.exs")
Path.extname("dave/test.exs")

#current working directory
File.cwd

#Exec a comand on terminal
System.cmd("whoami",[])

