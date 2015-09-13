A directory of all MM, FF, and MMII monsters and where they are found
by frequency, based on terrain.

The core is a database file of monsters (MMIIMonsters.txt) which is
fed into a program (parse.pl) along with a type for the database (this
can be anything but the current data file only contains land
encounters so I usually call it "land"). For example:

./parse.pl <MMIIMonsters.txt land

Parse.pl then produces a database in the form of a directory structure
such that the monsters which are common in tropical civilized forests
are found in

land/tropical_civilized_forest/common

this allows you to, for example, find where trolls live and their
frequency in each terrain:

[code]grep -rHi "^troll$" *
cold_civilized_desert/rare:Troll
cold_civilized_forest/uncommon:Troll
cold_civilized_hills/rare:Troll
cold_civilized_mountains/rare:Troll
cold_civilized_plains/rare:Troll
cold_civilized_swamp/uncommon:Troll
cold_wilderness_desert/rare:Troll
cold_wilderness_forest/uncommon:Troll
cold_wilderness_hills/rare:Troll
cold_wilderness_mountains/rare:Troll
cold_wilderness_plains/rare:Troll
cold_wilderness_swamps/uncommon:Troll
temperate_civilized_desert/rare:Troll
temperate_civilized_forest/uncommon:Troll
temperate_civilized_hills/rare:Troll
temperate_civilized_mountains/rare:Troll
temperate_civilized_plains/rare:Troll
temperate_civilized_swamp/uncommon:Troll
temperate_wilderness_desert/rare:Troll
temperate_wilderness_forest/uncommon:Troll
temperate_wilderness_hills/rare:Troll
temperate_wilderness_plains/rare:Troll
temperate_wildernes_swamp/uncommon:Troll
tropical_civilized_desert/rare:Troll
tropical_civilized_forest/uncommon:Troll
tropical_civilized_hills/rare:Troll
tropical_civilized_mountains/rare:Troll
tropical_civilized_plains/rare:Troll
tropical_civilized_swamp/uncommon:Troll
tropical_wilderness_desert/rare:Troll
tropical_wilderness_forest/uncommon:Troll
tropical_wilderness_hills/rare:Troll
tropical_wilderness_mountains/rare:Troll
tropical_wilderness_plains/rare:Troll
tropical_wilderness_swamp/uncommon:Troll
[/code]

and if you cd into a specific terrain then you should be able to do:

[code]sort -R common |head -1
Dinosaur, Triceratops[/code]

To get a single random common encounter,

or, for that matter
[code]sort -R common |head -10
Skunk
Rat, Giant
Jackal
Dinosaur, Monoclonius
Dinosaur, Styracosaur
Dinosaur, lguanadon
Wolf
Toad, Giant
Rhinoceros
Falcon, Small
[/code]

to get 10

You can also do 
[code]
cat temperate*/*|sort|uniq -c|sort -n|less
[/code]

to, in this case, get an ordered list with counts for how often each monster appears in a subset of terrains (except it doesn't list those that don't appear at all).

Parse.pl deletes any existing frequency files (but not directories) when it runs. It wouldn't be very hard to script it to pick a frequency list based on a random number.
