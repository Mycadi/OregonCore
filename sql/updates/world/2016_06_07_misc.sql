-- Removes equipment from Rogue Voidwalkers.
UPDATE `creature_template` SET `equipment_id`=0 WHERE `entry` =16974;

-- Dreadcaller SAI
SET @ENTRY := 19434;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dreadcaller - Out of Combat - Enable Combat Movement (No Repeat)"),
(@ENTRY,0,1,2,4,0,100,1,0,0,0,0,11,32666,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dreadcaller - On Aggro - Cast 'Shadow Bolt' (No Repeat)"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dreadcaller - On Aggro - Increment Phase By 1 (No Repeat)"),
(@ENTRY,0,3,0,9,1,100,0,0,40,2400,3800,11,32666,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dreadcaller - Within 0-40 Range - Cast 'Shadow Bolt' (No Repeat)"),
(@ENTRY,0,4,5,3,1,100,1,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dreadcaller - Between 0-15% Mana - Enable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,5,0,61,1,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dreadcaller - Between 0-15% Mana - Increment Phase By 1 (Phase 1) (No Repeat)"),
(@ENTRY,0,6,0,9,1,100,0,35,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dreadcaller - Within 35-80 Range - Enable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,7,0,9,1,100,0,5,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dreadcaller - Within 5-15 Range - Disable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,8,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dreadcaller - Within 0-5 Range - Enable Combat Movement (Phase 1) (No Repeat)"),
(@ENTRY,0,9,0,3,0,100,0,30,100,100,100,23,0,1,0,0,0,0,1,0,0,0,0,0,0,0,"Dreadcaller - Between 30-100% Mana - Decrement Phase By 1 (Phase 1) (No Repeat)"),
(@ENTRY,0,10,0,0,0,100,0,4000,9000,18100,24000,11,11443,1,0,0,0,0,2,0,0,0,0,0,0,0,"Dreadcaller - In Combat - Cast 'Cripple' (Phase 1) (No Repeat)");

-- Pathing for Dreadcaller Entry: 19434 'TDB FORMAT'
SET @NPC := 69502;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=177.5729,`position_y`=2268.238,`position_z`=48.5948 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,177.5729,2268.238,48.5948,0,0,0,0,100,0),
(@PATH,2,206.0571,2228.519,54.04856,0,0,0,0,100,0);
-- 0xF1304BEA00397367 .go 177.5729 2268.238 48.5948

-- Pathing for Dreadcaller Entry: 19434 'TDB FORMAT'
SET @NPC := 69501;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=190.7178,`position_y`=2286.323,`position_z`=49.66181 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,190.7178,2286.323,49.66181,0,0,0,0,100,0),
(@PATH,2,210.6431,2285.845,53.60326,0,0,0,0,100,0),
(@PATH,3,222.5459,2286.666,56.13475,0,0,0,0,100,0),
(@PATH,4,231.5569,2296.63,60.31371,0,0,0,0,100,0),
(@PATH,5,220.7462,2308.746,60.02021,0,0,0,0,100,0),
(@PATH,6,208.7211,2311.991,57.36103,0,0,0,0,100,0),
(@PATH,7,195.7977,2312.93,53.85427,0,0,0,0,100,0),
(@PATH,8,181.254,2297.919,50.28107,0,0,0,0,100,0);
-- 0xF1304BEA00396ED6 .go 190.7178 2286.323 49.66181

-- Pathing for Dreadcaller Entry: 19434 'TDB FORMAT'
SET @NPC := 69500;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=233.3709,`position_y`=2074.927,`position_z`=39.10539 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,233.3709,2074.927,39.10539,0,0,0,0,100,0),
(@PATH,2,228.1582,2076.218,39.70464,0,0,0,0,100,0),
(@PATH,3,226.8357,2086.181,39.48833,0,0,0,0,100,0),
(@PATH,4,227.4231,2100.461,39.53439,0,0,0,0,100,0),
(@PATH,5,231.5971,2104.666,38.92635,0,0,0,0,100,0),
(@PATH,6,237.6874,2098.439,39.00676,0,0,0,0,100,0),
(@PATH,7,241.6207,2088.015,38.11906,0,0,0,0,100,0),
(@PATH,8,238.947,2078.802,38.06547,0,0,0,0,100,0);
-- 0xF1304BEA00353517 .go 233.3709 2074.927 39.10539


-- Pathing for Dreadcaller Entry: 19434 'TDB FORMAT'
SET @NPC := 69503;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-523.7537,`position_y`=2008.213,`position_z`=82.43176 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-523.7537,2008.213,82.43176,0,0,0,0,100,0),
(@PATH,2,-513.3772,2034.226,82.13103,0,0,0,0,100,0),
(@PATH,3,-501.1374,2063.957,81.46646,0,0,0,0,100,0),
(@PATH,4,-490.7202,2097.977,79.50304,0,0,0,0,100,0),
(@PATH,5,-495.6437,2124.143,75.1469,0,0,0,0,100,0),
(@PATH,6,-500.0753,2152.032,70.07507,0,0,0,0,100,0),
(@PATH,7,-497.6553,2131.211,73.99121,0,0,0,0,100,0),
(@PATH,8,-488.903,2108.3,78.71799,0,0,0,0,100,0),
(@PATH,9,-496.6252,2076.111,81.08714,0,0,0,0,100,0),
(@PATH,10,-505.7927,2051.876,81.88617,0,0,0,0,100,0),
(@PATH,11,-519.2833,2018.794,82.35017,0,0,0,0,100,0),
(@PATH,12,-523.7976,2008.294,82.49103,0,0,0,0,100,0);
-- 0x1C09E4424012FA8000002000004E9B0D .go -523.7537 2008.213 82.43176

-- Pathing for Dreadcaller Entry: 19434 'TDB FORMAT'
SET @NPC := 69499;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-558.5822,`position_y`=2003.227,`position_z`=98.30606 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-558.5822,2003.227,98.30606,0,0,0,0,100,0),
(@PATH,2,-557.4218,2005.291,99.07405,0,0,0,0,100,0),
(@PATH,3,-559.7542,2056.054,96.38632,0,0,0,0,100,0),
(@PATH,4,-540.9093,2062.701,104.2178,0,0,0,0,100,0),
(@PATH,5,-538.0739,2083.637,102.7935,0,0,0,0,100,0),
(@PATH,6,-531.9629,2100.469,104.145,0,0,0,0,100,0),
(@PATH,7,-540.8042,2121.509,97.44407,0,0,0,0,100,0),
(@PATH,8,-542.6715,2139.263,94.42299,0,0,0,0,100,0),
(@PATH,9,-542.0955,2125.005,96.38588,0,0,0,0,100,0),
(@PATH,10,-531.0101,2105.611,103.8495,0,0,0,0,100,0),
(@PATH,11,-533.4691,2097.096,103.5421,0,0,0,0,100,0),
(@PATH,12,-539.8324,2066.038,103.8721,0,0,0,0,100,0),
(@PATH,13,-559.5454,2057.871,96.58672,0,0,0,0,100,0),
(@PATH,14,-557.4636,2005.37,98.92694,0,0,0,0,100,0);
-- 0x1C09E4424012FA8000002D00001EC994 .go -558.5822 2003.227 98.30606

-- Pathing for Dreadcaller Entry: 19434 'TDB FORMAT'
SET @NPC := 69504;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-506.4011,`position_y`=1982.52,`position_z`=85.11931 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-506.4011,1982.52,85.11931,0,0,0,0,100,0),
(@PATH,2,-491.8763,2002.533,90.20009,0,0,0,0,100,0),
(@PATH,3,-475.5587,2034.282,93.52704,0,0,0,0,100,0),
(@PATH,4,-459.14,2057.011,93.19531,0,0,0,0,100,0),
(@PATH,5,-488.9269,2006.812,90.64146,0,0,0,0,100,0),
(@PATH,6,-506.4684,1982.384,85.10349,0,0,0,0,100,0),
(@PATH,7,-459.1624,2056.984,93.22046,0,0,0,0,100,0),
(@PATH,8,-453.0856,2078.318,92.4622,0,0,0,0,100,0),
(@PATH,9,-458.4782,2105.915,91.30417,0,0,0,0,100,0),
(@PATH,10,-453.1829,2091.579,91.92897,0,0,0,0,100,0),
(@PATH,11,-454.6579,2067.877,92.86068,0,0,0,0,100,0),
(@PATH,12,-471.7339,2040.147,93.86339,0,0,0,0,100,0),
(@PATH,13,-488.8954,2006.772,90.6447,0,0,0,0,100,0),
(@PATH,14,-506.3882,1982.291,85.0636,0,0,0,0,100,0);
-- 0x1C09E4424012FA8000002D00001EC026 .go -506.4011 1982.52 85.11931

