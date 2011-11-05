SET @LibraryLaborer := 29724;
SET @UldarBoss := 29725;
SET @AirStrip := 29726;
SET @ReavandDispo := 29727;
SET @HallsofStone := 29728;
SET @Dirkee := 29729;
SET @Recovery := 29730;

SET @UldarBossRef := 50013;
SET @AirStripRef := 50013+1;
SET @HallsofStoneRef := 50013+2;
SET @ReavandDispoRef := 50013+3;
SET @LibraryLaborerRef := 50013+4;
 
DELETE FROM `skinning_loot_template` WHERE `entry` IN (@Recovery,@Dirkee,@LibraryLaborer,@ReavandDispo,@HallsofStone,@AirStrip,@UldarBoss);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(@Recovery, 41338, 42, 1, 0, 1, 3),
(@Recovery, 41337, 44, 1, 0, 1, 3),
(@Recovery, 39690, 9, 1, 0, 1, 3),
(@Recovery, 39681, 4, 1, 0, 2, 4),
(@Recovery, 49050, 0.5, 1, 0, 1, 1),
(@Recovery, 39682, 0.5, 1, 0, 1, 1), 
(@Dirkee, 41338, 42, 1, 0, 1, 3),
(@Dirkee, 41337, 44.5, 1, 0, 1, 3), 
(@Dirkee, 39690, 10, 1, 0, 1, 3), 
(@Dirkee, 39681, 3, 1, 0, 2, 4), 
(@Dirkee, 49050, 0.5, 1, 0, 1, 1),
(@LibraryLaborer , 1, 100, 1, 0, -@LibraryLaborerRef, 1),
(@ReavandDispo, 1, 100, 1, 0, -@ReavandDispoRef, 1),
(@HallsofStone, 1, 100, 1, 0, -@HallsofStoneRef, 1),
(@AirStrip, 1, 100, 1, 0, -@AirStripRef, 1),
(@UldarBoss, 1, 100, 1, 0, -@UldarBossRef, 1);
 
DELETE FROM `reference_loot_template` WHERE `entry` IN (@AirStripRef,@ReavandDispoRef,@LibraryLaborerRef,@HallsofStoneRef,@UldarBossRef);
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(@AirStripRef, 41338, 33, 1, 0, 1, 1), 
(@AirStripRef, 41337, 42, 1, 0, 1, 1), 
(@AirStripRef, 39690, 13, 1, 0, 1, 3), 
(@AirStripRef, 39681, 10, 1, 0, 1, 4), 
(@AirStripRef, 39686, 1.2, 1, 0, 1, 1), 
(@AirStripRef, 49050, 0.8, 1, 0, 1, 1), 
(@ReavandDispoRef, 41338, 40, 1, 0, 1, 3), 
(@ReavandDispoRef, 41337, 40, 1, 0, 1, 3), 
(@ReavandDispoRef, 39690, 9.5, 1, 0, 1, 3), 
(@ReavandDispoRef, 39681, 9.5, 1, 0, 2, 4), 
(@ReavandDispoRef, 39686, 0.5, 1, 0, 1, 1), 
(@ReavandDispoRef, 49050, 0.5, 1, 0, 1, 1),
(@LibraryLaborerRef, 41338, 43, 1, 0, 1, 3),
(@LibraryLaborerRef, 41337, 42, 1, 0, 1, 3),
(@LibraryLaborerRef, 39690, 9, 1, 0, 1, 3), 
(@LibraryLaborerRef, 39681, 4, 1, 0, 2, 4),
(@LibraryLaborerRef, 49050, 1, 1, 0, 1, 1),
(@LibraryLaborerRef, 39686, 0.5, 1, 0, 1, 1), 
(@LibraryLaborerRef, 39682, 0.5, 1, 0, 1, 1), 
(@HallsofStoneRef, 41338, 43.5, 1, 0, 1, 3),
(@HallsofStoneRef, 41337, 42, 1, 0, 1, 3),
(@HallsofStoneRef, 39690, 8, 1, 0, 1, 3), 
(@HallsofStoneRef, 39681, 5, 1, 0, 2, 4), 
(@HallsofStoneRef, 49050, 0.5, 1, 0, 1, 1), 
(@HallsofStoneRef, 39686, 0.5, 1, 0, 1, 1), 
(@HallsofStoneRef, 39682, 0.5, 1, 0, 1, 1), 
(@UldarBossRef, 35627, 43, 1, 0, 2, 10), 
(@UldarBossRef, 35624, 42, 1, 0, 4, 10), 
(@UldarBossRef, 35623, 43, 1, 0, 2, 6), 
(@UldarBossRef, 36860, 42, 1, 0, 2, 6),
(@UldarBossRef, 39690, 30, 1, 0, 16, 19), 
(@UldarBossRef, 39686, 26, 1, 0, 2, 3), 
(@UldarBossRef, 39682, 22, 1, 0, 5, 5), 
(@UldarBossRef, 39681, 21, 1, 0, 8, 10), 
(@UldarBossRef, 49050, 2, 1, 0, 1, 1); 

UPDATE `creature_template` SET `skinloot`=@LibraryLaborer WHERE `entry` IN (29389,29724);
UPDATE `creature_template` SET `skinloot`=@ReavandDispo WHERE `entry` IN (34273,34274,29382); 
UPDATE `creature_template` SET `skinloot`=@Dirkee WHERE `entry`=32500; 
UPDATE `creature_template` SET `skinloot`=@Recovery WHERE `entry` IN (34267,34268); 
UPDATE `creature_template` SET `skinloot`=@AirStrip WHERE `entry` IN (32358,25792,25758,25752,25753,25814,25793); 
UPDATE `creature_template` SET `skinloot`=@HallsofStone WHERE `entry` IN (27972,31383,27971,31387);
UPDATE `creature_template` SET `skinloot`=@UldarBoss WHERE `entry` IN (34332,34106,33113,34003,33293,33885);
