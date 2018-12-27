# bo3fogandlighting
BO3 Changing lighting and fog bank states

Requires prefab that has volumetric example and world fog example
Requires two lighting states on your sun volume, compiled in radiant, exported, and compiled in launcher

Create fog folder in your scripts folder
Add fog change scripts to scripts/fog/ folder

Add to top of mapname.csc
#using scripts\zm\fog\fog_change;

mapname.gsc:
#using scripts\zm\fog\fog_change;

Add to zone file
scriptparsetree,scripts/zm/fog/fog_change.csc
scriptparsetree,scripts/zm/fog/fog_change.gsc
