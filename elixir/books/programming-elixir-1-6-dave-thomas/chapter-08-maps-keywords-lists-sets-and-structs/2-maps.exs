# Maps are the go to key/value data structure
#  they are like hashes / objects in JS
i = &IO.inspect/1

map = %{name: "Dave", likes: "Programming", where: "Dallas"}

i.(map)

i.(Map.keys(map))

i.(Map.values(map))

i.(map[:name])
i.(map[:likes])
i.(map[:where])

i.(map.name)

map1 = Map.drop(map, [:where, :likes])
i.(map1)

map2 = Map.put(map, :also_likes, "TypeScript")
i.(map2)

i.(Map.has_key?(map1, :where))

# { also_likes, updated_map } = Map.pop(map2, :also_likes)
result = Map.pop(map2, :also_likes)
i.(result)

i.(Map.equal?(map, elem(result, 1)))
