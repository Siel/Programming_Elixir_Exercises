defmodule MyEnum do
  #(:list,fn)=>boolean
  def all?([],_fun), do: true
  def all?([head|tail],fun) do
    if fun.(head) do
      all?(tail,fun)
    else
      false
    end
  end
  #no retorna nada, solo invoca la función
  def each([],_fun), do: :ok
  def each([head|tail],fun) do
    #[fun.(head)|each(tail,fun)] NO recursion de cola
    fun.(head)
    each(tail,fun)
  end
  #retorna una lista con los elementos que evaluados en fun = true
  #Esta primera implementación es suboptima y no funciona bien
  #def filter([],_fun), do: []
  #def filter([head|tail],fun) do
  #  if fun.(head) do
  #    [head | filter(tail,fun)]
  #  end
  #end

  #esta segunda implementación usa recursión de cola y es mejor
  def filter(list,fun) do
    _filter(list,fun,[])
  end

  defp _filter([],_fun,acc), do: Enum.reverse(acc)

  defp _filter([head|tail],fun,acc) do
    if fun.(head) do
      _filter(tail,fun,[head|acc])
    else
      _filter(tail,fun,acc)
    end
  end
  #return a tuple with two list
  def split(list,split) do
    _split(list,split,{[],[]})
  end

  defp _split([],_count,{l1,l2}) do
    {Enum.reverse(l1),Enum.reverse(l2)}
  end
  defp _split([head|tail],0,{l1,l2}) do
    _split(tail,0,{l1,[head|l2]})
  end 
  defp _split([head|tail],count,{l1,l2}) do
    _split(tail,count-1,{[head|l1],l2})
  end

  def take(list,count), do: elem(split(list,count),0)

  def flatten(list), do: Enum.reverse(do_flatten(list,[]))
  
  defp do_flatten([],acc), do: acc#porque no funcionó el reverse acá´?

  #si h es todavía una lista toca volver a dividirlo
  defp do_flatten([h|t],acc) when is_list(h) do
    do_flatten(t,do_flatten(h,acc))#dejamos esperando a t
    #y seguimos dividiendo h hasta llegar a la funcion de abajo
  end
  # si h ya no es una lista
  defp do_flatten([h|t],acc) do
    do_flatten(t,[h|acc])
  end
   
end
#[ 1, [ 2, 3, [4] ], 5, [[[6]]]]