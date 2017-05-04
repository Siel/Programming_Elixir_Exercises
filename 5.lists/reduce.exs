defmodule MyList do
    def reduce([],value,_), do: value #última iteración de suma
    def reduce([head|tail],value,func) do
        reduce(tail,func.(head,value),func)
    end
end