-- Gossip for Witch Doctor Torgash
UPDATE `creature_template` SET `gossip_menu_id`=7602 WHERE `entry`=18014;
-- Gossip for Zurjaya
UPDATE `creature_template` SET `gossip_menu_id`=7609 WHERE `entry`=18018;
-- Gossip for Shadow Hunter Denjai
UPDATE `creature_template` SET `gossip_menu_id`=7601 WHERE `entry`=18013;
-- Gossip for Gambarinka
UPDATE `creature_template` SET `gossip_menu_id`=7601 WHERE `entry`=18015;
-- Gossip for Seer Janidi
UPDATE `creature_template` SET `gossip_menu_id`=7603 WHERE `entry`=18017;

DELETE FROM `gossip_menu` WHERE `entry` IN (7602,7609,7601,7603);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(7602, 9249),
(7601, 9248),
(7603, 9250),
(7609, 9260);

-- Adds the creature_equip_template to the creatures
DELETE FROM `creature_equip_template` WHERE `entry` IN (17295,17264,17269,17270,17271,17309,17455,17517);
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(17259, 10612, 11589, 0),
(17264, 10616, 22215, 0),
(17269, 13698, 0, 0),
(17270, 12629, 12629, 0),
(17271, 18419, 0, 0),
(17309, 11365, 0, 0),
(17455, 3494, 11506, 0),
(17517, 13504, 0, 0);

UPDATE `creature_template` SET `equipment_id`=entry WHERE `entry` IN (17259,17264,17269,17270,17271,17309,17455,17475,17517);
UPDATE `creature` SET `equipment_id`=0 WHERE `id` IN (17259,17264,17269,17270,17271,17309,17455,17475,17517);
DELETE FROM `item_template` WHERE `entry` IN (10612,11589,10616,22215,13698,12629,11365,3494,11506,13504,18419);
INSERT INTO `item_template` (entry, class, subclass, displayid, inventorytype, sheath) VALUES
(10612,2,0,19550,13,3), -- 1h axe, Bonechewer Hungerer
(11589,4,6,21553,14,4), -- Shield, Bonechewer Hungerer
(10616,2,15,19555,13,3), -- Dagger, Bonechewer Ravener
(22215,2,15,34560,13,3), -- Dagger, Bonechewer Ravener
(13698,2,10,24394,17,2), -- Staff, Bleeding Hollow Darkcaster
(12629,2,0,22893,13,3), -- 1h axe, Bleeding Hollow Archer
(11365,2,10,21341,17,2), -- Staff, Hellfire Watcher
(3494,2,13,3755,8,0), -- Fist, Bonechewer Beastmaster
(11506,2,13,21144,22,7), -- OH fist, Bonechewer Beastmaster
(13504,2,8,24167,13,3), -- 1h sword, Hellfire Sentry
(18419,2,1,18419,17,1); -- 2h axe, Bonechewer Destroyer

-- Fix previous quest for "Rejold's New Brew"
UPDATE `quest_template` SET `PrevQuestID`=315 WHERE `entry`=415;

-- Fix OfferRewardText for "Beer Basted Boar Ribs"
UPDATE `quest_template` SET `OfferRewardText`="The Malt is brewed, the Boars are dead$BAnd before all is done and anything said$BWe will have to fight for first dibs$BOn these savory Beer Basted Boar Ribs!" WHERE `entry`=384;

-- Fix chaining for quests related to Well Watcher Solarian
UPDATE `quest_template` SET `PrevQuestID`=8328 WHERE `entry`=10068;
UPDATE `quest_template` SET `PrevQuestID`=9676 WHERE `entry`=10069;
UPDATE `quest_template` SET `PrevQuestID`=9393 WHERE `entry`=10070;
UPDATE `quest_template` SET `PrevQuestID`=8564 WHERE `entry`=10072;

-- Fix chaining for Blood Elves' training quests
UPDATE `quest_template` SET `PrevQuestID`=8325 WHERE `entry` IN (9393, 8328, 9676, 8564, 9392, 8563);

-- adding a key requirement for gameobject "Cage Door" (entry: 143979) at Kurzen's Compound by closing it
UPDATE `gameobject` SET `state`=1 WHERE `guid`=10673;

-- Fix pathing for quest "A Cry for Help"
UPDATE `creature_template` SET `InhabitType` = 1 WHERE `entry` = 17312;

--
-- Waypoints for Ghostlands
--
-- Pathing for Deatholme Acolyte Entry: 16315 'TDB FORMAT'
SET @NPC := 82514;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=6980.597,`position_y`=-5898.018,`position_z`=28.76383 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,6980.597,-5898.018,28.76383,0,0,0,0,100,0), -- 23:05:14
(@PATH,2,6980.413,-5864.207,38.00547,0,0,0,0,100,0), -- 23:05:31
(@PATH,3,6985.412,-5841.971,49.12637,0,0,0,0,100,0), -- 23:05:46
(@PATH,4,6996.224,-5824.525,58.95233,0,0,0,0,100,0), -- 23:05:56
(@PATH,5,7008.987,-5810.714,68.33813,0,0,0,0,100,0), -- 23:06:05
(@PATH,6,7018.887,-5796.988,77.02762,0,0,0,0,100,0), -- 23:06:14
(@PATH,7,7023.633,-5785.236,83.22521,0,0,0,0,100,0), -- 23:06:21
(@PATH,8,7025.083,-5767.624,91.65661,0,0,0,0,100,0), -- 23:06:27
(@PATH,9,7023.818,-5754.515,99.82605,0,0,0,0,100,0), -- 23:06:35
(@PATH,10,7021.463,-5739.864,105.2905,0,0,0,0,100,0), -- 23:06:42
(@PATH,11,7023.037,-5750.744,102.3329,0,0,0,0,100,0), -- 23:06:50
(@PATH,12,7024.833,-5765.023,93.1219,0,0,0,0,100,0), -- 23:06:54
(@PATH,13,7024.46,-5781.898,84.79234,0,0,0,0,100,0), -- 23:07:01
(@PATH,14,7021.089,-5792.683,79.57092,0,0,0,0,100,0), -- 23:07:09
(@PATH,15,7010.271,-5809.296,69.25038,0,0,0,0,100,0), -- 23:07:14
(@PATH,16,6998.258,-5822.302,60.71892,0,0,0,0,100,0), -- 23:07:23
(@PATH,17,6986.333,-5840.401,49.7908,0,0,0,0,100,0), -- 23:07:31
(@PATH,18,6980.666,-5861.458,39.13383,0,0,0,0,100,0); -- 23:07:40

