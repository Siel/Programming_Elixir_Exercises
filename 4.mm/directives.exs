# import directive
defmodule Example do
  def func1 do
    List.flatten [1,[2,3],4]#aplana la lista
  end
  def func2 do
    import List, only: [flatten: 1]
    flatten [5,[6,7],8]
  end
end
#alias directive
defmodule Example2 do
  def compile_and_go(source) do
    alias My.Other.Module.Parser, as: Parser
 	  alias My.Other.Module.Runner, as: Runner
 	  source
 	  |> Parser.parse()
 	  |> Runner.execute()
 	end
end
