defmodule Canvas do
    @defaults [fg: "black", bg: "white", font: "Merri-weather"]

    def draw_text(text, options \\ []) do
        options = Keyword.merge(@defaults, options)#sobrescribe todas las keyword iguales, dejando las de optiones
        IO.puts "Drawing text #{inspect(text)}"
        IO.puts "Foreground:  #{options[:fg]}"
        IO.puts "Background:  #{Keyword.get(options,:bg)}"
        IO.puts "Font:        #{Keyword.get(options,:font)}"
        IO.puts "Pattern:     #{Keyword.get(options,:pattern,"solid")}"
        IO.puts "Style:       #{inspect Keyword.get_values(options,:style)}"#esto solo se puede hacer con listas
    end
end

#Canvas.draw_text("Hola", fg: "red", style: "italic", style: "bold")
#Canvas.draw_text("Hola", [fg: "red", style: "italic", style: "bold"])