-- Pathing for Deatholme Acolyte Entry: 16315 'TDB FORMAT'
SET @NPC := 82536;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=6997.067,`position_y`=-5687.621,`position_z`=102.8226 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,6997.067,-5687.621,102.8226,0,0,0,0,100,0), -- 23:06:27
(@PATH,2,6990.939,-5688.242,101.8386,0,0,0,0,100,0), -- 23:06:32
(@PATH,3,6976.603,-5693.576,96.38464,0,0,0,0,100,0), -- 23:06:36
(@PATH,4,6970.503,-5700.29,92.63046,0,0,0,0,100,0), -- 23:06:41
(@PATH,5,6967.743,-5712.647,88.57698,0,0,0,0,100,0), -- 23:06:45
(@PATH,6,6970.009,-5720.242,85.64739,0,0,0,0,100,0), -- 23:06:50
(@PATH,7,6971.563,-5723.634,84.75957,0,0,0,0,100,0), -- 23:06:55
(@PATH,8,6979.354,-5724.356,84.26402,0,0,0,0,100,0), -- 23:06:57
(@PATH,9,6979.47,-5714.573,84.58974,0,0,0,0,100,0), -- 23:07:00
(@PATH,10,6979.149,-5705.578,84.45787,0,0,0,0,100,0), -- 23:07:05
(@PATH,11,6979.545,-5714.578,84.56152,0,0,0,0,100,0), -- 23:09:00
(@PATH,12,6979.16,-5705.374,84.45621,0,0,0,0,100,0), -- 23:09:04
(@PATH,13,6980.682,-5682.834,82.93341,0,0,0,0,100,0), -- 23:09:11
(@PATH,14,6985.518,-5671.094,82.00629,0,0,0,0,100,0), -- 23:09:17
(@PATH,15,6990.438,-5665.75,81.61432,0,0,0,0,100,0), -- 23:09:22
(@PATH,16,6995.886,-5661.015,81.00694,0,0,0,0,100,0), -- 23:09:26
(@PATH,17,6995.958,-5660.979,80.95592,0,0,0,0,100,0), -- 23:09:29
(@PATH,18,6990.574,-5665.602,81.49225,0,0,0,0,100,0), -- 23:09:30
(@PATH,19,6985.71,-5671.139,81.79518,0,0,0,0,100,0), -- 23:09:33
(@PATH,20,6979.59,-5690.713,83.48748,0,0,0,0,100,0), -- 23:09:38
(@PATH,21,6979.259,-5705.457,84.32413,0,0,0,0,100,0), -- 23:09:44
(@PATH,22,6980.716,-5719.662,84.53703,0,0,0,0,100,0), -- 23:09:52
(@PATH,23,6978.376,-5725.388,84.53719,0,0,0,0,100,0), -- 23:09:56
(@PATH,24,6977.495,-5726.067,84.54002,0,0,0,0,100,0), -- 23:09:58
(@PATH,25,6968.405,-5716.007,87.3763,0,0,0,0,100,0), -- 23:10:01
(@PATH,26,6967.94,-5709.555,89.84632,0,0,0,0,100,0), -- 23:10:06
(@PATH,27,6974.01,-5696.171,94.75365,0,0,0,0,100,0), -- 23:10:09
(@PATH,28,6984.721,-5690.32,99.80565,0,0,0,0,100,0); -- 23:10:14

-- Pathing for Deatholme Acolyte Entry: 16315 'TDB FORMAT'
SET @NPC := 82537;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7010.643,`position_y`=-5693.538,`position_z`=102.6286 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7010.643,-5693.538,102.6286,0,0,0,0,100,0), -- 23:06:47
(@PATH,2,7016.285,-5693.483,102.6231,0,0,0,0,100,0), -- 23:06:49
(@PATH,3,7018.219,-5692.301,102.6074,0,0,0,0,100,0), -- 23:06:50
(@PATH,4,7021.005,-5689.024,102.3725,0,0,0,0,100,0), -- 23:06:53
(@PATH,5,7018.614,-5679.159,102.6098,0,0,0,0,100,0), -- 23:06:56
(@PATH,6,7014.545,-5677.964,102.6143,0,0,0,0,100,0), -- 23:06:57
(@PATH,7,7010.401,-5678.611,102.6134,0,0,0,0,100,0), -- 23:07:00
(@PATH,8,7007.026,-5681.029,102.6129,0,0,0,0,100,0), -- 23:07:02
(@PATH,9,7004.883,-5684.334,102.6098,0,0,0,0,100,0), -- 23:07:05
(@PATH,10,7005.852,-5689.117,102.6089,0,0,0,0,100,0); -- 23:07:07

-- Pathing for Deatholme Acolyte Entry: 16315 'TDB FORMAT'
SET @NPC := 82540;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7029.595,`position_y`=-5682.818,`position_z`=102.658 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7029.595,-5682.818,102.658,0,0,0,0,100,0), -- 23:06:56
(@PATH,2,7035.782,-5681.29,102.0026,0,0,0,0,100,0), -- 23:07:01
(@PATH,3,7045.729,-5681.199,98.82371,0,0,0,0,100,0), -- 23:07:03
(@PATH,4,7056.35,-5684.523,93.90004,0,0,0,0,100,0), -- 23:07:07
(@PATH,5,7045.667,-5681.057,98.76253,0,0,0,0,100,0), -- 23:09:05
(@PATH,6,7056.332,-5684.539,93.80215,0,0,0,0,100,0), -- 23:09:09
(@PATH,7,7060.951,-5689.726,91.59099,0,0,0,0,100,0), -- 23:09:13
(@PATH,8,7064.874,-5703.865,86.7645,0,0,0,0,100,0), -- 23:09:17
(@PATH,9,7063.655,-5709.466,84.63042,0,0,0,0,100,0), -- 23:09:22
(@PATH,10,7058.803,-5714.256,84.48442,0,0,0,0,100,0), -- 23:09:27
(@PATH,11,7057.9,-5714.272,84.27392,0,0,0,0,100,0), -- 23:09:28
(@PATH,12,7054.177,-5703.301,84.48618,0,0,0,0,100,0), -- 23:09:30
(@PATH,13,7052.994,-5694.213,84.35367,0,0,0,0,100,0), -- 23:09:37
(@PATH,14,7043.341,-5673.357,82.8222,0,0,0,0,100,0), -- 23:09:43
(@PATH,15,7035.741,-5663.536,81.92133,0,0,0,0,100,0), -- 23:09:49
(@PATH,16,7029.659,-5659.765,81.63133,0,0,0,0,100,0), -- 23:09:52
(@PATH,17,7022.754,-5657.553,81.0175,0,0,0,0,100,0), -- 23:09:56
(@PATH,18,7022.701,-5657.519,80.93935,0,0,0,0,100,0), -- 23:10:00
(@PATH,19,7029.343,-5659.941,81.43478,0,0,0,0,100,0), -- 23:10:01
(@PATH,20,7038.872,-5666.699,82.0325,0,0,0,0,100,0), -- 23:10:05
(@PATH,21,7047.313,-5680.742,83.38,0,0,0,0,100,0), -- 23:10:08
(@PATH,22,7052.837,-5694.202,84.4315,0,0,0,0,100,0), -- 23:10:14
(@PATH,23,7053.863,-5703.065,84.7151,0,0,0,0,100,0), -- 23:10:20
(@PATH,24,7054.707,-5709.983,84.50665,0,0,0,0,100,0), -- 23:10:26
(@PATH,25,7057.84,-5714.267,84.24426,0,0,0,0,100,0), -- 23:10:29
(@PATH,26,7064.392,-5706.512,85.34109,0,0,0,0,100,0), -- 23:10:30
(@PATH,27,7063.626,-5695.099,89.8451,0,0,0,0,100,0), -- 23:10:34
(@PATH,28,7059.115,-5687.389,92.43468,0,0,0,0,100,0), -- 23:10:39
(@PATH,29,7048.491,-5681.79,97.46969,0,0,0,0,100,0), -- 23:10:43
(@PATH,30,7038.716,-5681.117,100.7739,0,0,0,0,100,0); -- 23:10:48

