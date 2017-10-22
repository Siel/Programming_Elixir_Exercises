b = <<1, 2, 3>>
byte_size b #> 3
bite_size b #> 24

b= <<1::size(2), 1::size(3)>> #> <<9::size(5)>>
byte_size(b) #> 1
bite_size(b) #> 5

b = <<1>> #> <<1>>
bf = <<2.5::float>> #> <<64, 4, 0, 0, 0, 0, 0, 0>>
a = << b :: binary, bf :: binary >> #> <<1, 64, 4, 0, 0, 0, 0, 0, 0>>

#An IEEE 754 float has a sign bit, 11 bits of exponent, 
#and 52 bits of mantissa. The exponent is biased by 1023, 
#and the mantissa is a fraction with the top bit assumed to be 1. 
#So we can extract the fields and then use :math.pow, 
#which performs exponentiation, to reassemble the number:
<< sign::size(1), exp::size(11), mantissa::size(52) >> = << 3.14159::float >>
(1 + mantissa / :math.pow(2, 52)) * :math.pow(2, exp-1023)


#Double Quoted Strings are binaries

#Some UTF8 char take more than one single byte
dqs = "∂x/∂y"
String.length dqs #> 5
byte_size dqs #> 9

String.at(dqs,0) #> "∂"
String.codepoints(dqs) #> ["∂", "x", "/", "∂", "y"]
String.split(dqs,"/")  #> ["∂x", "∂y"]
String.capitalize "école" #> "École"
String.downcase "ØRSteD" #> "ørsted"
String.upcase "JULIAN" #> "julian"
String.duplicate "Ho! ", 3 #> "Ho! Ho! Ho! "
String.ends_with? "string", ["elix", "stri", "ring"] #> true
String.starts_with? "string", ["elix", "stri", "ring"] #> true
String.first "∂og" #> "∂"
String.last "∂og" #> "g"
# returns a number between 0 - 1 indicating the simalirity of two strings
String.jaro_distance("jonathan", "jonathon")
String.myers_difference("banana", "panama")
#> [del: "b", ins: "p", eq: "ana", del: "n", ins: "m", eq: "a"]

#next_codepoint
defmodule MyString do
  def each(str, func), do: _each(String.next_codepoint(str), func)

  defp _each({codepoint, rest}, func) do
    func.(codepoint)
    _each(String.next_codepoint(rest), func)
  end

  defp _each(nil, _), do: []
end 	

MyString.each "∂og", fn c -> IO.puts c end

String.slice "the cat on the mat", 4, 3 #> "cat"
String.slice "the cat on the mat", -3, 3 #> "mat”

String.split "   the cat on the mat   " #> ["the", "cat", "on", "the", "mat"]
String.split "the cat on the mat", "t" #> ["", "he ca", " on ", "he ma", ""]
String.split "the cat on the mat", ~r{[ae]} #> ["th", " c", "t on th", " m", "t"]
String.split "the cat on the mat", ~r{[ae]}, parts: 2 #> ["th", " cat on the mat"]
String.trim "\n   julian nn          \n  " #> "julian nn"