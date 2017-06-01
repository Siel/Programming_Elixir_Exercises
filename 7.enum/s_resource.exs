#How the streams can insteract with external resources?
#how to implement this by yourself?

#el primer argumento debería ser el recurso al que le queremos
#hacer stream, pero si pasamos directamente el recurso este abriría
#el mismo y es posible que nosotros no queramos iniciar el stream
#hasta pasado un tiempo, por lo que el primer parametro es una función
#que devuelve el recurso. 

#Lo mismo pasa para el tercer parámetro (cerrar el recurso)

defmodule Countdown do

  def sleep(seconds) do
    receive do
      after seconds*1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end

  def timer do
    Stream.resource(
      fn ->          # the number of seconds to the start of the next minute
         {_h,_m,s} = :erlang.time
         60 - s - 1
      end,

      fn 
        0     ->#Halt at zero
          {:halt, 0}
        count -> #wait for the next second, then return its countdown
          sleep(1)
          #Retorna una lista y convierte el numero en string
          { [inspect(count)], count - 1 }
      end,

      fn _ -> nil end   # nothing to deallocate
    )
  end
end

counter = Countdown.timer
printer = counter |> Stream.each(&IO.puts/1)
speaker = printer |> Stream.each(&Countdown.say/1)
speaker |> Enum.take(5)
#counter |> Enum.each(&IO.puts/1) directamente comienza a escribir

#Organizando
speaker = Countdown.timer
|>Stream.each(&IO.puts/1)
|>Stream.each(&Countdown.say/1)
|>Enum.take(5)