-- Pathing for Grimscale Oracle Entry: 15669 'TDB FORMAT'
SET @NPC := 56234;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=8878.816,`position_y`=-5749.102,`position_z`=0.5971264 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,8878.816,-5749.102,0.5971264,0,0,0,0,100,0), -- 23:32:50
(@PATH,2,8872.123,-5724.519,0.5082448,0,0,0,0,100,0), -- 23:33:17
(@PATH,3,8858.525,-5719.116,0.797046,0,0,0,0,100,0), -- 23:33:23
(@PATH,4,8820.211,-5718.883,-1.039287,0,0,0,0,100,0), -- 23:33:33
(@PATH,5,8797.094,-5711.732,0.5297012,0,0,0,0,100,0), -- 23:33:43
(@PATH,6,8789.655,-5709.307,0.9552886,0,0,0,0,100,0), -- 23:33:53
(@PATH,7,8771.264,-5697.327,1.041862,0,0,0,0,100,0), -- 23:34:01
(@PATH,8,8754.51,-5692.826,0.9234784,0,0,0,0,100,0), -- 23:34:08
(@PATH,9,8754.548,-5692.86,0.8107796,0,0,0,0,100,0), -- 23:34:17
(@PATH,10,8754.832,-5692.778,1.003729,0,0,0,0,100,0), -- 23:34:22
(@PATH,11,8771.507,-5697.777,0.8035664,0,0,0,0,100,0), -- 23:34:29
(@PATH,12,8806.005,-5714.252,-1.612888,0,0,0,0,100,0), -- 23:34:38
(@PATH,13,8829.296,-5721.84,1.24645,0,0,0,0,100,0), -- 23:34:48
(@PATH,14,8847.945,-5721.054,0.8082525,0,0,0,0,100,0), -- 23:34:57
(@PATH,15,8858.877,-5719.242,0.7433279,0,0,0,0,100,0), -- 23:35:07
(@PATH,16,8872.451,-5724.64,0.7027312,0,0,0,0,100,0); -- 23:35:13

-- Pathing for Grimscale Oracle Entry: 15669 'TDB FORMAT'
SET @NPC := 56221;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=8777.075,`position_y`=-5755.628,`position_z`=0.7944576 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,8777.075,-5755.628,0.7944576,0,0,0,0,100,0), -- 23:25:41
(@PATH,2,8744.947,-5758.729,1.44137,0,0,0,0,100,0), -- 23:26:14
(@PATH,3,8723.646,-5744.492,0.7795044,0,0,0,0,100,0), -- 23:26:24
(@PATH,4,8711.309,-5729.942,1.035426,0,0,0,0,100,0), -- 23:26:32
(@PATH,5,8691.229,-5710.955,0.2195589,0,0,0,0,100,0), -- 23:26:39
(@PATH,6,8687.803,-5701.443,-0.1464095,0,0,0,0,100,0), -- 23:26:48
(@PATH,7,8653.561,-5676.286,1.293998,0,0,0,0,100,0), -- 23:27:01
(@PATH,8,8641.836,-5678.255,1.193712,0,0,0,0,100,0), -- 23:27:12
(@PATH,9,8641.773,-5678.348,1.107449,0,0,0,0,100,0), -- 23:27:23
(@PATH,10,8667.416,-5673.973,0.01454574,0,0,0,0,100,0), -- 23:27:32
(@PATH,11,8675.772,-5684.51,0.2002553,0,0,0,0,100,0), -- 23:27:43
(@PATH,12,8690.506,-5709.449,0.5053282,0,0,0,0,100,0), -- 23:27:56
(@PATH,13,8694.455,-5720.396,0.996207,0,0,0,0,100,0), -- 23:28:04
(@PATH,14,8711.694,-5730.25,0.9948567,0,0,0,0,100,0), -- 23:28:12
(@PATH,15,8732.313,-5750.292,1.464421,0,0,0,0,100,0), -- 23:28:20
(@PATH,16,8751.975,-5757.997,0.9221863,0,0,0,0,100,0), -- 23:28:30
(@PATH,17,8777.087,-5755.516,0.800478,0,0,0,0,100,0); -- 23:28:43

-- Pathing for Grimscale Forager Entry: 15670 'TDB FORMAT'
SET @NPC := 56242;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=9071.955,`position_y`=-5877.383,`position_z`=0.6975139 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,9071.955,-5877.383,0.6975139,0,0,0,0,100,0), -- 23:37:45
(@PATH,2,9059.324,-5868.073,-1.393102,0,0,0,0,100,0), -- 23:38:00
(@PATH,3,9029.121,-5854.314,0.6379914,0,0,0,0,100,0), -- 23:38:11
(@PATH,4,9026.947,-5821.172,1.145625,0,0,0,0,100,0), -- 23:38:21
(@PATH,5,9027.102,-5820.248,1.393944,0,0,0,0,100,0), -- 23:38:35
(@PATH,6,9032.799,-5775.275,0.952391,0,0,0,0,100,0), -- 23:38:44
(@PATH,7,9031.125,-5767.591,0.8471048,0,0,0,0,100,0), -- 23:38:56
(@PATH,8,9008.104,-5754.679,0.8015774,0,0,0,0,100,0), -- 23:39:07
(@PATH,9,8966.937,-5741.705,1.29663,0,0,0,0,100,0), -- 23:39:17
(@PATH,10,8962.295,-5740.867,1.235597,0,0,0,0,100,0), -- 23:39:27
(@PATH,11,8927.979,-5767.035,0.04672858,0,0,0,0,100,0), -- 23:39:37
(@PATH,12,8938.715,-5761.229,1.038244,0,0,0,0,100,0), -- 23:39:45
(@PATH,13,8943.727,-5758.281,0.968925,0,0,0,0,100,0), -- 23:39:52
(@PATH,14,8981.834,-5744.667,0.7889291,0,0,0,0,100,0), -- 23:40:02
(@PATH,15,8986.465,-5746.015,0.8002989,0,0,0,0,100,0), -- 23:40:12
(@PATH,16,9008.296,-5754.792,0.820213,0,0,0,0,100,0), -- 23:40:21
(@PATH,17,9036.458,-5792.002,1.43752,0,0,0,0,100,0), -- 23:40:32
(@PATH,18,9028.837,-5817.06,1.559729,0,0,0,0,100,0), -- 23:40:45
(@PATH,19,9023.854,-5848.162,1.221549,0,0,0,0,100,0), -- 23:40:54
(@PATH,20,9042.734,-5857.301,-2.073786,0,0,0,0,100,0); -- 23:41:08

-- Pathing for Grimscale Seer Entry: 15950 'TDB FORMAT'
SET @NPC := 56391;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=9037.592,`position_y`=-5766.527,`position_z`=0.5168767 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,9037.592,-5766.527,0.5168767,0,0,0,0,100,0), -- 23:42:42
(@PATH,2,9048.254,-5784.458,0.9698197,0,0,0,0,100,0), -- 23:42:51
(@PATH,3,9059.32,-5798.216,-0.9207587,0,0,0,0,100,0), -- 23:42:59
(@PATH,4,9076.928,-5813.567,0.3946522,0,0,0,0,100,0), -- 23:43:10
(@PATH,5,9080.393,-5815.896,0.6621327,0,0,0,0,100,0), -- 23:43:18
(@PATH,6,9088.405,-5809.686,0.7750955,0,0,0,0,100,0), -- 23:43:21
(@PATH,7,9106.832,-5804.949,0.821775,0,0,0,0,100,0), -- 23:43:28
(@PATH,8,9123.148,-5807.707,0.8019806,0,0,0,0,100,0), -- 23:43:36
(@PATH,9,9135.586,-5821.801,0.7773802,0,0,0,0,100,0), -- 23:43:43
(@PATH,10,9149.662,-5822.438,0.7227378,0,0,0,0,100,0), -- 23:43:49
(@PATH,11,9167.805,-5833.559,0.5458255,0,0,0,0,100,0), -- 23:43:58
(@PATH,12,9167.66,-5833.448,0.4231594,0,0,0,0,100,0), -- 23:44:11
(@PATH,13,9167.701,-5833.285,0.7127371,0,0,0,0,100,0), -- 23:44:23
(@PATH,14,9149.432,-5822.394,0.7666007,0,0,0,0,100,0), -- 23:44:32
(@PATH,15,9135.407,-5821.695,0.8019806,0,0,0,0,100,0), -- 23:44:38
(@PATH,16,9123.027,-5807.496,0.8282324,0,0,0,0,100,0), -- 23:44:45
(@PATH,17,9106.761,-5805.003,0.785993,0,0,0,0,100,0), -- 23:44:51
(@PATH,18,9088.161,-5809.791,0.7095211,0,0,0,0,100,0), -- 23:45:00
(@PATH,19,9071.598,-5809.765,-0.6348054,0,0,0,0,100,0), -- 23:45:03
(@PATH,20,9050.107,-5787.132,0.9787122,0,0,0,0,100,0), -- 23:45:10
(@PATH,21,9049.096,-5785.835,1.078146,0,0,0,0,100,0); -- 23:45:20

