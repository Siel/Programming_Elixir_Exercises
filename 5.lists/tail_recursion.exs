#abajo hay un ejemplo de tail recursion, optimización de funciones recursivas
defmodule MyList do
    def mapsum([],_), do: 0
    def mapsum([head|tail],fun) do
        fun.(head) + mapsum(tail,fun)
    end 

    def max([head|tail]) do
        _max(tail,head)
    end
    defp _max([],max), do: max
    defp _max([head|tail],max) when head>= max do
        max([head|tail])
    end
    defp _max([head|tail],max) when max > head do
        max([max|tail])
    end


    def max2([max]), do: max
    def max2([max|[head|tail]]) when head>= max do
        max([head|tail])
    end
    def max2([max|[head|tail]]) when max > head do
        max([max|tail])
    end

    def caesar([], n), do: []
    def caesar([head|tail],n) when (head+n) > 122 do
        [head+n-26|caesar(tail,n)]
    end
    def caesar([head|tail],n) when (head+n) <= 122 do
        [head+n|caesar(tail,n)]
    end

    def span(from,to) when from > to, do: []
    def span(from, to) do
        [from | span(from+1,to)]
    end

end

#la solución de arriba es valida, pero no es optima
    #existe una optimización que se le puede hacer a las funciones recursivas
    #llamada tail recursion, la idea es que la función recursiva no vaya retornando valores
    #y que con estos valores vaya armando la respuesta (como en el ejemplo de arriba)
    #sino, se espera que las funciones no retornen (en la iteración), por el contrario, las funciones deben
    #solamente llamarse a si mismas de forma recursiva (menos retornos = más optimo), un ejemplo de esto lo pongo a continuación

    #cada vez que se llama a una funcion, todos los valores previos que estaban en el scope de la función que llamó, deben enviarse
    #al stack para que los registros estén libres para almacenar el nuevo conjunto de variables de la función que se llama,
    #si  hacemos esto: [from | span(from+1,to)] hay que guardar ese valor from por cada iteración en el stack
    #en cambio si hacemos esto _span(from+1, to, [from+1 | acc]), todos los valores se pasan en la función y así no se
    #sorecarga el stack

defmodule MyList2 do
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
end