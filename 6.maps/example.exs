map = %{ name: "Dave", likes: "Programming", where: "Dallas" }
#%{likes: "Programming", name: "Dave", where: "Dallas"}
Map.keys map
#[:likes, :name, :where]
Map.values map
#["Programming", "Dave", "Dallas"]
map[:name]
#"Dave"
map.name
#"Dave"
map1 = Map.drop map, [:where, :likes]
#%{name: "Dave"}
map2 = Map.put map, :also_likes, "Ruby"
#%{also_likes: "Ruby", likes: "Programming", name: "Dave", where: "Dallas"}
Map.keys map2
#[:also_likes, :likes, :name, :where]
Map.has_key? map1, :where
#false
{ value, updated_map } = Map.pop map2, :also_likes
#{"Ruby", %{likes: "Programming", name: "Dave", where: "Dallas"}}
Map.equal? map, updated_map
#true
person = %{name: "Dave", height: 1.88}
#Is there an entry with the key :name?
%{name: name} = person
%{name: _, height: _} = person
%{name: "Dave"}=person
#pero este no hace match
%{name: _, weight: _}=person

#updating a map
new_map = %{old_map|key=>value,...}
#esta sintaxis no sirve para agregar nuevos elementos al map
m=%{a: 1, b: 2, c: 3}
m1=%{m|a: "one"}#=> %{a: "one", b:2, c:3}
#para agregar nuevos elementos al map hay que usar
#Map.put_new/3