-- Pathing for Ghostlands Guardian Entry: 16541 'TDB FORMAT'
SET @NPC := 145414;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7150.675,`position_y`=-7072.731,`position_z`=55.28159 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7150.675,-7072.731,55.28159,0,0,0,0,100,0), -- 11:51:25
(@PATH,2,7140.165,-7095.667,56.32489,0,0,0,0,100,0), -- 11:51:41
(@PATH,3,7134.295,-7111.137,58.849,0,0,0,0,100,0), -- 11:51:51
(@PATH,4,7149.599,-7137.551,55.19991,0,0,0,0,100,0), -- 11:51:59
(@PATH,5,7183.908,-7143.587,56.03042,0,0,0,0,100,0), -- 11:52:11
(@PATH,6,7218.184,-7136.882,58.99335,0,0,0,0,100,0), -- 11:52:25
(@PATH,7,7235.5,-7129.492,60.65919,0,0,0,0,100,0), -- 11:52:39
(@PATH,8,7243.874,-7125.855,61.10926,0,30000,0,0,100,0), -- 11:52:51
(@PATH,9,7243.135,-7095.02,61.9528,0,0,0,0,100,0), -- 11:53:38
(@PATH,10,7224.584,-7078.627,58.69924,0,0,0,0,100,0), -- 11:54:28
(@PATH,11,7189.417,-7063.731,58.10524,0,0,0,0,100,0); -- 11:54:29

-- Pathing for Ghostlands Guardian Entry: 16541 'TDB FORMAT'
SET @NPC := 81743;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7483.415,`position_y`=-6898.222,`position_z`=96.65485 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7483.415,-6898.222,96.65485,0,0,0,0,100,0), -- 22:01:51
(@PATH,2,7490.502,-6889.069,94.41743,0,0,0,0,100,0), -- 22:01:59
(@PATH,3,7481.624,-6866.266,88.67288,0,0,0,0,100,0), -- 22:02:05
(@PATH,4,7480.969,-6837.274,77.65476,0,0,0,0,100,0), -- 22:02:16
(@PATH,5,7480.024,-6797.451,76.10669,0,0,0,0,100,0), -- 22:02:28
(@PATH,6,7478.713,-6785.392,77.4765,0,0,0,0,100,0), -- 22:02:43
(@PATH,7,7479.419,-6793.053,76.67186,0,0,0,0,100,0), -- 22:02:54
(@PATH,8,7480.9,-6834.077,76.25935,0,0,0,0,100,0), -- 22:03:02
(@PATH,9,7480.634,-6861.903,86.81428,0,0,0,0,100,0), -- 22:03:17
(@PATH,10,7490.069,-6885.811,93.34169,0,0,0,0,100,0); -- 22:03:30

-- Pathing for Ghostlands Guardian Entry: 16541 'TDB FORMAT'
SET @NPC := 81737;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7546.458,`position_y`=-6726.992,`position_z`=80.78694 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7546.458,-6726.992,80.78694,0,0,0,0,100,0), -- 22:05:54
(@PATH,2,7527.194,-6732.486,80.58603,0,0,0,0,100,0), -- 22:06:08
(@PATH,3,7604.331,-6767.942,85.9845,0,0,0,0,100,0), -- 22:09:49
(@PATH,4,7593.505,-6753.936,89.24313,0,0,0,0,100,0), -- 22:09:59
(@PATH,5,7575.111,-6734.221,84.59973,0,0,0,0,100,0); -- 22:10:07

-- Pathing for Ghostlands Guardian Entry: 16541 'TDB FORMAT'
SET @NPC := 81723;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7640.057,`position_y`=-6821.591,`position_z`=80.17661 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7640.057,-6821.591,80.17661,0,0,0,0,100,0), -- 22:05:42
(@PATH,2,7633.815,-6796.717,78.65404,0,0,0,0,100,0), -- 22:05:51
(@PATH,3,7615.372,-6775.387,80.24687,0,0,0,0,100,0), -- 22:06:00
(@PATH,4,7632.267,-6793.745,77.46573,0,0,0,0,100,0), -- 22:06:15
(@PATH,5,7634.777,-6800.083,79.74638,0,0,0,0,100,0), -- 22:06:27
(@PATH,6,7649.132,-6834.647,83.15082,0,0,0,0,100,0), -- 22:06:37
(@PATH,7,7656.086,-6858.044,87.99471,0,0,0,0,100,0), -- 22:06:45
(@PATH,8,7651.524,-6839.359,84.67632,0,0,0,0,100,0), -- 22:06:56
(@PATH,9,7640.049,-6821.556,80.16749,0,0,0,0,100,0); -- 22:07:05

-- Pathing for Ghostlands Guardian Entry: 16541 'TDB FORMAT'
SET @NPC := 81719;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7563.64,`position_y`=-6881.709,`position_z`=112.1673 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7563.64,-6881.709,112.1673,0,0,0,0,100,0), -- 18:53:33
(@PATH,2,7551.659,-6901.236,112.1663,0,0,0,0,100,0), -- 18:53:38
(@PATH,3,7555.867,-6910.663,111.9691,0,0,0,0,100,0), -- 18:56:12
(@PATH,4,7565.996,-6914.735,108.4578,0,0,0,0,100,0), -- 18:53:51
(@PATH,5,7579.56,-6906.405,103.1527,0,0,0,0,100,0), -- 18:54:00
(@PATH,6,7591.544,-6890.522,95.51781,0,0,0,0,100,0), -- 18:54:08
(@PATH,7,7595.471,-6871.276,94.72267,0,0,0,0,100,0), -- 18:54:18
(@PATH,8,7586.251,-6861.987,93.77134,0,0,0,0,100,0), -- 18:54:24
(@PATH,9,7577.42,-6854.581,93.04897,0,0,0,0,100,0), -- 18:55:26
(@PATH,10,7578.87,-6826.335,87.31084,0,0,0,0,100,0), -- 18:54:34
(@PATH,11,7578.864,-6821.618,86.92613,0,0,0,0,100,0), -- 18:54:47
(@PATH,12,7561.332,-6803.103,87.30068,0,0,0,0,100,0), -- 18:55:15
(@PATH,13,7560.291,-6799.682,87.58893,0,0,0,0,100,0), -- 18:55:08
(@PATH,14,7556.946,-6782.622,89.82014,0,0,0,0,100,0), -- 18:54:58
(@PATH,15,7560.291,-6799.682,87.58893,0,0,0,0,100,0), -- 18:55:08
(@PATH,16,7561.332,-6803.103,87.30068,0,0,0,0,100,0), -- 18:55:15
(@PATH,17,7578.864,-6821.618,86.92613,0,0,0,0,100,0), -- 18:54:47
(@PATH,18,7578.87,-6826.335,87.31084,0,0,0,0,100,0), -- 18:54:34
(@PATH,19,7577.42,-6854.581,93.04897,0,0,0,0,100,0), -- 18:55:26
(@PATH,20,7588.399,-6863.539,93.97005,0,0,0,0,100,0), -- 18:55:39
(@PATH,21,7593.956,-6877.988,95.42189,0,0,0,0,100,0), -- 18:55:48
(@PATH,22,7583.048,-6903.001,101.4519,0,0,0,0,100,0), -- 18:55:55
(@PATH,23,7570.524,-6913.488,106.4994,0,0,0,0,100,0), -- 18:56:05
(@PATH,24,7555.867,-6910.663,111.9691,0,0,0,0,100,0), -- 18:56:12
(@PATH,25,7551.659,-6901.236,112.1663,0,0,0,0,100,0), -- 18:53:38
(@PATH,26,7563.374,-6882.594,112.1059,0,0,0,0,100,0); -- 18:56:20

