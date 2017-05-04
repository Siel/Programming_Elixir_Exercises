# Concatenate list
[1,2,3] ++ [4,5,6] #=> [1,2,3,4,5,6]

# Flatten
List.flatten([[[1],[2,3]],[4]])#=> [1,2,3,4]

# Folding (like reduce but in any direction)
List.foldl([1,2,3], "", fn value, acc -> "#{value}(#{acc})" end)
#=>"3(2(1()))"

List.foldr([1,2,3], "", fn value, acc -> "#{value}(#{acc})" end)
#=>"1(2(3()))"

# Updating in the middle (not a cheap operation)
list = [1,2,3]
List.replace_at(list,2,"hola")

#Accessing tuples within lists
kw=[{:name, "Dave"},{:likes, "Programming"},{:where, "Dallas", "TX"}]
kw[:name]#=> "Dave"
kw[:likes]#=> "Programming"
List.keyfind(kw,"Dallas",1) #=> {:where, "Dallas", "TX"}
List.keyfind(kw,"TX",1) #=> nil
List.keyfind(kw,"TX",2) #=>  {:where, "Dallas", "TX"}
List.keyfind(kw,"TX",1,"No city called TX") #=> "No city called TX"
List.keydelete(kw,"TX",2)#=> [name: "Dave", likes: "Programming"]
List.keyreplace(kw,:name,0,{:first_name, "Dave"}) #=> [{:first_name, "Dave"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]
List.keyreplace(kw,"Dave",1,{:first_name, "Juli"}) #=> [{:first_name, "Juli"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]