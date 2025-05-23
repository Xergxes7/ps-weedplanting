# Project Sloth Weed Planting 

Script provides the convenience of planting weed anywhere using both male and female seeds, along with additional features like watering, harvesting branches, drying, and packing the weed.

For all support questions, ask in our [Discord](https://www.discord.gg/projectsloth) support chat. Do not create issues if you need help. Issues are for bug reporting and new features only.

# Preview
![image](https://user-images.githubusercontent.com/82112471/221007957-34e1641e-1cc0-469a-8bf1-33315ef1bdf0.png)
![image](https://user-images.githubusercontent.com/82112471/221006801-4639fe6e-3a07-4d27-b0e1-90e1134829fd.png)
![image](https://user-images.githubusercontent.com/82112471/221007532-bd50ae14-5927-4d7e-90fb-b2c1c9b0c467.png)
![image](https://user-images.githubusercontent.com/82112471/221007532-bd50ae14-5927-4d7e-90fb-b2c1c9b0c467.png)
![image](https://user-images.githubusercontent.com/107671912/222414486-e789257e-f9f4-4152-a8d0-738be9d13fa7.png)
![image](https://user-images.githubusercontent.com/107671912/224058250-8635434c-0c16-4ff4-97bf-d3b5d9290a64.png)

# Dependencies

- [QBCore](https://github.com/qbcore-framework/qb-core)
- [oxmysql](https://github.com/overextended/oxmysql)

# Installation
* Download ZIP
* Drag and drop resource into your server files, make sure to remove -main in the folder name
* Run the attached SQL script (weedplanting.sql)
* Start resource through server.cfg
* Restart your server.
## older qb-core
## Add to your qb-core > shared > items.lua
```lua
--- ps-weedplanting
['weedplant_seedm'] 			 = {['name'] = 'weedplant_seedm', 			    ['label'] = 'Male Weed Seed', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'weedplant_seed.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Male Weed Seed'},
['weedplant_seedf'] 			 = {['name'] = 'weedplant_seedf', 			    ['label'] = 'Female Weed Seed', 		['weight'] = 0, 		['type'] = 'item', 		['image'] = 'weedplant_seed.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Female Weed Seed'},
['weedplant_branch'] 			 = {['name'] = 'weedplant_branch', 			    ['label'] = 'Weed Branch', 				['weight'] = 10000, 	['type'] = 'item', 		['image'] = 'weedplant_branch.png', 	['unique'] = true, 		['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Weed plant'},
['weedplant_weed'] 		     	 = {['name'] = 'weedplant_weed', 			    ['label'] = 'Dried Weed', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'weedplant_weed.png', 		['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Weed ready for packaging'},
['weedplant_packedweed'] 		 = {['name'] = 'weedplant_packedweed', 			['label'] = 'Packed Weed', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'weedplant_weed.png', 		['unique'] = true, 		['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Weed ready for sale'},
['weedplant_package'] 			 = {['name'] = 'weedplant_package', 			['label'] = 'Suspicious Package', 		['weight'] = 10000, 	['type'] = 'item', 		['image'] = 'weedplant_package.png', 	['unique'] = true, 		['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Suspicious Package'},
['plant_tub'] 			         = {['name'] = 'plant_tub', 			        ['label'] = 'Plant Tub', 		     	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'plant_tub.png', 		    ['unique'] = false, 	['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Pot for planting plants'},
['empty_watering_can'] 			 = {['name'] = 'empty_watering_can', 			['label'] = 'Empty Watering Can', 		['weight'] = 500, 		['type'] = 'item', 		['image'] = 'watering_can.png', 	    ['unique'] = true, 	    ['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Empty watering can'},
['full_watering_can'] 			 = {['name'] = 'full_watering_can', 			['label'] = 'Full Watering Can', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'watering_can.png', 	    ['unique'] = true, 	    ['useable'] = false, 	['shouldClose'] = false,	   ['combinable'] = nil,   ['description'] = 'Watering can filled with water for watering plants'},
["keya"]                         = {["name"] = "keya",                          ["label"] = "Labkey A",                 ["weight"] = 0,         ["type"] = "item",      ["image"] = "keya.png",                 ["unique"] = true,      ["useable"] = false,    ["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "Labkey A.."},
```
## new qb-core update
## Add to your qb-core > shared > items.lua
```lua
--- ps-weedplanting
weedplant_seedm 			 = {name = 'weedplant_seedm', 			    label = 'Male Weed Seed', 			weight = 0, 		type = 'item', 		image = 'weedplant_seed.png', 		unique = false, 	useable = false, 	shouldClose = false,   combinable = nil,   description = 'Male Weed Seed'},
weedplant_seedf 			 = {name = 'weedplant_seedf', 			    label = 'Female Weed Seed', 		weight = 0, 		type = 'item', 		image = 'weedplant_seed.png', 		unique = false, 	useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Female Weed Seed'},
weedplant_branch 			 = {name = 'weedplant_branch', 			    label = 'Weed Branch', 				weight = 10000, 	type = 'item', 		image = 'weedplant_branch.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Weed plant'},
weedplant_weed 		     	 = {name = 'weedplant_weed', 			    label = 'Dried Weed', 				weight = 100, 		type = 'item', 		image = 'weedplant_weed.png', 		unique = false, 	useable = false, 	shouldClose = false,   combinable = nil,   description = 'Weed ready for packaging'},
weedplant_packedweed 		 = {name = 'weedplant_packedweed', 			label = 'Packed Weed', 				weight = 100, 		type = 'item', 		image = 'weedplant_weed.png', 		unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Weed ready for sale'},
weedplant_package 			 = {name = 'weedplant_package', 			label = 'Suspicious Package', 		weight = 10000, 	type = 'item', 		image = 'weedplant_package.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Suspicious Package'},
plant_tub 			         = {name = 'plant_tub', 			        label = 'Plant Tub', 		     	weight = 1000, 		type = 'item', 		image = 'plant_tub.png', 		    unique = false, 	useable = false, 	shouldClose = false,   combinable = nil,   description = 'Pot for planting plants'},
empty_watering_can 			 = {name = 'empty_watering_can', 			label = 'Empty Watering Can', 		weight = 500, 		type = 'item', 		image = 'watering_can.png', 	    unique = true, 	    useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Empty watering can'},
full_watering_can 			 = {name = 'full_watering_can', 			label = 'Full Watering Can', 		weight = 1000, 		type = 'item', 		image = 'watering_can.png', 	    unique = true, 	    useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Watering can filled with water for watering plants'},
keya                         = {name = "keya",                          label = "Labkey A",                 weight = 0,         type = "item",      image = "keya.png",                 unique = true,      useable = false,    shouldClose = false,   combinable = nil,   description = "Labkey A.."},

--strains
--seeds
weed_whitewidow_seed         = { name = 'weed_whitewidow_seed', label = 'White Widow Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = false, combinable = nil, description = 'A weed seed of White Widow' },
weed_skunk_seed              = { name = 'weed_skunk_seed', label = 'Skunk Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of Skunk' },
weed_purplehaze_seed         = { name = 'weed_purplehaze_seed', label = 'Purple Haze Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of Purple Haze' },
weed_ogkush_seed             = { name = 'weed_ogkush_seed', label = 'OGKush Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of OG Kush' },
weed_amnesia_seed            = { name = 'weed_amnesia_seed', label = 'Amnesia Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of Amnesia' },
weed_ak47_seed               = { name = 'weed_ak47_seed', label = 'AK47 Seed', weight = 0, type = 'item', image = 'weed_seed.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A weed seed of AK47' },


--harvested
weedplant_branch_purplehaze  = {name = 'weedplant_branch_purplehaze', 		label = 'Purple Haze Weed Branch', 				weight = 10000, 	type = 'item', 		image = 'weedplant_branch.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Purple Haze Weed plant'},
weedplant_branch_ogkush 	 = {name = 'weedplant_branch_ogkush', 			label = 'OG Kush Weed Branch', 				weight = 10000, 	type = 'item', 		image = 'weedplant_branch.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'OG Kush Weed plant'},
weedplant_branch_whitewidow  = {name = 'weedplant_branch_whitewidow', 		label = 'White Widow Weed Branch', 				weight = 10000, 	type = 'item', 		image = 'weedplant_branch.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'White Widow Weed plant'},
weedplant_branch_skunk		 = {name = 'weedplant_branch_skunk', 			label = 'Skunk Weed Branch', 				weight = 10000, 	type = 'item', 		image = 'weedplant_branch.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Skunk Weed plant'},
weedplant_branch_amnesia 	 = {name = 'weedplant_branch_amnesia', 			label = 'Amnesia Weed Branch', 				weight = 10000, 	type = 'item', 		image = 'weedplant_branch.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Amnesia Weed plant'},
weedplant_branch_ak47 		 = {name = 'weedplant_branch_ak47', 	    	label = 'AK47 Weed Branch', 				weight = 10000, 	type = 'item', 		image = 'weedplant_branch.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'AK47 Weed plant'},



--dried
weedplant_weed_purplehaze 		     	 	 = {name = 'weedplant_weed_purplehaze', 			    label = 'Dried Purple Haze Weed', 				weight = 100, 		type = 'item', 		image = 'weedplant_weed.png', 		unique = false, 	useable = false, 	shouldClose = false,   combinable = nil,   description = 'Purple Haze Weed ready for packaging'},
weedplant_weed_ogkush  		     	 	 = {name = 'weedplant_weed_ogkush', 			    label = 'Dried OG Kush Weed', 				weight = 100, 		type = 'item', 		image = 'weedplant_weed.png', 		unique = false, 	useable = false, 	shouldClose = false,   combinable = nil,   description = 'OG Kush Weed ready for packaging'},
weedplant_weed_whitewidow 		     	 	 = {name = 'weedplant_weed_whitewidow', 			    label = 'Dried White Widow Weed', 				weight = 100, 		type = 'item', 		image = 'weedplant_weed.png', 		unique = false, 	useable = false, 	shouldClose = false,   combinable = nil,   description = 'White Widow Weed ready for packaging'},
weedplant_weed_skunk	 		     	 	 = {name = 'weedplant_weed_skunk', 			    label = 'Dried Skunk Weed', 				weight = 100, 		type = 'item', 		image = 'weedplant_weed.png', 		unique = false, 	useable = false, 	shouldClose = false,   combinable = nil,   description = 'Skunk Weed ready for packaging'},
weedplant_weed_amnesia 		     	 	 = {name = 'weedplant_weed_amnesia', 			    label = 'Dried Amnesia Weed', 				weight = 100, 		type = 'item', 		image = 'weedplant_weed.png', 		unique = false, 	useable = false, 	shouldClose = false,   combinable = nil,   description = 'Amnesia Weed ready for packaging'},
weedplant_weed_ak47		     	 	 = {name = 'weedplant_weed_ak47', 			    label = 'Dried AK47 Weed', 				weight = 100, 		type = 'item', 		image = 'weedplant_weed.png', 		unique = false, 	useable = false, 	shouldClose = false,   combinable = nil,   description = 'AK47 Weed ready for packaging'},


--Packed
weed_whitewidow              = { name = 'weed_whitewidow', label = 'White Widow Weed', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = { accept = { 'rolling_paper' }, reward = 'joint_whitewidow', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Rolling joint', timeOut = 5000, } }, description = 'A weed bag with White Widow ready for sale' },
weed_skunk                   = { name = 'weed_skunk', label = 'Skunk Weed', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = { accept = { 'rolling_paper' }, reward = 'joint_skunk', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Rolling joint', timeOut = 5000, } }, description = 'A weed bag with Skunk ready for sale' },
weed_purplehaze              = { name = 'weed_purplehaze', label = 'Purple Haze Weed', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = { accept = { 'rolling_paper' }, reward = 'joint_purplehaze', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Rolling joint', timeOut = 5000, } }, description = 'A weed bag with Purple Haze ready for sale' },
weed_ogkush                  = { name = 'weed_ogkush', label = 'OGKush Weed', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = { accept = { 'rolling_paper' }, reward = 'joint_ogkush', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Rolling joint', timeOut = 5000, } }, description = 'A weed bag with OG Kush ready for sale' },
weed_amnesia                 = { name = 'weed_amnesia', label = 'Amnesia Weed', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = { accept = { 'rolling_paper' }, reward = 'joint_amnesia', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Rolling joint', timeOut = 5000, } }, description = 'A weed bag with Amnesia ready for sale' },
weed_ak47                    = { name = 'weed_ak47', label = 'AK47 Weed', weight = 200, type = 'item', image = 'weed_baggy.png', unique = false, useable = true, shouldClose = false, combinable = { accept = { 'rolling_paper' }, reward = 'joint_ogkush', anim = { dict = 'anim@amb@business@weed@weed_inspecting_high_dry@', lib = 'weed_inspecting_high_base_inspector', text = 'Rolling joint', timeOut = 5000, } }, description = 'A weed bag with AK47 ready for sale' },


--WeedRun
weedplant_package_whitewidow = {name = 'weedplant_package_whitewidow', 			label = 'Suspicious Package', 			weight = 10000, 	type = 'item', 		image = 'weedplant_package.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Suspicious Package'},
weedplant_package_skunk		 = {name = 'weedplant_package_skunk', 			label = 'Suspicious Package', 			weight = 10000, 	type = 'item', 		image = 'weedplant_package.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Suspicious Package'},
weedplant_package_purplehaze = {name = 'weedplant_package_purplehaze', 			label = 'Suspicious Package', 			weight = 10000, 	type = 'item', 		image = 'weedplant_package.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Suspicious Package'},
weedplant_package_ogkush     = {name = 'weedplant_package_ogkush', 			label = 'Suspicious Package', 			weight = 10000, 	type = 'item', 		image = 'weedplant_package.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Suspicious Package'},
weedplant_package_amnesia 	 = {name = 'weedplant_package_amnesia', 			label = 'Suspicious Package', 			weight = 10000, 	type = 'item', 		image = 'weedplant_package.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Suspicious Package'},
weedplant_package_ak47  	 = {name = 'weedplant_package_ak47', 			label = 'Suspicious Package', 			weight = 10000, 	type = 'item', 		image = 'weedplant_package.png', 	unique = true, 		useable = false, 	shouldClose = false,   combinable = nil,   description = 'Suspicious Package'},


--Growing Items
plant_tub 			         = {name = 'plant_tub', 			        label = 'Plant Tub', 		     		weight = 1000, 		type = 'item', 		image = 'plant_tub.png', 		unique = false, 	useable = false, 	shouldClose = false,   combinable = nil,   description = 'Pot for planting plants'},
empty_watering_can 			 = {name = 'empty_watering_can', 			label = 'Empty Watering Can', 			weight = 500, 		type = 'item', 		image = 'watering_can.png', 	    	unique = true, 	    	useable = true, 	shouldClose = true,	   combinable = nil,   description = 'Empty watering can'},
full_watering_can 			 = {name = 'full_watering_can', 			label = 'Full Watering Can', 			weight = 1000, 		type = 'item', 		image = 'watering_can.png', 	   	unique = true, 	    	useable = false, 	shouldClose = false,	   combinable = nil,   description = 'Watering can filled with water for watering plants'},
keya                         		 = {name = "keya",                          		label = "Labkey A",                 		weight = 0,         	type = "item",      	image = "keya.png",                 	unique = true,      	useable = false,    shouldClose = false,   combinable = nil,   description = "Labkey A.."},
weed_nutrition               = { name = 'weed_nutrition', label = 'Plant Fertilizer', weight = 2000, type = 'item', image = 'weed_nutrition.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Plant nutrition' },
empty_weed_bag               = { name = 'empty_weed_bag', label = 'Empty Weed Bag', weight = 0, type = 'item', image = 'weed_baggy_empty.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'A small empty bag' },


```

## Weed Processing (Weed Lab)
If you want to use the script's own teleport system to go inside the weed lab then leave the `EnableTp = true` on line 24.

OR 

If you want to use qb-smallresources default teleport instead of the scripts then go to `qb-smallresource > config.lua` and add the following lines below `Config.Teleports` 
```
    --- Weedlab
    [1] = {
        [1] = {
            coords = vector4(1066.2, -3183.38, -39.16, 89.3),
            ["AllowVehicle"] = false,
            drawText = '[E] Exit Lab'
        },
        [2] = {
            coords = vector4(-66.95, -1312.37, 29.28, 180.95),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Lab'
        },

    },
```
# Credits
* [Lionh34rt](https://github.com/Lionh34rt) | Check out more scripts from Lionh34rt [here.](https://lionh34rt.tebex.io/category/1954119)