-- Pathing for Ghostlands Guardian Entry: 16541 'TDB FORMAT'
SET @NPC := 81745;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7493.75,`position_y`=-6888.333,`position_z`=94.14599 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7493.75,-6888.333,94.14599,0,0,0,0,100,0), -- 21:57:19
(@PATH,2,7481.219,-6899.196,97.32906,0,0,0,0,100,0), -- 21:57:29
(@PATH,3,7455.676,-6912.633,103.082,0,0,0,0,100,0), -- 21:57:36
(@PATH,4,7435.434,-6934.373,107.2755,0,0,0,0,100,0), -- 21:57:49
(@PATH,5,7429.151,-6957.596,112.5967,0,0,0,0,100,0), -- 21:58:00
(@PATH,6,7409.229,-6988.246,112.3306,0,0,0,0,100,0), -- 21:58:16
(@PATH,7,7398.064,-7006.403,105.4191,0,0,0,0,100,0), -- 21:58:24
(@PATH,8,7379.978,-7023.313,98.34062,0,0,0,0,100,0), -- 21:58:33
(@PATH,9,7368.91,-7048.285,91.6894,0,0,0,0,100,0), -- 21:58:44
(@PATH,10,7362.03,-7076.459,81.8666,0,0,0,0,100,0), -- 21:58:55
(@PATH,11,7335.145,-7098.242,66.09917,0,0,0,0,100,0), -- 21:59:07
(@PATH,12,7304.179,-7104.348,54.56339,0,0,0,0,100,0), -- 21:59:23
(@PATH,13,7332.545,-7099.682,64.96516,0,0,0,0,100,0), -- 21:59:41
(@PATH,14,7360.992,-7078.073,81.13574,0,0,0,0,100,0), -- 21:59:57
(@PATH,15,7367.925,-7051.186,90.94432,0,0,0,0,100,0), -- 22:00:12
(@PATH,16,7376.316,-7028.957,96.4644,0,0,0,0,100,0), -- 22:00:25
(@PATH,17,7397.015,-7007.736,104.9266,0,0,0,0,100,0), -- 22:00:35
(@PATH,18,7408.008,-6990.256,111.4358,0,0,0,0,100,0), -- 22:00:46
(@PATH,19,7411.379,-6986.646,112.7126,0,0,0,0,100,0), -- 22:00:56
(@PATH,20,7429.151,-6957.596,112.5967,0,0,0,0,100,0), -- 21:58:00
(@PATH,21,7433.051,-6937.843,108.0633,0,0,0,0,100,0), -- 22:01:05
(@PATH,22,7445.005,-6922.467,103.7956,0,0,0,0,100,0), -- 22:01:28
(@PATH,23,7450.903,-6915.155,103.3749,0,0,0,0,100,0), -- 22:01:28
(@PATH,24,7450.903,-6915.155,103.3749,0,0,0,0,100,0), -- 22:01:28
(@PATH,25,7477.773,-6901.932,98.37746,0,0,0,0,100,0), -- 22:01:33
(@PATH,26,7493.729,-6888.343,94.15305,0,0,0,0,100,0); -- 22:01:45

-- Pathing for Blacksmith Frances Entry: 17655 'TDB FORMAT'
SET @NPC := 81724;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7604.855,`position_y`=-6905.621,`position_z`=93.76188 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7604.855,-6905.621,93.76188,0.8203048,60000,0,0,100,0), -- 22:07:38
(@PATH,2,7600.523,-6904.995,93.88599,0,0,0,0,100,0), -- 22:08:19
(@PATH,3,7600.523,-6904.995,93.88599,1.780236,0,0,0,100,0), -- 22:08:21
(@PATH,4,7600.064,-6907.846,93.76472,0,0,0,0,100,0), -- 22:09:30
(@PATH,5,7600.523,-6904.995,93.88599,0,30000,0,0,100,0), -- 22:10:03
(@PATH,6,7600.523,-6904.995,93.88599,1.780236,0,0,0,100,0), -- 22:10:04
(@PATH,7,7598.409,-6904.81,94.34996,0,60000,0,0,100,0), -- 22:10:58
(@PATH,8,7596.794,-6905.625,94.31394,3.996804,0,0,0,100,0), -- 22:10:59
(@PATH,9,7600.523,-6904.995,93.88599,0,0,0,0,100,0), -- 22:11:26
(@PATH,10,7600.523,-6904.995,93.88599,1.780236,0,0,0,100,0), -- 22:11:27
(@PATH,11,7598.409,-6904.81,94.34996,0,60000,0,0,100,0), -- 22:12:20
(@PATH,12,7596.794,-6905.625,94.31394,3.996804,0,0,0,100,0), -- 22:12:22
(@PATH,13,7600.523,-6904.995,93.88599,0,0,0,0,100,0), -- 22:12:42
(@PATH,14,7600.523,-6904.995,93.88599,1.780236,0,0,0,100,0), -- 22:12:44
(@PATH,15,7604.855,-6905.621,93.76188,0,120000,0,0,100,0), -- 22:14:00
(@PATH,16,7604.855,-6905.621,93.76188,0.8203048,0,0,0,100,0); -- 22:14:02

-- Pathing for Rathis Tomber Entry: 16224 'TDB FORMAT'
SET @NPC := 81720;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=7638.232,`position_y`=-6842.241,`position_z`=84.2546 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,7638.232,-6842.241,84.2546,2.076942,0,0,0,100,0), -- 22:09:02
(@PATH,2,7636.98,-6839.962,83.24476,0,0,0,0,100,0), -- 22:09:36
(@PATH,3,7637.41,-6837.574,82.88759,0,0,0,0,100,0), -- 22:09:38
(@PATH,4,7639.8,-6835.542,82.59454,0,0,0,0,100,0), -- 22:09:39
(@PATH,5,7643.04,-6835.119,82.58206,0,0,0,0,100,0), -- 22:09:40
(@PATH,6,7644.657,-6837.574,83.20168,0,0,0,0,100,0), -- 22:09:41
(@PATH,7,7644.05,-6838.9,83.9032,0,60000,0,0,100,0),
(@PATH,8,7645.192,-6836.052,83.1027,0,0,0,0,100,0), -- 22:09:50
(@PATH,9,7642.421,-6834.729,82.59531,0,0,0,0,100,0), -- 22:09:51
(@PATH,10,7639.884,-6835.1,82.53012,0,0,0,0,100,0), -- 22:09:52
(@PATH,11,7637.52,-6837.243,82.75238,0,0,0,0,100,0), -- 22:09:53
(@PATH,12,7636.066,-6839.554,82.94509,0,0,0,0,100,0), -- 22:09:55
(@PATH,13,7637.412,-6842.98,83.70974,0,10000,0,0,100,0), -- 22:09:56
(@PATH,14,7638.232,-6842.241,84.2546,0,0,0,0,100,0), -- 22:10:06
(@PATH,15,7638.232,-6842.241,84.2546,2.076942,60000,0,0,100,0); -- 22:10:06

-- Pathing for Sentinel Infiltrator Entry: 16333 'TDB FORMAT'
SET @NPC := 85939;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=6826.52,`position_y`=-7216.635,`position_z`=26.2077 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,6826.52,-7216.635,26.2077,0,0,0,0,100,0), -- 18:25:44
(@PATH,2,6840.17,-7215.392,27.32393,0,0,0,0,100,0), -- 18:25:48
(@PATH,3,6842.315,-7214.781,27.5872,0,0,0,0,100,0), -- 18:25:52
(@PATH,4,6847.95,-7208.919,27.60912,0,0,0,0,100,0), -- 18:25:54
(@PATH,5,6846.517,-7200.238,27.39073,0,0,0,0,100,0), -- 18:25:58
(@PATH,6,6836.5,-7187.716,26.55817,0,0,0,0,100,0), -- 18:26:01
(@PATH,7,6829.814,-7187.942,25.16908,0,0,0,0,100,0), -- 18:26:05
(@PATH,8,6828.214,-7188.198,24.70531,0,0,0,0,100,0), -- 18:26:08
(@PATH,9,6820.545,-7191.426,24.19164,0,0,0,0,100,0), -- 18:26:11
(@PATH,10,6816.887,-7196.539,24.25371,0,0,0,0,100,0), -- 18:26:15
(@PATH,11,6816.825,-7206.355,24.66104,0,0,0,0,100,0), -- 18:26:18
(@PATH,12,6824.003,-7215.546,25.92787,0,0,0,0,100,0); -- 18:26:22

