#C - A character list with no escaping or interpolation
~C{Hola mundo}
#c - A character list, scaped and interpolated just like a single 
#quoted string
~c{Hola mundo}
#D - A date in the format yyyy-mm--dd
~D{1991-02-09}
#N - A naive(raw) datetime in the format yyyy-mm--dd hh:mm:ss[.ddd]
~N{1991-02-09 10:00:00.000}
#R - A regular expression with no escaping or interpolation
~R{_lp:\*:(\d+):(\d+)}
#r - A regular expression, escaped and interpolated
~r{_lp:\*:(\d+):(\d+)}
#S - A string with no escaping or interpolation
~S{Hola mundo}
#s - A string escaped and interpolated
~s{hola mundo}
#T - Time hh:mm:ss
~T{05:45:00}
#W - List of white-spaced delimited words no escaping or interpolation
~W{La vida es bella}
#w - List of white-spaced delimited words with escaping and interpolation
~w{La vida es bella}

#Ejemplos
~C[1\n2#{1+2}]
~c[1\n2#{1+2}]
~S[1\n2#{1+2}]
~s[1\n2#{1+2}]
~W[The c#{'a'}t sat on the mat]
~w[The c#{'a'}t sat on the mat]
~N[1999-12-31 23:59:59]

#~W y ~w toman argumentos adicionales a, c y s (atom, char, string)
~w[the c#{'a'}t sat on the mat]a
~w[the c#{'a'}t sat on the mat]c
~w[the c#{'a'}t sat on the mat]s

"Cat" #string
'cat' #char list