-- Pathing for Sentinel Infiltrator Entry: 16333 'TDB FORMAT'
-- Needs SAI scripting
SET @NPC := 85810;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=6834.944,`position_y`=-7216.469,`position_z`=26.75792 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,6834.944,-7216.469,26.75792,0,0,0,0,100,0), -- 18:21:32
(@PATH,2,6826.208,-7222.83,27.19634,0,0,0,0,100,0), -- 18:21:40
(@PATH,3,6817.325,-7206.505,24.92965,0,0,0,0,100,0), -- 18:21:52
(@PATH,4,6819.723,-7180.195,25.83248,0,0,0,0,100,0), -- 18:22:00
(@PATH,5,6811.1,-7153.327,37.85592,0,0,0,0,100,0), -- 18:22:11
(@PATH,6,6794.896,-7138.714,44.19709,0,0,0,0,100,0), -- 18:22:24
(@PATH,7,6778.596,-7138.577,47.74215,0,0,0,0,100,0), -- 18:22:34
(@PATH,8,6770.257,-7144.743,49.66928,0,0,0,0,100,0), -- 18:22:40
(@PATH,9,6786.903,-7138.087,45.32982,0,0,0,0,100,0), -- 18:22:53
(@PATH,10,6817.342,-7166.106,30.71012,0,0,0,0,100,0), -- 18:23:03
(@PATH,11,6823.649,-7165.904,28.29505,0,0,0,0,100,0), -- 18:23:20
(@PATH,12,6835.131,-7148.97,30.26661,0,0,0,0,100,0), -- 18:23:27
(@PATH,13,6835.175,-7162.583,27.79875,0,0,0,0,100,0), -- 18:23:38
(@PATH,14,6835.874,-7170.188,26.83617,0,0,0,0,100,0), -- 18:23:45
(@PATH,15,6827.219,-7186.351,24.99562,0,0,0,0,100,0), -- 18:23:49
(@PATH,16,6818.312,-7181.476,25.84511,0,0,0,0,100,0), -- 18:23:56
(@PATH,17,6813.708,-7178.023,26.07334,0,0,0,0,100,0), -- 18:24:03
(@PATH,18,6800.086,-7180.936,26.13367,0,0,0,0,100,0), -- 18:24:08
(@PATH,19,6788.234,-7196.194,26.14623,0,0,0,0,100,0), -- 18:24:16
(@PATH,20,6784.672,-7191.459,26.15236,0,0,0,0,100,0), -- 18:25:03
(@PATH,21,6802.208,-7180.021,26.09461,0,0,0,0,100,0), -- 18:25:13
(@PATH,22,6821.094,-7186.088,24.97617,0,0,0,0,100,0), -- 18:25:20
(@PATH,23,6836.174,-7190.566,26.19097,0,0,0,0,100,0), -- 18:25:24
(@PATH,24,6844.302,-7187.855,27.69562,0,0,0,0,100,0), -- 18:25:32
(@PATH,25,6846.742,-7212.095,27.73918,0,0,0,0,100,0); -- 18:25:45

-- Pathing for Sentinel Infiltrator Entry: 16333 'TDB FORMAT'
-- Needs SAI scripting
SET @NPC := 85876;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=6814.882,`position_y`=-7163.52,`position_z`=33.06502 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,6814.882,-7163.52,33.06502,0,0,0,0,100,0), -- 18:26:55
(@PATH,2,6796.829,-7138.427,44.13749,0,0,0,0,100,0), -- 18:27:03
(@PATH,3,6778.327,-7138.773,48.00482,0,0,0,0,100,0), -- 18:27:16
(@PATH,4,6776.107,-7139.004,48.73849,0,0,0,0,100,0), -- 18:27:24
(@PATH,5,6783.224,-7137.825,46.49815,0,0,0,0,100,0), -- 18:27:51
(@PATH,6,6794.398,-7137.108,44.60288,0,0,0,0,100,0), -- 18:27:56
(@PATH,7,6800.035,-7146.845,40.49599,0,0,0,0,100,0), -- 18:28:01
(@PATH,8,6795.779,-7165.81,32.8607,0,0,0,0,100,0), -- 18:28:05
(@PATH,9,6794.719,-7181.562,26.63479,0,0,0,0,100,0), -- 18:28:14
(@PATH,10,6794.198,-7190.434,25.95545,0,0,0,0,100,0), -- 18:28:24
(@PATH,11,6789.857,-7191.004,25.8968,0,0,0,0,100,0), -- 18:28:38
(@PATH,12,6789.924,-7190.855,26.1468,0,0,0,0,100,0), -- 18:28:41
(@PATH,13,6801.363,-7179.81,25.90792,0,0,0,0,100,0), -- 18:28:54
(@PATH,14,6801.586,-7179.51,26.09436,0,0,0,0,100,0), -- 18:29:01
(@PATH,15,6817.118,-7187.298,24.99203,0,0,0,0,100,0), -- 18:29:06
(@PATH,16,6818.806,-7191.954,24.44993,0,0,0,0,100,0), -- 18:29:13
(@PATH,17,6819.498,-7215.1,25.45433,0,0,0,0,100,0), -- 18:29:18
(@PATH,18,6817.387,-7217.657,26.22639,0,0,0,0,100,0), -- 18:29:24
(@PATH,19,6815.59,-7207.964,25.15621,0,0,0,0,100,0), -- 18:29:35
(@PATH,20,6816.641,-7195.688,24.46806,0,0,0,0,100,0), -- 18:29:44
(@PATH,21,6830.292,-7179.979,26.3147,0,0,0,0,100,0), -- 18:29:50
(@PATH,22,6823.895,-7177.721,26.77645,0,0,0,0,100,0); -- 18:30:03

-- Pathing for Shadowpine Catlord Entry: 16345 'TDB FORMAT'
SET @NPC := 85833;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=6825.845,`position_y`=-7407.999,`position_z`=47.05538 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,6825.845,-7407.999,47.05538,0,0,0,0,100,0), -- 18:03:11
(@PATH,2,6819.822,-7407.742,47.8176,0,0,0,0,100,0), -- 18:03:23
(@PATH,3,6797.965,-7395.941,47.85873,0,0,0,0,100,0), -- 18:03:32
(@PATH,4,6790.372,-7391.337,48.14279,0,0,0,0,100,0), -- 18:05:27
(@PATH,5,6785.934,-7382.063,48.67854,0,0,0,0,100,0), -- 18:05:12
(@PATH,6,6780.216,-7369.419,49.53757,0,0,0,0,100,0), -- 18:03:44
(@PATH,7,6762.875,-7356.745,49.3274,0,0,0,0,100,0), -- 18:03:59
(@PATH,8,6757.482,-7359.899,49.68204,0,0,0,0,100,0), -- 18:04:51
(@PATH,9,6752.945,-7365.431,51.41992,0,0,0,0,100,0), -- 18:04:05
(@PATH,10,6736.967,-7385.644,51.58582,0,0,0,0,100,0), -- 18:04:20
(@PATH,11,6707.192,-7407.871,51.19869,0,0,0,0,100,0), -- 18:04:48
(@PATH,12,6706.392,-7408.471,51.19869,0,0,0,0,100,0), -- 18:04:48
(@PATH,13,6736.911,-7385.608,51.53582,0,0,0,0,100,0), -- 18:04:48
(@PATH,14,6752.945,-7365.431,51.41992,0,0,0,0,100,0), -- 18:04:05
(@PATH,15,6757.482,-7359.899,49.68204,0,0,0,0,100,0), -- 18:04:51
(@PATH,16,6765.563,-7357.226,49.71237,0,0,0,0,100,0), -- 18:05:06
(@PATH,17,6780.216,-7369.419,49.53757,0,0,0,0,100,0), -- 18:03:44
(@PATH,18,6785.934,-7382.063,48.67854,0,0,0,0,100,0), -- 18:05:12
(@PATH,19,6790.372,-7391.337,48.14279,0,0,0,0,100,0), -- 18:05:27
(@PATH,20,6797.965,-7395.941,47.85873,0,0,0,0,100,0), -- 18:03:32
(@PATH,21,6819.822,-7407.742,47.8176,0,0,0,0,100,0); -- 18:03:23

-- Pathing for Shadowpine Catlord Entry: 16345 'TDB FORMAT'
SET @NPC := 85899;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=6642.614,`position_y`=-7403.334,`position_z`=65.37686 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,6642.614,-7403.334,65.37686,0,0,0,0,100,0), -- 18:12:02
(@PATH,2,6655.589,-7402.668,65.25717,0,0,0,0,100,0), -- 18:12:07
(@PATH,3,6659.145,-7404.814,64.66093,0,0,0,0,100,0), -- 18:12:13
(@PATH,4,6666.81,-7405.762,59.45066,0,0,0,0,100,0), -- 18:12:16
(@PATH,5,6670.078,-7400.617,57.92281,0,0,0,0,100,0), -- 18:12:19
(@PATH,6,6683.644,-7387.567,57.7993,0,0,0,0,100,0), -- 18:12:25
(@PATH,7,6694.211,-7385.182,53.51888,0,0,0,0,100,0), -- 18:12:30
(@PATH,8,6701.323,-7375.21,53.19016,0,0,0,0,100,0), -- 18:12:39
(@PATH,9,6706.042,-7306.476,52.34984,0,0,0,0,100,0), -- 18:12:56
(@PATH,10,6698.629,-7306.6,52.3459,0,0,0,0,100,0), -- 18:13:09
(@PATH,11,6658.128,-7346.422,53.5539,0,0,0,0,100,0), -- 18:13:25
(@PATH,12,6663.863,-7357.194,55.34796,0,0,0,0,100,0), -- 18:13:40
(@PATH,13,6687.574,-7370.823,53.74558,0,0,0,0,100,0), -- 18:13:48
(@PATH,14,6692.782,-7383.596,54.75917,0,0,0,0,100,0), -- 18:14:00
(@PATH,15,6679.604,-7389.391,57.81517,0,0,0,0,100,0), -- 18:14:09
(@PATH,16,6668.09,-7405,57.93337,0,0,0,0,100,0), -- 18:14:14
(@PATH,17,6663.221,-7406.32,61.86858,0,0,0,0,100,0), -- 18:14:20
(@PATH,18,6657.667,-7403.231,64.99197,0,0,0,0,100,0), -- 18:14:23
(@PATH,19,6646.945,-7407.651,65.2119,0,0,0,0,100,0), -- 18:14:27
(@PATH,20,6642.138,-7401.195,67.02313,0,0,0,0,100,0), -- 18:14:32
(@PATH,21,6643.672,-7393.591,70.57539,0,0,0,0,100,0), -- 18:14:37
(@PATH,22,6648.191,-7390.153,70.75128,0,0,0,0,100,0), -- 18:14:41
(@PATH,23,6655.95,-7390.098,70.72308,0,0,0,0,100,0), -- 18:14:45
(@PATH,24,6672.11,-7389.826,70.80399,0,0,0,0,100,0), -- 18:14:49
(@PATH,25,6674.516,-7400.391,70.78954,0,0,0,0,100,0), -- 18:14:54
(@PATH,26,6670.333,-7405.347,70.74722,0,0,0,0,100,0), -- 18:14:58
(@PATH,27,6655.763,-7405.991,70.77985,0,0,0,0,100,0), -- 18:15:03
(@PATH,28,6652.884,-7398.17,70.53949,0,0,0,0,100,0), -- 18:15:08
(@PATH,29,6648.519,-7390.229,70.74633,0,0,0,0,100,0), -- 18:15:14
(@PATH,30,6643.527,-7393.528,70.72253,0,0,0,0,100,0), -- 18:15:17
(@PATH,31,6642.74,-7403.402,65.47425,0,0,0,0,100,0); -- 18:15:22

-- Pathing for Shadowpine Hexxer Entry: 16346 'TDB FORMAT'
SET @NPC := 85922;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=6544.311,`position_y`=-7415.042,`position_z`=66.8414 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,6544.311,-7415.042,66.8414,0,0,0,0,100,0), -- 18:12:06
(@PATH,2,6557.531,-7398.131,62.547,0,0,0,0,100,0), -- 18:12:18
(@PATH,3,6584.465,-7368.215,56.64576,0,0,0,0,100,0), -- 18:12:52
(@PATH,4,6589.184,-7361.762,55.35123,0,0,0,0,100,0), -- 18:12:52
(@PATH,5,6593.902,-7355.309,54.72623,0,0,0,0,100,0), -- 18:12:52
(@PATH,6,6598.534,-7348.974,54.28678,0,0,0,0,100,0), -- 18:12:52
(@PATH,7,6603.207,-7346.335,54.47303,0,0,0,0,100,0), -- 18:15:13
(@PATH,8,6609.078,-7343.148,54.03077,0,0,0,0,100,0), -- 18:12:53
(@PATH,9,6619.535,-7340.988,53.94233,0,0,0,0,100,0), -- 18:15:00
(@PATH,10,6636.512,-7345.48,53.38771,0,0,0,0,100,0), -- 18:13:02
(@PATH,11,6650.978,-7350.788,53.67146,0,0,0,0,100,0), -- 18:14:42
(@PATH,12,6679.457,-7366.645,54.62379,0,0,0,0,100,0), -- 18:13:15
(@PATH,13,6688.482,-7368.755,53.68621,0,0,0,0,100,0), -- 18:13:31
(@PATH,14,6707.076,-7373.765,53.0295,0,0,0,0,100,0), -- 18:14:20
(@PATH,15,6724.337,-7391.231,52.32455,0,0,0,0,100,0), -- 18:13:40
(@PATH,16,6742.169,-7407.499,51.53728,0,0,0,0,100,0), -- 18:13:54
(@PATH,17,6740.595,-7406.18,51.4976,0,0,0,0,100,0), -- 18:14:08
(@PATH,18,6724.337,-7391.231,52.32455,0,0,0,0,100,0), -- 18:13:40
(@PATH,19,6707.076,-7373.765,53.0295,0,0,0,0,100,0), -- 18:14:20
(@PATH,20,6686.671,-7368.761,53.71722,0,0,0,0,100,0), -- 18:14:34
(@PATH,21,6679.457,-7366.645,54.62379,0,0,0,0,100,0), -- 18:13:15
(@PATH,22,6650.978,-7350.788,53.67146,0,0,0,0,100,0), -- 18:14:42
(@PATH,23,6636.512,-7345.48,53.38771,0,0,0,0,100,0), -- 18:13:02
(@PATH,24,6619.535,-7340.988,53.94233,0,0,0,0,100,0), -- 18:15:00
(@PATH,25,6609.078,-7343.148,54.03077,0,0,0,0,100,0), -- 18:12:53
(@PATH,26,6603.207,-7346.335,54.47303,0,0,0,0,100,0), -- 18:15:13
(@PATH,27,6598.534,-7348.974,54.28678,0,0,0,0,100,0), -- 18:12:52
(@PATH,28,6593.902,-7355.309,54.72623,0,0,0,0,100,0), -- 18:12:52
(@PATH,29,6586.425,-7365.703,56.44064,0,0,0,0,100,0), -- 18:15:20
(@PATH,30,6560.438,-7394.56,61.59495,0,0,0,0,100,0), -- 18:15:30
(@PATH,31,6544.499,-7415.031,66.93755,0,0,0,0,100,0); -- 18:15:45

