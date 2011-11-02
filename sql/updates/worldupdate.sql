UPDATE `version` SET `db_version`='TDB 335.11.41' LIMIT 1;
UPDATE `creature_template` SET `baseattacktime`=2000,`speed_run`=0.99206 WHERE `entry`=35321;
UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000,`spell1`=51421 WHERE `entry`=28366;
UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000,`exp`=2,`minlevel`=75,`maxlevel`=75,`baseattacktime`=2000,`speed_run`=3.42857,`VehicleId`=107 WHERE `entry`=35299;
UPDATE `creature_model_info` SET `bounding_radius`=0.3055,`combat_reach`=1,`gender`=2 WHERE `modelid`=27101;
UPDATE `creature_model_info` SET `bounding_radius`=0.434,`combat_reach`=1.4,`gender`=0 WHERE `modelid`=29862;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=35299;
INSERT INTO `npc_spellclick_spells` VALUES
(35299,46598,0,0,0,1,0,0,0);
-- SAI for Lieutenant Commander Thalvos
SET @ENTRY := 16978;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY; -- Remove EAI
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,10848,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Lieutenant Commander Thalvos - On spawn - Cast Shroud of Death on self'),
(@ENTRY,0,1,0,0,0,50,0,4000,4000,8000,8000,11,8242,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Lieutenant Commander Thalvos - Combat - Cast Shield Slam on victim'),
(@ENTRY,0,2,0,0,0,50,0,5000,5000,10000,10000,11,11976,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Lieutenant Commander Thalvos - Combat - Cast Strike on victim');

-- Pathing for Lieutenant Commander Thalvos Entry: 16978
SET @NPC := 59381;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1402.399,`position_y`=2707.896,`position_z`=-27.4831 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1400.287,2711.631,-27.80707,0,0,0,100,0),
(@PATH,2,-1401.863,2713.817,-28.77578,0,0,0,100,0),
(@PATH,3,-1400.287,2711.631,-27.80707,0,0,0,100,0),
(@PATH,4,-1402.399,2707.896,-27.4831,0,0,0,100,0);

DELETE FROM `spell_script_names` WHERE `ScriptName`= 'spell_gen_shroud_of_death';
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35,`baseattacktime`=2000,`npcflag`=0x1000000,`unit_flags`=0x4000,`speed_run`=1,`VehicleId`=510 WHERE `entry`=34944; -- Keep Cannon (faction is set by core script A: 1732, H: 1735)
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35,`baseattacktime`=2000,`npcflag`=0x1000000,`unit_flags`=0x4000,`unit_class`=4 WHERE `entry`=34793; -- Catapult (faction is set by core script A: 1732, H: 1735)
UPDATE `creature_template` SET `faction_A`=1732,`faction_H`=1732,`baseattacktime`=2000,`npcflag`=0x1000000,`unit_flags`=0x2004000,`speed_run`=1 WHERE `entry`=34929; -- Alliance Gunship Cannon (core script should remove unselectable flag)
UPDATE `creature_template` SET `faction_A`=1735,`faction_H`=1735,`baseattacktime`=2000,`npcflag`=0x1000000,`unit_flags`=0x2004000,`speed_run`=1 WHERE `entry`=34935; -- Horde Gunship Cannon
UPDATE `creature_template` SET `baseattacktime`=2000,`unit_flags`=0x4000,`speed_walk`=3.2 WHERE `entry`=35273; -- Glaive Thrower
UPDATE `creature_template` SET `baseattacktime`=2000,`npcflag`=0x1000000,`unit_flags`=0x4000,`speed_walk`=1.2,`speed_run`=0.98571 WHERE `entry`=34775; -- Demolisher
UPDATE `creature_template` SET `baseattacktime`=2000,`unit_flags`=16640,`unit_class`=4,`speed_walk`=1.2,`speed_run`=1 WHERE `entry`=34776; -- Siege Engine
UPDATE `creature_template` SET `baseattacktime`=2000,`npcflag`=0x1000000,`unit_flags`=0x2004000,`unit_class`=4,`speed_walk`=1.2,`VehicleId`=436 WHERE `entry`=36355; -- Siege Turret
UPDATE `creature_template` SET `baseattacktime`=2000,`unit_flags`=16640,`unit_class`=4 WHERE `entry`=35069; -- Siege Engine
UPDATE `creature_template` SET `faction_A`=1732,`faction_H`=1732,`exp`=0,`minlevel`=70,`maxlevel`=70,`baseattacktime`=2000,`npcflag`=0x1000000,`unit_flags`=0x4000,`speed_walk`=3.2 WHERE `entry`=34802; -- Glaive Thrower

UPDATE `creature_model_info` SET `bounding_radius`=0.31,`combat_reach`=0,`gender`=2 WHERE `modelid`=29488; -- Alliance Gunship Cannon
UPDATE `creature_model_info` SET `bounding_radius`=1.9,`combat_reach`=0,`gender`=2 WHERE `modelid`=29489; -- Horde Gunship Cannon
UPDATE `creature_model_info` SET `bounding_radius`=1,`combat_reach`=7.7,`gender`=2 WHERE `modelid`=25292; -- Siege Engine
UPDATE `creature_model_info` SET `bounding_radius`=0.305,`combat_reach`=5,`gender`=2 WHERE `modelid`=28106; -- Siege Turret
UPDATE `creature_model_info` SET `bounding_radius`=1,`combat_reach`=7.7,`gender`=2 WHERE `modelid`=26403; -- Siege Engine
UPDATE `creature_model_info` SET `bounding_radius`=0.381875,`combat_reach`=1.25,`gender`=2 WHERE `modelid`=29734; -- Glaive Thrower
UPDATE `creature_model_info` SET `bounding_radius`=0.381875,`combat_reach`=1.25,`gender`=2 WHERE `modelid`=29642; -- Glaive Thrower

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (34929,35273,34802,34775,34935,34793,36355,35069,34776);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`quest_start`,`quest_start_active`,`quest_end`,`cast_flags`,`aura_required`,`aura_forbidden`,`user_type`) VALUES
(34929,43671,0,0,0,1,0,0,0), -- Alliance Gunship Cannon - Ride Vehicle
(35273,68503,0,0,0,1,0,0,0), -- Glaive Thrower - Ride Vehicle
(34802,68503,0,0,0,1,0,0,0), -- Glaive Thrower - Ride Vehicle
(34775,66245,0,0,0,1,0,0,0), -- Demolisher - Ride Vehicle
(34935,43671,0,0,0,1,0,0,0), -- Horde Gunship Cannon - Ride Vehicle
(34793,66245,0,0,0,1,0,0,0), -- Catapult - Ride Vehicle
(36355,46598,0,0,0,1,0,0,0), -- Siege Turret - Ride Vehicle Hardcoded
(35069,46598,0,0,0,1,0,0,0), -- Siege Engine - Ride Vehicle Hardcoded
(34776,46598,0,0,0,1,0,0,0); -- Siege Engine - Ride Vehicle Hardcoded

DELETE FROM `creature_template_addon` WHERE `entry` IN (34944,34793,34929,34775,34935,34776,36355,35069,35273,34802);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(34944,0,0,1,0, NULL), -- Keep Cannon
(34793,0,0,257,0, NULL), -- Catapult
(34929,0,0,1,0, NULL), -- Alliance Gunship Cannon
(34775,0,0,257,0, NULL), -- Demolisher
(34935,0,0,1,0, NULL), -- Horde Gunship Cannon
(34776,0,0,1,0, NULL), -- Siege Engine
(36355,0,0,257,0, NULL), -- Siege Turret
(35069,0,0,1,0, NULL), -- Siege Engine
(35273,0,0,257,0, NULL), -- Glaive Thrower
(34802,0,0,257,0, NULL); -- Glaive Thrower

UPDATE `creature_template` SET
`spell1`=66218, -- Launch
`spell2`=66296, -- Shadow Veil
`spell8`=68362 -- Driving Credit (SPELL_EFFECT_DUMMY)
WHERE `entry`=34793; -- Catapult (E9 87)

UPDATE `creature_template` SET
`spell1`=66518 -- Airship Cannon
WHERE `entry`=34929; -- Alliance Gunship Cannon (71 88)
DELETE FROM `conditions` WHERE `SourceEntry`=24311 AND `SourceTypeOrReferenceId`=13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES
(13,0,24311,0,18,1,11380,0,0,'','Powerful Healing Ward - Jin\'do the Hexxer'),
(13,0,24311,0,18,1,14825,0,0,'','Powerful Healing Ward - Withered Mistress'),
(13,0,24311,0,18,1,14986,0,0,'','Powerful Healing Ward - Shade of Jin\'do'),
(13,0,24311,0,18,1,14826,0,0,'','Powerful Healing Ward - Sacrificed Troll'),
(13,0,24311,0,18,1,14883,0,0,'','Powerful Healing Ward - Voodoo Slave');
UPDATE `command` SET `help` = 'Syntax: .reload all gossips\nReload gossip_menu, gossip_menu_option, gossip_scripts, points_of_interest tables.' WHERE `name`='reload all gossips';
DELETE FROM `command` WHERE `name` = 'reload gossip_scripts';
DROP TABLE IF EXISTS `gossip_scripts`;
ALTER TABLE `gossip_menu_option` DROP `action_script_id`;
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|130 WHERE `entry`=33500;
-- Fix achievement criteria for Supreme Defender
DELETE FROM `disables` WHERE `sourceType`=4 AND  `entry`=3698;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=3698;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(3698,6,3277,0, ''),  -- check if player is in Warsong Gulch
(3698,7,23333,0, '');  -- check if victim has a Horde Flag buff

DELETE FROM `disables` WHERE `sourceType`=4 AND  `entry`=3699;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=3699;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(3699,6,3277,0, ''),   -- check if player is in Warsong Gulch
(3699,7,23335,0, ''); -- check if victim has a Alliance Flag buff

-- Fix achievement criteria for Stormtrooper
DELETE FROM `disables` WHERE `sourceType`=4 AND  `entry`=3685;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=3685;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(3685,6,3820,0, ''), -- check if player is in EOTS
(3685,7,34976,0, '');  -- check if victim has a Netherstorm Flag buff
DELETE FROM `creature_template_addon` WHERE `entry` IN (21250,23507,23527,23528,23529,23530,23531,27958);
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES
(21250,36440), -- Pink Elekk, Terokkar Forest
(23507,36440), -- Elwynn Pink Elekk
(23527,36440), -- Teldrassil Pink Elekk
(23528,36440), -- Azuremyst Pink Elekk
(23529,36440), -- Mulgore Pink Elekk
(23530,36440), -- Tirisfal Pink Elekk
(23531,36440); -- Eversong Pink Elekk
DELETE FROM `creature_onkill_reputation` WHERE `creature_id`=22300;
UPDATE `quest_template` SET `RequiredRaces`=0 WHERE `entry` IN (12759,12760,12703);
UPDATE `areatrigger_teleport` SET `target_position_x`=-4464.919922,`target_position_y`=-1666.23999,`target_position_z`=81.892769,`target_orientation`=4.288273 WHERE `id`=242;
UPDATE `game_event` SET `start_time`='2011-09-04 00:01:00' WHERE `eventEntry`=4; -- Darkmoon Faire (Elwynn Forest)
SET @EquiEntry = 2473; -- (creature_equip_template.entry - need 2)
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|32768,`equipment_id`=@EquiEntry+0 WHERE `entry`=29333; -- Onslaught Gryphon Rider
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|32768,`equipment_id`=@EquiEntry+1 WHERE `entry`=29329; -- Onslaught Paladin
DELETE FROM `creature_equip_template` WHERE `entry` IN (@EquiEntry,@EquiEntry+1);
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES 
(@EquiEntry+0,38488,0,0),
(@EquiEntry+1,40452,12932,0);
UPDATE `creature_model_info` SET `bounding_radius`=0.3366,`combat_reach`=1.65,`gender`=0 WHERE `modelid`=26179; -- Onslaught Gryphon Rider
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1.5,`gender`=0 WHERE `modelid`=26166; -- Onslaught Paladin
DELETE FROM `creature_template_addon` WHERE `entry` IN (29333,29329);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(29333,24688,50331648,1,0, NULL), -- Onslaught Gryphon Rider
(29329,19085,0,1,0, NULL); -- Onslaught Paladin
-- Taela Everstride "Allerian Stronghold, Terokkar Forest" SAI
SET @ENTRY   := 18704; -- NPC entry
SET @SPELL1  := 29121; -- Shoot Bow
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@ENTRY;
UPDATE `creature_template_addon` SET `bytes2`=258 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,5000,6000,5000,6000,11,@SPELL1,0,0,0,0,0,10,58462,16899,0,0,0,0,0, 'Taela Everstride - OOC - Cast shoot on target');
-- Fix Spell condition
UPDATE `conditions` SET `ConditionValue2`=16899 WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=29121;
-- Remove out path data
DELETE FROM  `creature_addon` WHERE `guid`=66949;
DELETE FROM `waypoint_data` WHERE `id`=669490;
DELETE FROM `waypoint_scripts` WHERE `id` BETWEEN 144 AND 156;
DELETE FROM `disables` WHERE `entry`=7598 AND `sourceType`=4;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7598 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7598,11,0,0,'achievement_kings_bane');
DELETE FROM `disables` WHERE `entry`=7587 AND `sourceType`=4;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7587 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7587,11,0,0,'achievement_void_dance');
DELETE FROM `spell_script_names` WHERE `spell_id`=29371;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`)
VALUES
(29371,'spell_heigan_eruption');
DELETE FROM `disables` WHERE `entry` IN (7264,7548) AND `sourceType`=4;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7264,7548) AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7264,11,0,0,'achievement_safety_dance'),
(7548,11,0,0,'achievement_safety_dance');
UPDATE `spell_proc_event` SET `procFlags`=0x14000,`ppmRate`=0 WHERE `entry`=65007;
DELETE FROM `spell_script_names` WHERE `spell_id` IN(63720,64004);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(63720,'spell_kologarn_stone_shout'),
(64004,'spell_kologarn_stone_shout');
DELETE FROM `spell_script_names` WHERE `spell_id` = -50294;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(-50294,'spell_dru_starfall_aoe');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10068,10069) AND `type` IN (0,11);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(10068,11,0,0,'achievement_ignis_shattered'), -- Shattered (10 Player)
(10069,11,0,0,'achievement_ignis_shattered'); -- Shattered (25 Player)
DELETE FROM `disables` WHERE `entry` IN (10173,10306,10451,10462) AND sourceType=4;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10173,10306,10451,10462) AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10173,11,0,0,'achievement_shadowdodger'),
(10306,11,0,0,'achievement_shadowdodger'),
(10451,11,0,0,'achievement_smell_saronite'),
(10462,11,0,0,'achievement_smell_saronite');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10394,10395,10396,10397);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10394,12,1,0,''),
(10395,12,1,0,''),
(10396,12,0,0,''),
(10397,12,0,0,'');
DELETE FROM `spell_dbc` WHERE `id`=65074;
INSERT INTO `spell_dbc` (`Id`,`Effect1`,`EffectRadiusIndex1`,`EffectImplicitTargetA1`,`EffectImplicitTargetB1`,`comment`)
VALUES
(65074,3,28,22,30,'Knock on Wood Achievements - Criteria Marker');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10447,10448,10449,10459,10460,10461);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10447,11,0,0,'achievement_knock_on_wood'),
(10447,12,0,0,''),
(10448,11,0,0,'achievement_knock_knock_on_wood'),
(10448,12,0,0,''),
(10449,11,0,0,'achievement_knock_knock_knock_on_wood'),
(10449,12,0,0,''),
(10459,11,0,0,'achievement_knock_on_wood'),
(10459,12,1,0,''),
(10460,11,0,0,'achievement_knock_knock_on_wood'),
(10460,12,1,0,''),
(10461,11,0,0,'achievement_knock_knock_knock_on_wood'),
(10461,12,1,0,'');
UPDATE `spell_dbc` SET `comment`='Freya Achievement spell - Criteria Marker' WHERE `id`=65074;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10445,10758) AND `type` IN (11,18);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10445,11,0,0,'achievement_getting_back_to_nature'),
(10758,11,0,0,'achievement_getting_back_to_nature');
DELETE FROM `disables` WHERE `entry`=7317 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7317 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7317,11,0,0,'achievement_respect_your_elders');
DELETE FROM `disables` WHERE `entry`=7318 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7318 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7318,11,0,0,'achievement_king_dred');
DELETE FROM `disables` WHERE `entry`=7316 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7316 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7316,11,0,0,'achievement_chaos_theory');
DELETE FROM `disables` WHERE `entry`=7583 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7583 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7583,11,0,0,'achievement_share_the_love');
DELETE FROM `disables` WHERE `entry`=7136 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7136 AND `type`=5;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(7136,5,55817,0,'');
DELETE FROM `disables` WHERE `entry`=4240 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=4240 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(4240,11,0,0,'achievement_watch_him_die');
DELETE FROM `spell_script_names` WHERE `spell_id` IN (64679,64392);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`)
VALUES
(64679,'spell_auriaya_sentinel_blast'),
(64392,'spell_auriaya_sentinel_blast');
-- Pathing for Arctic Ram Entry: 26426
SET @NPC := 133248;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3509.64,`position_y`=-750.9414,`position_z`=294.3868 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3511.387,-733.5805,299.6368,49000,0,0,100,0),
(@PATH,2,3509.64,-750.9414,294.3868,0,0,0,100,0),
(@PATH,3,3498.443,-768.702,291.2594,0,0,0,100,0),
(@PATH,4,3509.64,-750.9414,294.3868,0,0,0,100,0);

-- Pathing for Illusia Lune Entry: 27042
SET @NPC := 133617;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3647.948,`position_y`=-717.1948,`position_z`=215.0342 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3648.265,-715.3195,215.0314,0,0,0,100,0),
(@PATH,2,3644.507,-714.7984,214.2407,0,0,0,100,0),
(@PATH,3,3635.043,-713.5746,214.2407,0,0,0,100,0),
(@PATH,4,3644.625,-714.8554,214.2407,0,0,0,100,0),
(@PATH,5,3648.25,-715.2807,215.0314,0,0,0,100,0),
(@PATH,6,3647.977,-717.1859,215.0342,0,0,0,100,0),
(@PATH,7,3655.216,-718.0604,215.0296,0,0,0,100,0),
(@PATH,8,3647.948,-717.1948,215.0342,0,0,0,100,0);

-- Pathing for Ordal McLumpkins Entry: 27044
SET @NPC := 133619;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3621.722,`position_y`=-718.3648,`position_z`=215.0349 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,2,3619.423,-714.603,215.0349,35000,0,@PATH+1,100,0),
(@PATH,4,3616.081,-716.1984,215.0349,50000,0,@PATH+2,100,0),
(@PATH,6,3621.722,-718.3648,215.0349,35000,0,@PATH+2,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@PATH+1,@PATH+2,@PATH+3);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,0,30,0,0,1.466077,846),
(@PATH+1,1,2,83,69,0,847),
(@PATH+2,0,30,0,0,4.639134,848),
(@PATH+2,1,2,83,69,0,849);

-- Pathing for Hulking Jormungar Entry: 26293
SET @NPC := 113071;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4686.325,`position_y`=338.1416,`position_z`=116.9954 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4700.168,367.0156,118.5855,0,0,0,100,0),
(@PATH,2,4731.135,364.8878,126.2894,0,0,0,100,0),
(@PATH,3,4743.483,343.251,129.0478,0,0,0,100,0),
(@PATH,4,4713.793,315.9503,120.7992,0,0,0,100,0),
(@PATH,5,4686.325,338.1416,116.9954,0,0,0,100,0);

-- Pathing for Magnataur Patriarch Entry: 26295
SET @NPC := 113266;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4049.302,`position_y`=-29.04574,`position_z`=55.26999 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4047.976,-37.78185,55.98508,0,0,0,100,0),
(@PATH,2,4047.698,-50.11871,53.98508,0,0,0,100,0),
(@PATH,3,4047.976,-37.78185,55.98508,0,0,0,100,0),
(@PATH,4,4049.302,-29.04574,55.26999,0,0,0,100,0),
(@PATH,5,4047.754,-16.93381,53.89499,0,0,0,100,0),
(@PATH,6,4049.302,-29.04574,55.26999,0,0,0,100,0);

-- Pathing for Crystalline Ice Elemental Entry: 26316
SET @NPC := 115062;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4860.147,`position_y`=992.9332,`position_z`=210.192 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4869.752,1002.653,215.5425,0,0,0,100,0),
(@PATH,2,4860.147,992.9332,210.192,0,0,0,100,0),
(@PATH,3,4850.6,983.3943,204.442,0,0,0,100,0),
(@PATH,4,4844.505,971.259,198.692,0,0,0,100,0),
(@PATH,5,4858.342,938.2769,188.1321,0,0,0,100,0),
(@PATH,6,4844.505,971.259,198.692,0,0,0,100,0),
(@PATH,7,4850.6,983.3943,204.442,0,0,0,100,0),
(@PATH,8,4860.147,992.9332,210.192,0,0,0,100,0);

-- Pathing for Crystalline Ice Elemental Entry: 26316
SET @NPC := 115054;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4917.303,`position_y`=924.0703,`position_z`=223.1336 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4929.146,915.8573,220.6336,0,0,0,100,0),
(@PATH,2,4940.256,927.373,227.7124,0,0,0,100,0),
(@PATH,3,4941.91,938.2441,233.9879,0,0,0,100,0),
(@PATH,4,4938.07,947.0781,238.7379,0,0,0,100,0),
(@PATH,5,4917.303,924.0703,223.1336,0,0,0,100,0);

-- Pathing for Crystalline Ice Giant Entry: 26291
SET @NPC := 112865;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4770.23,`position_y`=469.9691,`position_z`=111.7675 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4796.084,455.2377,109.338,54000,0,@PATH+1,100,0),
(@PATH,2,4770.23,469.9691,111.7675,22000,0,@PATH+2,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@PATH+1,@PATH+2);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,0,30,0,0,2.9147,850),
(@PATH+2,0,30,0,0,5.201081,851);

-- Pathing for Crystalline Ice Giant Entry: 26291
SET @NPC := 112866;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4874.087,`position_y`=452.3281,`position_z`=115.6979 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4888.814,445.456,118.1979,5000,0,@PATH+1,100,0),
(@PATH,2,4901.041,426.041,116.2949,0,0,0,100,0),
(@PATH,3,4901.041,426.041,116.2949,6000,0,@PATH+2,100,0),
(@PATH,4,4874.087,452.3281,115.6979,0,0,0,100,0),
(@PATH,5,4874.087,452.3281,115.6979,8000,0,@PATH+3,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@PATH+1,@PATH+2,@PATH+3);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,0,30,0,0,0.8552113,852),
(@PATH+2,0,30,0,0,0.8901179,853),
(@PATH+3,0,30,0,0,0.06981317,854);

-- Pathing for Rabbit Entry: 721
SET @NPC := 115702;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5753.539,`position_y`=772.873,`position_z`=640.8826 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5767.785,754.2614,641.7114,0,0,0,100,0),
(@PATH,2,5773.825,766.6644,640.7427,0,0,0,100,0),
(@PATH,3,5767.785,754.2614,641.7114,5000,0,0,100,0),
(@PATH,4,5753.539,772.873,640.8826,0,0,0,100,0),
(@PATH,5,5748.938,764.3101,641.9448,0,0,0,100,0),
(@PATH,6,5733.615,778.2639,641.7114,0,0,0,100,0),
(@PATH,7,5737.831,782.386,641.448,0,0,0,100,0),
(@PATH,8,5740.602,787.1411,641.0325,0,0,0,100,0),
(@PATH,9,5733.241,793.4806,640.9481,0,0,0,100,0),
(@PATH,10,5722.088,796.697,641.5259,0,0,0,100,0),
(@PATH,11,5726.339,806.3635,640.8337,0,0,0,100,0),
(@PATH,12,5722.138,815.5085,640.8914,0,0,0,100,0),
(@PATH,13,5714.45,821.5867,641.2027,0,0,0,100,0),
(@PATH,14,5700.078,828.2365,641.8647,0,0,0,100,0),
(@PATH,15,5698.136,820.8531,641.5467,0,0,0,100,0),
(@PATH,16,5709.789,810.5593,641.5497,0,0,0,100,0),
(@PATH,17,5698.065,820.5817,641.5533,0,0,0,100,0),
(@PATH,18,5700.078,828.2365,641.8647,0,0,0,100,0),
(@PATH,19,5714.45,821.5867,641.2027,0,0,0,100,0),
(@PATH,20,5722.138,815.5085,640.8914,0,0,0,100,0),
(@PATH,21,5726.339,806.3635,640.8337,0,0,0,100,0),
(@PATH,22,5722.088,796.697,641.5259,0,0,0,100,0),
(@PATH,23,5733.241,793.4806,640.9481,0,0,0,100,0),
(@PATH,24,5740.602,787.1411,641.0325,0,0,0,100,0),
(@PATH,25,5737.831,782.386,641.448,0,0,0,100,0),
(@PATH,26,5733.615,778.2639,641.7114,0,0,0,100,0),
(@PATH,27,5748.938,764.3101,641.9448,0,0,0,100,0),
(@PATH,28,5753.539,772.873,640.8826,0,0,0,100,0);

-- Pathing for Putrid Wight Entry: 23992
SET @NPC := 113344;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2668.823,`position_y`=-3746.312,`position_z`=249.9565 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2646.826,-3743.444,246.5889,0,0,0,100,0),
(@PATH,2,2629.433,-3732.29,245.4538,0,0,0,100,0),
(@PATH,3,2623.224,-3719.469,245.4964,0,0,0,100,0),
(@PATH,4,2627.88,-3711.047,246.3409,0,0,0,100,0),
(@PATH,5,2639.799,-3709.354,243.2022,0,0,0,100,0),
(@PATH,6,2647.973,-3713.873,239.3536,0,0,0,100,0),
(@PATH,7,2655.269,-3720.628,235.0643,0,0,0,100,0),
(@PATH,8,2664.609,-3723.947,230.2771,0,0,0,100,0),
(@PATH,9,2672.977,-3721.034,225.9482,0,0,0,100,0),
(@PATH,10,2680.715,-3711.313,221.8469,6000,0,0,100,0),
(@PATH,11,2677.229,-3716.424,222.8778,0,0,0,100,0),
(@PATH,12,2668.853,-3722.688,228.2985,0,0,0,100,0),
(@PATH,13,2659.52,-3723.743,232.6282,0,0,0,100,0),
(@PATH,14,2651.728,-3716.389,237.3867,0,0,0,100,0),
(@PATH,15,2643.281,-3709.406,241.6877,0,0,0,100,0),
(@PATH,16,2632.315,-3711.092,245.6459,0,0,0,100,0),
(@PATH,17,2624.75,-3717.884,245.7113,0,0,0,100,0),
(@PATH,18,2624.219,-3728.446,245.2014,0,0,0,100,0),
(@PATH,19,2631.771,-3736.979,245.6085,0,0,0,100,0),
(@PATH,20,2643.255,-3747.242,246.4638,0,0,0,100,0),
(@PATH,21,2655.134,-3751.437,248.9429,0,0,0,100,0),
(@PATH,22,2662.831,-3751.152,249.8362,0,0,0,100,0),
(@PATH,23,2668.823,-3746.312,249.9565,8000,0,0,100,0);

-- Pathing for Putrid Wight Entry: 23992
SET @NPC := 113343;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2785.402,`position_y`=-3613.447,`position_z`=250.922 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2785.402,-3613.447,250.922,0,0,0,100,0),
(@PATH,2,2785.44,-3590.348,251.3575,0,0,0,100,0),
(@PATH,3,2780.647,-3566.933,248.1158,0,0,0,100,0),
(@PATH,4,2776.989,-3563.271,247.6174,6000,0,0,100,0),
(@PATH,5,2786.118,-3579.14,249.4645,0,0,0,100,0),
(@PATH,6,2789.177,-3593.625,250.844,0,0,0,100,0),
(@PATH,7,2784.655,-3606.138,251.7757,0,0,0,100,0),
(@PATH,8,2778.348,-3606.077,253.5872,0,0,0,100,0),
(@PATH,9,2781.997,-3610.31,252.2005,0,0,0,100,0),
(@PATH,10,2789.771,-3615.286,249.8559,0,0,0,100,0),
(@PATH,11,2796.63,-3628.361,248.4757,0,0,0,100,0),
(@PATH,12,2798.595,-3636.199,247.7422,0,0,0,100,0),
(@PATH,13,2794.572,-3637.352,248.0836,0,0,0,100,0),
(@PATH,14,2806.817,-3639.35,246.4777,0,0,0,100,0),
(@PATH,15,2815.37,-3643.385,242.7697,0,0,0,100,0),
(@PATH,16,2817.436,-3655.363,242.607,0,0,0,100,0),
(@PATH,17,2803.864,-3660.431,246.2676,0,0,0,100,0),
(@PATH,18,2790.148,-3659.774,245.6176,0,0,0,100,0),
(@PATH,19,2783.257,-3650.315,241.2681,0,0,0,100,0),
(@PATH,20,2778.241,-3638.333,235.9849,0,0,0,100,0),
(@PATH,21,2771.057,-3630.219,230.9954,0,0,0,100,0),
(@PATH,22,2761.502,-3627.29,226.378,0,0,0,100,0),
(@PATH,23,2751.042,-3632.291,221.8077,6000,0,0,100,0),
(@PATH,24,2754.787,-3630.722,223.3591,0,0,0,100,0),
(@PATH,25,2766.29,-3628.396,228.8643,0,0,0,100,0),
(@PATH,26,2774.306,-3633.359,232.863,0,0,0,100,0),
(@PATH,27,2779.261,-3642.92,237.6714,0,0,0,100,0),
(@PATH,28,2785.011,-3652.979,242.7388,0,0,0,100,0),
(@PATH,29,2792.728,-3659.369,246.4393,0,0,0,100,0),
(@PATH,30,2806.87,-3658.866,245.5233,0,0,0,100,0),
(@PATH,31,2817.342,-3650.064,242.2243,0,0,0,100,0),
(@PATH,32,2799.635,-3631.787,247.9718,0,0,0,100,0),
(@PATH,33,2785.402,-3613.447,250.922,0,0,0,100,0);

-- Pathing for Necrolord Entry: 24014
SET @NPC := 97230;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=24014,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2809.687,`position_y`=-3622.016,`position_z`=161.3961 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2814.799,-3624.542,161.3958,0,0,0,100,0),
(@PATH,2,2823.035,-3625.648,161.3949,0,0,0,100,0),
(@PATH,3,2829.876,-3624.724,161.3975,0,0,0,100,0),
(@PATH,4,2836.048,-3620.994,161.3983,0,0,0,100,0),
(@PATH,5,2841.855,-3615.051,161.3947,0,0,0,100,0),
(@PATH,6,2844.207,-3609.994,161.3975,0,0,0,100,0),
(@PATH,7,2845.186,-3601.875,161.3951,0,0,0,100,0),
(@PATH,8,2844.337,-3594.973,161.3975,0,0,0,100,0),
(@PATH,9,2840.764,-3588.99,161.3957,0,0,0,100,0),
(@PATH,10,2834.76,-3583.182,161.3952,0,0,0,100,0),
(@PATH,11,2829.575,-3580.736,161.3979,0,0,0,100,0),
(@PATH,12,2821.425,-3579.65,161.3952,0,0,0,100,0),
(@PATH,13,2814.341,-3580.5,161.4046,0,0,0,100,0),
(@PATH,14,2808.07,-3583.772,161.4029,0,0,0,100,0),
(@PATH,15,2802.685,-3590.109,161.395,0,0,0,100,0),
(@PATH,16,2800.225,-3595.279,161.3977,0,0,0,100,0),
(@PATH,17,2799.105,-3603.418,161.3947,0,0,0,100,0),
(@PATH,18,2800.01,-3610.333,161.3973,0,0,0,100,0),
(@PATH,19,2803.705,-3616.418,161.3981,0,0,0,100,0),
(@PATH,20,2809.687,-3622.016,161.3961,0,0,0,100,0);

-- Pathing for Necrolord Entry: 24014
SET @NPC := 97248;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=24014,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2824.036,`position_y`=-3624.829,`position_z`=221.4252 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2816.773,-3623.985,221.4255,0,0,0,100,0),
(@PATH,2,2809.992,-3621.294,221.4247,0,0,0,100,0),
(@PATH,3,2803.77,-3615.729,221.4243,0,0,0,100,0),
(@PATH,4,2800.449,-3608.825,221.4259,0,0,0,100,0),
(@PATH,5,2799.794,-3601.215,221.4245,0,0,0,100,0),
(@PATH,6,2802.056,-3593.389,221.4274,0,0,0,100,0),
(@PATH,7,2806.402,-3587.211,221.4274,0,0,0,100,0),
(@PATH,8,2812.614,-3583.304,221.4273,0,0,0,100,0),
(@PATH,9,2819.016,-3581.604,221.4285,0,0,0,100,0),
(@PATH,10,2825.446,-3581.84,221.4301,0,0,0,100,0),
(@PATH,11,2831.818,-3583.644,221.4293,0,0,0,100,0),
(@PATH,12,2836.348,-3587.178,221.4313,0,0,0,100,0),
(@PATH,13,2839.835,-3592.544,221.434,0,0,0,100,0),
(@PATH,14,2842.145,-3599.79,221.4294,0,0,0,100,0),
(@PATH,15,2843.347,-3608.321,221.4291,0,0,0,100,0),
(@PATH,16,2840.997,-3614.059,221.4281,0,0,0,100,0),
(@PATH,17,2836.926,-3619.116,221.4238,0,0,0,100,0),
(@PATH,18,2831.312,-3622.841,221.4241,0,0,0,100,0),
(@PATH,19,2824.036,-3624.829,221.4252,0,0,0,100,0);

-- Pathing for Necrolord Entry: 24014
SET @NPC := 97260;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=24014,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2586.513,`position_y`=-3756.084,`position_z`=161.398 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2594.313,-3758.43,161.3953,0,0,0,100,0),
(@PATH,2,2601.175,-3758.778,161.3977,0,0,0,100,0),
(@PATH,3,2607.68,-3756.348,161.3983,0,0,0,100,0),
(@PATH,4,2614.385,-3751.512,161.3951,0,0,0,100,0),
(@PATH,5,2617.877,-3746.704,161.3976,0,0,0,100,0),
(@PATH,6,2620.328,-3738.942,161.3956,0,0,0,100,0),
(@PATH,7,2620.506,-3731.859,161.3961,0,0,0,100,0),
(@PATH,8,2618.016,-3725.396,161.3984,0,0,0,100,0),
(@PATH,9,2612.961,-3718.617,161.3952,0,0,0,100,0),
(@PATH,10,2608.518,-3715.498,161.398,0,0,0,100,0),
(@PATH,11,2600.665,-3713.045,161.3954,0,0,0,100,0),
(@PATH,12,2593.633,-3712.684,161.4046,0,0,0,100,0),
(@PATH,13,2586.809,-3714.743,161.4106,0,0,0,100,0),
(@PATH,14,2580.48,-3720.084,161.3953,0,0,0,100,0),
(@PATH,15,2577.218,-3724.641,161.3979,0,0,0,100,0),
(@PATH,16,2574.743,-3732.453,161.3959,0,0,0,100,0),
(@PATH,17,2574.244,-3739.552,161.3972,0,0,0,100,0),
(@PATH,18,2576.927,-3746.14,161.3958,0,0,0,100,0),
(@PATH,19,2581.687,-3752.61,161.398,0,0,0,100,0),
(@PATH,20,2586.513,-3756.084,161.398,0,0,0,100,0);

-- Pathing for Necrolord Entry: 24014
SET @NPC := 203503;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2603.992,`position_y`=-3713.681,`position_z`=141.3663 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2597.609,-3712.674,141.3633,0,0,0,100,0),
(@PATH,2,2593.398,-3712.327,141.3879,0,0,0,100,0),
(@PATH,3,2587.152,-3715.266,141.3655,0,0,0,100,0),
(@PATH,4,2580.309,-3720.183,141.3624,0,0,0,100,0),
(@PATH,5,2576.709,-3724.49,141.3625,0,0,0,100,0),
(@PATH,6,2574.215,-3732.656,141.3617,0,0,0,100,0),
(@PATH,7,2574.386,-3739.554,141.3635,0,0,0,100,0),
(@PATH,8,2576.045,-3746.666,141.3606,0,0,0,100,0),
(@PATH,9,2579.443,-3751.851,141.3886,0,0,0,100,0),
(@PATH,10,2584.13,-3754.667,141.3627,0,0,0,100,0),
(@PATH,11,2590.743,-3758.33,141.3646,0,0,0,100,0),
(@PATH,12,2597.277,-3758.514,141.364,0,0,0,100,0),
(@PATH,13,2605.202,-3757.24,141.363,0,0,0,100,0),
(@PATH,14,2611.11,-3754.3,141.3651,0,0,0,100,0),
(@PATH,15,2616.42,-3749.062,141.363,0,0,0,100,0),
(@PATH,16,2619.533,-3741.9,141.3637,0,0,0,100,0),
(@PATH,17,2620.534,-3736.029,141.3637,0,0,0,100,0),
(@PATH,18,2618.751,-3727.877,141.3636,0,0,0,100,0),
(@PATH,19,2616.373,-3722.089,141.3558,0,0,0,100,0),
(@PATH,20,2610.62,-3717.114,141.3638,0,0,0,100,0),
(@PATH,21,2603.992,-3713.681,141.3663,0,0,0,100,0);

-- Pathing for Necrolord Entry: 24014
SET @NPC := 115178;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2810.375,`position_y`=-3582.374,`position_z`=141.3599 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2805.214,-3586.358,141.3641,0,0,0,100,0),
(@PATH,2,2801.175,-3592.824,141.363,0,0,0,100,0),
(@PATH,3,2798.759,-3600.248,141.3618,0,0,0,100,0),
(@PATH,4,2799.583,-3606.401,141.3644,0,0,0,100,0),
(@PATH,5,2802.503,-3614.063,141.3632,0,0,0,100,0),
(@PATH,6,2805.852,-3619.302,141.3641,0,0,0,100,0),
(@PATH,7,2812.384,-3623.335,141.3662,0,0,0,100,0),
(@PATH,8,2819.554,-3625.753,141.3661,0,0,0,100,0),
(@PATH,9,2825.986,-3625.251,141.364,0,0,0,100,0),
(@PATH,10,2833.809,-3622.541,141.3623,0,0,0,100,0),
(@PATH,11,2838.974,-3618.843,141.3642,0,0,0,100,0),
(@PATH,12,2843.044,-3612.401,141.3634,0,0,0,100,0),
(@PATH,13,2845.442,-3605.066,141.3624,0,0,0,100,0),
(@PATH,14,2845.091,-3598.814,141.3633,0,0,0,100,0),
(@PATH,15,2842.213,-3590.969,141.3621,0,0,0,100,0),
(@PATH,16,2838.518,-3585.883,141.3633,0,0,0,100,0),
(@PATH,17,2831.972,-3581.769,141.3635,0,0,0,100,0),
(@PATH,18,2824.755,-3579.538,141.3658,0,0,0,100,0),
(@PATH,19,2818.303,-3579.807,141.3651,0,0,0,100,0),
(@PATH,20,2810.375,-3582.374,141.3599,0,0,0,100,0);

-- Pathing for Necrolord Entry: 24014
SET @NPC := 97251;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=24014,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2801.415,`position_y`=-3592.805,`position_z`=181.4086 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2805.63,-3586.741,181.4093,0,0,0,100,0),
(@PATH,2,2810.837,-3582.852,181.4067,0,0,0,100,0),
(@PATH,3,2818.372,-3579.891,181.4075,0,0,0,100,0),
(@PATH,4,2824.698,-3579.42,181.4061,0,0,0,100,0),
(@PATH,5,2831.986,-3581.824,181.4095,0,0,0,100,0),
(@PATH,6,2838.559,-3585.897,181.4075,0,0,0,100,0),
(@PATH,7,2842.173,-3590.988,181.4084,0,0,0,100,0),
(@PATH,8,2845.01,-3598.905,181.3987,0,0,0,100,0),
(@PATH,9,2845.163,-3605.083,181.4067,0,0,0,100,0),
(@PATH,10,2842.933,-3612.533,181.4066,0,0,0,100,0),
(@PATH,11,2839.144,-3618.943,181.4076,0,0,0,100,0),
(@PATH,12,2833.877,-3622.96,181.4045,0,0,0,100,0),
(@PATH,13,2826.177,-3625.395,181.4086,0,0,0,100,0),
(@PATH,14,2819.915,-3625.802,181.4059,0,0,0,100,0),
(@PATH,15,2812.322,-3623.443,181.3985,0,0,0,100,0),
(@PATH,16,2805.912,-3619.149,181.4085,0,0,0,100,0),
(@PATH,17,2801.737,-3614.466,181.4039,0,0,0,100,0),
(@PATH,18,2799.258,-3606.344,181.4081,0,0,0,100,0),
(@PATH,19,2798.46,-3600.148,181.4072,0,0,0,100,0),
(@PATH,20,2801.415,-3592.805,181.4086,0,0,0,100,0);

-- Pathing for Necrolord Entry: 24014
SET @NPC := 115180;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2819.609,`position_y`=-3625.823,`position_z`=201.4168 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2825.926,-3625.365,201.4147,0,0,0,100,0),
(@PATH,2,2833.738,-3622.546,201.414,0,0,0,100,0),
(@PATH,3,2838.858,-3618.962,201.4162,0,0,0,100,0),
(@PATH,4,2842.757,-3612.3,201.4155,0,0,0,100,0),
(@PATH,5,2845.156,-3605.187,201.4145,0,0,0,100,0),
(@PATH,6,2845.112,-3598.919,201.4165,0,0,0,100,0),
(@PATH,7,2842.278,-3590.991,201.4143,0,0,0,100,0),
(@PATH,8,2838.798,-3585.699,201.4129,0,0,0,100,0),
(@PATH,9,2832.123,-3581.366,201.4112,0,0,0,100,0),
(@PATH,10,2824.705,-3579.036,201.4159,0,0,0,100,0),
(@PATH,11,2818.319,-3579.608,201.414,0,0,0,100,0),
(@PATH,12,2810.397,-3582.356,201.4127,0,0,0,100,0),
(@PATH,13,2805.141,-3585.997,201.4149,0,0,0,100,0),
(@PATH,14,2801.093,-3592.536,201.4165,0,0,0,100,0),
(@PATH,15,2798.692,-3600.158,201.4118,0,0,0,100,0),
(@PATH,16,2799.542,-3606.275,201.4129,0,0,0,100,0),
(@PATH,17,2802.349,-3614.061,201.4144,0,0,0,100,0),
(@PATH,18,2805.995,-3619.276,201.4165,0,0,0,100,0),
(@PATH,19,2812.382,-3623.6,201.4161,0,0,0,100,0),
(@PATH,20,2819.609,-3625.823,201.4168,0,0,0,100,0);

-- Pathing for Necrolord Entry: 24014
SET @NPC := 97241;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=24014,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2576.456,`position_y`=-3746.067,`position_z`=201.4139 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2581.68,-3752.681,201.414,0,0,0,100,0),
(@PATH,2,2586.568,-3756.62,201.413,0,0,0,100,0),
(@PATH,3,2594.226,-3758.521,201.4138,0,0,0,100,0),
(@PATH,4,2601.322,-3758.976,201.4392,0,0,0,100,0),
(@PATH,5,2608.325,-3756.202,201.4066,0,0,0,100,0),
(@PATH,6,2614.482,-3751.383,201.4148,0,0,0,100,0),
(@PATH,7,2617.85,-3746.781,201.4146,0,0,0,100,0),
(@PATH,8,2620.605,-3739.148,201.4127,0,0,0,100,0),
(@PATH,9,2620.888,-3731.896,201.415,0,0,0,100,0),
(@PATH,10,2618.019,-3725.131,201.4144,0,0,0,100,0),
(@PATH,11,2613.131,-3718.841,201.4171,0,0,0,100,0),
(@PATH,12,2608.565,-3715.357,201.4166,0,0,0,100,0),
(@PATH,13,2600.781,-3713.322,201.4151,0,0,0,100,0),
(@PATH,14,2593.642,-3712.292,201.4142,0,0,0,100,0),
(@PATH,15,2586.736,-3714.775,201.4059,0,0,0,100,0),
(@PATH,16,2580.157,-3719.908,201.413,0,0,0,100,0),
(@PATH,17,2577.031,-3724.391,201.4146,0,0,0,100,0),
(@PATH,18,2574.256,-3732.734,201.4134,0,0,0,100,0),
(@PATH,19,2573.823,-3739.465,201.4134,0,0,0,100,0),
(@PATH,20,2576.456,-3746.067,201.4139,0,0,0,100,0);

-- Pathing for Necrolord Entry: 24014
SET @NPC := 97249;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=24014,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2611.017,`position_y`=-3716.675,`position_z`=181.398 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2616.453,-3722.186,181.4082,0,0,0,100,0),
(@PATH,2,2619.343,-3727.752,181.4051,0,0,0,100,0),
(@PATH,3,2620.622,-3735.984,181.4042,0,0,0,100,0),
(@PATH,4,2619.866,-3742.29,181.4087,0,0,0,100,0),
(@PATH,5,2616.442,-3749.24,181.4057,0,0,0,100,0),
(@PATH,6,2611.063,-3754.8,181.4085,0,0,0,100,0),
(@PATH,7,2604.478,-3757.701,181.4068,0,0,0,100,0),
(@PATH,8,2597.286,-3758.759,181.4067,0,0,0,100,0),
(@PATH,9,2590.852,-3757.972,181.4083,0,0,0,100,0),
(@PATH,10,2584.248,-3754.43,181.4082,0,0,0,100,0),
(@PATH,11,2578.261,-3749.372,181.4069,0,0,0,100,0),
(@PATH,12,2575.873,-3743.828,181.4057,0,0,0,100,0),
(@PATH,13,2574.191,-3735.234,181.4073,0,0,0,100,0),
(@PATH,14,2575.195,-3729.327,181.4094,0,0,0,100,0),
(@PATH,15,2578.681,-3722.37,181.4084,0,0,0,100,0),
(@PATH,16,2583.938,-3716.915,181.4063,0,0,0,100,0),
(@PATH,17,2589.764,-3714.326,181.4076,0,0,0,100,0),
(@PATH,18,2597.566,-3712.55,181.4071,0,0,0,100,0),
(@PATH,19,2604.017,-3713.141,181.4054,0,0,0,100,0),
(@PATH,20,2611.017,-3716.675,181.398,0,0,0,100,0);

-- Pathing for Necrolord Entry: 24014
SET @NPC := 97250;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=24014,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2585.757,`position_y`=-3717.824,`position_z`=221.4304 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2579.807,-3722.263,221.4254,0,0,0,100,0),
(@PATH,2,2575.761,-3730.515,221.4254,0,0,0,100,0),
(@PATH,3,2575.521,-3739.346,221.4455,0,0,0,100,0),
(@PATH,4,2577.731,-3745.002,221.4266,0,0,0,100,0),
(@PATH,5,2581.885,-3751.379,221.4258,0,0,0,100,0),
(@PATH,6,2588.023,-3755.677,221.4271,0,0,0,100,0),
(@PATH,7,2596.354,-3757.416,221.4265,0,0,0,100,0),
(@PATH,8,2602.154,-3756.99,221.4272,0,0,0,100,0),
(@PATH,9,2608.952,-3753.872,221.4283,0,0,0,100,0),
(@PATH,10,2613.777,-3748.49,221.4299,0,0,0,100,0),
(@PATH,11,2616.507,-3743.333,221.4301,0,0,0,100,0),
(@PATH,12,2617.603,-3736.914,221.4314,0,0,0,100,0),
(@PATH,13,2616.173,-3730.112,221.4334,0,0,0,100,0),
(@PATH,14,2611.927,-3721.691,221.432,0,0,0,100,0),
(@PATH,15,2605.345,-3717.231,221.4332,0,0,0,100,0),
(@PATH,16,2595.783,-3715.589,221.4307,0,0,0,100,0),
(@PATH,17,2585.757,-3717.824,221.4304,0,0,0,100,0);

-- Pathing for Fearsome Horror Entry: 24073
SET @NPC := 97267;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2685.435,`position_y`=-3516.336,`position_z`=161.3539 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2662.709,-3500.542,161.3926,0,0,0,100,0),
(@PATH,2,2650.608,-3502.922,161.3893,0,0,0,100,0),
(@PATH,3,2642.166,-3507.048,161.4015,0,0,0,100,0),
(@PATH,4,2640.603,-3513.472,161.4016,0,0,0,100,0),
(@PATH,5,2643.823,-3521.674,161.4016,0,0,0,100,0),
(@PATH,6,2647.113,-3529.029,161.403,0,0,0,100,0),
(@PATH,7,2655.038,-3531.975,161.4017,0,0,0,100,0),
(@PATH,8,2671.99,-3521.808,161.3573,0,0,0,100,0),
(@PATH,9,2673.333,-3507.633,161.3396,0,0,0,100,0),
(@PATH,10,2675.246,-3494.586,161.3678,0,0,0,100,0),
(@PATH,11,2685.497,-3487.036,161.3884,0,0,0,100,0),
(@PATH,12,2692.917,-3484.15,161.3961,0,0,0,100,0),
(@PATH,13,2699.012,-3487.089,161.4006,0,0,0,100,0),
(@PATH,14,2706.217,-3502.243,161.4013,0,0,0,100,0),
(@PATH,15,2703.759,-3510.093,161.4025,0,0,0,100,0),
(@PATH,16,2685.435,-3516.336,161.3539,0,0,0,100,0);

-- Pathing for Fearsome Horror Entry: 24073
SET @NPC := 97246;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2579.879,`position_y`=-3696.3,`position_z`=161.4409 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2588.232,-3690.074,161.4458,0,0,0,100,0),
(@PATH,2,2589.271,-3684.429,161.4359,0,0,0,100,0),
(@PATH,3,2585.342,-3675.472,161.4335,0,0,0,100,0),
(@PATH,4,2581.837,-3668.191,161.4327,0,0,0,100,0),
(@PATH,5,2575.887,-3666.925,161.4406,0,0,0,100,0),
(@PATH,6,2570.748,-3698.407,161.4427,0,0,0,100,0),
(@PATH,7,2579.879,-3696.3,161.4409,0,0,0,100,0);

-- Pathing for Fearsome Horror Entry: 24073
SET @NPC := 105763;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=24073,`modelid`=0,`spawndist`=0,`MovementType`=2,`position_x`=2725.236,`position_y`=-3392.25,`position_z`=159.6907 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2727.104,-3390.643,159.6644,0,0,0,100,0),
(@PATH,2,2724.281,-3389.372,159.6592,0,0,0,100,0),
(@PATH,3,2721.806,-3387.376,159.6504,0,0,0,100,0),
(@PATH,4,2722.977,-3393.822,159.6598,0,0,0,100,0),
(@PATH,5,2725.236,-3392.25,159.6907,0,0,0,100,0);

-- Pathing for Fearsome Horror Entry: 24073
SET @NPC := 97252;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2813.579,`position_y`=-3620.822,`position_z`=161.4043 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2820.259,-3622.993,161.4039,0,0,0,100,0),
(@PATH,2,2825.655,-3622.695,161.4055,0,0,0,100,0),
(@PATH,3,2832.094,-3620.313,161.4071,0,0,0,100,0),
(@PATH,4,2836.655,-3616.929,161.4057,0,0,0,100,0),
(@PATH,5,2840.545,-3611.404,161.4061,0,0,0,100,0),
(@PATH,6,2842.39,-3604.52,161.4045,0,0,0,100,0),
(@PATH,7,2842.031,-3599.292,161.4063,0,0,0,100,0),
(@PATH,8,2839.814,-3592.598,161.4043,0,0,0,100,0),
(@PATH,9,2836.608,-3587.857,161.4041,0,0,0,100,0),
(@PATH,10,2830.603,-3584.255,161.4064,0,0,0,100,0),
(@PATH,11,2823.961,-3581.964,161.4031,0,0,0,100,0),
(@PATH,12,2818.599,-3582.841,161.4023,0,0,0,100,0),
(@PATH,13,2809.316,-3579.184,161.4106,0,0,0,100,0),
(@PATH,14,2801.529,-3572.713,161.4457,0,0,0,100,0),
(@PATH,15,2795.903,-3559.435,161.579,0,0,0,100,0),
(@PATH,16,2793.693,-3547.917,161.4434,0,0,0,100,0),
(@PATH,17,2794.609,-3538.025,161.6062,0,0,0,100,0),
(@PATH,18,2789.339,-3527.189,166.2076,0,0,0,100,0),
(@PATH,19,2778.46,-3527.366,166.1371,0,0,0,100,0),
(@PATH,20,2772.763,-3531.095,166.1371,0,0,0,100,0),
(@PATH,21,2765.156,-3536.607,166.1371,0,0,0,100,0),
(@PATH,22,2763.8,-3543.712,166.3489,0,0,0,100,0),
(@PATH,23,2772.348,-3554.362,161.5688,0,0,0,100,0),
(@PATH,24,2780.89,-3556.149,161.4322,0,0,0,100,0),
(@PATH,25,2791.389,-3562.775,161.5777,0,0,0,100,0),
(@PATH,26,2803.1,-3574.7,161.4174,0,0,0,100,0),
(@PATH,27,2803.814,-3581.895,161.3991,0,0,0,100,0),
(@PATH,28,2804,-3593.935,161.4066,0,0,0,100,0),
(@PATH,29,2801.798,-3600.579,161.4039,0,0,0,100,0),
(@PATH,30,2802.101,-3606.185,161.4054,0,0,0,100,0),
(@PATH,31,2804.482,-3612.46,161.4072,0,0,0,100,0),
(@PATH,32,2807.753,-3617.282,161.405,0,0,0,100,0),
(@PATH,33,2813.579,-3620.822,161.4043,0,0,0,100,0);

-- Pathing for Gjalerbron Warrior Entry: 23991
SET @NPC := 113286;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2656.009,`position_y`=-3595.201,`position_z`=205.3548 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2619.413,-3562.591,205.3707,0,0,0,100,0),
(@PATH,2,2578.914,-3535.467,206.4749,0,0,0,100,0),
(@PATH,3,2569.813,-3526.975,206.25688,0,0,0,100,0),
(@PATH,4,2547.857,-3503.03,187.9234,0,0,0,100,0),
(@PATH,5,2550.461,-3454.087,184.147,0,0,0,100,0),
(@PATH,6,2603.13,-3431.154,184.0111,0,0,0,100,0),
(@PATH,7,2618.346,-3441.865,186.16079,0,0,0,100,0),
(@PATH,8,2636.813,-3462.923,202.8718,0,0,0,100,0),
(@PATH,9,2639.909,-3468.866,206.72212,0,0,0,100,0),
(@PATH,10,2659.177,-3506.079,205.3751,0,0,0,100,0),
(@PATH,11,2684.902,-3549.402,205.3751,0,0,0,100,0),
(@PATH,12,2687.326,-3578.99,205.3152,0,0,0,100,0),
(@PATH,13,2656.009,-3595.201,205.3548,0,0,0,100,0);

-- Allerian Stronghold Fixup

-- Update position for Erick Nateson
UPDATE `creature` SET `position_x`=-2947.306,`position_y`=3982.602,`position_z`=0.04192996,`orientation`=3.493307 WHERE `id`=21399;

-- Pathing for High Elf Ranger Entry: 19000
SET @NPC := 68300;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2892.84,`position_y`=3947.823,`position_z`=13.40542 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,258,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2900.541,3949.979,13.40506,8000,0,0,100,0),
(@PATH,2,-2892.84,3947.823,13.40542,16000,0,0,100,0);

-- Pathing for High Elf Ranger Entry: 19000
SET @NPC := 68302;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2984.74,`position_y`=4065.979,`position_z`=16.47879 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,258,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2989.837,4072.737,16.47879,16000,0,0,100,0),
(@PATH,2,-2984.74,4065.979,16.47879,8000,0,0,100,0);

-- Pathing for High Elf Ranger Entry: 19000
SET @NPC := 68304;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-3057.808,`position_y`=4017.832,`position_z`=16.17462 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,258,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3052.007,4011.99,16.17451,8000,0,0,100,0),
(@PATH,2,-3057.808,4017.832,16.17462,16000,0,0,100,0);

-- Pathing for Allerian Horseman Entry: 19003
SET @NPC := 68308;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2872.895,`position_y`=3981.621,`position_z`=5.133294 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2404, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2862.589,3983.513,4.859164,23000,0,0,100,0),
(@PATH,2,-2877.861,3980.92,4.691218,22000,0,@PATH+1,100,0),
(@PATH,3,-2872.895,3981.621,5.133294,0,0,0,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@PATH+1);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,1,30,0,0,0.1919862,822);

-- Pathing for Allerian Horseman Entry: 19003
SET @NPC := 68309;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2965.397,`position_y`=4084.842,`position_z`=3.064998 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,2404, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2971.184,4089.91,4.059246,0,0,0,100,0),
(@PATH,2,-2974.546,4096.034,4.809246,0,0,0,100,0),
(@PATH,3,-2975.984,4102.904,5.563596,0,0,0,100,0),
(@PATH,4,-2976.84,4109.215,6.188596,0,0,0,100,0),
(@PATH,5,-2977.442,4116.1,6.438596,29000,0,0,100,0),
(@PATH,6,-2976.687,4106.692,6.063596,0,0,0,100,0),
(@PATH,7,-2975.544,4099.55,5.309246,0,0,0,100,0),
(@PATH,8,-2973.493,4091.829,4.309246,0,0,0,100,0),
(@PATH,9,-2969.062,4087.132,3.684246,0,0,0,100,0),
(@PATH,10,-2965.397,4084.842,3.064998,29000,0,@PATH+1,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@PATH+1);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,1,30,0,0,2.321288,823);

-- Pathing for Lemla Hopewing Entry: 19181
SET @NPC := 68626;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2981.203,`position_y`=3879.134,`position_z`=9.613096 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2992.487,3878.415,9.613096,9000,0,@PATH+1,100,0),
(@PATH,2,-2996.076,3870.127,9.613096,20000,0,0,100,0),
(@PATH,3,-2997.53,3865.11,9.484549,8000,0,0,100,0),
(@PATH,4,-2993.53,3863.55,9.484549,7000,0,0,100,0),
(@PATH,5,-2981.203,3879.134,9.613096,7000,0,0,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@PATH+1);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,0,30,0,0,1.27409,824);

-- Pathing for Allerian Defender Entry: 18999
SET @NPC := 68292;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2947.596,`position_y`=3983.544,`position_z`=-0.08307004 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2944.827,3979.540,0.041929,0,0,0,100,0),
(@PATH,2,-2942.500,3979.078,-0.20807,25000,0,@PATH+1,100,0),
(@PATH,3,-2939.759,3978.620,-0.425645,0,0,0,100,0),
(@PATH,4,-2936.500,3981.641,-0.33307,0,0,0,100,0),
(@PATH,5,-2935.938,3983.333,-0.33307,29000,0,@PATH+2,100,0),
(@PATH,6,-2935.374,3986.827,-0.594707,0,0,0,100,0),
(@PATH,7,-2937.500,3990.625,-0.58307,0,0,0,100,0),
(@PATH,8,-2940.678,3990.862,-0.70807,23000,0,@PATH+3,100,0),
(@PATH,9,-2943.362,3990.967,-0.597971,0,0,0,100,0),
(@PATH,10,-2947.396,3988.542,-0.20807,0,0,0,100,0),
(@PATH,11,-2947.596,3983.544,-0.08307004,27000,0,@PATH+4,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@PATH+1,@PATH+2,@PATH+3,@PATH+4);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,1,30,0,0,4.729842,825),
(@PATH+2,1,30,0,0,6.091199,826),
(@PATH+3,1,30,0,0,1.815142,827),
(@PATH+4,1,30,0,0,3.560472,828);

-- Pathing for Allerian Defender Entry: 18999
SET @NPC := 68296;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-3004.182,`position_y`=4059.2,`position_z`=16.47264 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3016.535,4050.462,16.47229,0,0,0,100,0),
(@PATH,2,-3022.042,4045.356,17.46166,0,0,0,100,0),
(@PATH,3,-3030.056,4039.186,17.46166,0,0,0,100,0),
(@PATH,4,-3032.783,4036.933,16.18017,0,0,0,100,0),
(@PATH,5,-3044.368,4027.187,16.17542,12000,0,@PATH+1,100,0),
(@PATH,6,-3039.387,4030.45,16.1769,0,0,0,100,0),
(@PATH,7,-3032.683,4037.32,16.1804,0,0,0,100,0),
(@PATH,8,-3025.89,4042.386,17.46166,0,0,0,100,0),
(@PATH,9,-3019.17,4047.763,17.46166,0,0,0,100,0),
(@PATH,10,-3016.295,4049.834,16.47264,0,0,0,100,0),
(@PATH,11,-3004.042,4059.303,16.47269,12000,0,@PATH+2,100,0),
(@PATH,12,-2992.944,4066.828,16.47743,0,0,0,100,0),
(@PATH,13,-2989.875,4062.297,16.47566,0,0,0,100,0),
(@PATH,14,-2999.597,4055.534,10.61597,0,0,0,100,0),
(@PATH,15,-3008.305,4049.41,5.663261,10000,0,@PATH+3,100,0),
(@PATH,16,-3003.988,4052.784,7.524997,0,0,0,100,0),
(@PATH,17,-2989.94,4062.394,16.47567,0,0,0,100,0),
(@PATH,18,-2992.964,4066.766,16.47739,0,0,0,100,0),
(@PATH,19,-3004.182,4059.2,16.47264,12000,0,@PATH+4,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@PATH+1,@PATH+2,@PATH+3,@PATH+4);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,1,30,0,0,2.373648,829),
(@PATH+2,1,30,0,0,2.164208,830),
(@PATH+3,1,30,0,0,0.3490658,831),
(@PATH+4,1,30,0,0,2.164208,832);

-- Pathing for Allerian Defender Entry: 18999
SET @NPC := 68290;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2908.265,`position_y`=3922.398,`position_z`=13.40726 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2905.809,3933.479,7.323796,0,0,0,100,0),
(@PATH,2,-2903.188,3943.559,2.596507,11000,0,@PATH+1,100,0),
(@PATH,3,-2907.823,3925.806,12.06445,0,0,0,100,0),
(@PATH,4,-2908.265,3922.398,13.40726,0,0,0,100,0),
(@PATH,5,-2903.021,3920.76,13.40938,19000,0,@PATH+2,100,0),
(@PATH,6,-2900.368,3931.102,13.40561,0,0,0,100,0),
(@PATH,7,-2896.775,3945.807,13.40281,29000,0,@PATH+3,100,0),
(@PATH,8,-2898.747,3936.718,13.40411,0,0,0,100,0),
(@PATH,9,-2903.021,3920.76,13.40938,28000,0,@PATH+4,100,0),
(@PATH,10,-2908.265,3922.398,13.40726,0,0,0,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (@PATH+1,@PATH+2,@PATH+3,@PATH+4);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,1,30,0,0,2.80998,833),
(@PATH+2,1,30,0,0,6.021386,834),
(@PATH+3,1,30,0,0,6.161012,835),
(@PATH+4,1,30,0,0,6.003932,836);

-- Allerian Defender SAI
SET @ENTRY   := 18999; -- NPC entry
SET @SPELL1  := 18396; -- Dismounting Blast
SET @GUID1   := 68293; -- One Defender is scripted
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@ENTRY; -- Set SAI as AI. Remove cpp ScriptName if one exist
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY; -- Remove EAI if exist
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@ENTRY,-@GUID1);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Allerian Defender - On Aggro - Cast Dismounting Blast on victim'),
(-@GUID1,0,0,0,4,0,100,1,0,0,0,0,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Allerian Defender - On Aggro - Cast Dismounting Blast on victim'),
(-@GUID1,0,1,0,1,0,100,0,40000,80000,180000,180000,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Allerian Defender - OOC - Run Script'),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.642576, 'Allerian Defender - Script - turn to'),
(@ENTRY*100,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Allerian Defender - Script - Say text 0'),
(@ENTRY*100,9,2,0,0,0,100,0,5000,5000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.466077, 'Allerian Defender - Script - turn to'),
(@ENTRY*100,9,3,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,10,68291,@ENTRY,0,0,0,0,0, 'Allerian Defender - Script - Say text 0');
-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry`=18999;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(18999,0,0, 'Hey, did you read the bounty on this wanted poster?',12,7,100,6,0,0, 'Allerian Defender'),
(18999,0,1, 'The Bone Wastes! I don''t care what''s being offered as a reward, I''m not going into the Bone Wastes!',12,7,100,6,0,0, 'Allerian Defender'),
(18999,0,2, 'This wanted poster says that they''re offering gold to these so-called adventurers to go kill things. Isn''t that what we do? I don''t think I''m being paid enough!',12,7,100,6,0,0, 'Allerian Defender'),
(18999,0,3, 'You want to go do the bounty off of this wanted poster after the shift is over?',12,7,100,6,0,0, 'Allerian Defender'),
(18999,0,4, 'This poster has a bounty on bonelashers. You think I should do that?',12,7,100,6,0,0, 'Allerian Defender'),
(18999,1,0, 'Is that wanted poster all that you''re going to talk about today?',12,7,100,1,0,0, 'Allerian Defender'),
(18999,1,1, 'I''m up to looking into that bounty after this shift.',12,7,100,1,0,0, 'Allerian Defender'),
(18999,1,2, 'I could use the extra money.',12,7,100,1,0,0, 'Allerian Defender'),
(18999,1,3, 'I don''t know and I don''t care.',12,7,100,1,0,0, 'Allerian Defender'),
(18999,1,4, 'The bonelashers of the wastes are no laughing matter. I hear they carry diseases!',12,7,100,1,0,0, 'Allerian Defender');
-- Remove old crappy script
UPDATE `creature` SET `MovementType`=0 WHERE `guid` IN (68291,68293);
UPDATE `creature_addon` SET `path_id`=0 WHERE `guid` IN (68291,68293);
DELETE FROM `waypoint_data` WHERE `id` IN (682910,682930);
DELETE FROM `waypoint_scripts` WHERE `id` BETWEEN 170 AND 171;
DELETE FROM `db_script_string` WHERE `entry` IN (2000005046,2000005047);

-- Pathing for Allerian Peasant Entry: 19147
SET @NPC := 68470;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2983.204,`position_y`=3971.366,`position_z`=2.162047 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2981.773,3966.45,2.614914,0,0,0,100,0),
(@PATH,2,-2981.005,3960.968,2.989914,0,0,0,100,0),
(@PATH,3,-2981.881,3954.581,2.614914,0,0,0,100,0),
(@PATH,4,-2982.862,3947.319,3.114914,0,0,0,100,0),
(@PATH,5,-2986.684,3945.63,3.239914,0,0,0,100,0),
(@PATH,6,-2986.646,3950.593,3.761735,6000,0,@PATH+1,100,0),
(@PATH,7,-2986.979,3946.354,3.114914,0,0,0,100,0),
(@PATH,8,-2982.707,3945.763,3.364914,0,0,0,100,0),
(@PATH,9,-2980.747,3953.042,2.739914,0,0,0,100,0),
(@PATH,10,-2980.202,3961.786,2.864914,0,0,0,100,0),
(@PATH,11,-2983.204,3971.366,2.162047,4000,0,@PATH+2,100,0);
-- F1304ACB07BEF300 .go -2981.773 3966.45 2.614914
DELETE FROM `waypoint_scripts` WHERE `id` IN (188,189,@PATH+1,@PATH+2);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,0,30,0,0,1.413717,837),
(@PATH+1,1,2,83,381,0,838),
(@PATH+2,1,2,83,381,0,839);

-- Pathing for Allerian Peasant Entry: 19147
SET @NPC := 68468;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2977.357,`position_y`=4012.234,`position_z`=1.424733 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2978.323,4006.793,1.174733,0,0,0,100,0),
(@PATH,2,-2973.405,4002.646,1.424733,0,0,0,100,0),
(@PATH,3,-2967.158,4003.521,1.299733,0,0,0,100,0),
(@PATH,4,-2964.591,4008.163,1.124218,0,0,0,100,0),
(@PATH,5,-2966.771,4010.062,1.299733,0,0,0,100,0),
(@PATH,6,-2969.096,4008.951,1.830398,5000,0,@PATH+1,100,0),
(@PATH,7,-2966.771,4010.062,1.299733,0,0,0,100,0),
(@PATH,8,-2964.591,4008.163,1.124218,0,0,0,100,0),
(@PATH,9,-2965.665,4005.173,1.249218,0,0,0,100,0),
(@PATH,10,-2972.548,4002.835,1.424733,0,0,0,100,0),
(@PATH,11,-2977.689,4007.088,1.174733,0,0,0,100,0),
(@PATH,12,-2977.357,4012.234,1.424733,4000,0,@PATH+2,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (184,185,@PATH+1,@PATH+2);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,0,30,0,0,3.839724,840),
(@PATH+1,1,2,83,381,0,841),
(@PATH+2,1,2,83,381,0,842);

-- Pathing for Allerian Peasant Entry: 19147
SET @NPC := 68469;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2994.862,`position_y`=4029.217,`position_z`=1.799733 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2995.501,4024.677,1.674733,0,0,0,100,0),
(@PATH,2,-2991.115,4017.175,1.424733,0,0,0,100,0),
(@PATH,3,-2986.05,4011.426,0.7997329,0,0,0,100,0),
(@PATH,4,-2980.667,4005.888,1.049733,0,0,0,100,0),
(@PATH,5,-2974.792,4001.254,1.424733,0,0,0,100,0),
(@PATH,6,-2969.111,3999.192,1.787047,0,0,0,100,0),
(@PATH,7,-2962.025,4001.197,1.249218,0,0,0,100,0),
(@PATH,8,-2955.767,4003.337,0.8742183,0,0,0,100,0),
(@PATH,9,-2949.479,4006.26,-0.5007817,0,0,0,100,0),
(@PATH,10,-2943.639,4005.681,-0.8757817,0,0,0,100,0),
(@PATH,11,-2938.82,4004.248,-0.8757817,5000,0,@PATH+2,100,0),
(@PATH,12,-2944.247,4006.454,-0.8757817,0,0,0,100,0),
(@PATH,13,-2950.113,4005.459,-0.2507817,0,0,0,100,0),
(@PATH,14,-2958.819,4002.142,1.124218,0,0,0,100,0),
(@PATH,15,-2968.181,3999.478,1.662047,0,0,0,100,0),
(@PATH,16,-2976.377,4001.348,1.424733,0,0,0,100,0),
(@PATH,17,-2982.522,4005.211,1.049733,0,0,0,100,0),
(@PATH,18,-2987.678,4011.322,0.6747329,0,0,0,100,0),
(@PATH,19,-2991.716,4016.418,1.174733,0,0,0,100,0),
(@PATH,20,-2994.956,4023.157,1.549733,0,0,0,100,0),
(@PATH,21,-2994.996,4027.696,1.799733,0,0,0,100,0),
(@PATH,22,-2994.862,4029.217,1.799733,5000,0,@PATH+1,100,0);
DELETE FROM `waypoint_scripts` WHERE `id` IN (186,187,@PATH+1,@PATH+2);
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(@PATH+1,0,30,0,0,1.570796,843),
(@PATH+1,1,2,83,381,0,844),
(@PATH+2,1,2,83,69,0,845);
DELETE FROM `disables` WHERE `entry`=6803 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=6803 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(6803,11,0,0,'achievement_defenseless');
DELETE FROM `disables` WHERE `entry`=7319 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7319 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7319,11,0,0,'achievement_less_rabi');
DELETE FROM `disables` WHERE `entry`=7577 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7577 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7577,11,0,0,'achievement_split_personality');
DELETE FROM `disables` WHERE `entry`=7320 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7320 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7320,11,0,0,'achievement_dehydration');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7590 AND `type`=18;DELETE FROM `spell_bonus_data` WHERE `entry` = 64891;
INSERT INTO `spell_bonus_data` VALUES
(64891, -1, 0, -1, -1, 'Paladin - T8 Holy 2P - Holy Mending');
DELETE FROM `spell_script_names` WHERE `spell_id` IN(4073,19804,12749,13258,13166);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(4073,'spell_gen_allow_cast_from_item_only'),
(19804,'spell_gen_allow_cast_from_item_only'),
(12749,'spell_gen_allow_cast_from_item_only'),
(13258,'spell_gen_allow_cast_from_item_only'),
(13166,'spell_gen_allow_cast_from_item_only');
DELETE FROM `spell_dbc` WHERE `id`=59046;
INSERT INTO `spell_dbc` (`Id`,`Effect1`,`EffectRadiusIndex1`,`EffectImplicitTargetA1`,`EffectImplicitTargetB1`,`comment`)
VALUES
(59046,3,28,22,30,'Tribunal of Ages - Criteria Marker');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7590 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7590,11,0,0,'achievement_brann_spankin_new');
DELETE FROM `disables` WHERE `entry`=7361 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7361 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7361,11,0,0,'achievement_oh_novos');
DELETE FROM `spell_dbc` WHERE `Id`=24308;
INSERT INTO `spell_dbc`(`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
('24308','0','0','256','0','0','0','0','0','0','0','0','1','0','0','101','0','0','0','0','26','1','0','-1','0','0','41','0','0','1','0','0','0','0','0','0','0','0','0','0','0','18','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','14986','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','Summon Shade of Jin''Do');
-- Fix typo for Ragnaros' Magmaburst
UPDATE `script_texts` SET `content_default`='MY PATIENCE IS DWINDLING! COME, GNATS, TO YOUR DEATH!' WHERE `npc_entry`=11502 AND `entry`='-1409018';
-- Fix Quest 11465 "The Ransacked Caravan"
-- Fjord Turkey SAI
SET @ENTRY   := 24746; -- NPC entry
SET @SPELL1  := 44323; -- Hawk Hunting
SET @SPELL2  := 44327; -- Hawk Hunting
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,@SPELL1,0,0,0,11,@SPELL2,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Fjord Turkey - On Spellhit - Cast spell on invoker'),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fjord Turkey - On Spellhit - Despawn');
-- Fix condition for Item 34111 to only target Fjord Turkey
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=34111;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,0,34111,0,24,1,@ENTRY,0,63,'','Item Trained Rock Falcon targets only Fjord Turkey');
-- Dragonflayer Ambusher SAI
SET @ENTRY   := 24779; -- NPC entry
SET @SPELL1  := 38557; -- Throw
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dragonflayer Ambusher - On spawn - Set random movement'),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dragonflayer Ambusher - On aggro - Say text'),
(@ENTRY,0,2,0,0,0,100,1,0,0,0,0,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Dragonflayer Ambusher - Combat - Cast spell on victim');
-- NPC talk text insert from sniff
DELETE FROM `creature_text` WHERE `entry`=24779;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(24779,0,0, 'Tonight we feast on you!',12,0,100,0,0,0, 'Dragonflayer Ambusher'),
(24779,0,1, 'Such easy prey...',12,0,100,0,0,0, 'Dragonflayer Ambusher'),
(24779,0,2, 'Who''s hunting who?',12,0,100,0,0,0, 'Dragonflayer Ambusher');
-- Ice Heart Jormungar Feeder SAI
SET @ENTRY   := 26358; -- NPC entry
SET @SPELL1  := 47447; -- Corrosive Spit
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,11000,20000,26000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Ice Heart Jormungar Feeder - Combat - Cast Corrosive Spit');

-- SAI for Fulgorge
SET @ENTRY := 18678;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature` SET `spawndist`=20,`MovementType`=1 WHERE `id`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,1,0,0,0,0,11,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - OOC - Cast Submerge Visual'),
(@ENTRY,0,1,0,61,0,100,1,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - OOC - Set Unselectable and Unattackable Flags'),
(@ENTRY,0,2,3,0,0,100,1,0,0,0,0,28,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - On Aggro - Remove Submerge Visual'),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - On Aggro - Remove Unselectable and Unattackable Flags'),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - On Aggro - Prevent Combat Movement'),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - On Aggro - Set Phase 1'),
(@ENTRY,0,6,7,0,1,100,0,1000,1000,2100,4500,11,31747,1,0,0,0,0,2,0,0,0,0,0,0,0,'Fulgorge - Combat - Cast Poison (Phase 1)'),
(@ENTRY,0,7,0,61,1,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - Combat - Prevent Combat Movement (Phase 1)'),
(@ENTRY,0,8,0,0,1,100,0,20400,20400,45000,50000,11,32738,1,0,0,0,0,2,0,0,0,0,0,0,0,'Fulgorge - Combat - Cast Bore (Phase 1)'),
(@ENTRY,0,9,10,9,1,100,0,20,60,0,0,11,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - At 20 - 60 Yards Range - Cast Submerge Visual (Phase 1)'),
(@ENTRY,0,10,0,61,1,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - At 20 - 60 Yards Range - Set Phase 2 (Phase 1)'),
(@ENTRY,0,11,12,9,2,100,0,0,8,0,0,28,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - At 0 - 8 Yards - Remove Submerge Visual (Phase 2)'),
(@ENTRY,0,12,13,61,2,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - Combat - Prevent Combat Movement (Phase 2)'),
(@ENTRY,0,13,14,61,2,100,0,0,8,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - At 0 - 8 Yards - Remove Unselectable and Unattackable Flags (Phase 2)'),
(@ENTRY,0,14,0,61,2,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - At 20 - 60 Yards Range - Set Phase 1 (Phase 2)');

-- Deranged Helboar SAI
SET @ENTRY  := 16863; -- NPC entry
SET @SPELL1 := 33908; -- Burning Spikes
SET @SPELL2 := 8599;  -- Enrage
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,@SPELL1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Deranged Helboar - On spawn - Cast Burning Spikes on self'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,@SPELL2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Deranged Helboar - On Health level - Cast Enrage When Below 30% HP');

-- Stonescythe Alpha SAI
SET @ENTRY  := 16929; -- NPC entry
SET @SPELL1 := 33911; -- Tear Armor
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,50,0,3000,3000,8000,8000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Stonescythe Alpha - Combat - Cast Tear Armor');

DELETE FROM `disables` WHERE `entry`=7593 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7593 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7593,11,0,0,'achievement_abuse_the_ooze');
DELETE FROM `disables` WHERE `entry`=7579 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7579 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7579,11,0,0,'achievement_consumption_junction');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=12976 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(12976,11,0,0,'achievement_three_faced');
DELETE FROM `disables` WHERE `entry`=7359 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7359 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7359,11,0,0,'achievement_volunteer_work');
UPDATE `achievement_criteria_data` SET `ScriptName`='achievement_brann_spankin_new' WHERE `ScriptName`='achievement_brann_sparklin_news';
DELETE FROM `disables` WHERE `entry` IN (7328,7329,7330,7331,7332,7333) AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7328,7329,7330,7331,7332,7333) AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7328,11,0,0,'achievement_twilight_assist'),
(7329,11,0,0,'achievement_twilight_duo'),
(7330,11,0,0,'achievement_twilight_zone'),
(7331,11,0,0,'achievement_twilight_assist'),
(7332,11,0,0,'achievement_twilight_duo'),
(7333,11,0,0,'achievement_twilight_zone');
DELETE FROM `disables` WHERE `entry`=7315 AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=7315 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(7315,11,0,0,'achievement_intense_cold');

DELETE FROM `spell_script_names` WHERE `spell_id`=48095;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`)
VALUES
(48095,'spell_intense_cold');
UPDATE `creature_template` SET `ScriptName`='npc_pool_of_tar' WHERE `entry`=33090;
UPDATE `trinity_string` SET `content_default`='You try to view cinematic %u but it doesn\'t exist.' WHERE entry='1200';
DELETE FROM `conditions` WHERE `SourceEntry`=24311 AND `ConditionValue2` IN (14825,14986,14826,14883);DELETE FROM `spell_proc_event` WHERE `entry` = 70817;
INSERT INTO `spell_proc_event` VALUES
(70817,0,11,0,0x1000,0,0x10000,0,0,0,0);
DELETE FROM `disables` WHERE `entry` IN (10056,10057,10058,10059,10060,10061,10218,10219) AND `sourceType`=4;

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10056,10057,10058,10059,10060,10061,10218,10219) AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10056,11,0,0,'achievement_orbital_bombardment'),
(10057,11,0,0,'achievement_orbital_devastation'),
(10058,11,0,0,'achievement_nuked_from_orbit'),
(10059,11,0,0,'achievement_orbital_bombardment'),
(10060,11,0,0,'achievement_orbital_devastation'),
(10061,11,0,0,'achievement_nuked_from_orbit'),
(10218,11,0,0,'achievement_orbit_uary'),
(10219,11,0,0,'achievement_orbit_uary');
DELETE FROM `spell_proc_event` WHERE `entry` = 63086;
INSERT INTO `spell_proc_event` VALUES 
(63086, 0x00, 9, 0x00000000, 0x00000000, 0x00010000, 0x00000000, 0x00000000, 0, 0, 0);
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_deathbringer_mark_of_the_fallen_champion';
DELETE FROM `command` WHERE `name`='pet tp';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_deathbringer_boiling_blood';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(72385,'spell_deathbringer_boiling_blood'),
(72441,'spell_deathbringer_boiling_blood'),
(72442,'spell_deathbringer_boiling_blood'),
(72443,'spell_deathbringer_boiling_blood');
UPDATE `spell_dbc` SET `Effect1`=28, `EffectMiscValueB1`=64 WHERE `Id`=24308;
DROP TABLE IF EXISTS `spell_proc`;
CREATE TABLE `spell_proc` (
  `spellId` mediumint(8) NOT NULL DEFAULT '0',
  `schoolMask` tinyint(4) NOT NULL DEFAULT '0',
  `spellFamilyName` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask0` int(10) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask1` int(10) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask2` int(10) unsigned NOT NULL DEFAULT '0',
  `typeMask` int(10) unsigned NOT NULL DEFAULT '0',
  `spellTypeMask` int(10) unsigned NOT NULL DEFAULT '0',
  `spellPhaseMask` int(10) NOT NULL DEFAULT '0',
  `hitMask` int(10) NOT NULL DEFAULT '0',
  `attributesMask` int(10) unsigned NOT NULL DEFAULT '0',
  `ratePerMinute` float NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `cooldown` float unsigned NOT NULL DEFAULT '0',
  `charges` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
DELETE FROM `command` WHERE `name` = 'reload spell_proc';
INSERT INTO `command` VALUES
('reload spell_proc',3,'Syntax: .reload spell_proc\nReload spell_proc table.');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10447,10448,10449,10459,10460,10461) AND `type` IN (11,18);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10447,18,0,0,''),
(10448,18,0,0,''),
(10449,18,0,0,''),
(10459,18,0,0,''),
(10460,18,0,0,''),
(10461,18,0,0,'');
DELETE FROM `spell_script_names` WHERE `spell_id`=66218;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES (66218,'spell_gen_launch');
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (33354,33355,33430,33431,33525,33526,33527,33528);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (33354,33355,33430,33431,33525,33526,33527,33528) AND `event_type`=6;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)
VALUES
(33354,0,0,0,6,0,100,0,0,0,0,0,34,2,1,0,0,0,0,19,32906,0,0,0,0,0,0,'Corrupted Servitor - on death set instance data for achievement Con-Speed-Atory'),
(33355,0,0,0,6,0,100,0,0,0,0,0,34,2,1,0,0,0,0,19,32906,0,0,0,0,0,0,'Misguided Nymph - on death set instance data for achievement Con-Speed-Atory'),
(33430,0,0,0,6,0,100,0,0,0,0,0,34,2,1,0,0,0,0,19,32906,0,0,0,0,0,0,'Guardian Lasher - on death set instance data for achievement Con-Speed-Atory'),
(33431,0,0,0,6,0,100,0,0,0,0,0,34,2,1,0,0,0,0,19,32906,0,0,0,0,0,0,'Forest Swarmer - on death set instance data for achievement Con-Speed-Atory'),
(33525,0,0,0,6,0,100,0,0,0,0,0,34,2,1,0,0,0,0,19,32906,0,0,0,0,0,0,'Mangrove Ent - on death set instance data for achievement Con-Speed-Atory'),
(33526,0,0,0,6,0,100,0,0,0,0,0,34,2,1,0,0,0,0,19,32906,0,0,0,0,0,0,'Ironroot Lasher - on death set instance data for achievement Con-Speed-Atory'),
(33527,0,0,0,6,0,100,0,0,0,0,0,34,2,1,0,0,0,0,19,32906,0,0,0,0,0,0,'Natures\'s Blade - on death set instance data for achievement Con-Speed-Atory'),
(33528,0,0,0,6,0,100,0,0,0,0,0,34,2,1,0,0,0,0,19,32906,0,0,0,0,0,0,'Guardian of Life - on death set instance data for achievement Con-Speed-Atory');
DELETE FROM `spell_script_names` WHERE `spell_id` IN(65266,65635,65636,66666,66667,66668);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(65266,'spell_gen_vehicle_scaling'),
(65635,'spell_gen_vehicle_scaling'),
(65636,'spell_gen_vehicle_scaling'),
(66666,'spell_gen_vehicle_scaling'),
(66667,'spell_gen_vehicle_scaling'),
(66668,'spell_gen_vehicle_scaling');
DROP TABLE `vehicle_scaling_info`;
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10447,10448,10449,10459,10460,10461) AND `type` IN (11,12,18);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10447,11,0,0,'achievement_knock_on_wood'),
(10447,12,0,0,''),
(10448,11,0,0,'achievement_knock_knock_on_wood'),
(10448,12,0,0,''),
(10449,11,0,0,'achievement_knock_knock_knock_on_wood'),
(10449,12,0,0,''),
(10459,11,0,0,'achievement_knock_on_wood'),
(10459,12,1,0,''),
(10460,11,0,0,'achievement_knock_knock_on_wood'),
(10460,12,1,0,''),
(10461,11,0,0,'achievement_knock_knock_knock_on_wood'),
(10461,12,1,0,'');

UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (33354,33355,33430,33431,33525,33526,33527,33528);



DELETE FROM `smart_scripts` WHERE `entryorguid` IN (33354,33355,33430,33431,33525,33526,33527,33528);
DELETE FROM `disables` WHERE `entry` IN (10088,10089,10418,10419,10420,10421);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10088,10089,10418,10419,10420,10421) AND `type`=5;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10088,5,58501,0,''),
(10089,5,58501,0,''),
(10418,5,58501,0,''),
(10419,5,58501,0,''),
(10420,5,58501,0,''),
(10421,5,58501,0,'');
UPDATE `areatrigger_teleport` SET `target_orientation`= 3.30496 WHERE `id`=922;
DELETE FROM `command` WHERE `name`= 'npc set deathstate';
-- Drop DeathState column
ALTER TABLE `creature` DROP COLUMN `DeathState`;
-- Remove spawns for Kologarn (not boss) and Focused Eyebeam (summoned).
DELETE FROM `creature` WHERE `id` IN (34297,33632,33802);
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (7709,7710,7711,7712,7713,7714,7715,7716,7718,7719);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (7709,7710,7711,7712,7713,7714,7715,7716,7718,7719);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(7709,6,4575,0, ''), -- killed player in Wintergrasp Fortress
(7710,6,4612,0, ''), -- killed player in Eastspark Workshop
(7711,6,4539,0, ''), -- killed player in The Broken Temple
(7712,6,4538,0, ''), -- killed player in The Sunken Ring
(7713,6,4611,0, ''), -- killed player in Westspark Workshop
(7714,6,4581,0, ''), -- killed player in Flamewatch Tower
(7715,6,4583,0, ''), -- killed player in Shadowsight Tower
(7716,6,4582,0, ''), -- killed player in Winter's Edge Tower
(7718,6,4584,0, ''), -- killed player in The Cauldron of Flames
(7719,6,4589,0, ''); -- killed player in The Chilled Quagmire
DELETE FROM `script_texts` WHERE `npc_entry`=10096;
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(10096,-1230003,'You have been sentenced to death for crimes against the Dark Iron nation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'npc_grimstone SCRIPT_TEXT1'),
(10096,-1230004,'The Sons of Thaurissan shall watch you perish in the Ring of the Law!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'npc_grimstone SCRIPT_TEXT2'),
(10096,-1230005,'Unleash the fury and let it be done!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'npc_grimstone SCRIPT_TEXT3'),
(10096,-1230006,'Haha! I bet you thought you were done!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'npc_grimstone SCRIPT_TEXT4'),
(10096,-1230007,'But your real punishment lies ahead.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'npc_grimstone SCRIPT_TEXT5'),
(10096,-1230008,'Good riddance!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'npc_grimstone SCRIPT_TEXT6');
DELETE FROM `spelldifficulty_dbc` WHERE `id` BETWEEN 3251 AND 3261;
INSERT INTO `spelldifficulty_dbc` (`id`,`spellid0`,`spellid1`,`spellid2`,`spellid3`)
VALUES
-- Steelbreaker
(3251,61980,63498,0,0),
(3252,61903,63493,0,0),
(3253,44008,63494,0,0),
(3254,64637,61888,0,0),
-- Runemaster Molgeim
(3255,62274,63489,0,0),
(3256,62277,63967,0,0),
(3257,62052,63492,0,0),
-- Stormcaller Brundir
(3258,61879,63479,0,0),
(3259,61869,63481,0,0),
(3260,61915,63483,0,0),
(3261,61887,63486,0,0);
DELETE FROM `command` WHERE `name` = 'wpgps';
INSERT INTO `command` VALUES
('wpgps', '3', 'Syntax: .wpgps\n\nOutput current position to sql developer log as partial SQL query to be used in pathing');
DELETE FROM `script_texts` WHERE `npc_entry`=14507;
DELETE FROM `creature_text` WHERE `entry`=14507;
INSERT INTO `creature_text` (`entry`,`groupid`,`text`,`type`,`sound`,`comment`) VALUES
(14507,1,'Let the coils of hate unfurl!',14,8421,'venoxis SAY_VENOXIS_TRANSFORM'),
(14507,2,'Ssserenity..at lassst!',14,0,'venoxis SAY_VENOXIS_DEATH');
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry`=14884;
DELETE FROM `smart_scripts` WHERE `entryorguid`=14884 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(14884,0,0,0,25,0,100,0,0,3,0,0,75,23867,0,0,0,0,0,1,0,0,0,0,0,0,0,'Parasitic Serpent - Cast Parasitic Serpent aura on spawn'),
(14884,0,1,2,31,0,100,0,23865,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Parasitic Serpent - stop combat movement, linking to 2'),
(14884,0,2,0,61,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Parasitic Serpent - evade, linking to 3'),
(14884,0,3,0,7,0,100,0,0,0,0,0,41,10,0,0,0,0,0,1,0,0,0,0,0,0,0,'Parasitic Serpent - on evade despawn');
-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67674;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3307.196,`position_y`=4042.883,`position_z`=154.8781 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3277.618,4026.461,147.0905,0,0,0,100,0),
(@PATH,2,3260.858,4007.037,144.7625,0,0,0,100,0),
(@PATH,3,3250.179,3988.815,150.5136,0,0,0,100,0),
(@PATH,4,3241.547,3965.698,161.7374,1000,0,0,100,0),
(@PATH,5,3250.179,3988.815,150.5136,0,0,0,100,0),
(@PATH,6,3260.858,4007.037,144.7625,0,0,0,100,0),
(@PATH,7,3277.618,4026.461,147.0905,0,0,0,100,0),
(@PATH,8,3307.196,4042.883,154.8781,0,0,0,100,0),
(@PATH,9,3320.514,4065.975,147.2531,0,0,0,100,0),
(@PATH,10,3339.809,4086.788,141.3519,0,0,0,100,0),
(@PATH,11,3320.514,4065.975,147.2531,0,0,0,100,0),
(@PATH,12,3307.196,4042.883,154.8781,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67675;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3500.969,`position_y`=4111.483,`position_z`=119.7430 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3485.152,4132.505,120.2611,0,0,0,100,0),
(@PATH,2,3500.969,4111.483,119.74300,0,0,0,100,0),
(@PATH,3,3504.477,4105.242,116.2309,0,0,0,100,0),
(@PATH,4,3528.868,4068.198,117.009,0,0,0,100,0),
(@PATH,5,3539.426,4043.977,115.94192,0,0,0,100,0),
(@PATH,6,3543.322,4036.772,109.2695,0,0,0,100,0),
(@PATH,7,3544.440,4030.735,106.11139,0,0,0,100,0),
(@PATH,8,3547.317,4017.866,112.61887,0,0,0,100,0),
(@PATH,9,3550.593,3999.587,112.1916,0,0,0,100,0),
(@PATH,10,3554.401,3988.877,118.17648,0,0,0,100,0),
(@PATH,11,3557.836,3972.274,118.9416,0,0,0,100,0),
(@PATH,12,3556.315,3956.803,123.46574,0,0,0,100,0),
(@PATH,13,3558.203,3940.378,123.7852,0,0,0,100,0),
(@PATH,14,3549.843,3903.547,118.9388,0,0,0,100,0),
(@PATH,15,3522.814,3871.391,125.8325,0,0,0,100,0),
(@PATH,16,3519.263,3862.244,122.35843,0,0,0,100,0),
(@PATH,17,3513.410,3840.514,130.29782,0,0,0,100,0),
(@PATH,18,3510.590,3830.997,126.47477,0,0,0,100,0),
(@PATH,19,3509.047,3823.276,128.7576,0,0,0,100,0),
(@PATH,20,3501.395,3806.494,139.15434,0,0,0,100,0),
(@PATH,21,3488.025,3783.108,145.2974,0,0,0,100,0),
(@PATH,22,3501.395,3806.494,139.15434,0,0,0,100,0),
(@PATH,23,3509.047,3823.276,128.7576,0,0,0,100,0),
(@PATH,24,3510.590,3830.997,126.47477,0,0,0,100,0),
(@PATH,25,3513.410,3840.514,130.29782,0,0,0,100,0),
(@PATH,26,3519.263,3862.244,122.35843,0,0,0,100,0),
(@PATH,27,3522.636,3871.163,125.8325,0,0,0,100,0),
(@PATH,28,3549.666,3903.319,118.9388,0,0,0,100,0),
(@PATH,29,3558.201,3940.354,123.7852,0,0,0,100,0),
(@PATH,30,3556.315,3956.803,123.46574,0,0,0,100,0),
(@PATH,31,3557.836,3972.274,118.9416,0,0,0,100,0),
(@PATH,32,3554.401,3988.877,118.17648,0,0,0,100,0),
(@PATH,33,3550.593,3999.587,112.1916,0,0,0,100,0),
(@PATH,34,3547.317,4017.866,112.61887,0,0,0,100,0),
(@PATH,35,3544.440,4030.735,106.11139,0,0,0,100,0),
(@PATH,36,3543.322,4036.772,109.2695,0,0,0,100,0),
(@PATH,37,3539.426,4043.977,115.94192,0,0,0,100,0),
(@PATH,38,3528.868,4068.198,117.009,0,0,0,100,0),
(@PATH,39,3504.477,4105.242,116.2309,0,0,0,100,0),
(@PATH,40,3500.969,4111.483,119.74300,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67676;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3187.844,`position_y`=3354.885,`position_z`=103.6849 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3186.171,3369.128,103.175,0,0,0,100,0),
(@PATH,2,3187.844,3354.885,103.6849,0,0,0,100,0),
(@PATH,3,3193.295,3334.863,105.5599,0,0,0,100,0),
(@PATH,4,3176.572,3326.64,106.6562,0,0,0,100,0),
(@PATH,5,3147.848,3330.089,110.65391,0,0,0,100,0),
(@PATH,6,3112.877,3326.449,108.7179,0,0,0,100,0),
(@PATH,7,3109.425,3297.064,110.9742,0,0,0,100,0),
(@PATH,8,3112.877,3326.449,108.7179,0,0,0,100,0),
(@PATH,9,3147.848,3330.089,110.65391,0,0,0,100,0),
(@PATH,10,3176.572,3326.64,106.6562,0,0,0,100,0),
(@PATH,11,3193.295,3334.863,105.5599,0,0,0,100,0),
(@PATH,12,3187.844,3354.885,103.6849,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67677;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3205.647,`position_y`=3602.592,`position_z`=129.2651 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3223.249,3624.715,127.0151,0,0,0,100,0),
(@PATH,2,3235.066,3659.355,127.7201,0,0,0,100,0),
(@PATH,3,3216.7,3678.948,130.4733,0,0,0,100,0),
(@PATH,4,3189.74,3684.127,131.0753,0,0,0,100,0),
(@PATH,5,3170.825,3663.576,132.6749,0,0,0,100,0),
(@PATH,6,3178.646,3639.574,130.4249,0,0,0,100,0),
(@PATH,7,3185.125,3653.292,130.72742,0,0,0,100,0),
(@PATH,8,3201.354,3649.029,128.16573,0,0,0,100,0),
(@PATH,9,3204.285,3617.030,129.46323,0,0,0,100,0),
(@PATH,10,3190.81,3613.903,130.5821,0,0,0,100,0),
(@PATH,11,3187.683,3592.944,134.12030,0,0,0,100,0),
(@PATH,12,3202.407,3584.459,129.73170,0,0,0,100,0),
(@PATH,13,3200.818,3578.828,129.82494,0,0,0,100,0),
(@PATH,14,3197.821,3575.041,130.04979,0,0,0,100,0),
(@PATH,15,3192.861,3576.952,131.0747,0,0,0,100,0),
(@PATH,16,3184.961,3555.860,131.56726,0,0,0,100,0),
(@PATH,17,3174.97,3545.822,139.6494,0,0,0,100,0),
(@PATH,18,3168.137,3528.296,144.1821,0,0,0,100,0),
(@PATH,19,3174.97,3545.822,139.6494,0,0,0,100,0),
(@PATH,20,3184.961,3555.860,131.56726,0,0,0,100,0),
(@PATH,21,3192.861,3576.952,131.0747,0,0,0,100,0),
(@PATH,22,3197.821,3575.041,130.04979,0,0,0,100,0),
(@PATH,23,3200.818,3578.828,129.82494,0,0,0,100,0),
(@PATH,24,3202.407,3584.459,129.73170,0,0,0,100,0),
(@PATH,25,3187.683,3592.944,134.12030,0,0,0,100,0),
(@PATH,26,3190.81,3613.903,130.5821,0,0,0,100,0),
(@PATH,27,3204.285,3617.030,129.46323,0,0,0,100,0),
(@PATH,28,3201.354,3649.029,128.16573,0,0,0,100,0),
(@PATH,29,3185.125,3653.292,130.72742,0,0,0,100,0),
(@PATH,30,3178.388,3639.369,130.4249,0,0,0,100,0),
(@PATH,31,3170.825,3663.576,132.6749,0,0,0,100,0),
(@PATH,32,3189.74,3684.127,131.0753,0,0,0,100,0),
(@PATH,33,3216.7,3678.948,130.4733,0,0,0,100,0),
(@PATH,34,3235.066,3659.355,127.7201,0,0,0,100,0),
(@PATH,35,3223.249,3624.715,127.0151,0,0,0,100,0),
(@PATH,36,3205.647,3602.592,129.2651,0,0,0,100,0),
(@PATH,37,3192.143,3599.760,130.23784,0,0,0,100,0),
(@PATH,38,3187.477,3599.081,133.15712,0,0,0,100,0),
(@PATH,39,3181.387,3595.847,134.07948,0,0,0,100,0),
(@PATH,40,3170.807,3588.936,135.81763,0,0,0,100,0),
(@PATH,41,3173.438,3581.25,135.0747,0,0,0,100,0),
(@PATH,42,3168.840,3584.897,136.61433,0,0,0,100,0),
(@PATH,43,3160.090,3578.968,139.22585,0,0,0,100,0),
(@PATH,44,3153.512,3574.571,138.24211,0,0,0,100,0),
(@PATH,45,3148.415,3570.115,141.38100,0,0,0,100,0),
(@PATH,46,3144.422,3566.506,140.08098,0,0,0,100,0),
(@PATH,47,3138.708,3561.236,141.6376,0,0,0,100,0),
(@PATH,48,3115.41,3551.044,140.6872,1000,0,0,100,0),
(@PATH,49,3138.708,3561.236,141.6376,0,0,0,100,0),
(@PATH,50,3144.422,3566.506,140.08098,0,0,0,100,0),
(@PATH,51,3148.415,3570.115,141.38100,0,0,0,100,0),
(@PATH,52,3153.512,3574.571,138.24211,0,0,0,100,0),
(@PATH,53,3160.090,3578.968,139.22585,0,0,0,100,0),
(@PATH,54,3168.840,3584.897,136.61433,0,0,0,100,0),
(@PATH,55,3172.968,3580.598,135.0747,0,0,0,100,0),
(@PATH,56,3170.807,3588.936,135.81763,0,0,0,100,0),
(@PATH,57,3181.387,3595.847,134.07948,0,0,0,100,0),
(@PATH,58,3187.477,3599.081,133.15712,0,0,0,100,0),
(@PATH,59,3192.143,3599.760,130.23784,0,0,0,100,0),
(@PATH,60,3205.647,3602.592,129.2651,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67678;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3083.824,`position_y`=3822.363,`position_z`=142.9242 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3107.359,3805.027,143.4097,0,0,0,100,0),
(@PATH,2,3113.569,3784.48,142.849,0,0,0,100,0),
(@PATH,3,3125.968,3758.109,141.6801,0,0,0,100,0),
(@PATH,4,3143.205,3746.017,140.3879,0,0,0,100,0),
(@PATH,5,3166.316,3767.922,139.2505,0,0,0,100,0),
(@PATH,6,3157.023,3792.195,141.1255,0,0,0,100,0),
(@PATH,7,3165.993,3808.895,140.2915,0,0,0,100,0),
(@PATH,8,3169.192,3824.669,133.174408,0,0,0,100,0),
(@PATH,9,3172.914,3832.764,133.808151,0,0,0,100,0),
(@PATH,10,3175.760,3840.606,130.687729,0,0,0,100,0),
(@PATH,11,3167.760,3847.435,134.709045,0,0,0,100,0),
(@PATH,12,3160.811,3854.203,135.4904,0,0,0,100,0),
(@PATH,13,3156.707,3863.009,137.4904,0,0,0,100,0),
(@PATH,14,3145.38,3864.699,144.4904,0,0,0,100,0),
(@PATH,15,3115.666,3862.969,143.9057,0,0,0,100,0),
(@PATH,16,3095.106,3848.855,144.1251,0,0,0,100,0),
(@PATH,17,3083.824,3822.363,142.9242,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67679;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2953.074,`position_y`=4418.923,`position_z`=113.6698 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2968.870,4415.504,104.08283,0,0,0,100,0),
(@PATH,2,2980.312,4414.008,110.27019,0,0,0,100,0),
(@PATH,3,2989.23,4413.055,111.8806,0,0,0,100,0),
(@PATH,4,3019.479,4393.933,114.7273,0,0,0,100,0),
(@PATH,5,3031.533,4384.412,115.13152,0,0,0,100,0),
(@PATH,6,3037.941,4378.716,110.84249,0,0,0,100,0),
(@PATH,7,3042.72,4375.858,114.4709,0,0,0,100,0),
(@PATH,8,3047.354,4372.069,118.25387,0,0,0,100,0),
(@PATH,9,3069.198,4352.577,120.5235,0,0,0,100,0),
(@PATH,10,3070.953,4332.657,125.02256,0,0,0,100,0),
(@PATH,11,3072.404,4323.974,122.46004,0,0,0,100,0),
(@PATH,12,3075.358,4315.096,129.9413,0,0,0,100,0),
(@PATH,13,3079.458,4302.790,133.94775,0,0,0,100,0),
(@PATH,14,3080.927,4296.537,131.91492,0,0,0,100,0),
(@PATH,15,3085.319,4283.639,136.32475,0,0,0,100,0),
(@PATH,16,3086.899,4278.267,136.2266,0,0,0,100,0),
(@PATH,17,3083.732,4260.896,130.52606,0,0,0,100,0),
(@PATH,18,3082.22,4243.589,132.2974,0,0,0,100,0),
(@PATH,19,3072.038,4215.869,141.6003,0,0,0,100,0),
(@PATH,20,3068.870,4212.112,142.49199,0,0,0,100,0),
(@PATH,21,3065.441,4208.322,140.52289,0,0,0,100,0),
(@PATH,22,3059.951,4202.285,145.96335,0,0,0,100,0),
(@PATH,23,3046.959,4187.614,148.8807,0,0,0,100,0),
(@PATH,24,3046.440,4183.375,148.15771,0,0,0,100,0),
(@PATH,25,3045.245,4174.715,144.05222,0,0,0,100,0),
(@PATH,26,3044.982,4164.704,148.3401,0,0,0,100,0),
(@PATH,27,3062.038,4148.822,144.2151,0,0,0,100,0),
(@PATH,28,3085.888,4134.461,134.2539,0,0,0,100,0),
(@PATH,29,3090.815,4126.320,129.15350,0,0,0,100,0),
(@PATH,30,3098.432,4116.025,134.30519,0,0,0,100,0),
(@PATH,31,3102.213,4111.794,134.9322,0,0,0,100,0),
(@PATH,32,3125.156,4102.375,131.92854,0,0,0,100,0),
(@PATH,33,3133.285,4098.211,125.818,0,0,0,100,0),
(@PATH,34,3136.667,4096.907,125.45198,0,0,0,100,0),
(@PATH,35,3142.879,4094.014,130.06189,0,0,0,100,0),
(@PATH,36,3147.032,4092.458,130.79753,0,0,0,100,0),
(@PATH,37,3163.426,4085.868,128.8258,0,0,0,100,0),
(@PATH,38,3147.032,4092.458,130.79753,0,0,0,100,0),
(@PATH,39,3142.879,4094.014,130.06189,0,0,0,100,0),
(@PATH,40,3136.667,4096.907,125.45198,0,0,0,100,0),
(@PATH,41,3133.285,4098.211,125.818,0,0,0,100,0),
(@PATH,42,3125.156,4102.375,131.92854,0,0,0,100,0),
(@PATH,43,3102.213,4111.794,134.9322,0,0,0,100,0),
(@PATH,44,3098.432,4116.025,134.30519,0,0,0,100,0),
(@PATH,45,3090.815,4126.320,129.15350,0,0,0,100,0),
(@PATH,46,3085.888,4134.461,134.2539,0,0,0,100,0),
(@PATH,47,3062.038,4148.822,144.2151,0,0,0,100,0),
(@PATH,48,3045.147,4164.433,148.5901,0,0,0,100,0),
(@PATH,49,3045.245,4174.715,144.05222,0,0,0,100,0),
(@PATH,50,3046.440,4183.375,148.15771,0,0,0,100,0),
(@PATH,51,3046.959,4187.614,148.8807,0,0,0,100,0),
(@PATH,52,3059.951,4202.285,145.96335,0,0,0,100,0),
(@PATH,53,3065.441,4208.322,140.52289,0,0,0,100,0),
(@PATH,54,3068.870,4212.112,142.49199,0,0,0,100,0),
(@PATH,55,3072.038,4215.869,141.6003,0,0,0,100,0),
(@PATH,56,3082.22,4243.589,132.2974,0,0,0,100,0),
(@PATH,57,3083.732,4260.896,130.52606,0,0,0,100,0),
(@PATH,58,3086.899,4278.267,136.2266,0,0,0,100,0),
(@PATH,59,3085.319,4283.639,136.32475,0,0,0,100,0),
(@PATH,60,3080.927,4296.537,131.91492,0,0,0,100,0),
(@PATH,61,3079.458,4302.790,133.94775,0,0,0,100,0),
(@PATH,62,3075.358,4315.096,129.9413,0,0,0,100,0),
(@PATH,63,3072.404,4323.974,122.46004,0,0,0,100,0),
(@PATH,64,3070.953,4332.657,125.02256,0,0,0,100,0),
(@PATH,65,3069.198,4352.577,120.5235,0,0,0,100,0),
(@PATH,66,3047.354,4372.069,118.25387,0,0,0,100,0),
(@PATH,67,3042.72,4375.858,114.4709,0,0,0,100,0),
(@PATH,68,3037.941,4378.716,110.84249,0,0,0,100,0),
(@PATH,69,3031.533,4384.412,115.13152,0,0,0,100,0),
(@PATH,70,3019.479,4393.933,114.7273,0,0,0,100,0),
(@PATH,71,2989.23,4413.055,111.8806,0,0,0,100,0),
(@PATH,72,2980.312,4414.008,110.27019,0,0,0,100,0),
(@PATH,73,2968.870,4415.504,104.08283,0,0,0,100,0),
(@PATH,74,2953.074,4418.923,113.6698,0,0,0,100,0),
(@PATH,75,2945.318,4422.867,113.08457,0,0,0,100,0),
(@PATH,76,2937.188,4426.727,106.90451,0,0,0,100,0),
(@PATH,77,2927.775,4431.704,112.43441,0,0,0,100,0),
(@PATH,78,2916.436,4437.853,113.2494,0,0,0,100,0),
(@PATH,79,2887.948,4449.667,115.9472,0,0,0,100,0),
(@PATH,80,2916.436,4437.853,113.2494,0,0,0,100,0),
(@PATH,81,2927.775,4431.704,112.43441,0,0,0,100,0),
(@PATH,82,2937.188,4426.727,106.90451,0,0,0,100,0),
(@PATH,83,2945.318,4422.867,113.08457,0,0,0,100,0),
(@PATH,84,2953.074,4418.923,113.6698,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67680;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3354.154,`position_y`=3934.199,`position_z`=194.9946 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3326.337,3936.656,185.7551,0,0,0,100,0),
(@PATH,2,3289.139,3941.342,176.3743,0,0,0,100,0),
(@PATH,3,3277.685,3946.140,173.13022,0,0,0,100,0),
(@PATH,4,3270.545,3949.150,168.28789,0,0,0,100,0),
(@PATH,5,3264.730,3950.612,168.52800,0,0,0,100,0),
(@PATH,6,3260.312,3951.976,166.74434,0,0,0,100,0),
(@PATH,7,3256.503,3953.552,167.9874,0,0,0,100,0),
(@PATH,8,3233.981,3970.728,159.8886,0,0,0,100,0),
(@PATH,9,3201.644,3982.191,155.4106,0,0,0,100,0),
(@PATH,10,3192.360,3985.352,154.61075,0,0,0,100,0),
(@PATH,11,3185.386,3987.769,151.02473,0,0,0,100,0),
(@PATH,12,3177.326,3990.076,153.16119,0,0,0,100,0),
(@PATH,13,3157.516,3996.942,152.4727,0,0,0,100,0),
(@PATH,14,3138.194,4034.612,143.7936,0,0,0,100,0),
(@PATH,15,3157.516,3996.942,152.4727,0,0,0,100,0),
(@PATH,16,3177.326,3990.076,153.16119,0,0,0,100,0),
(@PATH,17,3185.386,3987.769,151.02473,0,0,0,100,0),
(@PATH,18,3192.360,3985.352,154.61075,0,0,0,100,0),
(@PATH,19,3201.644,3982.191,155.4106,0,0,0,100,0),
(@PATH,20,3233.981,3970.728,159.8886,0,0,0,100,0),
(@PATH,21,3256.503,3953.552,167.9874,0,0,0,100,0),
(@PATH,22,3260.312,3951.976,166.74434,0,0,0,100,0),
(@PATH,23,3264.730,3950.612,168.52800,0,0,0,100,0),
(@PATH,24,3270.545,3949.150,168.28789,0,0,0,100,0),
(@PATH,25,3277.685,3946.140,173.13022,0,0,0,100,0),
(@PATH,26,3289.139,3941.342,176.3743,0,0,0,100,0),
(@PATH,27,3326.337,3936.656,185.7551,0,0,0,100,0),
(@PATH,28,3354.154,3934.199,194.9946,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67681;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3355.43,`position_y`=4002.26,`position_z`=172.045 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3330.275,3988.508,172.517,0,0,0,100,0),
(@PATH,2,3335.216,3953.428,182.4946,0,0,0,100,0),
(@PATH,3,3343.837,3924.523,195.0368,1000,0,0,100,0),
(@PATH,4,3335.253,3953.264,182.4946,0,0,0,100,0),
(@PATH,5,3330.275,3988.508,172.517,0,0,0,100,0),
(@PATH,6,3355.438,4002.257,172.045,0,0,0,100,0),
(@PATH,7,3357.194,4007.439,174.10998,0,0,0,100,0),
(@PATH,8,3361.875,4020.746,173.30781,0,0,0,100,0),
(@PATH,9,3365.056,4031.747,166.795,0,0,0,100,0),
(@PATH,10,3378.95,4062.084,164.3968,1000,0,0,100,0),
(@PATH,11,3365.056,4031.747,166.795,0,0,0,100,0),
(@PATH,12,3361.876,4020.746,173.30781,0,0,0,100,0),
(@PATH,13,3357.194,4007.439,174.10998,0,0,0,100,0),
(@PATH,14,3355.43,4002.26,172.045,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67682;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2753.675,`position_y`=3675.186,`position_z`=135.0956 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2752.725,3638.173,138.30611,0,0,0,100,0),
(@PATH,2,2737.014,3614.894,140.55336,0,0,0,100,0),
(@PATH,3,2723.215,3596.417,139.1804,0,0,0,100,0),
(@PATH,4,2699.974,3555.05,136.0686,0,0,0,100,0),
(@PATH,5,2700.122,3523.024,138.8626,0,0,0,100,0),
(@PATH,6,2732.669,3502.801,137.7376,0,0,0,100,0),
(@PATH,7,2760.138,3473.001,137.8149,0,0,0,100,0),
(@PATH,8,2732.669,3502.801,137.7376,0,0,0,100,0),
(@PATH,9,2700.122,3523.024,138.8626,0,0,0,100,0),
(@PATH,10,2699.974,3555.05,136.0686,0,0,0,100,0),
(@PATH,11,2723.215,3596.417,139.1804,0,0,0,100,0),
(@PATH,12,2737.014,3614.894,140.55336,0,0,0,100,0),
(@PATH,13,2752.725,3638.173,138.30611,0,0,0,100,0),
(@PATH,14,2753.675,3675.186,135.0956,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67683;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3494.521,`position_y`=3825.948,`position_z`=138.826 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3478.928,3860.734,137.685,0,0,0,100,0),
(@PATH,2,3468.246,3864.527,144.41382,0,0,0,100,0),
(@PATH,3,3436.838,3871.05,145.8949,0,0,0,100,0),
(@PATH,4,3400.958,3849.562,144.1248,0,0,0,100,0),
(@PATH,5,3436.838,3871.05,145.8949,0,0,0,100,0),
(@PATH,6,3468.246,3864.527,144.41382,0,0,0,100,0),
(@PATH,7,3478.62,3860.805,137.685,0,0,0,100,0),
(@PATH,8,3494.521,3825.948,138.826,0,0,0,100,0),
(@PATH,9,3501.794,3816.455,134.85043,0,0,0,100,0),
(@PATH,10,3506.306,3810.192,137.24022,0,0,0,100,0),
(@PATH,11,3522.751,3787.881,134.6801,0,0,0,100,0),
(@PATH,12,3540.783,3744.365,126.4502,0,0,0,100,0),
(@PATH,13,3549.274,3716.644,128.705,0,0,0,100,0),
(@PATH,14,3561.855,3703.672,126.12941,0,0,0,100,0),
(@PATH,15,3568.691,3697.024,121.05640,0,0,0,100,0),
(@PATH,16,3575.249,3691.114,124.98943,0,0,0,100,0),
(@PATH,17,3581.976,3684.394,125.7408,0,0,0,100,0),
(@PATH,18,3604.484,3652.555,122.0869,0,0,0,100,0),
(@PATH,19,3614.723,3618.143,122.672,0,0,0,100,0),
(@PATH,20,3643.934,3580.083,108.1123,0,0,0,100,0),
(@PATH,21,3654.955,3560.409,102.2775,0,0,0,100,0),
(@PATH,22,3643.917,3548.586,104.79498,0,0,0,100,0),
(@PATH,23,3639.404,3543.252,102.43231,0,0,0,100,0),
(@PATH,24,3634.628,3537.618,107.24618,0,0,0,100,0),
(@PATH,25,3630.19,3531.329,109.6528,0,0,0,100,0),
(@PATH,26,3634.628,3537.618,107.24618,0,0,0,100,0),
(@PATH,27,3639.404,3543.252,102.43231,0,0,0,100,0),
(@PATH,28,3643.917,3548.586,104.79498,0,0,0,100,0),
(@PATH,29,3654.955,3560.409,102.2775,0,0,0,100,0),
(@PATH,30,3643.934,3580.083,108.1123,0,0,0,100,0),
(@PATH,31,3614.723,3618.143,122.672,0,0,0,100,0),
(@PATH,32,3604.569,3652.428,122.0869,0,0,0,100,0),
(@PATH,33,3581.976,3684.394,125.7408,0,0,0,100,0),
(@PATH,34,3575.249,3691.114,124.98943,0,0,0,100,0),
(@PATH,35,3568.691,3697.024,121.05640,0,0,0,100,0),
(@PATH,36,3561.855,3703.672,126.12941,0,0,0,100,0),
(@PATH,37,3549.274,3716.644,128.705,0,0,0,100,0),
(@PATH,38,3540.783,3744.365,126.4502,0,0,0,100,0),
(@PATH,39,3522.751,3787.881,134.6801,0,0,0,100,0),
(@PATH,40,3506.306,3810.192,137.24022,0,0,0,100,0),
(@PATH,41,3501.794,3816.455,134.85043,0,0,0,100,0),
(@PATH,42,3494.521,3825.948,138.826,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67684;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2701.955,`position_y`=3523.686,`position_z`=138.8626 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2715.25,3553.21,136.9013,0,0,0,100,0),
(@PATH,2,2736.884,3574.413,139.223,0,0,0,100,0),
(@PATH,3,2771.713,3570.953,143.5453,0,0,0,100,0),
(@PATH,4,2792.225,3585.327,149.4203,0,0,0,100,0),
(@PATH,5,2771.713,3570.953,143.5453,0,0,0,100,0),
(@PATH,6,2736.884,3574.413,139.223,0,0,0,100,0),
(@PATH,7,2715.25,3553.21,136.9013,0,0,0,100,0),
(@PATH,8,2701.955,3523.686,138.8626,0,0,0,100,0),
(@PATH,9,2674.59,3498.665,138.4444,0,0,0,100,0),
(@PATH,10,2658.199,3478.996,136.3828,0,0,0,100,0),
(@PATH,11,2657.239,3466.174,137.92674,0,0,0,100,0),
(@PATH,12,2656.176,3454.785,135.19179,0,0,0,100,0),
(@PATH,13,2656.075,3446.561,139.651,0,0,0,100,0),
(@PATH,14,2644.711,3405.757,145.9891,0,0,0,100,0),
(@PATH,15,2628.007,3385.215,146.6058,0,0,0,100,0),
(@PATH,16,2644.711,3405.757,145.9891,0,0,0,100,0),
(@PATH,17,2656.075,3446.561,139.651,0,0,0,100,0),
(@PATH,18,2656.176,3454.785,135.19179,0,0,0,100,0),
(@PATH,19,2657.239,3466.174,137.92674,0,0,0,100,0),
(@PATH,20,2658.199,3478.996,136.3828,0,0,0,100,0),
(@PATH,21,2674.59,3498.665,138.4444,0,0,0,100,0),
(@PATH,22,2701.955,3523.686,138.8626,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67686;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2748.586,`position_y`=3009.797,`position_z`=120.4969 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2767.257,3018.985,122.9459,0,0,0,100,0),
(@PATH,2,2801.052,3000.443,124.6497,0,0,0,100,0),
(@PATH,3,2812.721,2982.991,116.0997,0,0,0,100,0),
(@PATH,4,2832.336,2996.546,120.5997,0,0,0,100,0),
(@PATH,5,2830.507,3010.039,123.0247,0,0,0,100,0),
(@PATH,6,2814.308,3024.928,124.6497,0,0,0,100,0),
(@PATH,7,2801.464,3020.028,127.3997,0,0,0,100,0),
(@PATH,8,2793.697,3003.944,124.4459,0,0,0,100,0),
(@PATH,9,2772.344,2989.09,119.8073,0,0,0,100,0),
(@PATH,10,2748.876,2991.988,115.8422,0,0,0,100,0),
(@PATH,11,2748.586,3009.797,120.4969,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67688;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2834.561,`position_y`=3001.471,`position_z`=120.8159 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2840.711,3031.622,124.3159,0,0,0,100,0),
(@PATH,2,2857.4,3067.843,129.3599,0,0,0,100,0),
(@PATH,3,2899.201,3080.454,126.1296,0,0,0,100,0),
(@PATH,4,2857.4,3067.843,129.3599,0,0,0,100,0),
(@PATH,5,2840.711,3031.622,124.3159,0,0,0,100,0),
(@PATH,6,2834.561,3001.471,120.8159,0,0,0,100,0),
(@PATH,7,2822.727,2965.426,115.3626,0,0,0,100,0),
(@PATH,8,2818.008,2927.768,116.7844,0,0,0,100,0),
(@PATH,9,2822.727,2965.426,115.3626,0,0,0,100,0),
(@PATH,10,2834.561,3001.471,120.8159,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67689;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2848.075,`position_y`=3093.444,`position_z`=132.7349 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2858.285,3097.977,136.87012,0,0,0,100,0),
(@PATH,2,2871.172,3100.596,135.9064,0,0,0,100,0),
(@PATH,3,2892.202,3086.498,130.2546,0,0,0,100,0),
(@PATH,4,2903.099,3082.905,125.89697,0,0,0,100,0),
(@PATH,5,2916.77,3078.38,118.1466,0,0,0,100,0),
(@PATH,6,2931.368,3085.41,124.3966,0,0,0,100,0),
(@PATH,7,2913.329,3108.087,136.5948,0,0,0,100,0),
(@PATH,8,2901.257,3107.051,132.31752,0,0,0,100,0),
(@PATH,9,2888.116,3103.573,134.9064,0,0,0,100,0),
(@PATH,10,2874.584,3076.865,130.3796,0,0,0,100,0),
(@PATH,11,2864.657,3041.682,126.3279,0,0,0,100,0),
(@PATH,12,2843.429,3035.965,122.9529,0,0,0,100,0),
(@PATH,13,2826.314,3047.521,129.3029,0,0,0,100,0),
(@PATH,14,2827.662,3066.208,130.5529,0,0,0,100,0),
(@PATH,15,2848.075,3093.444,132.7349,0,0,0,100,0);

-- Pathing for Nether Ray Entry: 18880
SET @NPC := 67690;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3211.062,`position_y`=2915.2,`position_z`=126.1535 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3234.818,2931.539,132.6105,0,0,0,100,0),
(@PATH,2,3211.062,2915.2,126.1535,0,0,0,100,0),
(@PATH,3,3180.997,2899.493,122.4443,0,0,0,100,0),
(@PATH,4,3155.461,2898.618,109.8302,0,0,0,100,0),
(@PATH,5,3130.092,2921.61,111.8091,0,0,0,100,0),
(@PATH,6,3101.947,2887.793,107.7605,0,0,0,100,0),
(@PATH,7,3092.268,2889.189,100.72347,0,0,0,100,0),
(@PATH,8,3080.941,2889.102,101.0506,0,0,0,100,0),
(@PATH,9,3074.878,2890.193,101.54104,0,0,0,100,0),
(@PATH,10,3061.921,2893.191,100.51373,0,0,0,100,0),
(@PATH,11,3056.108,2895.22,95.62936,0,0,0,100,0),
(@PATH,12,3046.537,2896.025,88.50332,0,0,0,100,0),
(@PATH,13,3036.618,2898.464,90.65160,0,0,0,100,0),
(@PATH,14,3026.08,2901.524,87.18484,0,0,0,100,0),
(@PATH,15,2994.799,2882.332,78.04801,0,0,0,100,0),
(@PATH,16,2999.258,2856.904,68.22955,0,0,0,100,0),
(@PATH,17,2981.474,2831.317,66.73794,0,0,0,100,0),
(@PATH,18,2981.693,2807.114,58.98794,0,0,0,100,0),
(@PATH,19,2981.474,2831.317,66.73794,0,0,0,100,0),
(@PATH,20,2999.154,2856.777,68.22955,0,0,0,100,0),
(@PATH,21,2994.799,2882.332,78.04801,0,0,0,100,0),
(@PATH,22,3026.08,2901.524,87.18484,0,0,0,100,0),
(@PATH,23,3036.618,2898.464,90.65160,0,0,0,100,0),
(@PATH,24,3046.537,2896.025,88.50332,0,0,0,100,0),
(@PATH,25,3056.108,2895.22,95.62936,0,0,0,100,0),
(@PATH,26,3061.921,2893.191,100.51373,0,0,0,100,0),
(@PATH,27,3074.878,2890.193,101.54104,0,0,0,100,0),
(@PATH,28,3080.941,2889.102,101.0506,0,0,0,100,0),
(@PATH,29,3092.268,2889.189,100.72347,0,0,0,100,0),
(@PATH,30,3101.77,2887.565,107.7605,0,0,0,100,0),
(@PATH,31,3130.092,2921.61,111.8091,0,0,0,100,0),
(@PATH,32,3155.461,2898.618,109.8302,0,0,0,100,0),
(@PATH,33,3180.997,2899.493,122.4443,0,0,0,100,0),
(@PATH,34,3211.062,2915.2,126.1535,0,0,0,100,0);

-- Pathing for Shaleskin Flayer Entry: 20210
SET @NPC := 71872;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3367.845,`position_y`=4044.642,`position_z`=166.1468 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3366.639,4009.914,176.67,0,1,0,100,0),
(@PATH,2,3368.435,4004.178,177.404144,0,1,0,100,0),
(@PATH,3,3370.942,3996.480,175.153839,0,1,0,100,0),
(@PATH,4,3373.951,3984.955,186.3951,0,1,0,100,0),
(@PATH,5,3365.027,3955.574,192.7446,0,1,0,100,0),
(@PATH,6,3341.767,3935.888,190.3696,0,1,0,100,0),
(@PATH,7,3318.116,3920.932,189.6091,0,1,0,100,0),
(@PATH,8,3291.822,3931.773,180.6205,0,1,0,100,0),
(@PATH,9,3279.326,3936.204,176.748886,0,1,0,100,0),
(@PATH,10,3274.518,3937.024,172.854630,0,1,0,100,0),
(@PATH,11,3266.748,3939.606,175.114761,0,1,0,100,0),
(@PATH,12,3257,3943.094,171.2374,0,1,0,100,0),
(@PATH,13,3221.064,3955.733,165.0594,0,1,0,100,0),
(@PATH,14,3215.425,3985.175,154.1606,0,1,0,100,0),
(@PATH,15,3227.777,3993.394,151.396332,0,1,0,100,0),
(@PATH,16,3233.644,3998.084,146.493988,0,1,0,100,0),
(@PATH,17,3241.634,4004.46,149.7625,0,1,0,100,0),
(@PATH,18,3249.900,4002.525,149.618729,0,1,0,100,0),
(@PATH,19,3258.537,4000.494,145.491760,0,1,0,100,0),
(@PATH,20,3263.390,3999.769,147.094147,0,1,0,100,0),
(@PATH,21,3278.169,3998.145,157.3382,0,1,0,100,0),
(@PATH,22,3294.997,3986.058,163.8382,0,1,0,100,0),
(@PATH,23,3311.89,3996.222,166.142,0,1,0,100,0),
(@PATH,24,3316.447,4016.001,156.5248,0,1,0,100,0),
(@PATH,25,3294.146,4053.942,150.6925,0,1,0,100,0),
(@PATH,26,3301.807,4061.169,149.166290,0,1,0,100,0),
(@PATH,27,3311.557,4068.420,142.918396,0,1,0,100,0),
(@PATH,28,3317.598,4073.995,144.5602,0,1,0,100,0),
(@PATH,29,3341.35,4079.132,143.1019,0,1,0,100,0),
(@PATH,30,3352.074,4063.453,155.245,0,1,0,100,0),
(@PATH,31,3367.845,4044.642,166.1468,0,1,0,100,0);

-- Pathing for Shaleskin Flayer Entry: 20210
SET @NPC := 71879;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2648.76,`position_y`=3549.557,`position_z`=137.8162 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2666.568,3548.781,135.4412,0,1,0,100,0),
(@PATH,2,2648.76,3549.557,137.8162,0,1,0,100,0),
(@PATH,3,2633.136,3554.922,140.6537,0,1,0,100,0),
(@PATH,4,2642.836,3586.615,151.5832,0,1,0,100,0),
(@PATH,5,2647.962,3603.651,160.0796,0,1,0,100,0),
(@PATH,6,2633.64,3560.175,142.5662,0,1,0,100,0),
(@PATH,7,2629.507,3533.575,138.5287,0,1,0,100,0),
(@PATH,8,2648.173,3501.048,142.4444,0,1,0,100,0),
(@PATH,9,2656.382,3500.899,140.968567,0,1,0,100,0),
(@PATH,10,2665.253,3500.416,135.201950,0,1,0,100,0),
(@PATH,11,2673.378,3499.821,137.783707,0,1,0,100,0),
(@PATH,12,2687.637,3500.182,138.9444,0,1,0,100,0),
(@PATH,13,2721.845,3517.543,138.1126,0,1,0,100,0),
(@PATH,14,2733.924,3521.773,137.1899,0,1,0,100,0),
(@PATH,15,2733.155,3482.243,138.363,0,1,0,100,0),
(@PATH,16,2715.966,3450.111,142.1551,0,1,0,100,0),
(@PATH,17,2706.084,3457.206,142.5301,0,1,0,100,0),
(@PATH,18,2683.547,3442.403,143.1151,0,1,0,100,0),
(@PATH,19,2682.677,3466.437,142.3651,0,1,0,100,0),
(@PATH,20,2654.926,3434.49,143.651,0,1,0,100,0),
(@PATH,21,2624.556,3430.113,144.4111,0,1,0,100,0),
(@PATH,22,2609.411,3420.988,146.5361,0,1,0,100,0),
(@PATH,23,2600.413,3394.266,144.4808,0,1,0,100,0),
(@PATH,24,2609.411,3420.988,146.5361,0,1,0,100,0),
(@PATH,25,2624.556,3430.113,144.4111,0,1,0,100,0),
(@PATH,26,2654.926,3434.49,143.651,0,1,0,100,0),
(@PATH,27,2682.677,3466.437,142.3651,0,1,0,100,0),
(@PATH,28,2683.547,3442.403,143.1151,0,1,0,100,0),
(@PATH,29,2706.084,3457.206,142.5301,0,1,0,100,0),
(@PATH,30,2715.966,3450.111,142.1551,0,1,0,100,0),
(@PATH,31,2733.155,3482.243,138.363,0,1,0,100,0),
(@PATH,32,2733.924,3521.773,137.1899,0,1,0,100,0),
(@PATH,33,2721.845,3517.543,138.1126,0,1,0,100,0),
(@PATH,34,2687.637,3500.182,138.9444,0,1,0,100,0),
(@PATH,35,2673.378,3499.821,137.783707,0,1,0,100,0),
(@PATH,36,2665.253,3500.416,135.201950,0,1,0,100,0),
(@PATH,37,2656.382,3500.899,140.968567,0,1,0,100,0),
(@PATH,38,2648.173,3501.048,142.4444,0,1,0,100,0),
(@PATH,39,2629.507,3533.575,138.5287,0,1,0,100,0),
(@PATH,40,2633.64,3560.175,142.5662,0,1,0,100,0),
(@PATH,41,2647.962,3603.651,160.0796,0,1,0,100,0),
(@PATH,42,2642.836,3586.615,151.5832,0,1,0,100,0),
(@PATH,43,2633.168,3555.064,140.6537,0,1,0,100,0),
(@PATH,44,2648.76,3549.557,137.8162,0,1,0,100,0);

-- Pathing for Nether Dragon Entry: 20332
SET @NPC := 72241;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4015.625,`position_y`=1375.597,`position_z`=-126.2281 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3993.205,1362.504,-126.3612,0,0,0,100,0),
(@PATH,2,4015.625,1375.597,-126.2281,0,0,0,100,0),
(@PATH,3,4023.942,1396.098,-130.608719,0,0,0,100,0),
(@PATH,4,4026.553,1401.912,-126.9327,0,0,0,100,0),
(@PATH,5,4031.12,1440.92,-123.1165,0,0,0,100,0),
(@PATH,6,4042.615,1481.239,-120.7033,0,0,0,100,0),
(@PATH,7,4074.899,1492.06,-119.7024,0,0,0,100,0),
(@PATH,8,4120.914,1499.665,-110.4685,0,0,0,100,0),
(@PATH,9,4146.447,1478.963,-118.314,0,0,0,100,0),
(@PATH,10,4178.771,1485.569,-122.8746,0,0,0,100,0),
(@PATH,11,4187.719,1485.892,-127.801094,0,0,0,100,0),
(@PATH,12,4199.382,1485.576,-127.4996,0,0,0,100,0),
(@PATH,13,4187.719,1485.892,-127.801094,0,0,0,100,0),
(@PATH,14,4178.91,1485.611,-122.8746,0,0,0,100,0),
(@PATH,15,4146.447,1478.963,-118.314,0,0,0,100,0),
(@PATH,16,4120.914,1499.665,-110.4685,0,0,0,100,0),
(@PATH,17,4074.899,1492.06,-119.7024,0,0,0,100,0),
(@PATH,18,4042.615,1481.239,-120.7033,0,0,0,100,0),
(@PATH,19,4031.12,1440.92,-123.1165,0,0,0,100,0),
(@PATH,20,4026.553,1401.912,-126.9327,0,0,0,100,0),
(@PATH,21,4023.942,1396.098,-130.608719,0,0,0,100,0),
(@PATH,22,4015.625,1375.597,-126.2281,0,0,0,100,0);

-- Pathing for Nether Dragon Entry: 20332
SET @NPC := 72242;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3963.911,`position_y`=1575.182,`position_z`=-29.98592 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3951.161133,1572.015015,-36.459148,0,0,0,100,0),
(@PATH,2,3933.130615,1566.745728,-46.080715,0,0,0,100,0),
(@PATH,3,3918.786865,1560.240112,-56.230549,0,0,0,100,0),
(@PATH,4,3908.367,1548.98,-65.75422,0,0,0,100,0),
(@PATH,5,3922.72,1533.55,-78.62922,0,0,0,100,0),
(@PATH,6,3959.93,1523.56,-100.9522,0,0,0,100,0),
(@PATH,7,3980.386475,1517.487,-112.395996,0,0,0,100,0),
(@PATH,8,4000.854,1504.009,-116.9818,0,0,0,100,0),
(@PATH,9,4024.555,1466.375,-120.6165,0,0,0,100,0),
(@PATH,10,4023.507,1434.695,-124.2415,0,0,0,100,0),
(@PATH,11,4024.031,1400.242,-128.8077,0,0,0,100,0),
(@PATH,12,4023.507,1434.695,-124.2415,0,0,0,100,0),
(@PATH,13,4024.555,1466.375,-120.6165,0,0,0,100,0),
(@PATH,14,4000.854,1504.009,-116.9818,0,0,0,100,0),
(@PATH,15,3980.386475,1517.487,-112.39599,0,0,0,100,0),
(@PATH,16,3959.93,1523.56,-100.9522,0,0,0,100,0),
(@PATH,17,3922.72,1533.55,-78.62922,0,0,0,100,0),
(@PATH,18,3908.367,1548.98,-65.75422,0,0,0,100,0),
(@PATH,19,3918.786865,1560.240,-56.23054,0,0,0,100,0),
(@PATH,20,3933.130615,1566.745,-46.08071,0,0,0,100,0),
(@PATH,21,3951.161133,1572.015,-36.45914,0,0,0,100,0),
(@PATH,22,3963.911,1575.182,-29.98592,0,0,0,100,0),
(@PATH,23,3994.548,1579.995,-14.14009,0,0,0,100,0),
(@PATH,24,4029.739,1577.882,4.271389,0,0,0,100,0),
(@PATH,25,4060.888,1579.013,16.68998,0,0,0,100,0),
(@PATH,26,4029.739,1577.882,4.271389,0,0,0,100,0),
(@PATH,27,3994.585,1579.99,-14.14009,0,0,0,100,0),
(@PATH,28,3963.911,1575.182,-29.98592,0,0,0,100,0);

-- Pathing for Tyrantus Entry: 20931
SET @NPC := 86748;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=5100.748,`position_y`=2970.803,`position_z`=80.09528 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,5067.605,2955.676,86.53796,0,0,0,100,0),
(@PATH,2,5042.515,2933.231,89.39855,0,0,0,100,0),
(@PATH,3,5050.041,2900.661,84.39855,0,0,0,100,0),
(@PATH,4,5083.47,2888.87,71.63325,0,0,0,100,0),
(@PATH,5,5112.217,2900.021,76.87354,0,0,0,100,0),
(@PATH,6,5146.686,2905.609,69.43682,0,0,0,100,0),
(@PATH,7,5175.723,2898.99,61.43365,0,0,0,100,0),
(@PATH,8,5179.67,2919.195,64.82211,0,0,0,100,0),
(@PATH,9,5149.783,2940.122,75.51481,0,0,0,100,0),
(@PATH,10,5139.561035,2946.871094,71.671478,0,0,0,100,0),
(@PATH,11,5129.333,2954.335,78.96996,0,0,0,100,0),
(@PATH,12,5109.654785,2965.536865,83.221230,0,0,0,100,0),
(@PATH,13,5100.748,2970.803,80.09528,0,0,0,100,0);

-- Pathing for Eye of Culuthas Entry: 20394
SET @NPC := 72356;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4574.177,`position_y`=2582.585,`position_z`=196.8039 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4581.819,2612.694,196.9925,0,0,0,100,0),
(@PATH,2,4574.177,2582.585,196.8039,0,0,0,100,0),
(@PATH,3,4572.471,2543.21,194.4042,0,0,0,100,0),
(@PATH,4,4566.249,2521.063,184.7399,0,0,0,100,0),
(@PATH,5,4557.073,2491.929,170.5824,0,0,0,100,0),
(@PATH,6,4544.432,2456.955,155.9754,0,0,0,100,0),
(@PATH,7,4537.792,2425.746,146.6794,0,0,0,100,0),
(@PATH,8,4531.627,2393.09,141.5395,0,0,0,100,0),
(@PATH,9,4537.75,2425.51,146.6794,0,0,0,100,0),
(@PATH,10,4544.432,2456.955,155.9754,0,0,0,100,0),
(@PATH,11,4557.073,2491.929,170.5824,0,0,0,100,0),
(@PATH,12,4566.249,2521.063,184.7399,0,0,0,100,0),
(@PATH,13,4572.471,2543.21,194.4042,0,0,0,100,0),
(@PATH,14,4574.177,2582.585,196.8039,0,0,0,100,0);

-- Pathing for Eye of Culuthas Entry: 20394
SET @NPC := 72361;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4724.262,`position_y`=2379.566,`position_z`=198.4699 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4664.497,2366.81,188.7332,0,0,0,100,0),
(@PATH,2,4629.371,2338.715,176.7445,0,0,0,100,0),
(@PATH,3,4614.613,2367.734,187.5365,0,0,0,100,0),
(@PATH,4,4597.512,2392.366,192.0093,0,0,0,100,0),
(@PATH,5,4603.895,2423.138,195.0877,0,0,0,100,0),
(@PATH,6,4597.512,2392.366,192.0093,0,0,0,100,0),
(@PATH,7,4614.613,2367.734,187.5365,0,0,0,100,0),
(@PATH,8,4629.371,2338.715,176.7445,0,0,0,100,0),
(@PATH,9,4664.46,2366.802,188.7332,0,0,0,100,0),
(@PATH,10,4691.033,2378.478,194.8672,0,0,0,100,0),
(@PATH,11,4724.262,2379.566,198.4699,0,0,0,100,0);

-- Pathing for Eye of Culuthas Entry: 20394
SET @NPC := 72359;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4545.216,`position_y`=2366.726,`position_z`=142.7543 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4566.693,2321.677,146.0354,0,0,0,100,0),
(@PATH,2,4599.825,2297.896,153.2209,0,0,0,100,0),
(@PATH,3,4620.302,2296.565,158.4346,0,0,0,100,0),
(@PATH,4,4633.196,2308.325,163.6382,0,0,0,100,0),
(@PATH,5,4629.893,2337.082,175.9945,0,0,0,100,0),
(@PATH,6,4661.949,2365.652,188.1765,0,0,0,100,0),
(@PATH,7,4678.245,2369.857,192.1172,0,0,0,100,0),
(@PATH,8,4669.796,2396.104,191.7422,0,0,0,100,0),
(@PATH,9,4678.245,2369.857,192.1172,0,0,0,100,0),
(@PATH,10,4661.949,2365.652,188.1765,0,0,0,100,0),
(@PATH,11,4629.893,2337.082,175.9945,0,0,0,100,0),
(@PATH,12,4633.196,2308.325,163.6382,0,0,0,100,0),
(@PATH,13,4620.302,2296.565,158.4346,0,0,0,100,0),
(@PATH,14,4599.825,2297.896,153.2209,0,0,0,100,0),
(@PATH,15,4566.693,2321.677,146.0354,0,0,0,100,0),
(@PATH,16,4545.216,2366.726,142.7543,0,0,0,100,0),
(@PATH,17,4538.641,2392.494,142.3793,0,0,0,100,0),
(@PATH,18,4499.992,2411.276,133.2375,0,0,0,100,0),
(@PATH,19,4538.641,2392.494,142.3793,0,0,0,100,0),
(@PATH,20,4545.216,2366.726,142.7543,0,0,0,100,0);

-- Pathing for Eye of Culuthas Entry: 20394
SET @NPC := 72355;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4615.711,`position_y`=2602.974,`position_z`=204.4271 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4594.127,2637.872,195.5317,0,0,0,100,0),
(@PATH,2,4602.311,2657.53,192.6531,0,0,0,100,0),
(@PATH,3,4614.258,2686.23,186.5977,0,0,0,100,0),
(@PATH,4,4616.129,2705.724,180.9353,0,0,0,100,0),
(@PATH,5,4617.279,2739.662,170.0329,0,0,0,100,0),
(@PATH,6,4616.129,2705.724,180.9353,0,0,0,100,0),
(@PATH,7,4614.258,2686.23,186.5977,0,0,0,100,0),
(@PATH,8,4602.311,2657.53,192.6531,0,0,0,100,0),
(@PATH,9,4594.127,2637.872,195.5317,0,0,0,100,0),
(@PATH,10,4615.708,2602.998,204.4271,0,0,0,100,0),
(@PATH,11,4649.18,2602.585,208.8828,0,0,0,100,0),
(@PATH,12,4692.474,2599.164,209.7667,0,0,0,100,0),
(@PATH,13,4704.08,2612.966,210.41,0,0,0,100,0),
(@PATH,14,4692.474,2599.164,209.7667,0,0,0,100,0),
(@PATH,15,4649.18,2602.585,208.8828,0,0,0,100,0),
(@PATH,16,4615.711,2602.974,204.4271,0,0,0,100,0);

-- Pathing for Eye of Culuthas Entry: 20394
SET @NPC := 72354;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4522.624,`position_y`=2679.764,`position_z`=176.6805 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4531.139,2677.394,176.5555,0,0,0,100,0),
(@PATH,2,4547.688,2673.579,176.7999,0,0,0,100,0),
(@PATH,3,4563.968,2673.638,178.2999,0,0,0,100,0),
(@PATH,4,4581.804,2681.135,181.2904,0,0,0,100,0),
(@PATH,5,4603.715,2690.732,185.2227,0,0,0,100,0),
(@PATH,6,4581.804,2681.135,181.2904,0,0,0,100,0),
(@PATH,7,4563.968,2673.638,178.2999,0,0,0,100,0),
(@PATH,8,4547.688,2673.579,176.7999,0,0,0,100,0),
(@PATH,9,4531.139,2677.394,176.5555,0,0,0,100,0),
(@PATH,10,4522.624,2679.764,176.6805,0,0,0,100,0);

-- Pathing for Felblade Doomguard Entry: 19853
SET @NPC := 70989;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2767.33,`position_y`=3119.978,`position_z`=153.6937 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2760.351,3133.046,151.8823,0,0,0,100,0),
(@PATH,2,2751.242,3166.751,147.9722,0,0,0,100,0),
(@PATH,3,2737.506,3197.843,148.5972,0,0,0,100,0),
(@PATH,4,2729.603,3240.773,147.6203,0,0,0,100,0),
(@PATH,5,2737.506,3197.843,148.5972,0,0,0,100,0),
(@PATH,6,2751.242,3166.751,147.9722,0,0,0,100,0),
(@PATH,7,2760.351,3133.046,151.8823,0,0,0,100,0),
(@PATH,8,2767.33,3119.978,153.6937,0,0,0,100,0);

-- Pathing for Felblade Doomguard Entry: 19853
SET @NPC := 70993;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2791.828,`position_y`=3285.33,`position_z`=147.6382 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2798.783,3266.615,147.6825,0,0,0,100,0),
(@PATH,2,2799.445,3234.606,147.6825,0,0,0,100,0),
(@PATH,3,2786.388,3199.4,147.5168,0,0,0,100,0),
(@PATH,4,2773.544,3167.466,148.1418,0,0,0,100,0),
(@PATH,5,2786.388,3199.4,147.5168,0,0,0,100,0),
(@PATH,6,2799.445,3234.606,147.6825,0,0,0,100,0),
(@PATH,7,2798.783,3266.615,147.6825,0,0,0,100,0),
(@PATH,8,2791.828,3285.33,147.6382,0,0,0,100,0),
(@PATH,9,2797.738,3316.09,147.8914,0,0,0,100,0),
(@PATH,10,2803.093,3341.802,146.3541,0,0,0,100,0),
(@PATH,11,2797.738,3316.09,147.8914,0,0,0,100,0),
(@PATH,12,2791.828,3285.33,147.6382,0,0,0,100,0);

-- Pathing for Felblade Doomguard Entry: 19853
SET @NPC := 70990;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2741.708,`position_y`=3283.103,`position_z`=134.8271 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2776.672,3296.708,135.0132,0,0,0,100,0),
(@PATH,2,2741.708,3283.103,134.8271,0,0,0,100,0),
(@PATH,3,2723.705,3264.671,135.1203,0,0,0,100,0),
(@PATH,4,2701.38,3251.365,133.8703,0,0,0,100,0),
(@PATH,5,2671.789,3241.817,136.0645,0,0,0,100,0),
(@PATH,6,2701.38,3251.365,133.8703,0,0,0,100,0),
(@PATH,7,2723.705,3264.671,135.1203,0,0,0,100,0),
(@PATH,8,2741.708,3283.103,134.8271,0,0,0,100,0);

-- Pathing for Felblade Doomguard Entry: 19853
SET @NPC := 70991;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2676.243,`position_y`=3108.495,`position_z`=129.766 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2695.884,3152.218,142.8452,0,0,0,100,0),
(@PATH,2,2733.633,3176.695,147.7222,0,0,0,100,0),
(@PATH,3,2767.524,3183.066,149.0168,0,0,0,100,0),
(@PATH,4,2783.046,3200.549,149.0731,0,0,0,100,0),
(@PATH,5,2795.111,3234.783,147.6825,0,0,0,100,0),
(@PATH,6,2783.158,3200.822,149.0731,0,0,0,100,0),
(@PATH,7,2767.524,3183.066,149.0168,0,0,0,100,0),
(@PATH,8,2734.088,3176.924,147.7222,0,0,0,100,0),
(@PATH,9,2695.884,3152.218,142.8452,0,0,0,100,0),
(@PATH,10,2676.243,3108.495,129.766,0,0,0,100,0);

-- Pathing for Felblade Doomguard Entry: 19853
SET @NPC := 70992;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2742.474,`position_y`=3066.703,`position_z`=127.121 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2771.316,3055.715,125.3878,0,0,0,100,0),
(@PATH,2,2742.474,3066.703,127.121,0,0,0,100,0),
(@PATH,3,2714.792,3083.177,125.9688,0,0,0,100,0),
(@PATH,4,2681.547,3107.022,129.766,0,0,0,100,0),
(@PATH,5,2666.155,3128.539,136.3696,0,0,0,100,0),
(@PATH,6,2681.547,3107.022,129.766,0,0,0,100,0),
(@PATH,7,2714.792,3083.177,125.9688,0,0,0,100,0),
(@PATH,8,2742.474,3066.703,127.121,0,0,0,100,0);

-- Pathing for Felblade Doomguard Entry: 19853
SET @NPC := 70994;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2828.05,`position_y`=3064.032,`position_z`=130.3029 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2825.407,3085.071,131.2243,0,0,0,100,0),
(@PATH,2,2828.707,3113.542,132.875,0,0,0,100,0),
(@PATH,3,2834.658,3132.813,135.1611,0,0,0,100,0),
(@PATH,4,2820.653,3168.33,138.3576,0,0,0,100,0),
(@PATH,5,2834.658,3132.813,135.1611,0,0,0,100,0),
(@PATH,6,2828.707,3113.542,132.875,0,0,0,100,0),
(@PATH,7,2825.407,3085.071,131.2243,0,0,0,100,0),
(@PATH,8,2828.05,3064.032,130.3029,0,0,0,100,0),
(@PATH,9,2808.235,3051.481,129.1779,0,0,0,100,0),
(@PATH,10,2789.981,3059.688,127.2628,0,0,0,100,0),
(@PATH,11,2808.235,3051.481,129.1779,0,0,0,100,0),
(@PATH,12,2828.05,3064.032,130.3029,0,0,0,100,0);

-- Pathing for Felblade Doomguard Entry: 19853
SET @NPC := 69981;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=19853,`curhealth`=1,`spawndist`=0,`MovementType`=2,`position_x`=2844.669,`position_y`=3361.501,`position_z`=138.5648 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2834.531,3372.974,140.5904,0,0,0,100,0),
(@PATH,2,2790.977,3386.551,143.3565,0,0,0,100,0),
(@PATH,3,2763.782,3391.451,147.1132,0,0,0,100,0),
(@PATH,4,2790.977,3386.551,143.3565,0,0,0,100,0),
(@PATH,5,2834.531,3372.974,140.5904,0,0,0,100,0),
(@PATH,6,2844.669,3361.501,138.5648,0,0,0,100,0),
(@PATH,7,2846.513,3330.011,136.4617,0,0,0,100,0),
(@PATH,8,2847.488,3293.011,136.3041,0,0,0,100,0),
(@PATH,9,2844.52,3274.385,136.4291,0,0,0,100,0),
(@PATH,10,2847.504,3292.923,136.3041,0,0,0,100,0),
(@PATH,11,2846.513,3330.011,136.4617,0,0,0,100,0),
(@PATH,12,2844.669,3361.501,138.5648,0,0,0,100,0);

-- Pathing for Ar'kelos Entry: 19494
SET @NPC := 69855;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2240.612,`position_y`=2231.969,`position_z`=101.7543 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2235.431,2232.697,101.3736,0,0,0,100,0),
(@PATH,2,2234.174,2236.417,101.1358,0,0,0,100,0),
(@PATH,3,2237.611,2241.542,101.1581,0,0,0,100,0),
(@PATH,4,2241.375,2242.135,101.3886,0,0,0,100,0),
(@PATH,5,2243.609,2240.113,101.623,0,0,0,100,0),
(@PATH,6,2243.737,2236.394,101.7843,0,0,0,100,0),
(@PATH,7,2240.612,2231.969,101.7543,0,0,0,100,0);

-- Pathing for Rhonsus Entry: 20410
SET @NPC := 72380;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2288.348,`position_y`=2051.086,`position_z`=69.96984 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2293.534,2058.441,72.17236,0,0,0,100,0),
(@PATH,2,2298.701,2070.502,74.82874,0,0,0,100,0),
(@PATH,3,2305.209,2079.167,75.70385,0,0,0,100,0),
(@PATH,4,2305.772,2084.435,76.57885,0,0,0,100,0),
(@PATH,5,2302.867,2090.55,77.07885,0,0,0,100,0),
(@PATH,6,2300.354,2092.865,77.57885,0,0,0,100,0),
(@PATH,7,2296.73,2097.01,77.76094,0,0,0,100,0),
(@PATH,8,2295.738,2100.037,78.14296,0,0,0,100,0),
(@PATH,9,2293.43,2105.372,77.89296,0,0,0,100,0),
(@PATH,10,2287.401,2103.315,71.39296,0,0,0,100,0),
(@PATH,11,2283.007,2090.36,65.88594,0,0,0,100,0),
(@PATH,12,2278.573,2079.996,65.76094,0,0,0,100,0),
(@PATH,13,2276.908,2071.605,66.01094,0,0,0,100,0),
(@PATH,14,2276.643,2060.942,65.5769,0,0,0,100,0),
(@PATH,15,2278.966,2052.992,65.0769,0,0,0,100,0),
(@PATH,16,2284.627,2046.858,67.3269,0,0,0,100,0),
(@PATH,17,2288.348,2051.086,69.96984,0,0,0,100,0);

-- Pathing for Cohlien Frostweaver Entry: 19545
SET @NPC := 69958;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2218.052,`position_y`=2155.52,`position_z`=75.16641 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2227.514,2146.222,74.54141,0,0,0,100,0),
(@PATH,2,2238.457,2156.491,77.7053,0,0,0,100,0),
(@PATH,3,2246.653,2163.828,80.7053,0,0,0,100,0),
(@PATH,4,2255.551,2174.134,84.49949,0,0,0,100,0),
(@PATH,5,2264.292,2184.693,87.87449,0,0,0,100,0),
(@PATH,6,2270.136,2192.784,90.81113,0,0,0,100,0),
(@PATH,7,2264.292,2184.693,87.87449,0,0,0,100,0),
(@PATH,8,2255.551,2174.134,84.49949,0,0,0,100,0),
(@PATH,9,2246.8,2163.955,80.7053,0,0,0,100,0),
(@PATH,10,2238.698,2156.714,77.7053,0,0,0,100,0),
(@PATH,11,2227.514,2146.222,74.54141,0,0,0,100,0),
(@PATH,12,2218.052,2155.52,75.16641,0,0,0,100,0),
(@PATH,13,2206.56,2146.317,72.41641,0,0,0,100,0),
(@PATH,14,2198.984,2154.768,71.77188,0,0,0,100,0),
(@PATH,15,2195.368,2159.292,71.64688,0,0,0,100,0),
(@PATH,16,2199.257,2163.273,73.27188,0,0,0,100,0),
(@PATH,17,2195.368,2159.292,71.64688,0,0,0,100,0),
(@PATH,18,2198.984,2154.768,71.77188,0,0,0,100,0),
(@PATH,19,2206.56,2146.317,72.41641,0,0,0,100,0),
(@PATH,20,2218.052,2155.52,75.16641,0,0,0,100,0);

-- Pathing for Abjurist Belmara Entry: 19546
SET @NPC := 69959;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2162.673,`position_y`=2239.201,`position_z`=74.96153 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2161.253,2246.413,75.08653,0,0,0,100,0),
(@PATH,2,2167.947,2252.325,75.3343,0,0,0,100,0),
(@PATH,3,2176.671,2259.385,76.0843,0,0,0,100,0),
(@PATH,4,2167.947,2252.325,75.3343,0,0,0,100,0),
(@PATH,5,2161.253,2246.413,75.08653,0,0,0,100,0),
(@PATH,6,2162.673,2239.201,74.96153,0,0,0,100,0),
(@PATH,7,2170.977,2229.723,75.35621,0,0,0,100,0),
(@PATH,8,2173.582,2222.547,75.48121,0,0,0,100,0),
(@PATH,9,2172.486,2216.009,74.85621,0,0,0,100,0),
(@PATH,10,2171.116,2206.345,73.35621,0,0,0,100,0),
(@PATH,11,2171.409,2196.346,72.16417,0,0,0,100,0),
(@PATH,12,2173.672,2191.277,71.66417,0,0,0,100,0),
(@PATH,13,2177.406,2192.71,72.91417,0,0,0,100,0),
(@PATH,14,2173.672,2191.277,71.66417,0,0,0,100,0),
(@PATH,15,2171.411,2196.131,72.16417,0,0,0,100,0),
(@PATH,16,2171.116,2206.345,73.35621,0,0,0,100,0),
(@PATH,17,2172.486,2216.009,74.85621,0,0,0,100,0),
(@PATH,18,2173.582,2222.547,75.48121,0,0,0,100,0),
(@PATH,19,2170.977,2229.723,75.35621,0,0,0,100,0),
(@PATH,20,2162.673,2239.201,74.96153,0,0,0,100,0);

-- Pathing for Conjurer Luminrath Entry: 19544
SET @NPC := 69957;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2308.526,`position_y`=2152.486,`position_z`=89.90528 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2304.674,2153.754,90.03028,0,0,0,100,0),
(@PATH,2,2308.526,2152.486,89.90528,0,0,0,100,0),
(@PATH,3,2315.141,2149.993,87.90528,0,0,0,100,0),
(@PATH,4,2317.099,2141.939,86.40528,0,0,0,100,0),
(@PATH,5,2312.283,2133.227,86.0655,0,0,0,100,0),
(@PATH,6,2304.422,2127.045,83.9405,0,0,0,100,0),
(@PATH,7,2300.402,2122.592,82.5655,0,0,0,100,0),
(@PATH,8,2293.575,2129.682,83.01796,0,0,0,100,0),
(@PATH,9,2280.72,2142.293,84.05183,0,0,0,100,0),
(@PATH,10,2277.714,2145.194,83.19107,0,0,0,100,0),
(@PATH,11,2271.714,2150.194,79.69107,0,0,0,100,0),
(@PATH,12,2266.208,2154.595,81.3303,0,0,0,100,0),
(@PATH,13,2256.744,2164.514,82.0803,0,0,0,100,0),
(@PATH,14,2266.208,2154.595,81.3303,0,0,0,100,0),
(@PATH,15,2271.714,2150.194,79.69107,0,0,0,100,0),
(@PATH,16,2277.714,2145.194,83.19107,0,0,0,100,0),
(@PATH,17,2280.72,2142.293,84.05183,0,0,0,100,0),
(@PATH,18,2293.575,2129.682,83.01796,0,0,0,100,0),
(@PATH,19,2300.182,2122.348,82.5655,0,0,0,100,0),
(@PATH,20,2304.185,2126.818,83.9405,0,0,0,100,0),
(@PATH,21,2312.283,2133.227,86.0655,0,0,0,100,0),
(@PATH,22,2317.099,2141.939,86.40528,0,0,0,100,0),
(@PATH,23,2315.141,2149.993,87.90528,0,0,0,100,0),
(@PATH,24,2308.526,2152.486,89.90528,0,0,0,100,0);

-- Pathing for Cragskaar Entry: 20202
SET @NPC := 71806;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4672.652,`position_y`=2833.642,`position_z`=119.7209 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4691.32,2831.765,115.2279,0,0,0,100,0),
(@PATH,2,4711.748,2826.127,110.9915,0,0,0,100,0),
(@PATH,3,4722.808,2820.741,108.2415,0,0,0,100,0),
(@PATH,4,4730.558,2807.48,104.1165,0,0,0,100,0),
(@PATH,5,4735.904,2790.546,97.97594,0,0,0,100,0),
(@PATH,6,4735.547,2772.659,94.97594,0,0,0,100,0),
(@PATH,7,4746.172,2759.377,88.90433,0,0,0,100,0),
(@PATH,8,4758.182,2753.981,84.27933,0,0,0,100,0),
(@PATH,9,4775.818,2729.572,81.34752,0,0,0,100,0),
(@PATH,10,4797.146,2714.692,83.22252,0,0,0,100,0),
(@PATH,11,4816.373,2706.599,87.94135,0,0,0,100,0),
(@PATH,12,4797.169,2714.673,83.22252,0,0,0,100,0),
(@PATH,13,4775.841,2729.552,81.34752,0,0,0,100,0),
(@PATH,14,4758.182,2753.981,84.27933,0,0,0,100,0),
(@PATH,15,4746.265,2759.257,88.90433,0,0,0,100,0),
(@PATH,16,4735.641,2772.538,94.97594,0,0,0,100,0),
(@PATH,17,4735.904,2790.546,97.97594,0,0,0,100,0),
(@PATH,18,4730.558,2807.48,104.1165,0,0,0,100,0),
(@PATH,19,4722.808,2820.741,108.2415,0,0,0,100,0),
(@PATH,20,4712.015,2825.991,110.9915,0,0,0,100,0),
(@PATH,21,4691.32,2831.765,115.2279,0,0,0,100,0),
(@PATH,22,4672.652,2833.642,119.7209,1000,0,0,100,0);

-- Pathing for Sundered Rumbler Entry: 18881
SET @NPC := 72537;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3285.168,`position_y`=3666.935,`position_z`=122.3814 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3285.266,3699.622,122.6314,0,0,0,100,0),
(@PATH,2,3285.168,3666.935,122.3814,0,0,0,100,0),
(@PATH,3,3271.159,3654.384,124.4546,0,0,0,100,0),
(@PATH,4,3285.168,3666.935,122.3814,0,0,0,100,0),
(@PATH,5,3285.266,3699.622,122.6314,0,0,0,100,0),
(@PATH,6,3283.2567,3707.5315,124.52155,0,0,0,100,0),
(@PATH,7,3282.0067,3712.5315,122.27155,0,0,0,100,0),
(@PATH,8,3281.2567,3715.0315,121.52155,0,0,0,100,0),
(@PATH,9,3280.7567,3718.0315,121.27155,0,0,0,100,0),
(@PATH,10,3280.2567,3720.0315,120.52155,0,0,0,100,0),
(@PATH,11,3276.763,3732.637,120.2214,0,0,0,100,0),
(@PATH,12,3238.595,3748.578,121.8806,0,0,0,100,0),
(@PATH,13,3237.837,3780.781,124.1419,0,0,0,100,0),
(@PATH,14,3238.595,3748.578,121.8806,0,0,0,100,0),
(@PATH,15,3276.763,3732.637,120.2214,0,0,0,100,0),
(@PATH,16,3280.2567,3720.0315,120.52155,0,0,0,100,0),
(@PATH,17,3280.7567,3718.0315,121.27155,0,0,0,100,0),
(@PATH,18,3281.2567,3715.0315,121.52155,0,0,0,100,0),
(@PATH,19,3282.0067,3712.5315,122.27155,0,0,0,100,0),
(@PATH,20,3283.2567,3707.5315,124.52155,0,0,0,100,0);

-- Pathing for Sundered Rumbler Entry: 18881
SET @NPC := 67694;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3300.63,`position_y`=3524.814,`position_z`=119.3577 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3301.806,3478.514,108.0464,0,0,0,100,0),
(@PATH,2,3300.63,3524.814,119.3577,0,0,0,100,0),
(@PATH,3,3314.206,3535.807,122.2244,0,0,0,100,0),
(@PATH,4,3314.667,3565.323,121.8494,0,0,0,100,0),
(@PATH,5,3295.182,3584.966,121.833,0,0,0,100,0),
(@PATH,6,3296.069,3616.939,124.855,0,0,0,100,0),
(@PATH,7,3317.645,3642.473,123.6244,0,0,0,100,0),
(@PATH,8,3281.766,3673.759,122.3814,0,0,0,100,0),
(@PATH,9,3317.645,3642.473,123.6244,0,0,0,100,0),
(@PATH,10,3296.069,3616.939,124.855,0,0,0,100,0),
(@PATH,11,3295.182,3584.966,121.833,0,0,0,100,0),
(@PATH,12,3314.667,3565.323,121.8494,0,0,0,100,0),
(@PATH,13,3314.206,3535.807,122.2244,0,0,0,100,0),
(@PATH,14,3300.63,3524.814,119.3577,0,0,0,100,0);

-- Pathing for Sundered Rumbler Entry: 18881
SET @NPC := 67695;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3283.052,`position_y`=3531.829,`position_z`=117.1162 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3257.882,3501.52,109.848,0,0,0,100,0),
(@PATH,2,3251.0377,3500.4235,107.93321,0,0,0,100,0),
(@PATH,3,3247.0377,3499.9235,106.93321,0,0,0,100,0),
(@PATH,4,3209.488,3493.788,105.6449,0,0,0,100,0),
(@PATH,5,3191.958,3480.165,99.16507,0,0,0,100,0),
(@PATH,6,3192.7714,3457.4731,97.96445,0,0,0,100,0),
(@PATH,7,3193.0214,3455.4731,97.21445,0,0,0,100,0),
(@PATH,8,3193.0214,3452.4731,96.46445,0,0,0,100,0),
(@PATH,9,3193.0214,3450.4731,95.71445,0,0,0,100,0),
(@PATH,10,3193.2714,3448.4731,94.71445,0,0,0,100,0),
(@PATH,11,3193.2714,3446.4731,94.21445,0,0,0,100,0),
(@PATH,12,3193.585,3438.282,93.76384,0,0,0,100,0),
(@PATH,13,3175.364,3421.07,94.23314,0,0,0,100,0),
(@PATH,14,3175.134,3400.337,95.73314,0,0,0,100,0),
(@PATH,15,3165.382,3385.651,100.0248,0,0,0,100,0),
(@PATH,16,3175.134,3400.337,95.73314,0,0,0,100,0),
(@PATH,17,3175.364,3421.07,94.23314,0,0,0,100,0),
(@PATH,18,3193.585,3438.282,93.76384,0,0,0,100,0),
(@PATH,19,3193.2714,3446.4731,94.21445,0,0,0,100,0),
(@PATH,20,3193.2714,3448.4731,94.71445,0,0,0,100,0),
(@PATH,21,3193.0214,3450.4731,95.71445,0,0,0,100,0),
(@PATH,22,3193.0214,3452.4731,96.46445,0,0,0,100,0),
(@PATH,23,3193.0214,3455.4731,97.21445,0,0,0,100,0),
(@PATH,24,3192.7714,3457.4731,97.96445,0,0,0,100,0),
(@PATH,25,3191.958,3480.165,99.16507,0,0,0,100,0),
(@PATH,26,3209.488,3493.788,105.6449,0,0,0,100,0),
(@PATH,27,3247.0377,3499.9235,106.93321,0,0,0,100,0),
(@PATH,28,3251.0377,3500.4235,107.93321,0,0,0,100,0),
(@PATH,29,3257.882,3501.52,109.848,0,0,0,100,0),
(@PATH,30,3283.052,3531.829,117.1162,0,0,0,100,0),
(@PATH,31,3281.379,3566.475,118.7789,0,0,0,100,0),
(@PATH,32,3291.429,3581.389,121.958,0,0,0,100,0),
(@PATH,33,3281.379,3566.475,118.7789,0,0,0,100,0),
(@PATH,34,3283.052,3531.829,117.1162,0,0,0,100,0);

-- Pathing for Sundered Rumbler Entry: 18881
SET @NPC := 67696;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3260.27,`position_y`=3469.911,`position_z`=99.7075 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3260.709,3483.817,100.7075,0,0,0,100,0),
(@PATH,2,3260.27,3469.911,99.7075,0,0,0,100,0),
(@PATH,3,3254.799,3462.614,99.6072,0,0,0,100,0),
(@PATH,4,3253.8108,3459.8367,98.7941,0,0,0,100,0),
(@PATH,5,3253.0608,3457.8367,97.7941,0,0,0,100,0),
(@PATH,6,3252.5608,3456.0867,96.5441,0,0,0,100,0),
(@PATH,7,3250.5608,3450.3367,94.0441,0,0,0,100,0),
(@PATH,8,3242.662,3428.51,93.43222,0,0,0,100,0),
(@PATH,9,3226.99,3399.985,94.66531,0,0,0,100,0),
(@PATH,10,3226.587,3388.906,94.66531,0,0,0,100,0),
(@PATH,11,3233.238,3377.579,93.66531,0,0,0,100,0),
(@PATH,12,3228.08,3366.189,93.63511,0,0,0,100,0),
(@PATH,13,3236.872,3342.85,93.31496,0,0,0,100,0),
(@PATH,14,3228.08,3366.189,93.63511,0,0,0,100,0),
(@PATH,15,3233.238,3377.579,93.66531,0,0,0,100,0),
(@PATH,16,3226.587,3388.906,94.66531,0,0,0,100,0),
(@PATH,17,3226.99,3399.985,94.66531,0,0,0,100,0),
(@PATH,18,3242.662,3428.51,93.43222,0,0,0,100,0),
(@PATH,19,3250.5608,3450.3367,94.0441,0,0,0,100,0),
(@PATH,20,3252.5608,3456.0867,96.5441,0,0,0,100,0),
(@PATH,21,3253.0608,3457.8367,97.7941,0,0,0,100,0),
(@PATH,22,3253.8108,3459.8367,98.7941,0,0,0,100,0),
(@PATH,23,3254.799,3462.614,99.6072,0,0,0,100,0),
(@PATH,24,3260.27,3469.911,99.7075,0,0,0,100,0);

-- Pathing for Sundered Rumbler Entry: 18881
SET @NPC := 67697;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3193.751,`position_y`=3437.182,`position_z`=93.63884 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3234.859,3432.428,93.43222,0,0,0,100,0),
(@PATH,2,3281.241,3419.181,93.43222,0,0,0,100,0),
(@PATH,3,3305.17,3406.754,93.4439,0,0,0,100,0),
(@PATH,4,3324.777,3383.345,95.8713,0,0,0,100,0),
(@PATH,5,3305.17,3406.754,93.4439,0,0,0,100,0),
(@PATH,6,3281.241,3419.181,93.43222,0,0,0,100,0),
(@PATH,7,3234.859,3432.428,93.43222,0,0,0,100,0),
(@PATH,8,3193.751,3437.182,93.63884,0,0,0,100,0),
(@PATH,9,3175.196,3422.16,94.23314,0,0,0,100,0),
(@PATH,10,3147.319,3422.596,100.6664,0,0,0,100,0),
(@PATH,11,3175.196,3422.16,94.23314,0,0,0,100,0),
(@PATH,12,3193.751,3437.182,93.63884,0,0,0,100,0);

-- Pathing for Culuthas Scan Target Dummy Entry: 21157
SET @NPC := 74222;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4553.955,`position_y`=2687.114,`position_z`=176.5499 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4549.639,2687.8,176.2999,0,0,0,100,0),
(@PATH,2,4553.955,2687.114,176.5499,0,0,0,100,0),
(@PATH,3,4555.577,2683.206,176.9249,0,0,0,100,0),
(@PATH,4,4553.955,2687.114,176.5499,0,0,0,100,0);

-- Pathing for Culuthas Scan Target Dummy Entry: 21157
SET @NPC := 74223;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4562.047,`position_y`=2669.278,`position_z`=178.5499 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4562.68,2675.701,178.1749,0,0,0,100,0),
(@PATH,2,4562.047,2669.278,178.5499,0,0,0,100,0),
(@PATH,3,4556.256,2668.143,177.7999,0,0,0,100,0),
(@PATH,4,4562.047,2669.278,178.5499,0,0,0,100,0);

-- Pathing for Culuthas Scan Target Dummy Entry: 21157
SET @NPC := 74224;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4696.381,`position_y`=2601.714,`position_z`=209.8917 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4702.104,2603.248,210.16,0,0,0,100,0),
(@PATH,2,4696.381,2601.714,209.8917,0,0,0,100,0),
(@PATH,3,4690.812,2596.801,209.8917,0,0,0,100,0),
(@PATH,4,4689.338,2591.425,209.8917,0,0,0,100,0),
(@PATH,5,4690.812,2596.801,209.8917,0,0,0,100,0),
(@PATH,6,4696.381,2601.714,209.8917,0,0,0,100,0);

-- Pathing for Culuthas Scan Target Dummy Entry: 21157
SET @NPC := 74225;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4694.737,`position_y`=2611.983,`position_z`=209.8917 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4694.698,2628.866,210.7667,0,0,0,100,0),
(@PATH,2,4694.737,2611.983,209.8917,0,0,0,100,0),
(@PATH,3,4688.729,2604.648,209.7667,0,0,0,100,0),
(@PATH,4,4679.191,2599.677,209.5167,0,0,0,100,0),
(@PATH,5,4669.759,2599.583,209.2667,0,0,0,100,0),
(@PATH,6,4682.154,2601.221,209.6417,0,0,0,100,0),
(@PATH,7,4694.737,2611.983,209.8917,0,0,0,100,0);

-- Pathing for Culuthas Scan Target Dummy Entry: 21157
SET @NPC := 74226;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4608.13,`position_y`=2429.07,`position_z`=195.0877 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4607.922,2424.169,194.9627,0,0,0,100,0),
(@PATH,2,4603.165,2421.986,194.9627,0,0,0,100,0),
(@PATH,3,4597.103,2424.986,195.2854,0,0,0,100,0),
(@PATH,4,4603.165,2421.986,194.9627,0,0,0,100,0),
(@PATH,5,4607.922,2424.169,194.9627,0,0,0,100,0),
(@PATH,6,4608.13,2429.07,195.0877,0,0,0,100,0);

-- Pathing for Culuthas Scan Target Dummy Entry: 21157
SET @NPC := 74227;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4666.593,`position_y`=2405.013,`position_z`=191.8335 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4663.231,2412.144,191.8335,0,0,0,100,0),
(@PATH,2,4666.593,2405.013,191.8335,0,0,0,100,0),
(@PATH,3,4665.042,2392.39,191.7332,0,0,0,100,0),
(@PATH,4,4657.117,2382.845,191.7332,0,0,0,100,0),
(@PATH,5,4647.556,2381.307,191.7332,0,0,0,100,0),
(@PATH,6,4657.117,2382.845,191.7332,0,0,0,100,0),
(@PATH,7,4665.042,2392.39,191.7332,0,0,0,100,0),
(@PATH,8,4666.593,2405.013,191.8335,0,0,0,100,0);

-- Pathing for Culuthas Scan Target Dummy Entry: 21157
SET @NPC := 74228;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4726.265,`position_y`=2381.999,`position_z`=198.4699 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4723.63,2385.29,198.4699,0,0,0,100,0),
(@PATH,2,4718.666,2383.238,198.3449,0,0,0,100,0),
(@PATH,3,4721.186,2363.666,198.9685,0,0,0,100,0),
(@PATH,4,4726.265,2381.999,198.4699,0,0,0,100,0);

-- Pathing for Culuthas Scan Target Dummy Entry: 21157
SET @NPC := 74229;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4705.219,`position_y`=2459.428,`position_z`=240.1093 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4707.024,2478.386,239.8881,0,0,0,100,0),
(@PATH,2,4703.323,2473.484,239.8881,0,0,0,100,0),
(@PATH,3,4702.328,2466.821,240.0131,0,0,0,100,0),
(@PATH,4,4705.219,2459.428,240.1093,0,0,0,100,0);

-- Pathing for Culuthas Scan Target Dummy Entry: 21157
SET @NPC := 74230;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4697.593,`position_y`=2505.859,`position_z`=236.6816 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4701.562,2501.556,237.7412,0,0,0,100,0),
(@PATH,2,4697.593,2505.859,236.6816,0,0,0,100,0),
(@PATH,3,4693.739,2504.999,237.5566,0,0,0,100,0),
(@PATH,4,4697.593,2505.859,236.6816,0,0,0,100,0);

-- Pathing for Culuthas Scan Target Dummy Entry: 21157
SET @NPC := 69986;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=21157,`curhealth`=1,`spawndist`=0,`MovementType`=2,`position_x`=4702.083,`position_y`=2488.536,`position_z`=239.2631 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4701.83,2482.624,239.6381,0,0,0,100,0),
(@PATH,2,4704.716,2479.467,239.8881,0,0,0,100,0),
(@PATH,3,4701.83,2482.624,239.6381,0,0,0,100,0),
(@PATH,4,4702.083,2488.536,239.2631,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71708;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4602.324,`position_y`=2706.992,`position_z`=180.9353 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4599.582,2718.879,179.018,0,0,0,100,0),
(@PATH,2,4602.102,2707.148,180.9353,0,0,0,100,0),
(@PATH,3,4625.324,2706.341,181.6853,0,0,0,100,0),
(@PATH,4,4629.149,2677.264,192.0977,0,0,0,100,0),
(@PATH,5,4625.324,2706.341,181.6853,0,0,0,100,0),
(@PATH,6,4602.324,2706.992,180.9353,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71709;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4555.143,`position_y`=2700.897,`position_z`=176.1601 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4565.459,2684.939,178.6749,0,0,0,100,0),
(@PATH,2,4555.143,2700.897,176.1601,0,0,0,100,0),
(@PATH,3,4550.593,2684.636,176.5499,0,0,0,100,0),
(@PATH,4,4555.143,2700.897,176.1601,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71710;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4643.591,`position_y`=2623.063,`position_z`=210.0078 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4615.729,2620.247,204.5521,0,0,0,100,0),
(@PATH,2,4643.591,2623.063,210.0078,0,0,0,100,0),
(@PATH,3,4653.376,2642.757,209.5201,0,0,0,100,0),
(@PATH,4,4643.591,2623.063,210.0078,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71711;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4572.147,`position_y`=2598.857,`position_z`=197.5539 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4562.755,2625.661,198.3123,0,0,0,100,0),
(@PATH,2,4572.147,2598.857,197.5539,0,0,0,100,0),
(@PATH,3,4567.414,2551.977,197.5292,0,0,0,100,0),
(@PATH,4,4572.7192,2548.6343,195.68613,0,0,0,100,0),
(@PATH,5,4586.7192,2539.6343,198.68613,0,0,0,100,0),
(@PATH,6,4599.199,2531.054,201.4356,0,0,0,100,0),
(@PATH,7,4586.7192,2539.6343,198.68613,0,0,0,100,0),
(@PATH,8,4572.7192,2548.6343,195.68613,0,0,0,100,0),
(@PATH,9,4567.414,2551.977,197.5292,0,0,0,100,0),
(@PATH,10,4572.147,2598.857,197.5539,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71712;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4574.8994,`position_y`=2607.1254,`position_z`=198.1482 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4570.387,2610.892,197.8675,0,0,0,100,0),
(@PATH,2,4571.046,2632.996,196.4925,0,0,0,100,0),
(@PATH,3,4596.327,2671.216,191.5404,0,0,0,100,0),
(@PATH,4,4571.046,2632.996,196.4925,0,0,0,100,0),
(@PATH,5,4570.387,2610.892,197.8675,0,0,0,100,0),
(@PATH,6,4574.8994,2607.1254,198.1482,0,0,0,100,0),
(@PATH,7,4577.8994,2604.3754,197.3982,0,0,0,100,0),
(@PATH,8,4582.8994,2600.1254,196.8982,0,0,0,100,0),
(@PATH,9,4585.8994,2597.3754,197.3982,0,0,0,100,0),
(@PATH,10,4588.8994,2594.8754,199.1482,0,0,0,100,0),
(@PATH,11,4591.912,2591.859,201.9289,0,0,0,100,0),
(@PATH,12,4588.8994,2594.8754,199.1482,0,0,0,100,0),
(@PATH,13,4585.8994,2597.3754,197.3982,0,0,0,100,0),
(@PATH,14,4582.8994,2600.1254,196.8982,0,0,0,100,0),
(@PATH,15,4577.8994,2604.3754,197.3982,0,0,0,100,0),
(@PATH,16,4574.8994,2607.1254,198.1482,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71713;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4645.316,`position_y`=2546.069,`position_z`=220.3803 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4627.432,2570.993,212.9502,0,0,0,100,0),
(@PATH,2,4601.223,2573.04,214.8252,0,0,0,100,0),
(@PATH,3,4627.432,2570.993,212.9502,0,0,0,100,0),
(@PATH,4,4645.316,2546.069,220.3803,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71714;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4692.563,`position_y`=2634.855,`position_z`=210.5535 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4696.623,2608.201,210.0167,0,0,0,100,0),
(@PATH,2,4692.563,2634.855,210.5535,0,0,0,100,0),
(@PATH,3,4724.994,2625.934,211.035,0,0,0,100,0),
(@PATH,4,4738.364,2616.47,212.2359,0,0,0,100,0),
(@PATH,5,4724.994,2625.934,211.035,0,0,0,100,0),
(@PATH,6,4692.563,2634.855,210.5535,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71715;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4701.552,`position_y`=2547.523,`position_z`=231.4014 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4680.343,2554.787,226.42,0,0,0,100,0),
(@PATH,2,4658.521,2569.822,220.5987,0,0,0,100,0),
(@PATH,3,4680.343,2554.787,226.42,0,0,0,100,0),
(@PATH,4,4701.552,2547.523,231.4014,0,0,0,100,0),
(@PATH,5,4720.161,2512.047,239.4912,0,0,0,100,0),
(@PATH,6,4701.552,2547.523,231.4014,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71716;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4644.884,`position_y`=2591.018,`position_z`=211.7237 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4669.56,2589.762,210.1417,0,0,0,100,0),
(@PATH,2,4679.705,2580.529,210.0167,0,0,0,100,0),
(@PATH,3,4693.441,2575.518,210.1417,0,0,0,100,0),
(@PATH,4,4679.705,2580.529,210.0167,0,0,0,100,0),
(@PATH,5,4669.56,2589.762,210.1417,0,0,0,100,0),
(@PATH,6,4644.884,2591.018,211.7237,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71717;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4722.953,`position_y`=2444.164,`position_z`=241.6093 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4700.694,2438.369,238.8593,0,0,0,100,0),
(@PATH,2,4722.953,2444.164,241.6093,0,0,0,100,0),
(@PATH,3,4705.252,2473.897,240.0131,0,0,0,100,0),
(@PATH,4,4722.275,2475.85,240.2631,0,0,0,100,0),
(@PATH,5,4705.252,2473.897,240.0131,0,0,0,100,0),
(@PATH,6,4722.953,2444.164,241.6093,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71718;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4672.375,`position_y`=2488.454,`position_z`=240.1172 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4660.249,2464.098,240.0322,0,0,0,100,0),
(@PATH,2,4672.375,2488.454,240.1172,0,0,0,100,0),
(@PATH,3,4677.573,2516.831,239.9316,0,0,0,100,0),
(@PATH,4,4672.375,2488.454,240.1172,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71719;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4674.963,`position_y`=2399.898,`position_z`=191.7422 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4636.733,2427.21,194.5835,0,0,0,100,0),
(@PATH,2,4674.963,2399.898,191.7422,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71720;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4591.706,`position_y`=2413.99,`position_z`=193.9104 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4582.292,2440.066,195.7642,0,0,0,100,0),
(@PATH,2,4591.706,2413.99,193.9104,0,0,0,100,0),
(@PATH,3,4591.92,2373.975,190.7593,0,0,0,100,0),
(@PATH,4,4591.706,2413.99,193.9104,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71721;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4553.732,`position_y`=2496.342,`position_z`=172.3324 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4570.055,2495.549,174.081329,0,0,0,100,0),
(@PATH,2,4582.606,2495.403,169.5553,0,0,0,100,0),
(@PATH,3,4570.055,2495.549,174.081329,0,0,0,100,0),
(@PATH,4,4553.732,2496.342,172.3324,0,0,0,100,0),
(@PATH,5,4533.37,2466.238,158.4754,0,0,0,100,0),
(@PATH,6,4553.732,2496.342,172.3324,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71722;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4629.57,`position_y`=2370.969,`position_z`=190.2865 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4653.941,2354.145,183.9265,0,0,0,100,0),
(@PATH,2,4656.874,2333.608,185.9265,0,0,0,100,0),
(@PATH,3,4653.941,2354.145,183.9265,0,0,0,100,0),
(@PATH,4,4629.57,2370.969,190.2865,0,0,0,100,0),
(@PATH,5,4614.512,2397.25,193.2865,0,0,0,100,0),
(@PATH,6,4617.032,2422.815,194.7127,0,0,0,100,0),
(@PATH,7,4614.512,2397.25,193.2865,0,0,0,100,0),
(@PATH,8,4629.57,2370.969,190.2865,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71723;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4597.019,`position_y`=2310.656,`position_z`=153.1604 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4575.151,2320.547,147.5354,0,0,0,100,0),
(@PATH,2,4565.379,2347.765,145.9557,0,0,0,100,0),
(@PATH,3,4556.11,2361.77,144.0807,0,0,0,100,0),
(@PATH,4,4527.204,2360.386,142.3529,0,0,0,100,0),
(@PATH,5,4556.11,2361.77,144.0807,0,0,0,100,0),
(@PATH,6,4565.379,2347.765,145.9557,0,0,0,100,0),
(@PATH,7,4575.151,2320.547,147.5354,0,0,0,100,0),
(@PATH,8,4597.019,2310.656,153.1604,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71724;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4616.262,`position_y`=2334.016,`position_z`=176.6195 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4642.863,2325.923,172.8524,0,0,0,100,0),
(@PATH,2,4636.983,2291.834,162.9081,0,0,0,100,0),
(@PATH,3,4628.926,2289.38,160.8096,0,0,0,100,0),
(@PATH,4,4636.983,2291.834,162.9081,0,0,0,100,0),
(@PATH,5,4642.863,2325.923,172.8524,0,0,0,100,0),
(@PATH,6,4616.262,2334.016,176.6195,0,0,0,100,0),
(@PATH,7,4591.569,2351.197,176.313,0,0,0,100,0),
(@PATH,8,4616.262,2334.016,176.6195,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71725;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4663.332,`position_y`=2350.589,`position_z`=188.1765 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4657.653,2329.646,186.3524,0,0,0,100,0),
(@PATH,2,4663.332,2350.589,188.1765,0,0,0,100,0),
(@PATH,3,4678.804,2363.938,193.0415,0,0,0,100,0),
(@PATH,4,4699.673,2358.466,198.6665,0,0,0,100,0),
(@PATH,5,4678.804,2363.938,193.0415,0,0,0,100,0),
(@PATH,6,4663.332,2350.589,188.1765,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71726;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4706.639,`position_y`=2387.899,`position_z`=198.2199 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4717.08,2384.72,198.3449,0,0,0,100,0),
(@PATH,2,4745.857,2375.955,198.4512,0,0,0,100,0),
(@PATH,3,4717.08,2384.72,198.3449,0,0,0,100,0),
(@PATH,4,4706.639,2387.899,198.2199,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71727;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4574.894,`position_y`=2289.601,`position_z`=146.0959 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4551.33,2291.415,141.1749,0,0,0,100,0),
(@PATH,2,4536.958,2310.266,139.5906,0,0,0,100,0),
(@PATH,3,4525.249,2342.697,136.3529,0,0,0,100,0),
(@PATH,4,4536.958,2310.266,139.5906,0,0,0,100,0),
(@PATH,5,4551.33,2291.415,141.1749,0,0,0,100,0),
(@PATH,6,4574.894,2289.601,146.0959,0,0,0,100,0);

-- Pathing for Hound of Culuthas Entry: 20141
SET @NPC := 71728;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4549.188,`position_y`=2419.691,`position_z`=148.8044 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4515.678,2427.541,143.7992,0,0,0,100,0),
(@PATH,2,4508.379,2413.015,135.952255,0,0,0,100,0),
(@PATH,3,4496.701,2392.73,133.75,0,0,0,100,0),
(@PATH,4,4508.379,2413.015,135.952255,0,0,0,100,0),
(@PATH,5,4515.678,2427.541,143.7992,0,0,0,100,0),
(@PATH,6,4549.188,2419.691,148.8044,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67837;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4680.648,`position_y`=2933.528,`position_z`=128.5915 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4699.682,2925.731,124.7106,0,0,0,100,0),
(@PATH,2,4733.456,2919.721,124.4173,0,0,0,100,0),
(@PATH,3,4748.244,2898.929,124.5695,0,0,0,100,0),
(@PATH,4,4767.581,2892.407,127.7676,0,0,0,100,0),
(@PATH,5,4798.508,2902.931,135.7957,0,0,0,100,0),
(@PATH,6,4767.581,2892.407,127.7676,0,0,0,100,0),
(@PATH,7,4748.244,2898.929,124.5695,0,0,0,100,0),
(@PATH,8,4733.456,2919.721,124.4173,0,0,0,100,0),
(@PATH,9,4699.682,2925.731,124.7106,0,0,0,100,0),
(@PATH,10,4680.648,2933.528,128.5915,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67838;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4694.271,`position_y`=3000.521,`position_z`=131.8281 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4659.013,2990.837,139.3366,1000,0,0,100,0),
(@PATH,2,4720.058,2989.236,126.6483,4000,0,0,100,0),
(@PATH,3,4694.271,3000.521,131.8281,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67839;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4793.853,`position_y`=2559.355,`position_z`=107.7497 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4793.462,2551.932,107.38942,0,0,0,100,0),
(@PATH,2,4801.294,2542.204,103.63306,0,0,0,100,0),
(@PATH,3,4804.184,2533.202,108.15168,0,0,0,100,0),
(@PATH,4,4809.523,2531.038,110.9908,0,0,0,100,0),
(@PATH,5,4804.184,2533.202,108.15168,0,0,0,100,0),
(@PATH,6,4801.294,2542.204,103.63306,0,0,0,100,0),
(@PATH,7,4793.462,2551.932,107.38942,0,0,0,100,0),
(@PATH,8,4793.853,2559.355,107.7497,0,0,0,100,0),
(@PATH,9,4811.914,2578.137,102.8657,0,0,0,100,0),
(@PATH,10,4816.318,2599.686,95.24067,0,0,0,100,0),
(@PATH,11,4806.355,2610.437,94.20722,0,0,0,100,0),
(@PATH,12,4805.519,2632.837,97.45722,0,0,0,100,0),
(@PATH,13,4796.551,2649.526,96.84445,0,0,0,100,0),
(@PATH,14,4788.854,2664.759,101.7405,0,0,0,100,0),
(@PATH,15,4771.989,2675.860,106.12727,0,0,0,100,0),
(@PATH,16,4758.874,2684.205,100.5239,0,0,0,100,0),
(@PATH,17,4771.989,2675.860,106.12727,0,0,0,100,0),
(@PATH,18,4788.732,2665.01,101.7405,0,0,0,100,0),
(@PATH,19,4796.551,2649.526,96.84445,0,0,0,100,0),
(@PATH,20,4805.396,2633.088,97.45722,0,0,0,100,0),
(@PATH,21,4806.355,2610.437,94.20722,0,0,0,100,0),
(@PATH,22,4816.354,2599.911,95.24067,0,0,0,100,0),
(@PATH,23,4811.949,2578.362,102.8657,0,0,0,100,0),
(@PATH,24,4793.853,2559.355,107.7497,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67840;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4824.477,`position_y`=2413.032,`position_z`=117.5647 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4826.337,2423.967,113.5648,0,0,0,100,0),
(@PATH,2,4824.542,2388.935,117.0019,0,0,0,100,0),
(@PATH,3,4813.468,2410.938,119.4397,1000,0,0,100,0),
(@PATH,4,4825.049,2394.731,117.0018,0,0,0,100,0),
(@PATH,5,4826.267,2388.755,116.1268,1000,0,0,100,0),
(@PATH,6,4824.679,2414.616,116.9397,4000,0,0,100,0),
(@PATH,7,4823.229,2376.179,116.8768,0,0,0,100,0),
(@PATH,8,4824.477,2413.032,117.5647,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67841;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4805.055,`position_y`=2965.261,`position_z`=136.8346 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4830.165,2940.167,142.0846,0,0,0,100,0),
(@PATH,2,4843.901,2916.912,145.5221,0,0,0,100,0),
(@PATH,3,4869.021,2894.213,150.9389,0,0,0,100,0),
(@PATH,4,4844.042,2916.676,145.5221,0,0,0,100,0),
(@PATH,5,4830.165,2940.167,142.0846,0,0,0,100,0),
(@PATH,6,4805.055,2965.261,136.8346,0,0,0,100,0),
(@PATH,7,4776.206,2983.031,131.7047,0,0,0,100,0),
(@PATH,8,4752.369,2980.172,128.7036,0,0,0,100,0),
(@PATH,9,4734.413,2954.917,125.8786,0,0,0,100,0),
(@PATH,10,4722.08,2929.788,122.8356,0,0,0,100,0),
(@PATH,11,4714.174,2899.318,118.1997,0,0,0,100,0),
(@PATH,12,4721.984,2929.598,122.8356,0,0,0,100,0),
(@PATH,13,4734.413,2954.917,125.8786,0,0,0,100,0),
(@PATH,14,4752.307,2980.16,128.7036,0,0,0,100,0),
(@PATH,15,4776.143,2983.02,131.7047,0,0,0,100,0),
(@PATH,16,4805.055,2965.261,136.8346,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67842;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4834.341,`position_y`=2888.756,`position_z`=143.8247 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4844.857,2856.093,143.7463,0,0,0,100,0),
(@PATH,2,4834.341,2888.756,143.8247,0,0,0,100,0),
(@PATH,3,4807.149,2909.79,137.9392,0,0,0,100,0),
(@PATH,4,4803.561,2932.8,138.1892,0,0,0,100,0),
(@PATH,5,4784.36,2964.11,133.7875,0,0,0,100,0),
(@PATH,6,4803.561,2932.8,138.1892,0,0,0,100,0),
(@PATH,7,4807.149,2909.79,137.9392,0,0,0,100,0),
(@PATH,8,4834.341,2888.756,143.8247,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67843;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4861.565,`position_y`=2899.577,`position_z`=149.4497 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4831.78,2932.901,142.9392,0,0,0,100,0),
(@PATH,2,4824.348,2966.6,139.2096,0,0,0,100,0),
(@PATH,3,4833.872,2984.859,138.9322,0,0,0,100,0),
(@PATH,4,4865.883,2993.591,143.0572,0,0,0,100,0),
(@PATH,5,4833.872,2984.859,138.9322,0,0,0,100,0),
(@PATH,6,4824.348,2966.6,139.2096,0,0,0,100,0),
(@PATH,7,4831.78,2932.901,142.9392,0,0,0,100,0),
(@PATH,8,4861.565,2899.577,149.4497,24000,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67844;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4889.342,`position_y`=2820.243,`position_z`=95.60491 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4866.937,2782.555,97.07332,0,0,0,100,0),
(@PATH,2,4834.273,2749.54,91.19633,0,0,0,100,0),
(@PATH,3,4813.485,2733.715,85.98716,0,0,0,100,0),
(@PATH,4,4809.271,2699.641,88.18708,0,0,0,100,0),
(@PATH,5,4810.158,2667.983,98.81208,0,0,0,100,0),
(@PATH,6,4809.271,2699.641,88.18708,0,0,0,100,0),
(@PATH,7,4813.485,2733.715,85.98716,0,0,0,100,0),
(@PATH,8,4834.273,2749.54,91.19633,0,0,0,100,0),
(@PATH,9,4866.937,2782.555,97.07332,0,0,0,100,0),
(@PATH,10,4889.342,2820.243,95.60491,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67847;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4671.166,`position_y`=2833.747,`position_z`=119.9709 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4701.324,2825.501,112.6165,0,0,0,100,0),
(@PATH,2,4733.146,2840.096,112.46,0,0,0,100,0),
(@PATH,3,4733.27,2865.343,117.21,0,0,0,100,0),
(@PATH,4,4717.506,2898.328,118.4497,0,0,0,100,0),
(@PATH,5,4733.584,2912.84,123.2923,0,0,0,100,0),
(@PATH,6,4766.141,2890.556,127.3195,0,0,0,100,0),
(@PATH,7,4733.584,2912.84,123.2923,0,0,0,100,0),
(@PATH,8,4717.506,2898.328,118.4497,0,0,0,100,0),
(@PATH,9,4733.27,2865.343,117.21,0,0,0,100,0),
(@PATH,10,4733.184,2840.137,112.46,0,0,0,100,0),
(@PATH,11,4701.324,2825.501,112.6165,0,0,0,100,0),
(@PATH,12,4671.166,2833.747,119.9709,0,0,0,100,0),
(@PATH,13,4657.984,2865.764,115.7247,0,0,0,100,0),
(@PATH,14,4678.522,2878.853,116.3573,0,0,0,100,0),
(@PATH,15,4657.984,2865.764,115.7247,0,0,0,100,0),
(@PATH,16,4671.166,2833.747,119.9709,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67848;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4735.839,`position_y`=3006.335,`position_z`=126.3608 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4766.877,3012.027,129.7613,0,0,0,100,0),
(@PATH,2,4735.839,3006.335,126.3608,0,0,0,100,0),
(@PATH,3,4699.474,2992.311,130.3387,0,0,0,100,0),
(@PATH,4,4667.536,2968.931,136.8387,0,0,0,100,0),
(@PATH,5,4655.592,2935.294,137.8124,0,0,0,100,0),
(@PATH,6,4667.536,2968.931,136.8387,0,0,0,100,0),
(@PATH,7,4699.474,2992.311,130.3387,0,0,0,100,0),
(@PATH,8,4735.839,3006.335,126.3608,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 69997;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=18886,`curhealth`=1,`spawndist`=0,`MovementType`=2,`position_x`=4836.941,`position_y`=2327.35,`position_z`=106.2828 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4855.318,2346.112,96.91952,4000,0,0,100,0),
(@PATH,2,4822.361,2352.147,109.4193,0,0,0,100,0),
(@PATH,3,4822.504,2344.83,108.5443,11000,0,0,100,0),
(@PATH,4,4828.094,2345.115,106.7943,0,0,0,100,0),
(@PATH,5,4836.068,2345.272,102.9197,0,0,0,100,0),
(@PATH,6,4844.936,2340.653,98.41952,0,0,0,100,0),
(@PATH,7,4852.699,2346.962,99.54452,0,0,0,100,0),
(@PATH,8,4846.147,2345.409,102.0445,1000,0,0,100,0),
(@PATH,9,4823.075,2346.144,108.0443,0,0,0,100,0),
(@PATH,10,4838.939,2344.494,101.9195,0,0,0,100,0),
(@PATH,11,4836.941,2327.35,106.2828,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67845;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4807.688,`position_y`=2724.204,`position_z`=84.94135 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4777.618,2730.457,81.22252,0,0,0,100,0),
(@PATH,2,4764.885,2742.8694,81.61359,0,0,0,100,0),
(@PATH,3,4756.885,2750.1194,85.11359,0,0,0,100,0),
(@PATH,4,4748.135,2758.1194,88.11359,0,0,0,100,0),
(@PATH,5,4746.541,2759.596,88.90433,0,0,0,100,0),
(@PATH,6,4739.336,2798.704,98.97594,0,0,0,100,0),
(@PATH,7,4746.541,2759.596,88.90433,0,0,0,100,0),
(@PATH,8,4748.135,2758.1194,88.11359,0,0,0,100,0),
(@PATH,9,4756.885,2750.1194,85.11359,0,0,0,100,0),
(@PATH,10,4764.885,2742.8694,81.61359,0,0,0,100,0),
(@PATH,11,4777.618,2730.457,81.22252,0,0,0,100,0),
(@PATH,12,4807.688,2724.204,84.94135,0,0,0,100,0),
(@PATH,13,4833.35,2746.087,91.07133,0,0,0,100,0),
(@PATH,14,4854.537,2763.94,96.69633,0,0,0,100,0),
(@PATH,15,4867.339,2749.076,90.63702,0,0,0,100,0),
(@PATH,16,4891.293,2750.6,84.13702,0,0,0,100,0),
(@PATH,17,4867.339,2749.076,90.63702,0,0,0,100,0),
(@PATH,18,4854.537,2763.94,96.69633,0,0,0,100,0),
(@PATH,19,4833.35,2746.087,91.07133,0,0,0,100,0),
(@PATH,20,4807.688,2724.204,84.94135,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67846;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4705.967,`position_y`=2725.816,`position_z`=112.5994 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4726.067,2715.057,100.2244,0,0,0,100,0),
(@PATH,2,4730.1675,2707.9592,96.68663,0,0,0,100,0),
(@PATH,3,4733.9175,2700.2092,102.68663,0,0,0,100,0),
(@PATH,4,4737.268,2693.862,108.1489,0,0,0,100,0),
(@PATH,5,4733.9175,2700.2092,102.68663,0,0,0,100,0),
(@PATH,6,4730.1675,2707.9592,96.68663,0,0,0,100,0),
(@PATH,7,4726.067,2715.057,100.2244,0,0,0,100,0),
(@PATH,8,4705.967,2725.816,112.5994,0,0,0,100,0),
(@PATH,9,4708.094,2745.621,111.2062,0,0,0,100,0),
(@PATH,10,4693.125,2751.136,115.1726,0,0,0,100,0),
(@PATH,11,4671.101,2754.369,125.6726,0,0,0,100,0),
(@PATH,12,4666.887,2768.541,130.7094,0,0,0,100,0),
(@PATH,13,4686.194,2770.743,124.8344,0,0,0,100,0),
(@PATH,14,4700.069,2777.035,116.6096,0,0,0,100,0),
(@PATH,15,4692.681,2791.015,114.4594,0,0,0,100,0),
(@PATH,16,4700.069,2777.035,116.6096,0,0,0,100,0),
(@PATH,17,4686.194,2770.743,124.8344,0,0,0,100,0),
(@PATH,18,4666.887,2768.541,130.7094,0,0,0,100,0),
(@PATH,19,4671.101,2754.369,125.6726,0,0,0,100,0),
(@PATH,20,4693.125,2751.136,115.1726,0,0,0,100,0),
(@PATH,21,4708.094,2745.621,111.2062,0,0,0,100,0),
(@PATH,22,4705.967,2725.816,112.5994,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 67849;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4894.055,`position_y`=2678.779,`position_z`=79.14181 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4898.583984,2685.638184,81.916397,0,0,0,100,0),
(@PATH,2,4898.583984,2685.638184,81.916397,0,0,0,100,0),
(@PATH,3,4903.135254,2692.378174,80.039780,0,0,0,100,0),
(@PATH,4,4906.950684,2697.958252,75.823601,0,0,0,100,0),
(@PATH,5,4910.214,2703.051,76.77097,0,0,0,100,0),
(@PATH,6,4906.950684,2697.958252,75.823601,0,0,0,100,0),
(@PATH,7,4903.135254,2692.378174,80.039780,0,0,0,100,0),
(@PATH,8,4898.583984,2685.638184,81.916397,0,0,0,100,0),
(@PATH,9,4898.583984,2685.638184,81.916397,0,0,0,100,0),
(@PATH,10,4894.055,2678.779,79.14181,0,0,0,100,0),
(@PATH,11,4890.638672,2668.343994,84.098625,0,0,0,100,0),
(@PATH,12,4880.379883,2649.595215,85.190849,0,0,0,100,0),
(@PATH,13,4877.725098,2643.881348,83.099609,0,0,0,100,0),
(@PATH,14,4875.45,2639.722,85.40894,0,0,0,100,0),
(@PATH,15,4872.527,2620.948,87.5256,0,0,0,100,0),
(@PATH,16,4854.194,2601.887,92.93586,0,0,0,100,0),
(@PATH,17,4847.225,2560.535,88.06782,1000,0,0,100,0),
(@PATH,18,4854.194,2601.887,92.93586,0,0,0,100,0),
(@PATH,19,4872.527,2620.948,87.5256,0,0,0,100,0),
(@PATH,20,4875.45,2639.722,85.40894,0,0,0,100,0),
(@PATH,21,4877.725098,2643.881348,83.099609,0,0,0,100,0),
(@PATH,22,4880.379883,2649.595215,85.190849,0,0,0,100,0),
(@PATH,23,4890.638672,2668.343994,84.098625,0,0,0,100,0),
(@PATH,24,4894.055,2678.779,79.14181,0,0,0,100,0);

-- Pathing for Farahlon Breaker Entry: 18886
SET @NPC := 69977;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=18886,`curhealth`=1,`spawndist`=0,`MovementType`=2,`position_x`=4819.647,`position_y`=2537.184,`position_z`=110.34905 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4824.148,2532.490,109.05141,0,0,0,100,0),
(@PATH,2,4816.462,2531.366,111.35047,0,0,0,100,0),
(@PATH,3,4812.264,2535.927,110.47469,3000,0,0,100,0),
(@PATH,4,4808.402,2540.578,104.31991,0,0,0,100,0),
(@PATH,5,4803.943,2544.884,102.38943,1000,0,0,100,0),
(@PATH,6,4794.366,2551.873,107.13906,0,0,0,100,0),
(@PATH,7,4797.480,2543.475,105.70802,0,0,0,100,0),
(@PATH,8,4796.184,2536.756,108.24725,5000,0,0,100,0),
(@PATH,9,4803.583,2530.559,109.12021,0,0,0,100,0),
(@PATH,10,4811.625,2532.295,111.37372,0,0,0,100,0),
(@PATH,11,4816.192,2535.158,110.93280,2000,0,0,100,0),
(@PATH,12,4823.782,2532.975,109.24986,0,0,0,100,0),
(@PATH,13,4823.609,2538.890,108.99189,1000,0,0,100,0),
(@PATH,14,4815.678,2538.618,109.75655,0,0,0,100,0),
(@PATH,15,4813.142,2545.137,104.41969,0,0,0,100,0),
(@PATH,16,4803.757,2544.752,102.43920,4000,0,0,100,0),
(@PATH,17,4792.094,2543.446,109.15849,0,0,0,100,0),
(@PATH,18,4791.390,2551.806,108.40910,0,0,0,100,0),
(@PATH,19,4803.108,2543.305,102.70206,2000,0,0,100,0),
(@PATH,20,4811.917,2533.514,111.25555,0,0,0,100,0),
(@PATH,21,4819.647,2537.184,110.34905,0,0,0,100,0);
UPDATE `item_template` SET `spellid_2`=53056 WHERE `entry`=39644;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (63317,64021);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`)
VALUES
(63317,'spell_razorscale_flame_breath'),
(64021,'spell_razorscale_flame_breath');

DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10066,10067);

DELETE FROM `conditions` WHERE `SourceEntry`=63317;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`comment`)
VALUES
(13,0,63317,0,18,1,33388,0,0,'','Flame Breath - Dark Rune Guardian');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10066,10067) AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10066,11,0,0,'achievement_iron_dwarf_medium_rare'),
(10067,11,0,0,'achievement_iron_dwarf_medium_rare');
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` = 6800;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(6800, 6, 3057, 0, ''),
(6800, 11, 0, 0, 'achievement_sickly_gazelle');
DELETE FROM `disables` WHERE `sourceType` = 4 AND `entry` = 6800;
DELETE FROM `areatrigger_scripts` WHERE `entry`=5718;
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(5718,'at_frozen_throne_teleport');
UPDATE `gameobject_template` SET `flags`=48 WHERE `entry`=202223; -- Scourge Transporter to the Frozen Throne
UPDATE `gameobject_template` SET `flags`=32 WHERE `entry` IN (202242,202243,202244,202245,202235,202246); -- Scourge Transporters

DELETE FROM `gameobject` WHERE `id` IN (202189,202188);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(151,202189,631,15,1,503.62,-2124.66,836.607,3.14159,0,0,0,1,6000,255,1),
(153,202188,631,15,1,503.62,-2124.66,836.607,3.14159,0,0,0,1,6000,255,0);

-- Highlord Tirion Fordring gossip
UPDATE `creature_template` SET `gossip_menu_id`=10993 WHERE `entry`=38995;

DELETE FROM `gossip_menu` WHERE `entry`=10993;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(10993,15290);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=10993;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(10993,0,0,'We are prepared, Highlord. Let us battle for the fate of Azeroth! For the light of dawn!',1,1,0,0,0,0,'');
DELETE FROM `creature_addon` WHERE `guid` IN (135968,135969,135970,135971,135972,135973,135974,135975,136372,136373,136374,136375,136376,136377,136378,136379,137582);
-- GAME_TELE: Some missing areas
SET @id := 1419;
DELETE FROM `game_tele` WHERE `id` IN(@id,@id+1,@id+2);
INSERT INTO `game_tele` (`id`,`position_x`,`position_y`,`position_z`,`orientation`,`map`,`name`) VALUES
(@id,5690.97,2141.074,798.0541,4.4344,571, 'TheFrozenHalls'),
(@id+1,8427.875,2706.33,655.095,5.743,571, 'TheShadowVault'),
(@id+2,3641.45,282.75,-120.145,3.325,571, 'ChamberOfAspects');
UPDATE `script_texts` SET `content_default`='%s hugs her father.' WHERE `entry`=-1000116;
UPDATE `script_texts` SET `content_default`='Be gone, trifling elf. I am in control now!' WHERE `entry`=-1548010;
UPDATE `script_texts` SET `content_default`='It would appear that I''ve made a slight miscalculation. I allowed my mind to be corrupted by the fiend in the prison, overriding my primary directive. All systems seem to be functional now. Clear.' WHERE `entry`=-1603257;
UPDATE `script_texts` SET `content_default`='Rin''ji will tell you secret now... $n, should go to the Overlook Cliffs. Rin''ji hid something on island there' WHERE `entry`=-1000408;
UPDATE `spell_proc_event` SET `procEx` = 0 WHERE `entry` = 60172;
UPDATE `spell_proc_event` SET `procEx` = `procEx`|0x42000 WHERE `entry` IN (58872,58874);
UPDATE `trinity_string` SET `content_default`='id: %d %s effmask: %d charges: %d stack: %d slot %d duration: %d maxduration: %d %s %s caster: %s guid: %d' WHERE `entry`=468;
-- Remove EAI events for Eye of the Storm Emissary and Eye of the Storm Envoy (incorrectly added earlier)
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (22013,22015);

-- Scripts already converted to SAI, removing EAI equivalents
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (18103,26349,26370,27234,27235,27236,27237);

-- Update: Use EventAI for Oluf the Violent, Iron Rune-shaper, Slag, Apprentice Osterkilgr, Scarlet Highlord Daion
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry` IN (23931,26270,28585,30409,32417);

-- More areatrigger_teleport fixes
UPDATE `areatrigger_teleport` SET `target_orientation`=4.718671 WHERE `id`=3928; -- Zul Gurub entrance
UPDATE `areatrigger_teleport` SET `target_orientation`=1.617921 WHERE `id`=3930; -- Zul Gurub exit
-- Timbermaw (spell_rate was 4, quest_rate was 1)
UPDATE `reputation_reward_rate` SET `quest_rate`=4,`spell_rate`=1 WHERE `faction`=576;
-- Mag'har (spell_rate was 2, quest_rate was 1)
UPDATE `reputation_reward_rate` SET `quest_rate`=2,`spell_rate`=1 WHERE `faction`=941;
UPDATE `gameobject_template` SET `ScriptName`='go_wind_stone' WHERE `entry` IN (180456,180461,180466,180518,180529,180534,180539,180544,180549,180554,180559,180564);
DELETE FROM `gossip_menu` WHERE `entry` IN (6543,6540,6542) AND `text_id` IN (7771,7772,7773,7776);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(6540,7771),
(6542,7772),
(6543,7776);

DELETE FROM `creature_text` WHERE `entry` IN (15209,15211,15212,15307,15206,15207,15208,15220,15203,15204,15205,15305);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(15209,0,0, 'The Abyssal Council does not tolerate deceit! Feel our wrath, little human!',12,0,100,0,0,0, 'Crimson Templar - SAY_TEMPLAR_AGGRO'),
(15211,0,0, 'The Abyssal Council does not tolerate deceit! Feel our wrath, little human!',12,0,100,0,0,0, 'Azure Templar - SAY_TEMPLAR_AGGRO'),
(15212,0,0, 'The Abyssal Council does not tolerate deceit! Feel our wrath, little human!',12,0,100,0,0,0, 'Hoary Templar - SAY_TEMPLAR_AGGRO'),
(15307,0,0, 'The Abyssal Council does not tolerate deceit! Feel our wrath, little human!',12,0,100,0,0,0, 'Earthen Templar - SAY_TEMPLAR_AGGRO'),
(15206,0,0, 'What? Such a small, frail thing beckons me? This will not do unpunished!',12,0,100,0,0,0, 'The Duke of Cynders - SAY_DUKE_AGGRO'),
(15207,0,0, 'What? Such a small, frail thing beckons me? This will not do unpunished!',12,0,100,0,0,0, 'The Duke of Fathoms - SAY_DUKE_AGGRO'),
(15208,0,0, 'What? Such a small, frail thing beckons me? This will not do unpunished!',12,0,100,0,0,0, 'The Duke of Shards - SAY_DUKE_AGGRO'),
(15220,0,0, 'What? Such a small, frail thing beckons me? This will not do unpunished!',12,0,100,0,0,0, 'The Duke of Zephyrs - SAY_DUKE_AGGRO'),
(15203,0,0, 'Your treachery only speeds your doom. This world will fall to darkness!',14,0,100,0,0,0, 'Prince Skaldrenox - YELL_ROYAL_AGGRO'),
(15204,0,0, 'Your treachery only speeds your doom. This world will fall to darkness!',14,0,100,0,0,0, 'High Marshal Whirlaxis - YELL_ROYAL_AGGRO'),
(15205,0,0, 'Your treachery only speeds your doom. This world will fall to darkness!',14,0,100,0,0,0, 'Baron Kazum - YELL_ROYAL_AGGRO'),
(15305,0,0, 'Your treachery only speeds your doom. This world will fall to darkness!',14,0,100,0,0,0, 'Lord Skwol - YELL_ROYAL_AGGRO');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (24734,24744,24756,24758,24760,24763,24765,24768,24770,24772,24784,24786,24788,24789,24790);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`, `Comment`) VALUES
(13,0,24734,0,18,0,180529,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24734,0,18,0,180456,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24734,0,18,0,180518,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24734,0,18,0,180544,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24734,0,18,0,180549,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24734,0,18,0,180564,0,0, '', 'Summon Templar Random - Lesser Wind Stone'),
(13,0,24744,0,18,0,180529,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24744,0,18,0,180456,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24744,0,18,0,180518,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24744,0,18,0,180544,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24744,0,18,0,180549,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24744,0,18,0,180564,0,0, '', 'Summon Templar Fire - Lesser Wind Stone'),
(13,0,24756,0,18,0,180529,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24756,0,18,0,180456,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24756,0,18,0,180518,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24756,0,18,0,180544,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24756,0,18,0,180549,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24756,0,18,0,180564,0,0, '', 'Summon Templar Air - Lesser Wind Stone'),
(13,0,24758,0,18,0,180529,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24758,0,18,0,180456,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24758,0,18,0,180518,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24758,0,18,0,180544,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24758,0,18,0,180549,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24758,0,18,0,180564,0,0, '', 'Summon Templar Earth - Lesser Wind Stone'),
(13,0,24760,0,18,0,180529,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
(13,0,24760,0,18,0,180456,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
(13,0,24760,0,18,0,180518,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
(13,0,24760,0,18,0,180544,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
(13,0,24760,0,18,0,180549,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
(13,0,24760,0,18,0,180564,0,0, '', 'Summon Templar Water - Lesser Wind Stone'),
--
(13,0,24763,0,18,0,180534,0,0, '', 'Summon Duke Random - Wind Stone'),
(13,0,24763,0,18,0,180461,0,0, '', 'Summon Duke Random - Wind Stone'),
(13,0,24763,0,18,0,180554,0,0, '', 'Summon Duke Random - Wind Stone'),
(13,0,24765,0,18,0,180534,0,0, '', 'Summon Duke Fire - Wind Stone'),
(13,0,24765,0,18,0,180461,0,0, '', 'Summon Duke Fire - Wind Stone'),
(13,0,24765,0,18,0,180554,0,0, '', 'Summon Duke Fire - Wind Stone'),
(13,0,24768,0,18,0,180534,0,0, '', 'Summon Duke Air - Wind Stone'),
(13,0,24768,0,18,0,180461,0,0, '', 'Summon Duke Air - Wind Stone'),
(13,0,24768,0,18,0,180554,0,0, '', 'Summon Duke Air - Wind Stone'),
(13,0,24770,0,18,0,180534,0,0, '', 'Summon Duke Earth - Wind Stone'),
(13,0,24770,0,18,0,180461,0,0, '', 'Summon Duke Earth - Wind Stone'),
(13,0,24770,0,18,0,180554,0,0, '', 'Summon Duke Earth - Wind Stone'),
(13,0,24772,0,18,0,180534,0,0, '', 'Summon Duke Water - Wind Stone'),
(13,0,24772,0,18,0,180461,0,0, '', 'Summon Duke Water - Wind Stone'),
(13,0,24772,0,18,0,180554,0,0, '', 'Summon Duke Water - Wind Stone'),
--
(13,0,24784,0,18,0,180466,0,0, '', 'Summon Royal Random - Greater Wind Stone'),
(13,0,24784,0,18,0,180539,0,0, '', 'Summon Royal Random - Greater Wind Stone'),
(13,0,24784,0,18,0,180559,0,0, '', 'Summon Royal Random - Greater Wind Stone'),
(13,0,24786,0,18,0,180466,0,0, '', 'Summon Royal Fire - Greater Wind Stone'),
(13,0,24786,0,18,0,180539,0,0, '', 'Summon Royal Fire - Greater Wind Stone'),
(13,0,24786,0,18,0,180559,0,0, '', 'Summon Royal Fire - Greater Wind Stone'),
(13,0,24788,0,18,0,180466,0,0, '', 'Summon Royal Air - Greater Wind Stone'),
(13,0,24788,0,18,0,180539,0,0, '', 'Summon Royal Air - Greater Wind Stone'),
(13,0,24788,0,18,0,180559,0,0, '', 'Summon Royal Air - Greater Wind Stone'),
(13,0,24789,0,18,0,180466,0,0, '', 'Summon Royal Earth - Greater Wind Stone'),
(13,0,24789,0,18,0,180539,0,0, '', 'Summon Royal Earth - Greater Wind Stone'),
(13,0,24789,0,18,0,180559,0,0, '', 'Summon Royal Earth - Greater Wind Stone'),
(13,0,24790,0,18,0,180466,0,0, '', 'Summon Royal Water - Greater Wind Stone'),
(13,0,24790,0,18,0,180539,0,0, '', 'Summon Royal Water - Greater Wind Stone'),
(13,0,24790,0,18,0,180559,0,0, '', 'Summon Royal Water - Greater Wind Stone');
-- More areatriggers rotations and some Z coordinates fixed
UPDATE `areatrigger_teleport` SET `target_orientation`=4.582802 WHERE `id`=259; -- Blackfathom deeps
UPDATE `areatrigger_teleport` SET `target_orientation`=3.147877 WHERE `id`=3186; -- Dire Maul, Capital Gardens, south
UPDATE `areatrigger_teleport` SET `target_orientation`=1.784425 WHERE `id`=3126; -- Maraudon, north
UPDATE `areatrigger_teleport` SET `target_position_z`=81.491974, `target_orientation`='1.259779' WHERE `id`=444; -- Razorfen Downs
UPDATE `areatrigger_teleport` SET `target_orientation`=1.840974 WHERE `id`=1472; -- Blackrock Dephts
UPDATE `areatrigger_teleport` SET `target_orientation`=2.095443 WHERE `id`=1470; -- Blackrock Spire
UPDATE `areatrigger_teleport` SET `target_orientation`=3.663096 WHERE `id`=2568; -- Scholomance
UPDATE `areatrigger_teleport` SET `target_position_z`=108.449623, `target_orientation`=1.935219 WHERE `id`=2221; -- Stratholme
UPDATE `areatrigger_teleport` SET `target_orientation`=4.55217 WHERE `id`=119; -- Deadmines
UPDATE `areatrigger_teleport` SET `target_orientation`=3.20443 WHERE `id`=288; -- Uldaman, north
UPDATE `areatrigger_teleport` SET `target_position_z`=266.22583, `target_orientation`=3.135308 WHERE `id`=882; -- Uldaman, south
UPDATE `areatrigger_teleport` SET `target_orientation`=2.959382 WHERE `id`=448; -- Altar of Atal'Hakkar
SET @ENTRY := 18716;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,62,0,100,0,7759,0,0,0,11,47068,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Who Are They - Shadowy Initiate - On Gossip option - Cast spell 47068 on player'),
(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,58,1,9613,2400,3800,30,30,1,0,0,0,0,0,0,0, 'Shadowy Initiate - On spawn install caster template');

SET @ENTRY := 18719;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,62,0,100,0,7760,0,0,0,11,47070,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Who Are They - Shadowy Advisor - On Gossip option - Cast spell 47070 on player'),
(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,58,1,9613,2400,3800,30,30,1,0,0,0,0,0,0,0, 'Shadowy Advisor - On spawn install caster template');

SET @ENTRY := 18930;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,62,0,100,0,7938,1,0,0,11,34924,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Vlagga Freyfeather - On gossip option 1 select - Cast Stair of Destiny to Thrallmar'),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,12,9297,4,30000,0,0,0,1,0,0,0,0,0,0,0, 'Vlagga Freyfeather - Vlagga Freyfeather - Summon Enraged Wyverns on Aggro'),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,12,9297,4,30000,0,0,0,1,0,0,0,0,0,0,0, 'Vlagga Freyfeather - Vlagga Freyfeather - Summon Enraged Wyverns on Aggro'),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Vlagga Freyfeather - Say text on Aggro');

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(@ENTRY,0,0, 'Arrrhhh...Guards!',14,7,100,0,0,0, 'Common Horde Flight Master');

-- some cleanup
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (19534,26816,26820,28417);
DELETE FROM `creature_ai_texts` WHERE `entry`=-337;

-- incorrectly set AIName
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='' WHERE `entry` IN (24938,27570);

SET @ENTRY := 25596;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,11,32423,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Infected Kodo Beast - Blue Radiation on spawn'),
(@ENTRY,0,1,0,27,0,100,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Infected Kodo Beast - remove death state on passager boarded'),
(@ENTRY,0,2,0,31,0,100,0,45877,0,0,0,41,0,0,0,0,0,0,22,0,0,0,0,0,0,0, 'Infected Kodo Beast - On Spell Hit despawn');

SET @ENTRY := 26257;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,58,1,51797,3400,4800,30,7,1,0,0,0,0,0,0,0, 'Surge Needle Sorcerer - On spawn install caster template');

SET @ENTRY := 26343;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,32423,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Indu''le Fisherman - On spawn - Cast Blue Radiation on self'),
(@ENTRY,0,1,0,9,0,100,0,0,20,15000,18000,11,11820,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Indu''le Fisherman -  Cast Electrified Net');

SET @ENTRY := 27842;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,12,9521,4,30000,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - Summon Enraged Felbat on Aggro'),
(@ENTRY,0,2,0,4,0,100,0,0,0,0,0,12,9521,4,30000,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - Summon Enraged Felbat on Aggro'),
(@ENTRY,0,3,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - Say text on Aggro'),
(@ENTRY,0,4,0,11,0,100,0,0,0,0,0,53,0,27842,1,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - on spawn start path'),
(@ENTRY,0,5,0,40,0,100,0,5,27842,0,0,80,2784201,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - at wp 5 run script1'),
(@ENTRY,0,6,0,40,0,100,0,8,27842,0,0,80,2784202,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Fenrick Barlowe - at wp 8 run script2');

DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(@ENTRY, 0, 0, 'Bat gizzards again for the gnomes tonight...', 12, 0, 100, 1, 0, 0, 'Fenrick Barlowe text'),
(@ENTRY, 0, 1, 'What do they expect, making the bats come in at that angle? Broken necks and gamey bat stew, that''s what they get.', 12, 0, 100, 1, 0, 0, 'Fenrick Barlowe text'),
(@ENTRY, 0, 2, 'We like trees, Fenrick. They provide cover. They won''t let me chop them down, either.', 12, 0, 100, 1, 0, 0, 'Fenrick Barlowe text'),
(@ENTRY, 0, 3, 'I wonder how many reinforcements need to suffer injury before they allows us to chop down these idiotic trees. They''re costing us a fortune in bats. Maybe I''ll rig a harness or two...', 12, 0, 100, 1, 0, 0, 'Fenrick Barlowe text'),
(@ENTRY,1,0, 'Arrrhhh...Guards!',14,7,100,0,0,0, 'Common Horde Flight Master');
UPDATE `creature_template` SET `baseattacktime`=2000 WHERE `entry`=36213; -- Kor'kron Overseer
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`baseattacktime`=2000,`unit_flags`=33280,`speed_walk`=1 WHERE `entry`=5677; -- Summoned Succubus
UPDATE `creature_template` SET `npcflag`=1,`unit_flags`=0x300,`speed_run`=0.99206 WHERE `entry`=33238; -- Argent Squire
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35,`unit_flags`=33536 WHERE `entry`=36979; -- Lil'KT
UPDATE `creature_template` SET `exp`=0,`InhabitType`=7,`flags_extra`=`flags_extra`|2|128 WHERE `entry` IN (34286,34159,33571); -- Orbital Support, Ulduar Gauntlet Generator, Ulduar Gauntlet Generator (small radius)
UPDATE `creature_template` SET `gossip_menu_id`=5021 WHERE `entry`=13257;
UPDATE `creature_template` SET `gossip_menu_id`=7320 WHERE `entry`=16886;
UPDATE `creature_template` SET `gossip_menu_id`=5283 WHERE `entry`=13617;
UPDATE `creature_template` SET `gossip_menu_id`=5241 WHERE `entry`=12096;
UPDATE `creature_template` SET `gossip_menu_id`=2602 WHERE `entry`=10267;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_venture_co_straggler' WHERE `entry`=27570; -- Wrongly deleted in a recent commit

UPDATE `creature_model_info` SET `bounding_radius`=0.2596,`combat_reach`=1.65,`gender`=1 WHERE `modelid`=30063; -- Kor'kron Overseer
UPDATE `creature_model_info` SET `bounding_radius`=0.6045,`combat_reach`=2.25,`gender`=1 WHERE `modelid`=10923; -- Summoned Succubus
UPDATE `creature_model_info` SET `bounding_radius`=0.06,`combat_reach`=0.3,`gender`=0 WHERE `modelid`=30507; -- Lil'KT
UPDATE `creature_model_info` SET `bounding_radius`=0.3,`combat_reach`=0,`gender`=0 WHERE `modelid`=28946; -- Argent Squire
UPDATE `creature_model_info` SET `bounding_radius`=0.3519,`combat_reach`=1.725,`gender`=0 WHERE `modelid`=26078; -- Windle Sparkshine

DELETE FROM `creature_template_addon` WHERE `entry` IN (36213,5677,33238,36979,34286,34159);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(36213,0,0,257,0, NULL), -- Kor'kron Overseer
(5677,0,0,1,0, NULL), -- Summoned Succubus
(33238,0,0,1,0, NULL), -- Argent Squire
(36979,0,0,1,0, '69683 70050'), -- Lil'KT (Lil' K.T. Passive / [DND] Lich Pet)
(34286,0,0,1,0, NULL), -- Orbital Support
(34159,0,0,1,0, NULL); -- Ulduar Gauntlet Generator (small radius)

UPDATE `creature` SET `MovementType`=0,`spawndist`=0 WHERE `id` IN (34286,34159,33571); -- Orbital Support, Ulduar Gauntlet Generator, Ulduar Gauntlet Generator (small radius)

-- No npc should have UNIT_FLAG_PVP_ATTACKABLE
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~0x8 WHERE `unit_flags` & 0x8;

DELETE FROM `gossip_menu` WHERE `entry`=1822 AND `text_id`=2474;
DELETE FROM `gossip_menu` WHERE `entry`=1823 AND `text_id`=2482;
DELETE FROM `gossip_menu` WHERE `entry`=1824 AND `text_id`=2481;
DELETE FROM `gossip_menu` WHERE `entry`=1825 AND `text_id`=2480;
DELETE FROM `gossip_menu` WHERE `entry`=1826 AND `text_id`=2479;
DELETE FROM `gossip_menu` WHERE `entry`=1827 AND `text_id`=2478;
DELETE FROM `gossip_menu` WHERE `entry`=1828 AND `text_id`=2477;
DELETE FROM `gossip_menu` WHERE `entry`=2186 AND `text_id`=2820;
DELETE FROM `gossip_menu` WHERE `entry`=2187 AND `text_id`=2820;
DELETE FROM `gossip_menu` WHERE `entry`=3182 AND `text_id`=3937;
DELETE FROM `gossip_menu` WHERE `entry`=2602 AND `text_id`=3296;
DELETE FROM `gossip_menu` WHERE `entry`=5241 AND `text_id`=6255;
DELETE FROM `gossip_menu` WHERE `entry`=5283 AND `text_id`=6316;
DELETE FROM `gossip_menu` WHERE `entry`=5021 AND `text_id`=6073;
DELETE FROM `gossip_menu` WHERE `entry`=5627 AND `text_id`=6736;
DELETE FROM `gossip_menu` WHERE `entry`=7320 AND `text_id`=8688;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(1822, 2474), (1823, 2482), (1824, 2481),
(1825, 2480), (1826, 2479), (1827, 2478),
(1828, 2477), (2186, 2820), (2187, 2820),
(3182, 3937), (2602, 3296), (5241, 6255),
(5283, 6316), (5021, 6073), (5627, 6736),
(7320, 8688);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=1663 AND `id`=0;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2187 AND `id`=0;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=4558 AND `id` IN (0,1,2);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=7939 AND `id` IN (0,1);
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5021 AND `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=5241 AND `id` IN (0,2);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(1663,0,0,'Amazing! I\'ve never spoken to a ghost. I wish to learn!', 1,1,0,0,0,0,''),
(2187,0,0,'Transcribe the tablet.',1,1,0,0,0,0,''),
(4558,0,3,'I seek more training in the priestly ways.',1,1,0,0,0,0,''),
(4558,1,0,'I wish to unlearn my talents.',1,1,0,0,0,0,''),
(4558,2,0,'Learn about Dual Talent Specialization.',1,1,0,0,0,0,''),
(7939,0,2,'Show me where I can fly.',1,1,0,0,0,0,''),
(7939,1,2,'Send me to Honor Hold!',1,1,0,0,0,0,''),
(5021,3,0,'How many more supplies are needed for the next upgrade?',1,1,5627,0,0,0,''),
(5241,0,0,'How many more supplies are needed to send ground assaults?',1,1,0,0,0,0,''),
(5241,2,1,'I want to browse your goods.',1,1,0,0,0,0,'');
UPDATE `creature_template` SET `dynamicflags`=32 WHERE `entry` IN (27457,27481,26513,26516); -- Skirmisher Corpse, Westfall Infantry Corpse, Drakkari Shaman Corpse, Drakkari Warrior Corpse

DELETE FROM `creature_template_addon` WHERE `entry` IN (27457,27481);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(27457,0,0,1,0, '29266'), -- Skirmisher Corpse (Permanent Feign Death)
(27481,0,0,1,0, '29266'); -- Westfall Infantry Corpse (Permanent Feign Death)

UPDATE `creature_template_addon` SET `bytes1`=0,`bytes2`=1,`mount`=0,`emote`=0,`auras`='29266' WHERE `entry` IN (26513,26516); -- Drakkari Shaman Corpse (Permanent Feign Death)

UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id` IN (27457,27481,26513,26516);
DELETE FROM `creature_addon` WHERE `guid` IN (102034,102035,102036,102037,102038,102041,102042,102043,102044,102045,102046,102047,103956,103957,103958,103959,103960,103972,103973,103974,103975,103976,103977,103978,103984,103985,103986,103987);

DELETE FROM `creature_ai_scripts` WHERE `creature_id`=27570;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=3062 AND `id` BETWEEN 0 AND 6;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`) VALUES
(3062,0,0, 'Low spirits', 1,1),
(3062,1,0, 'Bad hang nail', 1,1),
(3062,2,0, 'Feeling underpowered', 1,1),
(3062,3,0, 'Jungle Fever', 1,1),
(3062,4,0, 'Uni-brow', 1,1),
(3062,5,0, 'Whiplash', 1,1),
(3062,6,0, 'I don''t want to go back to work', 1,1);

DELETE FROM `creature_template_addon` WHERE `entry`=10578;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(10578,0,0,257,0, NULL); -- Bom'bay

UPDATE `creature` SET `MovementType`=1,`spawndist`=5 WHERE `id`=10578; -- rand movement
UPDATE `creature_template` SET `AIName`='SmartAI',`MovementType`=1 WHERE `entry`=10578;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=10578 AND `source_type`=0);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=1057800 AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(10578, 0, 0, 0, 62, 0, 100, 0, 3062, 0, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 0 run timed action list'),
(10578, 0, 1, 0, 62, 0, 100, 0, 3062, 1, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 1 run timed action list'),
(10578, 0, 2, 0, 62, 0, 100, 0, 3062, 2, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 2 run timed action list'),
(10578, 0, 3, 0, 62, 0, 100, 0, 3062, 3, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 3 run timed action list'),
(10578, 0, 4, 0, 62, 0, 100, 0, 3062, 4, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 4 run timed action list'),
(10578, 0, 5, 0, 62, 0, 100, 0, 3062, 5, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 5 run timed action list'),
(10578, 0, 6, 0, 62, 0, 100, 0, 3062, 6, 0, 0, 80, 10578*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - On gossip select 6 run timed action list'),
(10578, 0, 7, 0, 1, 0, 100, 0, 1000, 1000, 20000, 40000, 10, 153, 15, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - Every 20-40 seconds do random emote'),
(1057800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - Close gossip'),
-- could use a stop movement here
(1057800, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 4, 6482, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - Play a sound'),
(1057800, 9, 2, 0, 0, 0, 100, 0, 100, 100, 0, 0, 11, 17009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Bom''bay - Cast Voodoo');
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_voodoo';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(17009, 'spell_voodoo');
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` IN (32892,32879); -- Fix Thorim triggers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=71189;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,0,71189,0,18,1,37868,0,0, '', 'Dreamwalker''s Rage - target Risen Archmage'),
(13,0,71189,0,18,1,36791,0,0, '', 'Dreamwalker''s Rage - target Blazing Skeleton'),
(13,0,71189,0,18,1,37863,0,0, '', 'Dreamwalker''s Rage - target Suppresser'),
(13,0,71189,0,18,1,37934,0,0, '', 'Dreamwalker''s Rage - target Blistering Zombie'),
(13,0,71189,0,18,1,37886,0,0, '', 'Dreamwalker''s Rage - target Gluttonous Abomination'),
(13,0,71189,0,18,1,38186,0,0, '', 'Dreamwalker''s Rage - target Dream Portal (Pre-effect)'),
(13,0,71189,0,18,1,37945,0,0, '', 'Dreamwalker''s Rage - target Dream Portal'),
(13,0,71189,0,18,1,38429,0,0, '', 'Dreamwalker''s Rage - target Nightmare Portal (Pre-effect)'),
(13,0,71189,0,18,1,38430,0,0, '', 'Dreamwalker''s Rage - target Nightmare Portal'),
(13,0,71189,0,18,1,37907,0,0, '', 'Dreamwalker''s Rage - target Rot Worm');
UPDATE `spell_script_names` SET `ScriptName` = 'spell_dk_ghoul_explode' WHERE `spell_id` = 47496;
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_festergut_gaseous_blight';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_rotface_slime_spray';
DELETE FROM `spell_bonus_data` WHERE `entry` = 64844;
INSERT INTO `spell_bonus_data` VALUES
(64844, 0.5483, -1, -1, -1, 'Priest - Divine Hymn');
-- TODO: this list of vehicles isn't complete, need to find more vehicles with missing immunities
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` |
0x00000002| -- MECHANIC_DISORIENTED (Blind)
0x00000008| -- MECHANIC_DISTRACT (Distract)
0x00000010| -- MECHANIC_FEAR (Fear, Psychic Scream)
0x00000020| -- MECHANIC_GRIP (Death Grip)
0x00000040| -- MECHANIC_ROOT (Entangling Roots)
0x00000100| -- MECHANIC_SILENCE (Silence)
0x00000200| -- MECHANIC_SLEEP (Wyvern Sting)
0x00000400| -- MECHANIC_SNARE (Crippling Poison, Piercing Howl)
0x00000800| -- MECHANIC_STUN (Hammer of Justice)
0x00001000| -- MECHANIC_FREEZE (Freezing Trap)
0x00002000| -- MECHANIC_KNOUCKOUT (Gouge, Blast Wave)
-- 0x00004000| -- MECHANIC_BLEED (Rend, Deep Wounds) - requires confirmation
0x00010000| -- MECHANIC_POLYMORPH (Polymorph)
0x00040000| -- MECHANIC_SHIELD (Power word: Shield) -- maybe unnecessary, spells shouldn't be even casted on vehicles
-- 0x00200000| -- MECHANIC_INFECTED (Frost Fever, Blood Plague) - requires confirmation
0x00800000| -- MECHANIC_HORROR (warlock's Death Coil)
0x10000000| -- MECHANIC_IMMUNE_SHIELD (Hand of Protection) -- maybe unnecessary, spells shouldn't be even casted on vehicles
0x02000000| -- MECHANIC_INTERRUPT (Kick, Counterspell)
0x04000000 -- MECHANIC_DAZE (Dazed)
where entry IN (
-- Some random quest vehicles
25334, -- Horde Siege Tank
26523, -- Forsaken Blight Spreader
-- Strand of the Ancients vehicles
28781, -- Battleground Demolisher
27894, -- Antipersonnel Cannon
-- Wintergrasp vehicles
27881, -- Wintergrasp Catapult (both)
28094, -- Wintergrasp Demolisher (both)
28312, -- Wintergrasp Siege Engine (alliance)
28319, -- Wintergrasp Siege Turret (alliance)
28366, -- Wintergrasp Tower Cannon (both)
32627, -- Wintergrasp Siege Engine (horde)
32629, -- Wintergrasp Siege Turret (alliance)
-- Ulduar Vehicles
33060, -- Salvaged Siege Engine
33062, -- Salvaged Chopper
33067, -- Salvaged Siege Turret
33109, -- Salvaged Demolisher
-- Isle of Conquest vehicles
34793, -- Catapult (both)
34775, -- Demolisher (both)
34776, -- Siege Engine (alliance)
34777, -- Siege Turret (alliance)
34778, -- Flame Turret (alliance)
34802, -- Glaive Thrower (alliance)
34944, -- Keep Cannon (both)
35069, -- Siege Engine (horde)
35273, -- Glaive Thrower (horde)
36355, -- Siege Turret (horde)
36356); -- Flame Turret (horde)
DELETE FROM `spell_script_names` WHERE `spell_id` IN (50365,50391);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(50365,'spell_dk_improved_blood_presence'),
(50391,'spell_dk_improved_unholy_presence');
UPDATE `spell_bonus_data` SET `direct_bonus` = 0.564 WHERE `entry` = 64844;
DELETE FROM `spell_proc_event` WHERE `entry` = 58642;
INSERT INTO `spell_proc_event` VALUES
(58642, 0x00, 15, 0x00000000, 0x08000000, 0x00000000, 0x00000010, 0x00000000, 0, 0, 0);
UPDATE `spell_proc_event` SET `procEx` = 0 WHERE `entry` IN (53671,53673,54151,54154,54155);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|0x80 WHERE `entry` IN (17965,34784,34825,35278,35279,35280);
DELETE FROM `spell_bonus_data` WHERE `entry` = 12162;
INSERT INTO `spell_bonus_data` VALUES
(12162, 0, 0, 0, 0, 'Warrior - Deep Wounds');
DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5046,5047);
INSERT INTO `areatrigger_scripts` (`entry`,`ScriptName`) VALUES
(5046,'at_sholazar_waygate'),
(5047,'at_sholazar_waygate');
DELETE FROM `npc_vendor` WHERE `item` = 36902;
DELETE FROM `disables` WHERE `entry` = 7703 AND `sourceType` = 4;

DELETE FROM `achievement_criteria_data` WHERE criteria_id = 7703;
INSERT INTO `achievement_criteria_data` VALUES
(7703, 6, 4197, 0, ''),
(7703, 11, 0, 0, 'achievement_wg_didnt_stand_a_chance');
DELETE FROM `trinity_string` WHERE `entry` = 283;
INSERT INTO `trinity_string` (`entry`,`content_default`) VALUES 
(283,'You have disabled %s\'s chat for %u minutes, effective at the player\'s next login. Reason: %s.');
UPDATE `gameobject_template` SET `flags`=32,`faction`=114 WHERE `entry`=192642; -- Doodad_Dalaran_SewerDoor_01
UPDATE `gameobject_template` SET `flags`=32,`faction`=114 WHERE `entry`=192643; -- Doodad_Dalaran_SewerDoor_02
-- Gurubashi Blood Drinker SAI
SET @ENTRY := 11353;
SET @SPELL_BLOOD_LEECH := 24437; -- Blood Leech
SET @SPELL_DRAIN_LIFE := 24435; -- Drain Life
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=24437,`spell2`=24435,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,30,0,0,11,@SPELL_BLOOD_LEECH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Blood Drinker - At 50% HP - Cast Blood Leech');
-- (@ENTRY,0,1,0,0,0,100,0,3000,5000,9000,11000,11,@SPELL_DRAIN_LIFE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Blood Drinker - In Combat - Cast Drain Life'); -- Need spellscript, right now it heals the player for 5000 every second

-- Hakkari Priest SAI
SET @ENTRY := 11830;
SET @SPELL_PSYCHIC_SCREAM := 13704; -- Psychic Scream
SET @SPELL_ANTI_MAGIC_SHIELD := 24021; -- Anti-Magic Shield
SET @SPELL_CLEANSE_NOVA := 24022; -- Cleanse Nova
SET @SPELL_HEAL := 22883; -- Heal
UPDATE `creature_template` SET `AIName`='SmartAI',`mechanic_immune_mask`=`mechanic_immune_mask`|1 WHERE `entry`=@ENTRY; -- Immune to charm effects (mind control)
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Hakkari Priest - On Aggro - Say Line 0 (random)'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,27000,27000,11,@SPELL_PSYCHIC_SCREAM,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Priest - In Combat - Cast Psychic Scream'),
(@ENTRY,0,2,0,0,0,100,0,1000,1000,22000,24000,11,@SPELL_ANTI_MAGIC_SHIELD,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Priest - In Combat - Cast Anti-Magic Shield'),
(@ENTRY,0,3,0,0,0,100,0,15000,15000,30000,30000,11,@SPELL_CLEANSE_NOVA,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Priest - In Combat - Cast Cleanse Nova'),
(@ENTRY,0,4,0,2,0,100,1,0,50,0,0,11,@SPELL_HEAL,1,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Priest - At 50% HP - Cast Heal');
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Gurubashi Axe Thrower SAI
SET @ENTRY := 11350;
SET @SPELL_RANGED_THROW := 22887; -- Ranged Throw
SET @SPELL_FRENZY := 8269; -- Frenzy
SET @SPELL_AXE_FLURRY := 24018; -- Axe Flurry
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=22887,`spell2`=24018,`spell3`=8269,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'Gurubashi Axe Thrower - On Aggro - Say Line 1 (random)'),
(@ENTRY,0,1,0,9,0,100,1,5,30,1500,2000,11,@SPELL_RANGED_THROW,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Axe Thrower - On Range - Cast Ranged Throw'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,@SPELL_FRENZY,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Axe Thrower - At 30% HP - Cast Frenzy'),
(@ENTRY,0,3,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Gurubashi Axe Thrower - At 30% HP - Say Line 0'),
(@ENTRY,0,4,0,0,0,100,0,15000,15000,25000,28000,11,@SPELL_AXE_FLURRY,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Axe Thrower - In Combat - Cast Axe Flurry');
-- Axe Flurry whirldwind effect will now stun nearby players by throwing axes at them
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=24071 AND `spell_effect`=24020;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(24071,24020,1,'Axe Flurry will now throw axes at nearby players, stunning them');
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s goes into a frenzy!',16,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,1,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Portal of Madness SAI
SET @ENTRY := 15141;
SET @SPELL_SUMMON_MAD_VOIDWALKERS := 24622; -- Summon Mad Voidwalkers
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,6000,6000,6000,6000,11,@SPELL_SUMMON_MAD_VOIDWALKERS,0,0,0,0,0,1,0,0,0,0,0,0,0,'Portal of Madness - OCC - Cast Summon Mad Voidwalkers'),
(@ENTRY,0,1,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Portal of Madness - On Spawn - Set react state Passive');

-- Mad Voidwalker SAI
SET @ENTRY := 15146;
SET @SPELL_CONSUMING_SHADOW := 24614; -- Consuming Shadows
SET @SPELL_SHADOW_SHOCK := 24616; -- Shadow Shock
UPDATE `creature_template` SET `AIName`='SmartAI',`mechanic_immune_mask`=131073,`flags_extra`=64 WHERE `entry`=@ENTRY; -- Immune to Enslave and Banish and no experience gain
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mad Voidwalker - On spawn - Set random movement'),
(@ENTRY,0,1,0,0,0,100,2,7000,9000,11000,13000,11,@SPELL_CONSUMING_SHADOW,0,0,0,0,0,2,0,0,0,0,0,0,0,'Mad Voidwalker - In Combat - Cast Consuming Shadows'),
(@ENTRY,0,2,0,0,0,100,2,3000,4000,8000,8000,11,@SPELL_SHADOW_SHOCK,0,0,0,0,0,2,0,0,0,0,0,0,0,'Mad Voidwalker - In Combat - Cast Shadow Shock'),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,41,180000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mad Voidwalker - Link - Despawn after 3 minutes');

-- Mad Servant SAI
SET @ENTRY := 15111;
SET @SPELL_PORTAL_OF_MADNESS := 24621; -- Portal of Madness
SET @SPELL_FIREBALL := 24611; -- Fireball
SET @SPELL_FLAMESTRIKE := 24612; -- Flamestrike
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,3000,4000,5000,11,@SPELL_FIREBALL,0,0,0,0,0,5,0,0,0,0,0,0,0,'Mad Servant - In Combat - Cast Fireball'),
(@ENTRY,0,1,0,0,0,100,0,6000,7000,9000,11000,11,@SPELL_FLAMESTRIKE,1,0,0,0,0,5,0,0,0,0,0,0,0,'Mad Servant - In Combat - Cast Flamestrike'),
(@ENTRY,0,2,0,6,0,100,0,0,0,0,0,11,@SPELL_PORTAL_OF_MADNESS,2,0,0,0,0,1,0,0,0,0,0,0,0,'Mad Servant - On Death - Cast Portal of Madness');

-- Razzashi Adder SAI
SET @ENTRY := 11372;
SET @SPELL_VENOM_SPIT := 24011; -- Venom Spit
SET @SPELL_EXPLOIT_WEAKNESS := 24016; -- Exploit Weakness
SET @SPELL_TRASH := 3391; -- Trash
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,85,0,3000,3000,15000,18000,11,@SPELL_VENOM_SPIT,1,0,0,0,0,5,0,0,0,0,0,0,0,'Razzashi Adder - In Combat - Cast Venom Spit'),
(@ENTRY,0,1,0,0,0,100,0,10000,11000,20000,20000,11,@SPELL_EXPLOIT_WEAKNESS,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Adder - In Combat - Cast Exploit Weakness'),
(@ENTRY,0,2,0,0,0,100,0,9000,9000,11000,14000,11,@SPELL_TRASH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Razzashi Adder - In Combat - Cast Trash');

-- Gurubashi Headhunter SAI
SET @ENTRY := 11351;
SET @SPELL_THROW := 22887; -- Throw
SET @SPELL_WHIRLING_TRIP := 24048; -- Whirling Trip
SET @SPELL_MORTAL_STRIKE := 15708; -- Mortal Strike
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=22887,`spell2`=15708,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Headhunter - On Aggro - Say Line 0'),
(@ENTRY,0,1,0,9,0,100,0,5,30,1500,2000,11,@SPELL_THROW,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Headhunter - On Range - Cast Throw'),
(@ENTRY,0,2,0,0,0,100,0,3000,5000,7000,8000,11,@SPELL_WHIRLING_TRIP,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Headhunter - In Combat - Cast Whirlwing Trip'),
(@ENTRY,0,3,0,0,0,100,1,7000,8000,15000,15000,11,@SPELL_MORTAL_STRIKE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Headhunter - In Combat - Cast Mortal Strike');
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Hakkari Witch Doctor SAI
SET @ENTRY := 11831;
SET @SPELL_HEX := 24053; -- Hex
SET @SPELL_RELEASE_TOADS := 24058; -- Release Toads - needs work
SET @SPELL_SHADOW_SHOCK := 17289; -- Shadow Shock
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=24053,`spell2`=17289,`spell3`=24054,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Witch Doctor - On Aggro - Say Line 0'),
(@ENTRY,0,1,0,0,0,100,0,7000,9000,15000,17000,11,@SPELL_HEX,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Witch Doctor - In Combat - Cast Hex'),
(@ENTRY,0,2,0,0,0,100,0,5000,6000,12000,13000,11,@SPELL_SHADOW_SHOCK,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Witch Doctor - In Combat - Cast Shadow Shock');
-- (@ENTRY,0,2,0,0,0,100,0,15000,16000,20000,22000,11,@SPELL_RELEASE_TOADS,1,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Witch Doctor - Cast Release Toads'); -- Spell needs work
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Bloodseeker Bat SAI
SET @ENTRY := 11368;
SET @SPELL_CHARGE := 24023; -- Charge
UPDATE `creature_template` SET `AIName`='SmartAI',`unit_flags`=512 WHERE `entry`=@ENTRY; -- Will now be attackable
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,@SPELL_CHARGE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Bloodseeker Bat - On Aggro - Cast Charge');
-- Charge will now also trigger Fixate (cast on bat)
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=24023 AND `spell_effect`=12021;
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(24023,12021,1,'Charge (24023) will now trigger Fixate'); -- Bloodseeker Bat's charge

-- Razzashi Venombrood SAI
SET @ENTRY := 14532;
SET @SPELL_INTOXICATING_VENOM := 24596; -- Intoxicating Venom
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,1,5000,7000,11000,13000,11,@SPELL_INTOXICATING_VENOM,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Venombrood - In Combat - Cast Intoxicating Venom');

-- Razzashi Broodwidow SAI
SET @ENTRY := 11370;
SET @SPELL_WEB_SPIN := 24600; -- Web Spin
SET @SPELL_SUMMON_RAZZASHI_SKITTERER := 24598; -- Summon Razzashi Skitterer (x5)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,9000,10000,14000,15000,11,@SPELL_WEB_SPIN,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Broodwidow - In Combat - Cast Web Spin'),
(@ENTRY,0,1,0,6,0,100,0,0,0,0,0,11,@SPELL_SUMMON_RAZZASHI_SKITTERER,2,0,0,0,0,1,0,0,0,0,0,0,0,'Razzashi Broodwidow - On Death - Cast Summon Razzashi Skitterer');

-- Hakkari Shadowcaster SAI
SET @ENTRY := 11338;
SET @SPELL_MANA_BURN := 22947; -- Mana Burn
SET @SPELL_SHADOW_BOLT := 15232; -- Shadow Bolt
SET @SPELL_SHADOW_BOLT_VOLLEY := 20741; -- Shadow Bolt Volley
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=15232,`spell2`=20741,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,11000,13000,11,@SPELL_MANA_BURN,1,0,0,0,0,5,0,0,0,0,0,0,0,'Hakkari Shadowcaster - In Combat - Cast Mana Burn'),
(@ENTRY,0,1,0,0,0,100,0,7000,9000,12000,14000,11,@SPELL_SHADOW_BOLT,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Shadowcaster - In Combat - Cast Shadow Bolt'),
(@ENTRY,0,2,0,0,0,100,0,7000,9000,12000,14000,11,@SPELL_SHADOW_BOLT_VOLLEY,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Shadowcaster - In Combat - Cast Shadow Bolt Volley');

-- Razzashi Raptor SAI
SET @ENTRY := 14821;
SET @SPELL_ENRAGE := 8599; -- Enrage
SET @SPELL_INFECTED_BITE := 24339; -- Infected Bite
SET @SPELL_TRASH := 3391; -- Trash
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6500,6500,8000,8000,11,@SPELL_INFECTED_BITE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Raptor - In Combat - Cast Infected Bite'),
(@ENTRY,0,1,0,0,0,100,0,7000,8000,9000,10000,11,@SPELL_TRASH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Razzashi Raptor - In Combat - Cast Trash'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,@SPELL_ENRAGE,1,0,0,0,0,1,0,0,0,0,0,0,0,'Razzashi Raptor - At 30% HP - Cast Enrage'),
(@ENTRY,0,3,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Razzashi Raptor - At 30% HP - Say Line 0');
-- Enrage text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s becomes enraged!',16,0,100,0,0,0,'Razzashi Raptor - At 30% HP - Say Line 0');

-- Gurubashi Champion SAI
SET @ENTRY := 11356;
SET @SPELL_BATTLE_SHOUT := 24438; -- Battle Shout
SET @SPELL_CHARGE := 22886; -- Berserker Charge
SET @SPELL_STRIKE := 22591; -- Strike
SET @SPELL_SHIELD_SLAM := 15655; -- Shield Slam
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=22886,`spell2`=22591,`spell3`=15655,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Champion - On aggro - Say Line 0'),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,@SPELL_BATTLE_SHOUT,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Champion - On Aggro - Cast Battle Shout'),
(@ENTRY,0,2,0,0,0,100,0,3000,3000,9000,10000,11,@SPELL_STRIKE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Champion - In Combat - Cast Strike'),
(@ENTRY,0,3,0,0,0,100,0,11000,13000,20000,22000,11,@SPELL_CHARGE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Champion - In Combat - Cast Berserker Charge'),
(@ENTRY,0,4,0,0,0,100,0,6000,6000,9000,9000,11,@SPELL_SHIELD_SLAM,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Champion - In Combat - Cast Shield Shalm');
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Zulian Panther SAI
SET @ENTRY := 11365;
SET @SPELL_RAKE := 24332; -- Rake
SET @SPELL_RAVAGE := 24333; -- Ravage
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,9000,11000,13000,11,@SPELL_RAKE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Zulian Panther - In Combat - Cast Rake'),
(@ENTRY,0,1,0,0,0,100,0,11000,12000,22000,23000,11,@SPELL_RAVAGE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Zulian Panther - In Combat - Cast Ravage');

-- Gurubashi SAI
-- This one needs some work. It's summoned when opening a Voodoo Pile (spawned all over the instance) and should mind control the player for some seconds, but SAI refuses to cast the spell
SET @ENTRY := 15047;
SET @SPELL_WILL_OF_HAKKAR := 24178; -- Will of Hakkar
UPDATE `creature_template` SET `AIName`='SmartAI',`unit_flags`=33554434 WHERE `entry`=@ENTRY; -- Set unattackable, untargetable
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Portal of Madness - On Spawn - Set react state Passive'), -- Temporarily workaround. It shouldn't attack players, but need core support for creatures mind controlling players
(@ENTRY,0,1,0,0,0,100,0,5,5,5,5,11,@SPELL_WILL_OF_HAKKAR,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi - In Combat - Cast Will Of Hakkar');

-- Hakkari Shadow Hunter SAI
SET @ENTRY := 11339;
SET @SPELL_SHOOT := 16496; -- Shoot
SET @SPELL_MULTI_SHOT := 21390; -- Multi-shot
SET @SPELL_WYVERN_STING := 24335; -- Wyvern Sting
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Shadow Hunter - On aggro - Emote Line 0'),
(@ENTRY,0,1,0,4,0,100,0,0,0,0,0,11,@SPELL_SHOOT,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Shadow Hunter - On Aggro - Cast Shoot'),
(@ENTRY,0,2,0,0,0,100,0,1000,1000,2000,3000,11,@SPELL_SHOOT,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Shadow Hunter - In Combat - Cast Shoot'),
(@ENTRY,0,3,0,0,0,100,0,10000,10000,14000,16000,11,@SPELL_MULTI_SHOT,1,0,0,0,0,5,0,0,0,0,0,0,0,'Hakkari Shadow Hunter - In Combat - Cast Multi-Shot'),
(@ENTRY,0,4,0,0,0,100,0,12000,13000,17000,19000,11,@SPELL_WYVERN_STING,1,0,0,0,0,5,0,0,0,0,0,0,0,'Hakkari Shadow Hunter - In Combat - Cast Wyvern Sting');
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- 24247, 24246, 24222
-- Zulian Prowler SAI
SET @ENTRY := 15101;
SET @SPELL_TRASH := 3391; -- Trash
SET @SPELL_STEALTH := 24246; -- Stealth
SET @SPELL_VANISH_VISUAL := 24222; -- Vanish Visual
SET @SPELL_XXXXXX := 24247; -- Need more information and DBC
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,9000,10000,11,@SPELL_TRASH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Zulian Prowler - In Combat - Cast Trash');
-- (@ENTRY,0,1,0,11,0,100,0,0,0,0,0,11,@SPELL_STEALTH,0,0,0,0,0,1,0,0,0,0,0,0,0,'Zulian Prowler - On Spawn - Cast Stealth'), -- Needs to be implented in DBCs, together with 24247
-- (@ENTRY,0,2,0,11,0,100,0,0,0,0,0,11,@SPELL_VANISH_VISUAL,0,0,0,0,0,1,0,0,0,0,0,0,0,'Zulian Prowler - On Spawn - Cast Vanish Visual');

-- Atal'ai Mistress SAI
SET @ENTRY := 14882;
SET @SPELL_TRASH := 3391; -- Trash
SET @SPELL_CURSE_OF_BLOOD := 24673; -- Curse of Blood
SET @SPELL_SNAP_KICK := 24671; -- Snap Kick
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=3391,`spell2`=24673,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,9000,10000,11,@SPELL_TRASH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Atalai Mistress - In Combat - Cast Trash'),
(@ENTRY,0,1,0,0,0,100,0,11000,14000,22000,22000,11,@SPELL_CURSE_OF_BLOOD,1,0,0,0,0,2,0,0,0,0,0,0,0,'Atalai Mistress - In Combat - Cast Curse of Blood'),
(@ENTRY,0,2,0,0,0,100,0,9000,12000,22000,22000,11,@SPELL_SNAP_KICK,1,0,0,0,0,2,0,0,0,0,0,0,0,'Atalai Mistress - In Combat - Cast Snap Kick');

-- Zulian Crocolisk SAI
SET @ENTRY := 15043;
SET @SPELL_REND := 13445; -- Rend
SET @SPELL_TENDON_RIP := 3604; -- Tendon Rip
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,9000,11000,12000,11,@SPELL_TENDON_RIP,1,0,0,0,0,2,0,0,0,0,0,0,0,'Zulian Crocolisk - In Combat - Cast Tendon Rip'),
(@ENTRY,0,1,0,0,0,100,0,17000,19000,22000,24000,11,@SPELL_REND,1,0,0,0,0,2,0,0,0,0,0,0,0,'Zulian Crocolisk - In Combat - Cast Rend');

-- Hooktooth Frenzy SAI
SET @ENTRY := 11374;
SET @SPELL_PIERCE_ARMOR := 12097; -- Pierce Armor
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_loot_template` WHERE `entry`=@ENTRY AND `item`=19221; -- Remove incorrect item from loot table (Darkmoon Special Reserve)
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,5000,11000,11000,11,@SPELL_PIERCE_ARMOR,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hooktooth Frenzy - In Combat - Cast Pierce Armor');

-- Son of Hakkar SAI
SET @ENTRY := 11357;
SET @SPELL_TRASH := 3391; -- Trash
SET @SPELL_KNOCKDOWN := 16790; -- Knockdown
SET @SPELL_POISONOUS_BLOOD := 24320; -- Poisonous Blood
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,9000,10000,11,@SPELL_TRASH,1,0,0,0,0,1,0,0,0,0,0,0,0,'Son of Hakkar - In Combat - Cast Trash'),
(@ENTRY,0,1,0,0,0,100,0,11000,13000,19000,22000,11,@SPELL_KNOCKDOWN,1,0,0,0,0,2,0,0,0,0,0,0,0,'Son of Hakkar - In Combat - Cast Knockdown'),
(@ENTRY,0,2,0,6,0,100,0,0,0,0,0,11,@SPELL_POISONOUS_BLOOD,2,0,0,0,0,1,0,0,0,0,0,0,0,'Mad Servant - In Combat - Cast Poisonous Blood'); -- Spell needs work

-- Soulflayer SAI
SET @ENTRY := 11359;
SET @SPELL_FEAR := 22678; -- Fear
SET @SPELL_FRENZY := 8269; -- Frenzy
SET @SPELL_SOUL_TAP := 24619; -- Soul Tap
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,16000,19000,2100,23000,11,@SPELL_FEAR,1,0,0,0,0,5,0,0,0,0,0,0,0,'Soulflayer - In Combat - Cast Fear'),
(@ENTRY,0,1,0,0,0,100,0,10000,14000,20000,22000,11,@SPELL_SOUL_TAP,0,0,0,0,0,2,0,0,0,0,0,0,0,'Soulflayer - In Combat - Cast Soul Tap'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,@SPELL_FRENZY,1,0,0,0,0,1,0,0,0,0,0,0,0,'Soulflayer - At 30% HP - Cast Frenzy'),
(@ENTRY,0,3,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Soulflayer - At 30% HP - Say Line 0');
-- Frenzy text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s goes into a frenzy!',16,0,100,0,0,0,'Soulflayer - At 30% HP - Say Line 0');

-- Razzashi Cobra SAI
SET @ENTRY := 11373;
SET @SPELL_POISON := 24097; -- Poison
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,9000,11000,13000,11,@SPELL_POISON,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Cobra - In Combat - Cast Poison');

-- Hakkari Blood Priest SAI
SET @ENTRY := 11340;
SET @SPELL_DRAIN_LIFE := 24618; -- Drain Life
SET @SPELL_BLOOD_FUNNEL := 24617; -- Blood Funnel
SET @SPELL_DISPEL_MAGIC := 17201; -- Dispel Magic
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=24618,`spell2`=0,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,30,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Blood Priest - On Aggro - Emote Line'),
(@ENTRY,0,1,0,0,0,100,0,10000,10000,15000,15000,11,@SPELL_DISPEL_MAGIC,1,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Blood Priest - In Combat - Cast Dispel Magic'),
(@ENTRY,0,2,0,2,0,100,0,0,30,0,0,11,@SPELL_DRAIN_LIFE,1,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Blood Priest - At 30% HP - Cast Drain Life');
-- (@ENTRY,0,3,0,0,0,85,0,5000,5000,15000,18000,11,@SPELL_BLOOD_FUNNEL,1,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Blood Priest - In Combat - Cast Blood Funnel'), -- Need spellscript, heals player (target)
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'Killing you be easy!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,1,'Troll mojo da strongest mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,2,'Your skull gonna decorate our ritual altars!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,3,'I gonna make you into mojo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,4,'Feel da big bad voodoo!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,5,'My weapon be thirsty!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines'),
(@ENTRY,0,6,'You be dead soon!',12,0,100,0,0,0,'Part of the ZulGurub on aggro lines');

-- Voodoo Slave SAI
SET @ENTRY := 14883;
SET @SPELL_LIGHTNING_BLAST := 43996; -- Lightning Blast
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,0,0,100,0,3000,3000,6000,9000,11,@SPELL_LIGHTNING_BLAST,1,0,0,0,0,2,0,0,0,0,0,0,0,'Voodoo Slave - In Combat - Cast Lightning Blast');

-- Withered Mistress SAI
SET @ENTRY := 14825;
SET @SPELL_CURSE := 24673; -- Curse of Blood
SET @SPELL_DISPEL := 17201; -- Dispel Magic
SET @SPELL_VEIL_OF_SHADOW := 24674; -- Veil of Shadow
SET @SPELL_UNHOLY_FRENZY := 24672; -- Unholy Frenzy
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=3391,`spell2`=24673,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,11000,14000,22000,22000,11,@SPELL_CURSE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Withered Mistress - In Combat - Cast Curse of Blood'),
(@ENTRY,0,1,0,0,0,100,0,4000,5000,23000,26000,11,@SPELL_DISPEL,0,0,0,0,0,1,0,0,0,0,0,0,0,'Withered Mistress - In Combat - Cast Dispel Magic'),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,@SPELL_UNHOLY_FRENZY,1,0,0,0,0,1,0,0,0,0,0,0,0,'Withered Mistress - At 50% HP - Cast Unholy Frenzy'),
(@ENTRY,0,3,0,2,0,100,1,0,20,0,0,11,@SPELL_UNHOLY_FRENZY,1,0,0,0,0,1,0,0,0,0,0,0,0,'Withered Mistress - At 20% HP - Cast Unholy Frenzy');

-- Zulian Cub SAI
SET @ENTRY := 11360;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,15,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Zulian Cub - At 15% HP - Flee'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Zulian Cub - At 15% HP - Emote line 0');
-- Insert emote
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s attempts to run away in fear!',16,0,100,0,0,0,'Zulian Cub - At 15% HP - Emote line 0');

-- Gurubashi Berserker SAI
SET @ENTRY := 11352;
SET @SPELL_THUNDERCLAP := 15588; -- Thunderclap
SET @SPELL_KNOCK_AWAY := 11130; -- Knock Away
SET @SPELL_INTIMIDATING_ROAR := 16508; -- Intimidating Roar
SET @SPELL_FRENZY := 8269; -- Frenzy
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,3000,15000,15000,11,@SPELL_INTIMIDATING_ROAR,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Berserker - In Combat - Cast Intimidating Roar'),
(@ENTRY,0,1,0,0,0,100,0,10000,10000,12000,12000,11,@SPELL_KNOCK_AWAY,1,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Berserker - In Combat - Cast Knock Away'),
(@ENTRY,0,2,0,0,0,100,0,5000,5000,13000,18000,11,@SPELL_THUNDERCLAP,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Berserker - In Combat - Cast Thunderclap'),
(@ENTRY,0,3,0,2,0,100,1,0,30,0,0,11,@SPELL_FRENZY,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Berserker - At 30% HP - Cast Frenzy'),
(@ENTRY,0,4,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Gurubashi Berserker - At 30% HP - Emote Line 0');
-- Frenzy text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s goes into a frenzy!',16,0,100,0,0,0,'Gurubashi Berserker - At 30% HP - Emote Line 0');

-- Razzashi Serpent SAI
SET @ENTRY := 11371;
SET @SPELL_FATAL_BITE := 20539; -- Fatal Bite
SET @SPELL_PIERCE_ARMOR := 12097; -- Pierce Armor
SET @SPELL_TRANQUILIZING_POISON := 24002; -- Tranquilizing Poison
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,9000,12000,15000,11,@SPELL_FATAL_BITE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Serpent - In Combat - Cast Fatal Bite'),
(@ENTRY,0,1,0,0,0,100,0,9000,11000,14000,17000,11,@SPELL_TRANQUILIZING_POISON,1,0,0,0,0,5,0,0,0,0,0,0,0,'Razzashi Serpent - In Combat - Cast Tranquilizing Poison'),
(@ENTRY,0,2,0,0,0,100,0,3000,5000,11000,11000,11,@SPELL_PIERCE_ARMOR,1,0,0,0,0,2,0,0,0,0,0,0,0,'Razzashi Serpent - In Combat - Cast Pierce Armor');

-- Skullspitter Speaker SAI
SET @ENTRY := 11390;
SET @SPELL_HEAD_CRACK := 16172; -- Head Crack
SET @SPELL_WHIRLING_TRIP := 24048; -- Whirling Trip
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,16000,19000,1100,13000,11,@SPELL_HEAD_CRACK,1,0,0,0,0,2,0,0,0,0,0,0,0,'Skullspitter Speaker - In Combat - Cast Head Crack'),
(@ENTRY,0,1,0,0,0,100,0,8000,9000,7000,8000,11,@SPELL_WHIRLING_TRIP,1,0,0,0,0,2,0,0,0,0,0,0,0,'Skullspitter Speaker - In Combat - Cast Whirlwing Trip');
-- Remove old addon data
DELETE FROM `creature_addon` WHERE `guid`=49257;
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ENTRY,0,8,1,0,NULL); -- Make Skullspitter Speaker kneel

-- Bloodscalp Speaker SAI
SET @ENTRY := 11389;
SET @SPELL_DISARM := 6713; -- Disarm
SET @SPELL_REND := 16509; -- Rend
SET @SPELL_ENRAGE := 8599; -- Enrage
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,9000,11000,13000,11,@SPELL_REND,1,0,0,0,0,2,0,0,0,0,0,0,0,'Bloodscalp Speaker - In Combat - Cast Rend'),
(@ENTRY,0,1,0,0,0,100,0,9000,10000,13000,16000,11,@SPELL_DISARM,1,0,0,0,0,2,0,0,0,0,0,0,0,'Bloodscalp Speaker - In Combat - Cast Disarm');
-- Remove old addon data
DELETE FROM `creature_addon` WHERE `guid`=49288;
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ENTRY,0,8,1,0,NULL); -- Make Bloodscalp Speaker kneel

-- Vilebranch Speaker SAI
SET @ENTRY := 11391;
SET @SPELL_CLEAVE := 15284; -- Cleave
SET @SPELL_DEMORALIZING_SHOUT := 13730; -- Demoralizing Shout
SET @SPELL_ENRAGE := 8599; -- Enrage
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,@SPELL_DEMORALIZING_SHOUT,1,0,0,0,0,2,0,0,0,0,0,0,0,'Vilebranch Speaker - On Aggro - Cast Demoralizing Shout'),
(@ENTRY,0,1,0,0,0,100,0,9000,10000,1300,16000,11,@SPELL_CLEAVE,1,0,0,0,0,2,0,0,0,0,0,0,0,'Vilebranch Speaker - In Combat - Cast Cleave');
-- Remove old addon data
DELETE FROM `creature_addon` WHERE `guid`=49656;
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ENTRY,0,0,1,20,NULL); -- Make Vilebranch Speaker beg

-- Witherbark Speaker SAI
SET @ENTRY := 11388;
SET @SPELL_EARTH_SHOCK := 22885; -- Earth Shock
SET @SPELL_FROST_SHOCK := 21401; -- Frost Shock
SET @SPELL_LIGHTNING_BOLT := 15801; -- Lightning Bolt
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,@SPELL_FROST_SHOCK,0,0,0,0,0,2,0,0,0,0,0,0,0,'Witherbark Speaker - On Aggro - Cast Frost Shock'),
(@ENTRY,0,1,0,0,0,100,0,9000,10000,13000,16000,11,@SPELL_LIGHTNING_BOLT,0,0,0,0,0,2,0,0,0,0,0,0,0,'Witherbark Speaker - In Combat - Cast Lightning Bolt'),
(@ENTRY,0,2,0,0,0,100,0,5000,7000,10000,11000,11,@SPELL_EARTH_SHOCK,0,0,0,0,0,2,0,0,0,0,0,0,0,'Witherbark Speaker - In Combat - Cast Earth Shock');
-- Remove old addon data
DELETE FROM `creature_addon` WHERE `guid`=49657;
DELETE FROM `creature_template_addon` WHERE `entry`=@ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@ENTRY,0,0,1,20,NULL); -- Make Witherbark Speaker beg

-- Gurubashi Bat Rider SAI
SET @ENTRY := 14750;
SET @SPELL_DEMORALIZING_SHOUT := 23511; -- Demoralizing Shout
SET @SPELL_BATTLE_COMMAND := 5115; -- Battle Command
SET @SPELL_INFECTED_BITE := 16128; -- Infected Bite
SET @SPELL_TRASH := 3391; -- Trash
SET @SPELL_UNSTABLE_CONCOCTION := 24024; -- Unstable Concoction
SET @SPELL_THROW_LIQUID_FIRE := 23968; -- Throw Liquid Fire
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,11,@SPELL_DEMORALIZING_SHOUT,0,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Bat Rider - On Aggro - Cast Demoralizing Shout'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,25000,25000,11,@SPELL_BATTLE_COMMAND,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Bat Rider - On Combat - Cast Battle Command'),
(@ENTRY,0,2,0,0,0,100,0,6500,6500,8000,8000,11,@SPELL_INFECTED_BITE,0,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Bat Rider - On Combat - Cast Infected Bite'),
(@ENTRY,0,3,0,0,0,100,0,6000,6000,6000,6000,11,@SPELL_TRASH,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Bat Rider - On Combat - Cast Trash'),
(@ENTRY,0,4,0,2,0,100,1,0,30,0,0,11,@SPELL_UNSTABLE_CONCOCTION,4,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Bat Rider - At 30% HP - Cast Unstable Concoction'),
(@ENTRY,0,5,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Bat Rider - At 30% HP - Emote Line 0');
-- Insert emote
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s fully engulfs in flame and a maddened look appears in his eyes!',16,0,100,0,0,0,'Gurubashi Bat Rider - On Unstable Concoction cast - Emote Line 0');
-- Variable
SET @GOSSIP := 21258; -- gossip_menu.entry

-- Set actual gossip for Zanza the Restless
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP+0 WHERE `entry`=15042;

-- Insert gossip menu itself
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+0 AND `text_id`=7594;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP+0,7594);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+0 AND `text_id`=7595;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP+0,7595);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+1 AND `text_id`=7596;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP+1,7596);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+2 AND `text_id`=7597;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP+2,7597);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+3 AND `text_id`=7598;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP+3,7598);

-- Insert the gossip menu options, redirects to the next page which forms a short story by Zanza
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (@GOSSIP+0,@GOSSIP+1,@GOSSIP+2);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP+0,0,0,'I think I have heard of this magic.',1,3,@GOSSIP+1,0,0,0,''),
(@GOSSIP+1,0,0,'Arcanum? That sounds very familiar.',1,3,@GOSSIP+2,0,0,0,''),
(@GOSSIP+2,0,0,'What are the components?',1,3,@GOSSIP+3,0,0,0,'');

-- Conditions for gossip menu, the 'story' Zanza tells you becomes available when you hit exalted with Zandalar Tribe.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` BETWEEN @GOSSIP+0 AND @GOSSIP+3;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
(14,@GOSSIP+0,7594,0,5,270,3,0,0,"Only show text_id 7594 if player is neutral with Zandalar Tribe (270)"),
(14,@GOSSIP+0,7594,1,5,270,4,0,0,"Only show text_id 7594 if player is friendly with Zandalar Tribe (270)"),
(14,@GOSSIP+0,7594,2,5,270,5,0,0,"Only show text_id 7594 if player is honored with Zandalar Tribe (270)"),
(14,@GOSSIP+0,7594,3,5,270,6,0,0,"Only show text_id 7594 if player is reveved with Zandalar Tribe (270)"),
(14,@GOSSIP+0,7595,0,5,270,7,0,0,"Only show text_id 7595 if player is exalted with Zandalar Tribe (270)"),
(15,@GOSSIP+0,0,0,5,270,7,0,0,"Only show gossip option if player is exalted with Zandalar Tribe (270)"),
(15,@GOSSIP+1,0,0,5,270,7,0,0,"Only show gossip option if player is exalted with Zandalar Tribe (270)"),
(15,@GOSSIP+2,0,0,5,270,7,0,0,"Only show gossip option if player is exalted with Zandalar Tribe (270)");
-- Zanza's Potent Potables
UPDATE `quest_template` SET `RequestItemsText`='With your increased status amongst the tribe comes access to some of our more potent potables. Behold... these brews are strong in the mojo - blessed by Zanza and fit for adventurers from all walks of life!$B$BI will allow you to choose one from the three I offer; in exchange, I require one Zandalar Honor Token. Note that only the effects of a single one may course through your spirit at any given time.$B$BLet me know when you''re ready to barter!' WHERE `entry`=8243;

-- Essence Mangoes
UPDATE `quest_template` SET `RequestItemsText`='The extremely potent essence mango grows across many of the islands in the South Seas. A single mango will refresh those who eat it,both physically and mentally. If you''ve never had one,you do yourself a disservice!$B$BWe have enough of a supply here on the isle to offer you a handful in exchange for a Zandalar Honor Token. Speak with Vinchaxa if you need to learn how to get tokens; otherwise, let''s get to the business at hand!' WHERE `entry`=8196;

-- Signets of the Zandalar
UPDATE `quest_template` SET `RequestItemsText`='$N - for someone as exalted among the Zandalar as you are,I have something very special for you. Direct from our home in the South Seas... the Signets of the Zandalar! These signets are used to enhance any shoulder item you may possess. Should you seek might,mojo,or serenity - I have what you need!$B$BI ask for fifteen Zandalar Honor Tokens in exchange for your choice of one signet. If you have the tokens ready,then I''m ready to make a deal!' WHERE `entry`=8246;

-- Zandalar Headhsrinkers
UPDATE `creature` SET `position_x`=-11786.887695,`position_y`=1253.674072,`position_z`=0.959927,`orientation`=2.357351 WHERE `guid`=285;
UPDATE `creature` SET `position_x`=-11750.439453,`position_y`=1309.479858,`position_z`=2.551236,`orientation`=4.998511 WHERE `guid`=283;
UPDATE `creature` SET `MovementType`=0,`spawndist`=0 WHERE `guid` IN (285,283,284,280);

-- One missing Zandalar Headhsrinker spawn
-- This was the best guid I could find which was not in use
DELETE FROM `creature` WHERE `guid`=200615 AND `id`=14876;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES 
(200615,14876,0,1,1,14998,0,-11775.231445,1358.505981,0.776265,1.409376,1800,0,0,7326,2434,2,0,0,0);

-- Set Zandalar Enforcer's home position next to cage
UPDATE `creature` SET `position_x`=-11834.728516,`position_y`=1257.751221,`position_z`=2.153508,`orientation`=5.568032 WHERE `guid`=314;

-- Set Captured Hakkari Zealot's home position in cage
UPDATE `creature` SET `position_x`=-11838.209961,`position_y`=1256.006836,`position_z`=2.081958,`orientation`=5.776157 WHERE `guid`=2368;
DELETE FROM `creature_addon` WHERE `guid`=2368; -- Remove kneel from Zealot, happens in conversation

-- Make Exzhal face his object, he faces Captured Hakkari Zealot in conversation
UPDATE `creature` SET `orientation`=5.821840 WHERE `guid`=312;

-- Remove Circle of Binding - should be summoned in conversation between Exzhal and Captured Hakkari Zealot
DELETE FROM `gameobject` WHERE `guid`=12165;

-- Molthor SAI
SET @ENTRY := 14875;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,5,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Molthor - On Gossip Hello - Play Emote Cheer");

-- Zandalar Headshrinker: 14876
SET @GUID := 287;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11829.594727,`position_y`=1269.249512,`position_z`=1.430709,`orientation`=1.842991 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11835.188477,1288.131714,1.291541,0,0,0,100,0),
(@PATH,2,-11829.594727,1269.249512,1.430709,0,0,0,100,0),
(@PATH,3,-11823.579102,1251.472412,2.542836,0,0,0,100,0),
(@PATH,4,-11823.824219,1252.372681,2.492942,0,0,0,100,0),
(@PATH,5,-11814.262695,1246.662720,2.205406,0,0,0,100,0),
(@PATH,6,-11791.875977,1262.220703,1.538649,0,0,0,100,0),
(@PATH,7,-11766.643555,1275.045776,3.064182,0,0,0,100,0),
(@PATH,8,-11791.875977,1262.220703,1.538649,0,0,0,100,0),
(@PATH,9,-11814.262695,1246.662720,2.205406,0,0,0,100,0),
(@PATH,10,-11823.824219,1252.372681,2.492942,0,0,0,100,0),
(@PATH,11,-11823.579102,1251.472412,2.542836,0,0,0,100,0),
(@PATH,12,-11829.594727,1269.249512,1.430709,0,0,0,100,0),
(@PATH,13,-11835.188477,1288.131714,1.291541,0,0,0,100,0);

-- Zandalar Headshrinker: 14876
SET @GUID := 286;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11832.375977,`position_y`=1271.938721,`position_z`=1.459813,`orientation`=1.842991 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11837.279297,1288.950317,1.512615,0,0,0,100,0),
(@PATH,2,-11832.375977,1271.938721,1.459813,0,0,0,100,0),
(@PATH,3,-11825.054688,1251.701782,2.429044,0,0,0,100,0),
(@PATH,4,-11823.474609,1249.535645,2.501543,0,0,0,100,0),
(@PATH,5,-11813.486328,1243.423096,1.650653,0,0,0,100,0),
(@PATH,6,-11809.788086,1243.615967,1.399789,0,0,0,100,0),
(@PATH,7,-11794.386719,1257.631592,1.222988,0,0,0,100,0),
(@PATH,8,-11789.625000,1260.664429,1.522318,0,0,0,100,0),
(@PATH,9,-11764.781250,1273.674072,2.998039,0,0,0,100,0),
(@PATH,10,-11789.625000,1260.664429,1.522318,0,0,0,100,0),
(@PATH,11,-11794.386719,1257.631592,1.222988,0,0,0,100,0),
(@PATH,12,-11809.788086,1243.615967,1.399789,0,0,0,100,0),
(@PATH,13,-11813.486328,1243.423096,1.650653,0,0,0,100,0),
(@PATH,14,-11823.474609,1249.535645,2.501543,0,0,0,100,0),
(@PATH,15,-11825.054688,1251.701782,2.429044,0,0,0,100,0),
(@PATH,16,-11832.375977,1271.938721,1.459813,0,0,0,100,0),
(@PATH,17,-11837.279297,1288.950317,1.512615,0,0,0,100,0);

-- Zandalar Headshrinker: 14876
SET @GUID := 282;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11828.326172,`position_y`=1234.463989,`position_z`=0.780894,`orientation`=5.261924 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11824.317383,1227.511108,0.670448,0,0,0,100,0),
(@PATH,2,-11839.237305,1241.058105,1.519958,0,0,0,100,0),
(@PATH,3,-11846.645508,1243.729980,4.5744192,0,0,0,100,0),
(@PATH,4,-11841.049805,1260.212158,10.099603,0,0,0,100,0),
(@PATH,5,-11841.225586,1264.016235,11.571445,0,0,0,100,0),
(@PATH,6,-11842.425781,1267.932251,12.456536,0,0,0,100,0),
(@PATH,7,-11846.776367,1270.782959,14.125699,0,0,0,100,0),
(@PATH,8,-11850.278320,1271.012329,15.261613,0,0,0,100,0),
(@PATH,9,-11853.373047,1268.856567,16.700747,0,0,0,100,0),
(@PATH,10,-11855.116211,1264.943848,18.011517,0,0,0,100,0),
(@PATH,11,-11857.451172,1254.989014,21.714193,0,0,0,100,0),
(@PATH,12,-11851.708008,1250.510010,21.714193,0,0,0,100,0),
(@PATH,13,-11857.451172,1254.989014,21.714193,0,0,0,100,0),
(@PATH,14,-11855.116211,1264.943848,18.011517,0,0,0,100,0),
(@PATH,15,-11853.373047,1268.856567,16.700747,0,0,0,100,0),
(@PATH,16,-11850.278320,1271.012329,15.261613,0,0,0,100,0),
(@PATH,17,-11846.776367,1270.782959,14.125699,0,0,0,100,0),
(@PATH,18,-11842.425781,1267.932251,12.456536,0,0,0,100,0),
(@PATH,19,-11841.225586,1264.016235,11.571445,0,0,0,100,0),
(@PATH,20,-11841.049805,1260.212158,10.099603,0,0,0,100,0),
(@PATH,21,-11846.645508,1243.729980,4.5744192,0,0,0,100,0),
(@PATH,22,-11839.237305,1241.058105,1.519958,0,0,0,100,0),
(@PATH,23,-11824.317383,1227.511108,0.670448,0,0,0,100,0);

-- Hakkari Oracle: 14876
SET @GUID := 748;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11915.200195,`position_y`=-943.197021,`position_z`=52.455700,`orientation`=1.575122 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11915.455078,-884.229614,32.811508,10000,0,0,100,0),
(@PATH,2,-11915.200195,-943.197021,52.455700,0,0,0,100,0),
(@PATH,3,-11915.335938,-971.741028,62.940353,0,0,0,100,0),
(@PATH,4,-11915.582031,-997.877869,67.938759,0,0,0,100,0),
(@PATH,5,-11915.845703,-1047.903076,69.805588,0,0,0,100,0),
(@PATH,6,-11915.582031,-997.877869,67.938759,0,0,0,100,0),
(@PATH,7,-11915.335938,-971.741028,62.940353,0,0,0,100,0),
(@PATH,8,-11915.200195,-943.197021,52.455700,0,0,0,100,0);

-- Hakkari Oracle SAI
SET @ENTRY := 11346;
SET @SPELL_EARTH_SHOCK := 15501; -- Earth Shock
SET @SPELL_CHAIN_LIGHTNING := 16006; -- Chain Lightning
SET @SPELL_HEALING_WAVE := 15982; -- Healing Wave
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=0,`spell2`=0,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,1000,12000,15000,11,@SPELL_CHAIN_LIGHTNING,0,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Oracle - In Combat - Cast Chain Lightning'),
(@ENTRY,0,1,0,0,0,100,0,4000,5000,19000,20000,11,@SPELL_EARTH_SHOCK,0,0,0,0,0,2,0,0,0,0,0,0,0,'Hakkari Oracle - In Combat - Cast Earth Shock'),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,@SPELL_HEALING_WAVE,1,0,0,0,0,1,0,0,0,0,0,0,0,'Hakkari Oracle - At 50% HP - Cast Healing Wave');

-- Gurubashi Warrior SAI
SET @ENTRY := 11355;
SET @SPELL_KNOCKDOWN := 11428; -- Knockdown
SET @SPELL_ENRAGE := 8599; -- Enrage
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=0,`spell2`=0,`spell3`=0,`spell4`=0,`mechanic_immune_mask`=1 WHERE `entry`=@ENTRY; -- Immune to charm effects (mind control)
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4000,12000,15000,11,@SPELL_KNOCKDOWN,0,0,0,0,0,2,0,0,0,0,0,0,0,'Gurubashi Warrior - In Combat - Cast Knockdown'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,@SPELL_ENRAGE,1,0,0,0,0,1,0,0,0,0,0,0,0,'Gurubashi Warrior - At 30% HP - Cast Enrage'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Gurubashi Warrior - At 30% HP - Say Line 0');
-- Enrage text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,'%s becomes enraged!',16,0,100,0,0,0,'Gurubashi Warrior - At 30% HP - Say Line 0');

-- High Priestess Hai'watna SAI
SET @ENTRY := 11383;
SET @SPELL_SHADOW_BOLT_VOLLEY := 14887; -- Shadow Bolt Volley
SET @SPELL_HEAL := 15586; -- Heal
UPDATE `creature_template` SET `AIName`='SmartAI',`spell1`=0,`spell2`=0,`spell3`=0,`spell4`=0 WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,1000,12000,15000,11,@SPELL_SHADOW_BOLT_VOLLEY,0,0,0,0,0,2,0,0,0,0,0,0,0,'High Priestess Haiwatna - In Combat - Cast Shadow Bolt Volley'),
(@ENTRY,0,1,0,0,0,100,0,20000,25000,29000,31000,11,@SPELL_HEAL,0,0,0,0,0,1,0,0,0,0,0,0,0,'High Priestess Haiwatna - In Combat - Cast Heal');
-- All emotes, mostly ONESHOT_TALK
DELETE FROM `creature_addon` WHERE `guid` IN (49115,49114,49742,49741,49754,49120,49121,49122,49738,49105,49104,49737,91479,91478,91511,91512,91465,91464,49702,49701,91477,91476,91495,91496,49703,49704,91491,91490,91442,91443,49753,49314,49313,49310,49784,49785,49778,49779,49780,51459,51456,51457,51966,51965,49273,49272,49786,49787,49280,49281,49279,49799,49798,49797,49796,49795,49793,49794);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(49115,0,0,0,0,1,''),(49114,0,0,0,0,1,''),(49742,0,0,0,0,1,''),(49741,0,0,0,0,1,''),(49754,0,0,0,0,1,''),(49120,0,0,0,0,1,''),
(49121,0,0,0,0,1,''),(49122,0,0,0,0,1,''),(49738,0,0,0,0,1,''),(49105,0,0,0,0,1,''),(49104,0,0,0,0,1,''),(49737,0,0,0,0,1,''),
(91479,0,0,0,0,1,''),(91478,0,0,0,0,1,''),(91511,0,0,0,0,1,''),(91512,0,0,0,0,1,''),(91465,0,0,0,0,1,''),(91464,0,0,0,0,1,''),
(91496,0,0,0,0,1,''),(91495,0,0,0,0,1,''),(91476,0,0,0,0,1,''),(91477,0,0,0,0,1,''),(49701,0,0,0,0,1,''),(49702,0,0,0,0,1,''),
(49703,0,0,0,0,1,''),(49704,0,0,0,0,1,''),(91491,0,0,0,0,1,''),(91490,0,0,0,0,1,''),(91442,0,0,0,0,1,''),(91443,0,0,0,0,1,''),
(49784,0,0,0,0,1,''),(49785,0,0,0,0,1,''),(49778,0,0,0,0,1,''),(49779,0,0,0,0,1,''),(49780,0,0,0,0,1,''),(51459,0,0,0,0,1,''),
(51456,0,0,0,0,1,''),(51457,0,0,0,0,1,''),(51966,0,0,0,0,1,''),(51965,0,0,0,0,1,''),(49273,0,0,0,0,1,''),(49272,0,0,0,0,1,''),
(49786,0,0,0,0,1,''),(49787,0,0,0,0,1,''),(49280,0,0,0,0,1,''),(49281,0,0,0,0,1,''),(49279,0,0,0,0,1,''),(49799,0,0,0,0,1,''),
(49798,0,0,0,0,1,''),(49797,0,0,0,0,1,''),(49753,0,0,0,0,1,''),(49314,0,0,8,0,0,''),(49313,0,0,8,0,0,''),(49310,0,0,0,0,1,''),
(49794,0,0,0,0,333,''),(49796,0,0,0,0,333,''),(49795,0,0,0,0,333,''),(49793,0,0,0,0,333,'');

-- Set correct positions
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11960.496094,`position_y`=-1558.178711,`position_z`=41.212128,`orientation`=2.233450 WHERE `guid`=49097; -- Razzashi Serpent
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11971.704102,`position_y`=-1549.167236,`position_z`=41.434246,`orientation`=5.631021 WHERE `guid`=49096; -- Razzashi Adder
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-12010.169922,`position_y`=-1485.053101,`position_z`=79.251274,`orientation`=5.129887 WHERE `guid`=49121; -- Gurubashi Headhunter
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-12006.965820,`position_y`=-1484.825195,`position_z`=79.190865,`orientation`=4.628802 WHERE `guid`=49122; -- Hakkari Witch Doctor
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11981.070313,`position_y`=-1475.364746,`position_z`=79.736366,`orientation`=0.874606 WHERE `guid`=49193; -- Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11988.361328,`position_y`=-1621.758301,`position_z`=33.236633,`orientation`=2.167352 WHERE `guid`=49104; -- Gurubashi Axe Thrower
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-12054.768555,`position_y`=-1685.999512,`position_z`=43.074993,`orientation`=1.606618 WHERE `guid`=49752; -- Hakkari Priest
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11929.511719,`position_y`=-1844.217651,`position_z`=57.701702,`orientation`=0.172101 WHERE `guid`=49056; -- Mad Servant
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11596.799805,`position_y`=-1757.020020,`position_z`=39.871101,`orientation`=5.515240 WHERE `guid`=91464; -- Gurubashi Axe Thrower
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11649.000000,`position_y`=-1568.680054,`position_z`=39.392300,`orientation`=4.206240 WHERE `guid`=91476; -- Gurubashi Axe Thrower
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=0.382538 WHERE `guid` IN (51396,51395); -- Gurubashi Berserker
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=1.396260 WHERE `guid`=49120; -- Gurubashi Headhunter
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=5.497790 WHERE `guid`=49105; -- Gurubashi Axe Thrower
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=3.388120 WHERE `guid`=49059; -- Mad Servant
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=0.000000 WHERE `guid`=49060; -- Mad Servant
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=2.460910 WHERE `guid`=49285; -- Razzashi Raptor
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`orientation`=5.284594 WHERE `guid`=51576; -- Razzashi Raptor
UPDATE `creature` SET `MovementType`=0,`spawndist`=0 WHERE `guid` IN (51382,51375,51381,51383,51372,51370,51369,49359,49361,49362,49218,49219,49234,49235,49259,49260,91463,91462,91461,91459,91460,91439,49140,49139);

-- Double spawned creatures. Removing addon data to prevent errors
DELETE FROM `creature` WHERE `guid`=49806 AND `id`=11360; 
DELETE FROM `creature_addon` WHERE `guid`=49806;
DELETE FROM `creature` WHERE `guid`=49056 AND `id`=15111;
DELETE FROM `creature_addon` WHERE `guid` IN (15111,49056);
DELETE FROM `creature` WHERE `guid` IN (49221,49220) AND `id` IN (14880);
DELETE FROM `creature_addon` WHERE `guid` IN (49221,49220);
DELETE FROM `creature` WHERE `guid` IN (49142,49141,49149) AND `id` IN (14750);
DELETE FROM `creature_addon` WHERE `guid` IN (49142,49141,49149);
DELETE FROM `creature` WHERE `guid` IN (49138,49137) AND `id` IN (11368);
DELETE FROM `creature_addon` WHERE `guid` IN (49138,49137);

-- Missing spawns
-- Hakkari Priest
DELETE FROM `creature` WHERE `guid`=200616 AND `id`=11830;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES 
(200616,11830,309,1,1,11758,0,-11942.391602,-1640.220825,42.506130,2.932328,7200,0,0,17094,12170,0,0,0,0);
-- Razzashi Adder
DELETE FROM `creature` WHERE `guid` IN (200617,200618) AND `id` IN (11372);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(200617,11372,309,1,1,15150,0,-11997.982422,-1650.174438,34.328613,1.432994,7200,0,0,15260,0,2,0,0,0),
(200618,11372,309,1,1,15150,0,-11986.670898,-1651.959961,33.775238,1.432994,7200,0,0,15260,0,2,0,0,0);
-- Gurubashi Blood Drinker (this guid was used by a double-spawned NPC)
DELETE FROM `creature` WHERE `guid` IN (200619,200620) AND `id` IN (11353);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(200619,11353,309,1,1,11080,0,-11609.610352,-1631.155518,39.957348,3.214375,7200,0,0,18312,0,0,0,0,0),
(200620,11353,309,1,1,11081,0,-11608.893555,-1609.535156,40.082027,2.992088,7200,0,0,18312,0,0,0,0,0);

-- Zulian Panther pathing: 11365
SET @GUID := 49320;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11626.807617,`position_y`=-1701.435425,`position_z`=38.823635 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11626.807617,-1701.435425,38.823635,0,1,0,100,0),
(@PATH,2,-11627.707031,-1727.870483,40.333164,0,1,0,100,0),
(@PATH,3,-11629.434570,-1760.955322,38.754513,0,1,0,100,0),
(@PATH,4,-11653.967773,-1807.740723,43.086334,0,1,0,100,0),
(@PATH,5,-11629.434570,-1760.955322,38.754513,0,1,0,100,0),
(@PATH,6,-11627.707031,-1727.870483,40.333164,0,1,0,100,0),
(@PATH,7,-11630.115234,-1687.330566,39.997681,0,1,0,100,0),
(@PATH,8,-11634.075195,-1596.245239,39.645630,0,0,0,100,0);

-- Make the two other panthers follow 49320 (leader)
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49320,49319,49318);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49320;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49320,49320,0,0,2),
(49320,49319,3,225,2),
(49320,49318,3,90,2);

-- Hakkari Priest pathing: 11830
SET @GUID := 49752; -- Hakkari Priest leads
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12054.799805,`position_y`=-1686.000000,`position_z`=43.075001 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12059.555664,-1691.853027,43.423206,0,0,0,100,0),
(@PATH,2,-12059.799805,-1701.031494,44.344296,0,0,0,100,0),
(@PATH,3,-12053.253906,-1720.945435,48.184185,0,0,0,100,0),
(@PATH,4,-12043.537109,-1733.467651,51.260815,0,0,0,100,0),
(@PATH,5,-12034.110352,-1742.581421,53.809147,0,0,0,100,0),
(@PATH,6,-12043.537109,-1733.467651,51.260815,0,0,0,100,0),
(@PATH,7,-12053.253906,-1720.945435,48.184185,0,0,0,100,0),
(@PATH,8,-12059.799805,-1701.031494,44.344296,0,0,0,100,0),
(@PATH,9,-12059.555664,-1691.853027,43.423206,0,0,0,100,0),
(@PATH,10,-12058.425781,-1681.930420,42.665642,0,0,0,100,0),
(@PATH,11,-12042.879883,-1650.618164,40.627056,0,0,0,100,0),
(@PATH,12,-12034.342773,-1643.789551,39.795006,0,0,0,100,0),
(@PATH,13,-12009.803711,-1642.433350,35.999470,0,0,0,100,0),
(@PATH,14,-11992.014648,-1646.609253,34.173782,0,0,0,100,0),
(@PATH,15,-11962.285156,-1644.002441,36.924133,0,0,0,100,0),
(@PATH,16,-11951.910156,-1638.948730,38.838421,0,0,0,100,0),
(@PATH,17,-11949.411133,-1628.985229,39.359371,0,0,0,100,0),
(@PATH,18,-11946.486328,-1619.823486,41.083221,0,0,0,100,0),
(@PATH,19,-11947.083984,-1614.833984,39.48743,0,0,0,100,0),
(@PATH,20,-11943.375000,-1576.649292,38.514889,0,0,0,100,0),
(@PATH,21,-11942.552734,-1568.465454,41.119324,0,0,0,100,0),
(@PATH,23,-11941.658203,-1559.485596,39.735973,0,0,0,100,0),
(@PATH,24,-11938.247070,-1554.563354,39.750710,0,0,0,100,0),
(@PATH,25,-11918.897461,-1550.056152,38.295830,0,0,0,100,0),
(@PATH,26,-11903.013672,-1537.574463,31.093979,0,0,0,100,0),
(@PATH,27,-11900.709961,-1530.430054,28.203531,10000,0,0,100,0),
(@PATH,28,-11903.013672,-1537.574463,31.093979,0,0,0,100,0),
(@PATH,29,-11918.897461,-1550.056152,38.295830,0,0,0,100,0),
(@PATH,30,-11938.247070,-1554.563354,39.750710,0,0,0,100,0),
(@PATH,31,-11941.658203,-1559.485596,39.735973,0,0,0,100,0),
(@PATH,32,-11943.507813,-1569.661377,40.848972,0,0,0,100,0),
(@PATH,33,-11943.375000,-1576.649292,38.514889,0,0,0,100,0),
(@PATH,34,-11947.083984,-1614.833984,39.48743,0,0,0,100,0),
(@PATH,36,-11946.486328,-1619.823486,41.083221,0,0,0,100,0),
(@PATH,37,-11949.411133,-1628.985229,39.359371,0,0,0,100,0),
(@PATH,38,-11951.910156,-1638.948730,38.838421,0,0,0,100,0),
(@PATH,39,-11962.285156,-1644.002441,36.924133,0,0,0,100,0),
(@PATH,40,-11992.014648,-1646.609253,34.173782,0,0,0,100,0),
(@PATH,41,-12009.803711,-1642.433350,35.999470,0,0,0,100,0),
(@PATH,42,-12034.342773,-1643.789551,39.795006,0,0,0,100,0),
(@PATH,43,-12042.879883,-1650.618164,40.627056,0,0,0,100,0),
(@PATH,44,-12058.425781,-1681.930420,42.665642,0,0,0,100,0),
(@PATH,45,-12059.555664,-1691.853027,43.423206,0,0,0,100,0),
(@PATH,46,-12059.799805,-1701.031494,44.344296,0,0,0,100,0),
(@PATH,47,-12053.253906,-1720.945435,48.184185,0,0,0,100,0),
(@PATH,48,-12043.537109,-1733.467651,51.260815,0,0,0,100,0),
(@PATH,49,-12034.110352,-1742.581421,53.809147,0,0,0,100,0),
(@PATH,50,-12043.537109,-1733.467651,51.260815,0,0,0,100,0),
(@PATH,51,-12053.253906,-1720.945435,48.184185,0,0,0,100,0),
(@PATH,52,-12059.799805,-1701.031494,44.344296,0,0,0,100,0),
(@PATH,53,-12059.555664,-1691.853027,43.423206,0,0,0,100,0);

-- Make the Gurubashi Axe Thrower follow the Hakkari Priest
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49752,49751);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49752;
DELETE FROM `creature_formations` WHERE `memberGUID`=49751;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49752,49752,0,0,2),
(49752,49751,3,200,2);

-- Note: those should go faster but it's not possible. The `move_flag` column is limited!
-- Razzashi Skitterer pathing: 14880
SET @GUID := 49763;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12121.770508,`position_y`=-1781.804077,`position_z`=80.251060 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12121.770508,-1781.804077,80.251060,1000,1,0,100,0),
(@PATH,2,-12107.982422,-1754.442871,81.616844,1000,1,0,100,0),
(@PATH,3,-12106.101563,-1742.353638,80.255928,1000,1,0,100,0),
(@PATH,4,-12126.319336,-1719.959229,80.978317,1000,1,0,100,0),
(@PATH,5,-12107.717773,-1699.646362,81.238678,1000,1,0,100,0),
(@PATH,6,-12133.279297,-1669.547363,82.450058,1000,1,0,100,0),
(@PATH,7,-12138.102539,-1669.364258,85.529083,1000,1,0,100,0),
(@PATH,8,-12161.593750,-1692.840698,95.234123,1000,1,0,100,0),
(@PATH,9,-12165.793945,-1692.938721,97.776299,1000,1,0,100,0),
(@PATH,10,-12191.083008,-1669.304321,111.627693,1000,1,0,100,0),
(@PATH,11,-12195.055664,-1669.150146,113.257439,1000,1,0,100,0),
(@PATH,12,-12215.911133,-1692.359497,122.447922,1000,1,0,100,0),
(@PATH,13,-12220.180664,-1692.659546,124.706985,1000,1,0,100,0),
(@PATH,14,-12221.366211,-1670.207275,126.270119,1000,1,0,100,0),
(@PATH,15,-12215.528320,-1669.463379,122.749390,1000,1,0,100,0),
(@PATH,16,-12183.934570,-1689.368286,106.393227,1000,1,0,100,0),
(@PATH,17,-12164.437500,-1681.142578,95.410744,1000,1,0,100,0),
(@PATH,18,-12145.658203,-1670.292603,89.038513,1000,1,0,100,0),
(@PATH,19,-12134.544922,-1682.580444,82.284355,1000,1,0,100,0),
(@PATH,20,-12126.685547,-1692.754028,81.543770,1000,1,0,100,0),
(@PATH,21,-12108.330078,-1725.148071,80.870346,1000,1,0,100,0),
(@PATH,22,-12123.732422,-1739.145386,80.321144,1000,1,0,100,0),
(@PATH,23,-12111.660156,-1760.424561,80.601723,1000,1,0,100,0);

-- Make them follow each other
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49763,49762);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49763;
DELETE FROM `creature_formations` WHERE `memberGUID`=49762;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49763,49763,0,0,2),
(49763,49762,3,180,2);

-- Gurubashi Bat Rider pathing: 14750
SET @GUID := 49130;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12244.3,`position_y`=-1422.24,`position_z`=130.774 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12274.899414,-1414.912354,130.601059,0,0,0,100,0),
(@PATH,2,-12295.537109,-1443.068726,130.600327,0,0,0,100,0),
(@PATH,3,-12292.955078,-1465.422241,130.604462,0,0,0,100,0),
(@PATH,4,-12263.731445,-1485.708252,130.600510,0,0,0,100,0),
(@PATH,5,-12236.019531,-1462.886475,130.611526,0,0,0,100,0),
(@PATH,6,-12216.861328,-1455.598511,130.600693,0,0,0,100,0),
(@PATH,7,-12219.386719,-1437.946533,130.600693,0,0,0,100,0);

-- Following bats, leader is Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49130,49129,49123,49128,49127,49124,49125);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49130;
DELETE FROM `creature_formations` WHERE `memberGUID` IN (49129,49123,49128,49127,49124,49125);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49130,49130,0,0,2),
(49130,49129,6,0,2),
(49130,49123,6,60,2),
(49130,49128,6,120,2),
(49130,49127,6,180,2),
(49130,49124,6,240,2),
(49130,49125,6,300,2);

-- Gurubashi Bat Rider pathing: 14750
SET @GUID := 49185;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12277.5,`position_y`=-1444.66,`position_z`=130.725 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12279.888672,-1448.802124,130.600830,0,0,0,100,0),
(@PATH,2,-12274.909180,-1430.427979,130.601120,0,0,0,100,0),
(@PATH,3,-12244.499023,-1423.547974,130.601120,0,0,0,100,0),
(@PATH,4,-12224.520508,-1436.454224,130.601135,0,0,0,100,0),
(@PATH,5,-12212.955078,-1451.349609,130.600372,0,0,0,100,0),
(@PATH,6,-12233.332031,-1465.460449,130.600296,0,0,0,100,0),
(@PATH,7,-12255.265625,-1464.750000,130.600754,0,0,0,100,0);

-- Following bats, leader is Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49185,49167,49157,49156,49158);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49185;
DELETE FROM `creature_formations` WHERE `memberGUID` IN (49167,49157,49156,49158);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49185,49185,0,0,2),
(49185,49167,6,0,2),
(49185,49157,6,90,2),
(49185,49156,6,190,2),
(49185,49158,6,270,2);

-- Gurubashi Bat Rider pathing: 14750
SET @GUID := 49189;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12170.500000,`position_y`=-1467.250000,`position_z`=130.725006 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12131.439453,-1464.801758,130.600494,0,0,0,100,0),
(@PATH,2,-12170.894531,-1464.666138,130.602112,0,0,0,100,0),
(@PATH,3,-12196.201172,-1460.112305,131.453781,0,0,0,100,0),
(@PATH,4,-12211.844727,-1477.258057,130.900391,0,0,0,100,0),
(@PATH,5,-12196.201172,-1460.112305,131.453781,0,0,0,100,0),
(@PATH,6,-12170.894531,-1464.666138,130.602112,0,0,0,100,0);

-- Following bats, leader is Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49189,49188,49187,49186);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49189;
DELETE FROM `creature_formations` WHERE `memberGUID` IN (49188,49187,49186);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49189,49189,0,0,2),
(49189,49188,6,0,2),
(49189,49187,6,120,2),
(49189,49186,6,240,2);

-- Gurubashi Bat Rider pathing: 14750
SET @GUID := 49155;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12152.967773,`position_y`=-1487.547241,`position_z`=130.881485 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12186.473633,-1478.295776,130.600891,0,0,0,100,0),
(@PATH,2,-12206.798828,-1462.722656,131.283966,0,0,0,100,0),
(@PATH,3,-12195.971680,-1452.815918,130.631592,0,0,0,100,0),
(@PATH,4,-12175.709961,-1458.300659,130.601974,0,0,0,100,0),
(@PATH,5,-12155.517578,-1455.088135,130.601059,0,0,0,100,0),
(@PATH,6,-12136.959961,-1455.091919,130.601059,0,0,0,100,0),
(@PATH,7,-12125.050781,-1468.265625,130.600433,0,0,0,100,0),
(@PATH,8,-12150.831055,-1484.939819,130.655197,0,0,0,100,0);

-- Following bats, leader is Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49155,49154,49151,49150);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49155;
DELETE FROM `creature_formations` WHERE `memberGUID` IN (49154,49151,49150);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49155,49155,0,0,2),
(49155,49154,6,0,2),
(49155,49151,6,120,2),
(49155,49150,6,240,2);

-- Gurubashi Bat Rider pathing: 14750
SET @GUID := 49147;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12055.000000,`position_y`=-1443.459961,`position_z`=130.014999 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12072.780273,-1448.517334,130.204498,0,0,0,100,0),
(@PATH,2,-12098.666992,-1451.737915,130.774368,20000,0,0,100,0), -- Wait 20 seconds
(@PATH,3,-12072.780273,-1448.517334,130.204498,0,0,0,100,0),
(@PATH,4,-12056.207031,-1442.100464,130.156296,0,0,0,100,0);

-- Following bats, leader is Gurubashi Bat Rider
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49147,49143,49144,49145,49146);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49147;
DELETE FROM `creature_formations` WHERE `memberGUID` IN (49143,49144,49145,49146);
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49147,49147,0,0,2),
(49147,49143,6,90,2),
(49147,49144,6,180,2),
(49147,49145,6,270,2),
(49147,49146,6,360,2);

-- Bloodseeker Bat pathing: 11368
-- This one is done in move_flag run, makes it look better. Still looks horrible though =/
SET @GUID := 91555;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-12300.099609,`position_y`=-1370.160034,`position_z`=144.891006,`orientation`=5.4159 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-12280.832031,-1391.850098,149.030792,0,1,0,100,0),
(@PATH,2,-12279.230469,-1431.357666,150.007248,0,1,0,100,0),
(@PATH,3,-12263.227539,-1460.766235,147.386337,0,1,0,100,0),
(@PATH,4,-12231.422852,-1469.367920,148.652176,0,1,0,100,0),
(@PATH,5,-12220.394531,-1434.480347,151.252106,0,1,0,100,0),
(@PATH,6,-12246.502930,-1412.346069,152.635223,0,1,0,100,0);
DELETE FROM `creature_text` WHERE `entry`=36627 AND `groupid`=9;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(36627,9,0,'|TInterface\Icons\ability_creature_disease_02.blp:16|tYou have |cFF00FF00Mutated Infection!|r',42,0,0,0,0,0,'Rotface - EMOTE_MUTATED_INFECTION');
DELETE FROM `spell_dbc` WHERE `id`=18350;
INSERT INTO `spell_dbc` (`id`,`Effect1`,`EffectImplicitTargetA1`,`Comment`) VALUES
(18350,3,1,'Soul Preserver trinket spell');

DELETE FROM `spell_script_names` WHERE `spell_id`=18350;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(18350,'spell_gen_soul_preserver');
-- Fix ICC 25 man loot:
UPDATE `creature_template` SET `lootid`=100002 WHERE `entry` IN (37655,38031,38057,38058,38059,38062,38063,38072,38073,38074,38075,38076,38098,38099,38100,38101,38102,38108,38110,38139,38197,38198,38258,38418,38445,38446,38479,38480,38481);
-- Fix itemid in the grey reference
UPDATE `reference_loot_template` SET `item`=33364 WHERE `entry`=35063 AND `item`=33346;
/* NPC entries:
14902 - Jin'rokh the Breaker 	- 6321			- Warriors and paladins
14903 - Al'tabim the All-Seeing - 6322			- Mages, warlocks and priests
14904 - Maywiki of Zuldazar 	- 6341			- Shamans and druids
14905 - Falthir the Sightless 	- @GOSSIP		- Rogues and hunters
 */
 
/* TO DO:
 * There is one missing condition. When you get an upgrade of one of the necklaces, you lose the necklace of the previous quest. (the quest always takes it) But that also makes the conditions meet and it will show the gossip that you lost a necklace.
 * There is currently no way to do this through conditions, so whenever you read this and think it's possible, feel free to!
 */
 
-- Vars
SET @GOSSIP = 21262; -- gossip_menu.entry - need 10
SET @SUB_PALADIN := @GOSSIP+1; -- Menu id for Paladins
SET @SUB_WARRIOR := @GOSSIP+2; -- Menu id for Warriors
SET @SUB_PRIEST := @GOSSIP+3; -- Menu id for Priests
SET @SUB_WARLOCK := @GOSSIP+4; -- Menu id for Warlocks
SET @SUB_MAGE := @GOSSIP+5; -- Menu id for Mages
SET @SUB_SHAMAN := @GOSSIP+6; -- Menu id for Shamans
SET @SUB_DRUID := @GOSSIP+7; -- Menu id for Druids
SET @SUB_ROGUE := @GOSSIP+8; -- Menu id for Rogues
SET @SUB_HUNTER := @GOSSIP+9; -- Menu id for Hunters
 
-- Insert gossip options itself
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP+0 AND `text_id`=7556;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@GOSSIP+0,7556);

-- Set the gossip_menu for Falthir the Sightless
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP+0 WHERE `entry`=14905; -- Falthir the Sightless

-- Actual menu
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6321,6322,6341,@GOSSIP,@SUB_PALADIN,@SUB_WARRIOR,@SUB_PRIEST,@SUB_WARLOCK,@SUB_MAGE,@SUB_SHAMAN,@SUB_DRUID,@SUB_ROGUE,@SUB_HUNTER);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
-- Main menu for Jin'rokh
(6321,0,0,"Jin\'rokh, I need assistance in recovering a piece of my Freethinker's outfit.",1,3,@SUB_PALADIN,0,0,0,''), -- Main menu option for Paladins
(6321,1,0,"Jin\'rokh, I need assistance in recovering a piece of my Vindicator's outfit.",1,3,@SUB_WARRIOR,0,0,0,''), -- Main menu option for Warriors
-- PALADIN
(@SUB_PALADIN,0,0,"I seem to have misplaced my Zandalar Freethinker's Armguards. Can you help?",1,3,0,0,0,0,''),
(@SUB_PALADIN,1,0,"I seem to have misplaced my Zandalar Freethinker's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_PALADIN,2,0,"I seem to have misplaced my Zandalar Freethinker's Breastplate. Can you help?",1,3,0,0,0,0,''),
(@SUB_PALADIN,3,0,"I seem to have misplaced my Hero's Brand. Can you help?",1,3,0,0,0,0,''),
(@SUB_PALADIN,4,0,"I seem to have misplaced my Heathen's Brand. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_PALADIN,5,0,"I seem to have misplaced my Heathen's Brand. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_PALADIN,6,0,"I seem to have misplaced my Heathen's Brand. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- WARRIOR
(@SUB_WARRIOR,0,0,"I seem to have misplaced my Zandalar Vindicator's Armguards. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARRIOR,1,0,"I seem to have misplaced my Zandalar Vindicator's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARRIOR,2,0,"I seem to have misplaced my Zandalar Vindicator's Breastplate. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARRIOR,3,0,"I seem to have misplaced my Rage of Mugamba. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARRIOR,4,0,"I seem to have misplaced my Strength of Mugamba. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_WARRIOR,5,0,"I seem to have misplaced my Strength of Mugamba. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_WARRIOR,6,0,"I seem to have misplaced my Strength of Mugamba. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- Main menu for Al'tabim
(6322,0,0,"Al\'tabim, I need assistance in recovering a piece of my Confessor's outfit.",1,3,@SUB_PRIEST,0,0,0,''), -- Main menu option for Priests
(6322,1,0,"Al\'tabim, I need assistance in recovering a piece of my Demoniac's outfit.",1,3,@SUB_WARLOCK,0,0,0,''), -- Main menu option for Warlocks
(6322,2,0,"Al\'tabim, I need assistance in recovering a piece of my Illusionist's outfit.",1,3,@SUB_MAGE,0,0,0,''), -- Main menu option for Mages
-- PRIEST
(@SUB_PRIEST,0,0,"I seem to have misplaced my Zandalar Confessor's Bindings. Can you help?",1,3,0,0,0,0,''),
(@SUB_PRIEST,1,0,"I seem to have misplaced my Zandalar Confessor's Mantle. Can you help?",1,3,0,0,0,0,''),
(@SUB_PRIEST,2,0,"I seem to have misplaced my Zandalar Confessor's Wraps. Can you help?",1,3,0,0,0,0,''),
(@SUB_PRIEST,3,0,"I seem to have misplaced my All-Seeing Eye of Zuldazar. Can you help?",1,3,0,0,0,0,''),
(@SUB_PRIEST,4,0,"I seem to have misplaced my Eye of Zuldazar. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_PRIEST,5,0,"I seem to have misplaced my Eye of Zuldazar. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_PRIEST,6,0,"I seem to have misplaced my Eye of Zuldazar. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- WARLOCK
(@SUB_WARLOCK,0,0,"I seem to have misplaced my Zandalar Demoniac's Robe. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARLOCK,1,0,"I seem to have misplaced my Zandalar Demoniac's Mantle. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARLOCK,2,0,"I seem to have misplaced my Zandalar Demoniac's Wraps. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARLOCK,3,0,"I seem to have misplaced my Kezan's Unstoppable Taint. Can you help?",1,3,0,0,0,0,''),
(@SUB_WARLOCK,4,0,"I seem to have misplaced my Kezan's Taint. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_WARLOCK,5,0,"I seem to have misplaced my Kezan's Taint. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_WARLOCK,6,0,"I seem to have misplaced my Kezan's Taint. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- MAGE
(@SUB_MAGE,0,0,"I seem to have misplaced my Zandalar Illusionist's Robe. Can you help?",1,3,0,0,0,0,''),
(@SUB_MAGE,1,0,"I seem to have misplaced my Zandalar Illusionist's Mantle. Can you help?",1,3,0,0,0,0,''),
(@SUB_MAGE,2,0,"I seem to have misplaced my Zandalar Illusionist's Wraps. Can you help?",1,3,0,0,0,0,''),
(@SUB_MAGE,3,0,"I seem to have misplaced my Jewel of Kajaro. Can you help?",1,3,0,0,0,0,''),
(@SUB_MAGE,4,0,"I seem to have misplaced my Pebble of Kajaro. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_MAGE,5,0,"I seem to have misplaced my Pebble of Kajaro. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_MAGE,6,0,"I seem to have misplaced my Pebble of Kajaro. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- Main menu for Maywiki
(6341,0,0,"Maywiki, I need assistance in recovering a piece of my Augur's outfit.",1,3,@SUB_SHAMAN,0,0,0,''), -- Main menu option for Shamans
(6341,1,0,"Maywiki, I need assistance in recovering a piece of my Haruspex's outfit.",1,3,@SUB_DRUID,0,0,0,''), -- Main menu option for Druids
-- SHAMAN
(@SUB_SHAMAN,0,0,"I seem to have misplaced my Zandalar Augur's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_SHAMAN,1,0,"I seem to have misplaced my Zandalar Augur's Bracers. Can you help?",1,3,0,0,0,0,''),
(@SUB_SHAMAN,2,0,"I seem to have misplaced my Zandalar Augur's Hauberk. Can you help?",1,3,0,0,0,0,''),
(@SUB_SHAMAN,3,0,"I seem to have misplaced my Unmarred Vision of Voodress. Can you help?",1,3,0,0,0,0,''),
(@SUB_SHAMAN,4,0,"I seem to have misplaced my Vision of Voodress. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_SHAMAN,5,0,"I seem to have misplaced my Vision of Voodress. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_SHAMAN,6,0,"I seem to have misplaced my Vision of Voodress. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- DRUID
(@SUB_DRUID,0,0,"I seem to have misplaced my Zandalar Haruspex's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_DRUID,1,0,"I seem to have misplaced my Zandalar Haruspex's Bracers. Can you help?",1,3,0,0,0,0,''),
(@SUB_DRUID,2,0,"I seem to have misplaced my Zandalar Haruspex's Tunic. Can you help?",1,3,0,0,0,0,''),
(@SUB_DRUID,3,0,"I seem to have misplaced my Pristine Enchanted South Seas Kelp. Can you help?",1,3,0,0,0,0,''),
(@SUB_DRUID,4,0,"I seem to have misplaced my Enchanted South Seas Kelp. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_DRUID,5,0,"I seem to have misplaced my Enchanted South Seas Kelp. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_DRUID,6,0,"I seem to have misplaced my Enchanted South Seas Kelp. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- Main menu for Falthir
(@GOSSIP,0,0,"Falthir, I need assistance in recovering a piece of my Madcap's outfit.",1,3,@SUB_ROGUE,0,0,0,''), -- Main menu option for Rogues
(@GOSSIP,1,0,"Falthir, I need assistance in recovering a piece of my Predator's outfit.",1,3,@SUB_HUNTER,0,0,0,''), -- Main menu option for Hunters
-- ROGUE
(@SUB_ROGUE,0,0,"I seem to have misplaced my Zandalar Madcap's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_ROGUE,1,0,"I seem to have misplaced my Zandalar Madcap's Bracers. Can you help?",1,3,0,0,0,0,''),
(@SUB_ROGUE,2,0,"I seem to have misplaced my Zandalar Madcap's Tunic. Can you help?",1,3,0,0,0,0,''),
(@SUB_ROGUE,3,0,"I seem to have misplaced my Zandalarian Shadow Mastery Talisman. Can you help?",1,3,0,0,0,0,''),
(@SUB_ROGUE,4,0,"I seem to have misplaced my Zandalarian Shadow Talisman. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_ROGUE,5,0,"I seem to have misplaced my Zandalarian Shadow Talisman. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_ROGUE,6,0,"I seem to have misplaced my Zandalarian Shadow Talisman. Can you help?",1,3,0,0,0,0,''), -- Blue (2) necklace
-- HUNTER
(@SUB_HUNTER,0,0,"I seem to have misplaced my Zandalar Predator's Belt. Can you help?",1,3,0,0,0,0,''),
(@SUB_HUNTER,1,0,"I seem to have misplaced my Zandalar Predator's Bracers. Can you help?",1,3,0,0,0,0,''),
(@SUB_HUNTER,2,0,"I seem to have misplaced my Zandalar Predator's Tunic. Can you help?",1,3,0,0,0,0,''),
(@SUB_HUNTER,3,0,"I seem to have misplaced my Maelstrom's Wrath. Can you help?",1,3,0,0,0,0,''),
(@SUB_HUNTER,4,0,"I seem to have misplaced my Malestrom's Tendril. Can you help?",1,3,0,0,0,0,''), -- Green necklace
(@SUB_HUNTER,5,0,"I seem to have misplaced my Malestrom's Tendril. Can you help?",1,3,0,0,0,0,''), -- Blue (1) necklace
(@SUB_HUNTER,6,0,"I seem to have misplaced my Malestrom's Tendril. Can you help?",1,3,0,0,0,0,''); -- Blue (2) necklace

-- Jin'rokh the Breaker SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=14902;
DELETE FROM `smart_scripts` WHERE `entryorguid`=14902;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Paladin
(14902,0,0,0,62,0,100,0,@SUB_PALADIN,0,0,0,56,19827,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 0 give item Zandalar Freethinker''s Armguards'),
(14902,0,1,0,62,0,100,0,@SUB_PALADIN,1,0,0,56,19826,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 1 give item Zandalar Freethinker''s Belt'),
(14902,0,2,0,62,0,100,0,@SUB_PALADIN,2,0,0,56,19825,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 2 give item Zandalar Freethinker''s Breastplate'),
(14902,0,3,0,62,0,100,0,@SUB_PALADIN,3,0,0,56,19588,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 3 give item Hero''s Brand'),
(14902,0,4,0,62,0,100,0,@SUB_PALADIN,4,0,0,56,19579,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 4 give item Heathen''s Brand (green)'),
(14902,0,5,0,62,0,100,0,@SUB_PALADIN,5,0,0,56,19585,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 5 give item Heathen''s Brand (blue (1))'),
(14902,0,6,0,62,0,100,0,@SUB_PALADIN,6,0,0,56,19586,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 6 give item Heathen''s Brand (blue (2))'),
-- Closing gossips
(14902,0,7,0,62,0,100,0,@SUB_PALADIN,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,8,0,62,0,100,0,@SUB_PALADIN,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,9,0,62,0,100,0,@SUB_PALADIN,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,10,0,62,0,100,0,@SUB_PALADIN,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,11,0,62,0,100,0,@SUB_PALADIN,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,12,0,62,0,100,0,@SUB_PALADIN,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
(14902,0,13,0,62,0,100,0,@SUB_PALADIN,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker- On gossip option select - Close gossip'),
-- Warrior
(14902,0,14,0,62,0,100,0,@SUB_WARRIOR,0,0,0,56,19824,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 0 give item Zandalar Vindicator''s Armguards'),
(14902,0,15,0,62,0,100,0,@SUB_WARRIOR,1,0,0,56,19823,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 1 give item Zandalar Vindicator''s Belt'),
(14902,0,16,0,62,0,100,0,@SUB_WARRIOR,2,0,0,56,19822,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 2 give item Zandalar Vindicator''s Breastplate'),
(14902,0,17,0,62,0,100,0,@SUB_WARRIOR,3,0,0,56,19577,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 3 give item Rage of Mugamba'),
(14902,0,18,0,62,0,100,0,@SUB_WARRIOR,4,0,0,56,19574,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 4 give item Strength of Mugamba (green)'),
(14902,0,19,0,62,0,100,0,@SUB_WARRIOR,5,0,0,56,19575,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 5 give item Strength of Mugamba (blue (1))'),
(14902,0,20,0,62,0,100,0,@SUB_WARRIOR,6,0,0,56,19576,1,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip select 6 give item Strength of Mugamba (blue (2))'),
-- Closing gossips
(14902,0,21,0,62,0,100,0,@SUB_WARRIOR,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,22,0,62,0,100,0,@SUB_WARRIOR,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,23,0,62,0,100,0,@SUB_WARRIOR,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,24,0,62,0,100,0,@SUB_WARRIOR,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,25,0,62,0,100,0,@SUB_WARRIOR,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,26,0,62,0,100,0,@SUB_WARRIOR,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip'),
(14902,0,27,0,62,0,100,0,@SUB_WARRIOR,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jin''rokh the Breaker - On gossip option select - Close gossip');

-- Al''tabim the All-Seeing SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=14903;
DELETE FROM `smart_scripts` WHERE `entryorguid`=14903;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Priest
(14903,0,0,0,62,0,100,0,@SUB_PRIEST,0,0,0,56,19842,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 0 give item Zandalar Confessor''s Bindings'),
(14903,0,1,0,62,0,100,0,@SUB_PRIEST,1,0,0,56,19841,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 1 give item Zandalar Confessor''s Mantle'),
(14903,0,2,0,62,0,100,0,@SUB_PRIEST,2,0,0,56,19843,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 2 give item Zandalar Confessor''s Wraps'),
(14903,0,3,0,62,0,100,0,@SUB_PRIEST,3,0,0,56,19594,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 3 give item The All-Seeing Eye of Zuldazar'),
(14903,0,4,0,62,0,100,0,@SUB_PRIEST,4,0,0,56,19591,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 4 give item The Eye of Zuldazar (green)'),
(14903,0,5,0,62,0,100,0,@SUB_PRIEST,5,0,0,56,19592,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 5 give item The Eye of Zuldazar (blue (1))'),
(14903,0,6,0,62,0,100,0,@SUB_PRIEST,6,0,0,56,19593,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 6 give item The Eye of Zuldazar (blue (2))'),
-- Closing gossips
(14903,0,7,0,62,0,100,0,@SUB_PRIEST,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,8,0,62,0,100,0,@SUB_PRIEST,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,9,0,62,0,100,0,@SUB_PRIEST,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,10,0,62,0,100,0,@SUB_PRIEST,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,11,0,62,0,100,0,@SUB_PRIEST,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,12,0,62,0,100,0,@SUB_PRIEST,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,13,0,62,0,100,0,@SUB_PRIEST,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
-- Warlock
(14903,0,14,0,62,0,100,0,@SUB_WARLOCK,0,0,0,56,19849,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 0 give item Zandalar Demoniac''s Bindings'),
(14903,0,15,0,62,0,100,0,@SUB_WARLOCK,1,0,0,56,20033,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 1 give item Zandalar Demoniac''s Mantle'),
(14903,0,16,0,62,0,100,0,@SUB_WARLOCK,2,0,0,56,19848,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 2 give item Zandalar Demoniac''s Wraps'),
(14903,0,17,0,62,0,100,0,@SUB_WARLOCK,3,0,0,56,19605,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 3 give item The All-Seeing Eye of Zuldazar'),
(14903,0,18,0,62,0,100,0,@SUB_WARLOCK,4,0,0,56,19602,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 4 give item Kezan''s Taint (green)'),
(14903,0,19,0,62,0,100,0,@SUB_WARLOCK,5,0,0,56,19603,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 5 give item Kezan''s Taint (blue (1))'),
(14903,0,20,0,62,0,100,0,@SUB_WARLOCK,6,0,0,56,19604,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 6 give item Kezan''s Taint (blue (2))'),
-- Closing gossips
(14903,0,21,0,62,0,100,0,@SUB_WARLOCK,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,22,0,62,0,100,0,@SUB_WARLOCK,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,23,0,62,0,100,0,@SUB_WARLOCK,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,24,0,62,0,100,0,@SUB_WARLOCK,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,25,0,62,0,100,0,@SUB_WARLOCK,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,26,0,62,0,100,0,@SUB_WARLOCK,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,27,0,62,0,100,0,@SUB_WARLOCK,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
-- Mage
(14903,0,28,0,62,0,100,0,@SUB_MAGE,0,0,0,56,19845,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 0 give item Zandalar Illusionist''s Mantle'),
(14903,0,29,0,62,0,100,0,@SUB_MAGE,1,0,0,56,20034,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 1 give item Zandalar Illusionist''s Robes'),
(14903,0,30,0,62,0,100,0,@SUB_MAGE,2,0,0,56,19846,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 2 give item Zandalar Illusionist''s Wraps'),
(14903,0,31,0,62,0,100,0,@SUB_MAGE,3,0,0,56,19601,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 3 give item Jewel of Kajaro'),
(14903,0,32,0,62,0,100,0,@SUB_MAGE,4,0,0,56,19598,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 4 give item Pebble of Kajaro (green)'),
(14903,0,33,0,62,0,100,0,@SUB_MAGE,5,0,0,56,19599,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 5 give item Pebble of Kajaro (blue (1))'),
(14903,0,34,0,62,0,100,0,@SUB_MAGE,6,0,0,56,19600,1,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip select 6 give item Pebble of Kajaro (blue (2))'),
-- Closing gossips
(14903,0,35,0,62,0,100,0,@SUB_MAGE,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,36,0,62,0,100,0,@SUB_MAGE,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,37,0,62,0,100,0,@SUB_MAGE,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,38,0,62,0,100,0,@SUB_MAGE,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,39,0,62,0,100,0,@SUB_MAGE,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,40,0,62,0,100,0,@SUB_MAGE,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip'),
(14903,0,41,0,62,0,100,0,@SUB_MAGE,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Al''tabim the All-Seeing - On gossip option select - Close gossip');

-- Maywiki of Zuldazar SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=14904;
DELETE FROM `smart_scripts` WHERE `entryorguid`=14904;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Shaman
(14904,0,0,0,62,0,100,0,@SUB_SHAMAN,0,0,0,56,19829,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 0 give item Zandalar Augur''s Belt'),
(14904,0,1,0,62,0,100,0,@SUB_SHAMAN,1,0,0,56,19830,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 1 give item Zandalar Augur''s Bracers'),
(14904,0,2,0,62,0,100,0,@SUB_SHAMAN,2,0,0,56,19828,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 2 give item Zandalar Augur''s Hauberk'),
(14904,0,3,0,62,0,100,0,@SUB_SHAMAN,3,0,0,56,19609,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 3 give item Unmarred Vision of Voodress'),
(14904,0,4,0,62,0,100,0,@SUB_SHAMAN,4,0,0,56,19606,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 4 give item Vision of Voodress (green)'),
(14904,0,5,0,62,0,100,0,@SUB_SHAMAN,5,0,0,56,19607,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 5 give item Vision of Voodress (blue (1))'),
(14904,0,6,0,62,0,100,0,@SUB_SHAMAN,6,0,0,56,19608,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 6 give item Vision of Voodress (blue (2))'),
-- Closing gossips
(14904,0,7,0,62,0,100,0,@SUB_SHAMAN,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,8,0,62,0,100,0,@SUB_SHAMAN,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,9,0,62,0,100,0,@SUB_SHAMAN,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,10,0,62,0,100,0,@SUB_SHAMAN,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,11,0,62,0,100,0,@SUB_SHAMAN,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,12,0,62,0,100,0,@SUB_SHAMAN,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,13,0,62,0,100,0,@SUB_SHAMAN,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
-- Druid
(14904,0,14,0,62,0,100,0,@SUB_DRUID,0,0,0,56,19839,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 0 give item Zandalar Haruspex''s Belt'),
(14904,0,15,0,62,0,100,0,@SUB_DRUID,1,0,0,56,19840,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 1 give item Zandalar Haruspex''s Bracers'),
(14904,0,16,0,62,0,100,0,@SUB_DRUID,2,0,0,56,19838,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 2 give item Zandalar Haruspex''s Tunic'),
(14904,0,17,0,62,0,100,0,@SUB_DRUID,3,0,0,56,19613,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 3 give item Pristine Enchanted South Seas Kelp'),
(14904,0,18,0,62,0,100,0,@SUB_DRUID,4,0,0,56,19610,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 4 give item Enchanted South Seas Kelp (green)'),
(14904,0,19,0,62,0,100,0,@SUB_DRUID,5,0,0,56,19611,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 5 give item Enchanted South Seas Kelp (blue (1))'),
(14904,0,20,0,62,0,100,0,@SUB_DRUID,6,0,0,56,19612,1,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip select 6 give item Enchanted South Seas Kelp (blue (2))'),
-- Closing gossips
(14904,0,21,0,62,0,100,0,@SUB_DRUID,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,22,0,62,0,100,0,@SUB_DRUID,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,23,0,62,0,100,0,@SUB_DRUID,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,24,0,62,0,100,0,@SUB_DRUID,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,25,0,62,0,100,0,@SUB_DRUID,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,26,0,62,0,100,0,@SUB_DRUID,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip'),
(14904,0,27,0,62,0,100,0,@SUB_DRUID,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Maywiki of Zuldazar - On gossip option select - Close gossip');

-- Falthir the Sightless SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=14905;
DELETE FROM `smart_scripts` WHERE `entryorguid`=14905;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
-- Rogue
(14905,0,0,0,62,0,100,0,@SUB_ROGUE,0,0,0,56,19836,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 0 give item Zandalar Madcap''s Bracers'),
(14905,0,1,0,62,0,100,0,@SUB_ROGUE,1,0,0,56,19835,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 1 give item Zandalar Madcap''s Tunic'),
(14905,0,2,0,62,0,100,0,@SUB_ROGUE,2,0,0,56,19834,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 2 give item Zandalar Augur''s Belt'),
(14905,0,3,0,62,0,100,0,@SUB_ROGUE,3,0,0,56,19617,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 3 give item Zandalarian Shadow Mastery Talisman'),
(14905,0,4,0,62,0,100,0,@SUB_ROGUE,4,0,0,56,19614,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 4 give item Zandalarian Shadow Talisman (green)'),
(14905,0,5,0,62,0,100,0,@SUB_ROGUE,5,0,0,56,19615,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 5 give item Zandalarian Shadow Talisman (blue (1))'),
(14905,0,6,0,62,0,100,0,@SUB_ROGUE,6,0,0,56,19616,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 6 give item Zandalarian Shadow Talisman (blue (2))'),
-- Closing gossips
(14905,0,7,0,62,0,100,0,@SUB_ROGUE,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,8,0,62,0,100,0,@SUB_ROGUE,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,9,0,62,0,100,0,@SUB_ROGUE,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,10,0,62,0,100,0,@SUB_ROGUE,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,11,0,62,0,100,0,@SUB_ROGUE,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,12,0,62,0,100,0,@SUB_ROGUE,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,13,0,62,0,100,0,@SUB_ROGUE,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
-- Hunter
(14905,0,14,0,62,0,100,0,@SUB_HUNTER,0,0,0,56,19832,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 0 give item Zandalar Predator''s Belt'),
(14905,0,15,0,62,0,100,0,@SUB_HUNTER,1,0,0,56,19833,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 1 give item Zandalar Predator''s Bracers'),
(14905,0,16,0,62,0,100,0,@SUB_HUNTER,2,0,0,56,19831,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 2 give item Zandalar Predator''s Mantle'),
(14905,0,17,0,62,0,100,0,@SUB_HUNTER,3,0,0,56,19621,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 3 give item Maelstrom''s Wrath'),
(14905,0,18,0,62,0,100,0,@SUB_HUNTER,4,0,0,56,19618,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 4 give item Maelstrom''s Tendril (green)'),
(14905,0,19,0,62,0,100,0,@SUB_HUNTER,5,0,0,56,19619,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 5 give item Maelstrom''s Tendril (blue (1))'),
(14905,0,20,0,62,0,100,0,@SUB_HUNTER,6,0,0,56,19620,1,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip select 6 give item Maelstrom''s Tendril (blue (2))'),
-- Closing gossips
(14905,0,21,0,62,0,100,0,@SUB_HUNTER,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,22,0,62,0,100,0,@SUB_HUNTER,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,23,0,62,0,100,0,@SUB_HUNTER,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,24,0,62,0,100,0,@SUB_HUNTER,3,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,25,0,62,0,100,0,@SUB_HUNTER,4,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,26,0,62,0,100,0,@SUB_HUNTER,5,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip'),
(14905,0,27,0,62,0,100,0,@SUB_HUNTER,6,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Falthir the Sightless - On gossip option select - Close gossip');

-- Conditions for gossip menu options
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (6321,6322,6341,@GOSSIP,@SUB_PALADIN,@SUB_WARRIOR,@SUB_PRIEST,@SUB_WARLOCK,@SUB_MAGE,@SUB_SHAMAN,@SUB_DRUID,@SUB_ROGUE,@SUB_HUNTER);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
-- PALADIN CONDITIONS
-- Zandalar Freethinker's Armguards
(15,@SUB_PALADIN,0,0,8,8053,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Freethinker's Armguards is rewarded"),
(15,@SUB_PALADIN,0,0,26,19827,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Freethinker's Armguards"),
-- Zandalar Freethinker's Belt
(15,@SUB_PALADIN,1,0,8,8054,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Freethinker's Belt is rewarded"),
(15,@SUB_PALADIN,1,0,26,19826,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Freethinker's Belt"),
-- Zandalar Freethinker's Breastplate
(15,@SUB_PALADIN,2,0,8,8055,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Freethinker's Breastplate is rewarded"),
(15,@SUB_PALADIN,2,0,26,19825,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Freethinker's Breastplate"),
-- Hero's Brand
(15,@SUB_PALADIN,3,0,8,8048,0,0,0,"Only allow gossip option to be visible if quest The Hero's Brand is rewarded"),
(15,@SUB_PALADIN,3,0,26,19588,1,0,0,"Only allow gossip option to be visible if player does not have item Hero's Brand"),
-- Heathen's Band (green)
(15,@SUB_PALADIN,4,0,8,8045,0,0,0,"Only allow gossip option to be visible if quest The Heathen's Brand is rewarded"),
(15,@SUB_PALADIN,4,0,26,19579,1,0,0,"Only allow gossip option to be visible if player does not have item Heathen's Brand"),
-- Heathen's Band (blue - one)
(15,@SUB_PALADIN,5,0,8,8046,0,0,0,"Only allow gossip option to be visible if quest The Heathen's Brand is rewarded"),
(15,@SUB_PALADIN,5,0,26,19585,1,0,0,"Only allow gossip option to be visible if player does not have item Heathen's Brand"),
-- Heathen's Band (blue - two)
(15,@SUB_PALADIN,6,0,8,8047,0,0,0,"Only allow gossip option to be visible if quest The Heathen's Brand is rewarded"),
(15,@SUB_PALADIN,6,0,26,19586,1,0,0,"Only allow gossip option to be visible if player does not have item Heathen's Brand"),
-- WARRIOR CONDITIONS
-- Zandalar Vindicator's Armguards
(15,@SUB_WARRIOR,0,0,8,8058,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Armguards is rewarded"),
(15,@SUB_WARRIOR,0,0,26,19824,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Armguards"),
-- Zandalar Vindicator's Belt
(15,@SUB_WARRIOR,1,0,8,8078,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Belt is rewarded"),
(15,@SUB_WARRIOR,1,0,26,19823,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Belt"),
-- Zandalar Vindicator's Breastplate
(15,@SUB_WARRIOR,2,0,8,8079,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Breastplate is rewarded"),
(15,@SUB_WARRIOR,2,0,26,19822,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Breastplate"),
-- Rage of Mugamba
(15,@SUB_WARRIOR,3,0,8,8044,0,0,0,"Only allow gossip option to be visible if quest The Rage of Mugamba is rewarded"),
(15,@SUB_WARRIOR,3,0,26,19577,1,0,0,"Only allow gossip option to be visible if player does not have item Rage of Mugamba"),
-- Strength of Mugamba (green)
(15,@SUB_WARRIOR,4,0,8,8041,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,@SUB_WARRIOR,4,0,26,19574,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
-- Strength of Mugamba (blue - one)
(15,@SUB_WARRIOR,5,0,8,8042,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,@SUB_WARRIOR,5,0,26,19575,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
-- Strength of Mugamba (blue - two)
(15,@SUB_WARRIOR,6,0,8,8043,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,@SUB_WARRIOR,6,0,26,19576,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
-- PRIEST CONDITIONS
-- Zandalar Confessor's Bindings
(15,@SUB_PRIEST,0,0,8,8070,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Bindings is rewarded"),
(15,@SUB_PRIEST,0,0,26,19842,1,0,0,"Only allow gossip option to be visible if player does not have item  Zandalar Confessor's Bindings"),
-- Zandalar Confessor's Mantle
(15,@SUB_PRIEST,1,0,8,8071,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Mantle is rewarded"),
(15,@SUB_PRIEST,1,0,26,19841,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Confessor's Mantle"),
-- Zandalar Confessor's Wraps
(15,@SUB_PRIEST,2,0,8,8061,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Wraps is rewarded"),
(15,@SUB_PRIEST,2,0,26,19843,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Confessor's Wraps"),
-- The All-Seeing Eye of Zuldazar
(15,@SUB_PRIEST,3,0,8,8052,0,0,0,"Only allow gossip option to be visible if quest The All-Seeing Eye of Zuldazar is rewarded"),
(15,@SUB_PRIEST,3,0,26,19594,1,0,0,"Only allow gossip option to be visible if player does not have item The All-Seeing Eye of Zuldazar"),
-- The Eye of Zuldazar (green)
(15,@SUB_PRIEST,4,0,8,8049,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,@SUB_PRIEST,4,0,26,19591,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
-- The Eye of Zuldazar (blue - one)
(15,@SUB_PRIEST,5,0,8,8050,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,@SUB_PRIEST,5,0,26,19592,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
-- The Eye of Zuldazar (blue - two)
(15,@SUB_PRIEST,6,0,8,8051,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,@SUB_PRIEST,6,0,26,19593,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
-- WARLOCK CONDITIONS
-- Zandalar Demoniac's Mantle
(15,@SUB_WARLOCK,0,0,8,8076,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Mantle is rewarded"),
(15,@SUB_WARLOCK,0,0,26,19849,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Mantle"),
-- Zandalar Demoniac's Robe
(15,@SUB_WARLOCK,1,0,8,8077,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Robes is rewarded"),
(15,@SUB_WARLOCK,1,0,26,20033,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Robe"),
-- Zandalar Demoniac's Wraps
(15,@SUB_WARLOCK,2,0,8,8059,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Wraps is rewarded"),
(15,@SUB_WARLOCK,2,0,26,19848,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Wraps"),
-- Kezan's Unstoppable Taint
(15,@SUB_WARLOCK,3,0,8,8109,0,0,0,"Only allow gossip option to be visible if quest Kezan's Unstoppable Taint is rewarded"),
(15,@SUB_WARLOCK,3,0,26,19605,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Unstoppable Taint"),
-- Kezan's Taint (green)
(15,@SUB_WARLOCK,4,0,8,8106,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,@SUB_WARLOCK,4,0,26,19602,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
-- Kezan's Taint (blue - one)
(15,@SUB_WARLOCK,5,0,8,8107,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,@SUB_WARLOCK,5,0,26,19603,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
-- Kezan's Taint (blue - two)
(15,@SUB_WARLOCK,6,0,8,8108,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,@SUB_WARLOCK,6,0,26,19604,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
-- MAGE CONDITIONS
-- Zandalar Illusionist's Mantle
(15,@SUB_MAGE,0,0,8,8068,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Mantle is rewarded"),
(15,@SUB_MAGE,0,0,26,19845,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Mantle"),
-- Zandalar Illusionist's Robe
(15,@SUB_MAGE,1,0,8,8069,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Robes is rewarded"),
(15,@SUB_MAGE,1,0,26,20034,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Robe"),
-- Zandalar Illusionist's Wraps
(15,@SUB_MAGE,2,0,8,8060,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Wraps is rewarded"),
(15,@SUB_MAGE,2,0,26,19846,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Wraps"),
-- Jewel of Kajaro
(15,@SUB_MAGE,3,0,8,8104,0,0,0,"Only allow gossip option to be visible if quest The Jewel of Kajaro is rewarded"),
(15,@SUB_MAGE,3,0,26,19601,1,0,0,"Only allow gossip option to be visible if player does not have item Jewel of Kajaro"),
-- Pebble of Kajaro (green)
(15,@SUB_MAGE,4,0,8,8101,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,@SUB_MAGE,4,0,26,19598,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
-- Pebble of Kajaro (blue - one)
(15,@SUB_MAGE,5,0,8,8102,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,@SUB_MAGE,5,0,26,19599,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
-- Pebble of Kajaro (blue - two)
(15,@SUB_MAGE,6,0,8,8103,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,@SUB_MAGE,6,0,26,19600,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
-- SHAMAN CONDITIONS
-- Zandalar Augur's Belt
(15,@SUB_SHAMAN,0,0,8,8074,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Belt is rewarded"),
(15,@SUB_SHAMAN,0,0,26,19829,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Belt"),
-- Zandalar Augur's Bracers
(15,@SUB_SHAMAN,1,0,8,8056,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Bracers is rewarded"),
(15,@SUB_SHAMAN,1,0,26,19830,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Bracers"),
-- Zandalar Augur's Hauberk
(15,@SUB_SHAMAN,2,0,8,8075,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Hauberk is rewarded"),
(15,@SUB_SHAMAN,2,0,26,19828,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Hauberk"),
-- Unmarred Vision of Voodress
(15,@SUB_SHAMAN,3,0,8,8119,0,0,0,"Only allow gossip option to be visible if quest The Unmarred Vision of Voodress is rewarded"),
(15,@SUB_SHAMAN,3,0,26,19609,1,0,0,"Only allow gossip option to be visible if player does not have item Unmarred Vision of Voodress"),
-- Vision of Voodress (green)
(15,@SUB_SHAMAN,4,0,8,8116,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,@SUB_SHAMAN,4,0,26,19606,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
-- Vision of Voodress (blue - one)
(15,@SUB_SHAMAN,5,0,8,8117,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,@SUB_SHAMAN,5,0,26,19607,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
-- Vision of Voodress (blue - two)
(15,@SUB_SHAMAN,6,0,8,8118,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,@SUB_SHAMAN,6,0,26,19608,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
-- DRUID CONDITIONS
-- Zandalar Haruspex's Belt
(15,@SUB_DRUID,0,0,8,8064,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Belt is rewarded"),
(15,@SUB_DRUID,0,0,26,19839,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Belt"),
-- Zandalar Haruspex's Bracers
(15,@SUB_DRUID,1,0,8,8057,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Bracers is rewarded"),
(15,@SUB_DRUID,1,0,26,19840,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Bracers"),
-- Zandalar Haruspex's Tunic
(15,@SUB_DRUID,2,0,8,8065,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Tunic is rewarded"),
(15,@SUB_DRUID,2,0,26,19838,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Tunic"),
-- Pristine Enchanted South Seas Kelp
(15,@SUB_DRUID,3,0,8,8113,0,0,0,"Only allow gossip option to be visible if quest Pristine Enchanted South Seas Kelp is rewarded"),
(15,@SUB_DRUID,3,0,26,19613,1,0,0,"Only allow gossip option to be visible if player does not have item Pristine Enchanted South Seas Kelp"),
-- Enchanted South Seas Kelp (green)
(15,@SUB_DRUID,4,0,8,8110,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
(15,@SUB_DRUID,4,0,26,19610,1,0,0,"Only allow gossip option to be visible if player does not have item Enchanted South Seas Kelp"),
-- Enchanted South Seas Kelp (blue - one)
(15,@SUB_DRUID,5,0,8,8111,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
(15,@SUB_DRUID,5,0,26,19611,1,0,0,"Only allow gossip option to be visible if player does not have item Enchanted South Seas Kelp"),
-- Enchanted South Seas Kelp (blue - two)
(15,@SUB_DRUID,6,0,8,8112,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
(15,@SUB_DRUID,6,0,26,19612,1,0,0,"Only allow gossip option to be visible if player does not have item Enchanted South Seas Kelp"),
-- ROGUE CONDITIONS
-- Zandalar Madcap's Bracers
(15,@SUB_ROGUE,0,0,8,8063,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Bracers is rewarded"),
(15,@SUB_ROGUE,0,0,26,19836,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Bracers"),
-- Zandalar Madcap's Mantle
(15,@SUB_ROGUE,1,0,8,8072,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Mantle is rewarded"),
(15,@SUB_ROGUE,1,0,26,19835,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Mantle"),
-- Zandalar Madcap's Tunic
(15,@SUB_ROGUE,2,0,8,8073,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Tunic is rewarded"),
(15,@SUB_ROGUE,2,0,26,19834,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Tunic"),
-- Zandalarian Shadow Mastery Talisman
(15,@SUB_ROGUE,3,0,8,8144,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Mastery Talisman is rewarded"),
(15,@SUB_ROGUE,3,0,26,19617,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Mastery Talisman"),
-- Zandalarian Shadow Talisman (green)
(15,@SUB_ROGUE,4,0,8,8141,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@SUB_ROGUE,4,0,26,19614,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
-- Zandalarian Shadow Talisman (blue - one)
(15,@SUB_ROGUE,5,0,8,8142,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@SUB_ROGUE,5,0,26,19615,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
-- Zandalarian Shadow Talisman (blue - two)
(15,@SUB_ROGUE,6,0,8,8143,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@SUB_ROGUE,6,0,26,19616,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
-- HUNTER CONDITIONS
-- Zandalar Predator's Belt
(15,@SUB_HUNTER,0,0,8,8066,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Belt is rewarded"),
(15,@SUB_HUNTER,0,0,26,19832,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Belt"),
-- Zandalar Predator's Bracers
(15,@SUB_HUNTER,1,0,8,8062,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Bracers is rewarded"),
(15,@SUB_HUNTER,1,0,26,19833,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Bracers"),
-- Zandalar Predator's Mantle
(15,@SUB_HUNTER,2,0,8,8067,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Mantle is rewarded"),
(15,@SUB_HUNTER,2,0,26,19831,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Mantle"),
-- Maelstrom's Wrath
(15,@SUB_HUNTER,3,0,8,8148,0,0,0,"Only allow gossip option to be visible if quest Maelstrom's Wrath is rewarded"),
(15,@SUB_HUNTER,3,0,26,19621,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Wrath"),
-- Maelstrom's Tendril (green)
(15,@SUB_HUNTER,4,0,8,8145,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@SUB_HUNTER,4,0,26,19618,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril"),
-- Maelstrom's Tendril (blue - one)
(15,@SUB_HUNTER,5,0,8,8146,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@SUB_HUNTER,5,0,26,19619,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril"),
-- Maelstrom's Tendril (blue - two)
(15,@SUB_HUNTER,6,0,8,8147,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@SUB_HUNTER,6,0,26,19620,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril"),
-- NOTE: THESE ARE GROUPED CONDITIONS!
-- EITHER ONE OF THE REQUIREMENTS MUST BE MET FOR THE GOSSIP TO BE VISIBLE!
-- Conditions for gossip main menu of Jin''rokh the Breaker
-- Paladin main menu conditions
(15,6321,0,0,8,8053,0,0,0,"Only allow main gossip to be visible if quest Paragons of Power: The Freethinker's Armguards is rewarded"),
(15,6321,0,0,26,19827,1,0,0,"Only allow main gossip to be visible if player does not have item Zandalar Freethinker's Armguards"),
(15,6321,0,1,8,8054,0,0,0,"Only allow main gossip to be visible if quest Paragons of Power: The Freethinker's Belt is rewarded"),
(15,6321,0,1,26,19826,1,0,0,"Only allow main gossip to be visible if player does not have item Zandalar Freethinker's Belt"),
(15,6321,0,2,8,8055,0,0,0,"Only allow main gossip to be visible if quest Paragons of Power: The Freethinker's Breastplate is rewarded"),
(15,6321,0,2,26,19825,1,0,0,"Only allow main gossip to be visible if player does not have item Zandalar Freethinker's Breastplate"),
(15,6321,0,3,8,8048,0,0,0,"Only allow main gossip to be visible if quest The Hero's Brand is rewarded"),
(15,6321,0,3,26,19588,1,0,0,"Only allow main gossip to be visible if player does not have item Hero's Brand"),
(15,6321,0,4,8,8045,0,0,0,"Only allow main gossip to be visible if quest The Heathen's Brand is rewarded"),
(15,6321,0,4,26,19579,1,0,0,"Only allow main gossip to be visible if player does not have item Heathen's Brand"),
(15,6321,0,5,8,8046,0,0,0,"Only allow main gossip to be visible if quest The Heathen's Brand is rewarded"),
(15,6321,0,5,26,19585,1,0,0,"Only allow main gossip to be visible if player does not have item Heathen's Brand"),
(15,6321,0,6,8,8047,0,0,0,"Only allow main gossip to be visible if quest The Heathen's Brand is rewarded"),
(15,6321,0,6,26,19586,1,0,0,"Only allow main gossip to be visible if player does not have item Heathen's Brand"),
-- Warrior main menu conditions
(15,6321,1,0,8,8058,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Armguards is rewarded"),
(15,6321,1,0,26,19824,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Armguards"),
(15,6321,1,1,8,8078,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Belt is rewarded"),
(15,6321,1,1,26,19823,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Belt"),
(15,6321,1,2,8,8079,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Vindicator's Breastplate is rewarded"),
(15,6321,1,2,26,19822,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Vindicator's Breastplate"),
(15,6321,1,3,8,8044,0,0,0,"Only allow gossip option to be visible if quest The Rage of Mugamba is rewarded"),
(15,6321,1,3,26,19577,1,0,0,"Only allow gossip option to be visible if player does not have item Rage of Mugamba"),
(15,6321,1,4,8,8041,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,6321,1,4,26,19574,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
(15,6321,1,5,8,8042,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,6321,1,5,26,19575,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
(15,6321,1,6,8,8043,0,0,0,"Only allow gossip option to be visible if quest Strength of Mount Mugamba is rewarded"),
(15,6321,1,6,26,19576,1,0,0,"Only allow gossip option to be visible if player does not have item Strength of Mugamba"),
-- Conditions for gossip main menu of Al''tabim the All-Seeing
-- Priest main menu conditions
(15,6322,0,0,8,8070,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Bindings is rewarded"),
(15,6322,0,0,26,19842,1,0,0,"Only allow gossip option to be visible if player does not have item  Zandalar Confessor's Bindings"),
(15,6322,0,1,8,8071,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Mantle is rewarded"),
(15,6322,0,1,26,19841,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Confessor's Mantle"),
(15,6322,0,2,8,8061,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Confessor's Wraps is rewarded"),
(15,6322,0,2,26,19843,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Confessor's Wraps"),
(15,6322,0,3,8,8052,0,0,0,"Only allow gossip option to be visible if quest The All-Seeing Eye of Zuldazar is rewarded"),
(15,6322,0,3,26,19594,1,0,0,"Only allow gossip option to be visible if player does not have item The All-Seeing Eye of Zuldazar"),
(15,6322,0,4,8,8049,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,6322,0,4,26,19591,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
(15,6322,0,5,8,8050,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,6322,0,5,26,19592,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
(15,6322,0,6,8,8051,0,0,0,"Only allow gossip option to be visible if quest The Eye of Zuldazar is rewarded"),
(15,6322,0,6,26,19593,1,0,0,"Only allow gossip option to be visible if player does not have item The Eye of Zuldazar"),
-- Warlock main menu conditions
(15,6322,1,0,8,8076,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Mantle is rewarded"),
(15,6322,1,0,26,19849,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Mantle"),
(15,6322,1,1,8,8077,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Robes is rewarded"),
(15,6322,1,1,26,20033,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Robe"),
(15,6322,1,2,8,8059,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Demoniac's Wraps is rewarded"),
(15,6322,1,2,26,19848,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Demoniac's Wraps"),
(15,6322,1,3,8,8109,0,0,0,"Only allow gossip option to be visible if quest Kezan's Unstoppable Taint is rewarded"),
(15,6322,1,3,26,19605,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Unstoppable Taint"),
(15,6322,1,4,8,8106,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,6322,1,4,26,19602,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
(15,6322,1,5,8,8107,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,6322,1,5,26,19603,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
(15,6322,1,6,8,8108,0,0,0,"Only allow gossip option to be visible if quest Kezan's Taint is rewarded"),
(15,6322,1,6,26,19604,1,0,0,"Only allow gossip option to be visible if player does not have item Kezan's Taint"),
-- Mage main menu conditions
(15,6322,2,0,8,8068,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Mantle is rewarded"),
(15,6322,2,0,26,19845,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Mantle"),
(15,6322,2,1,8,8069,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Robes is rewarded"),
(15,6322,2,1,26,20034,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Robe"),
(15,6322,2,2,8,8060,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Illusionist's Wraps is rewarded"),
(15,6322,2,2,26,19846,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Illusionist's Wraps"),
(15,6322,2,3,8,8104,0,0,0,"Only allow gossip option to be visible if quest The Jewel of Kajaro is rewarded"),
(15,6322,2,3,26,19601,1,0,0,"Only allow gossip option to be visible if player does not have item Jewel of Kajaro"),
(15,6322,2,4,8,8101,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,6322,2,4,26,19598,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
(15,6322,2,5,8,8102,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,6322,2,5,26,19599,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
(15,6322,2,6,8,8103,0,0,0,"Only allow gossip option to be visible if quest The Pebble of Kajaro is rewarded"),
(15,6322,2,6,26,19600,1,0,0,"Only allow gossip option to be visible if player does not have item Pebble of Kajaro"),
-- Conditions for gossip main menu of Maywiki of Zuldazar
-- Shaman main menu conditions
(15,6341,0,0,8,8074,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Belt is rewarded"),
(15,6341,0,0,26,19829,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Belt"),
(15,6341,0,1,8,8056,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Bracers is rewarded"),
(15,6341,0,1,26,19830,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Bracers"),
(15,6341,0,2,8,8075,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Augur's Hauberk is rewarded"),
(15,6341,0,2,26,19828,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Augur's Hauberk"),
(15,6341,0,3,8,8119,0,0,0,"Only allow gossip option to be visible if quest The Unmarred Vision of Voodress is rewarded"),
(15,6341,0,3,26,19609,1,0,0,"Only allow gossip option to be visible if player does not have item Unmarred Vision of Voodress"),
(15,6341,0,4,8,8116,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,6341,0,4,26,19606,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
(15,6341,0,5,8,8117,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,6341,0,5,26,19607,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
(15,6341,0,6,8,8118,0,0,0,"Only allow gossip option to be visible if quest Vision of Voodress is rewarded"),
(15,6341,0,6,26,19608,1,0,0,"Only allow gossip option to be visible if player does not have item Vision of Voodress"),
-- Druid main menu conditions
(15,6341,1,0,8,8064,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Belt is rewarded"),
(15,6341,1,0,26,19839,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Belt"),
(15,6341,1,1,8,8057,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Bracers is rewarded"),
(15,6341,1,1,26,19840,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Bracers"),
(15,6341,1,2,8,8065,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Haruspex's Tunic is rewarded"),
(15,6341,1,2,26,19838,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Haruspex's Tunic"),
(15,6341,1,3,8,8113,0,0,0,"Only allow gossip option to be visible if quest Pristine Enchanted South Seas Kelp is rewarded"),
(15,6341,1,3,26,19613,1,0,0,"Only allow gossip option to be visible if player does not have item Pristine Enchanted South Seas Kelp"),
(15,6341,1,4,8,8110,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
(15,6341,1,4,26,19610,1,0,0,"Only allow gossip option to be visible if player does not have item Enchanted South Seas Kelp"),
(15,6341,1,5,8,8111,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
(15,6341,1,5,26,19611,1,0,0,"Only allow gossip option to be visible if player does not have item Enchanted South Seas Kelp"),
(15,6341,1,6,8,8112,0,0,0,"Only allow gossip option to be visible if quest Enchanted South Seas Kelp is rewarded"),
-- Conditions for gossip main menu of Falthir the Sightless
-- Rogue main menu conditions
(15,@GOSSIP,0,0,8,8063,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Bracers is rewarded"),
(15,@GOSSIP,0,0,26,19836,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Bracers"),
(15,@GOSSIP,0,1,8,8072,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Mantle is rewarded"),
(15,@GOSSIP,0,1,26,19835,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Mantle"),
(15,@GOSSIP,0,2,8,8073,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Madcap's Tunic is rewarded"),
(15,@GOSSIP,0,2,26,19834,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Madcap's Tunic"),
(15,@GOSSIP,0,3,8,8144,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Mastery Talisman is rewarded"),
(15,@GOSSIP,0,3,26,19617,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Mastery Talisman"),
(15,@GOSSIP,0,4,8,8141,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@GOSSIP,0,4,26,19614,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
(15,@GOSSIP,0,5,8,8142,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@GOSSIP,0,5,26,19615,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
(15,@GOSSIP,0,6,8,8143,0,0,0,"Only allow gossip option to be visible if quest Zandalarian Shadow Talisman is rewarded"),
(15,@GOSSIP,0,6,26,19616,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalarian Shadow Talisman"),
-- Hunter main menu conditions
(15,@GOSSIP,1,0,8,8066,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Belt is rewarded"),
(15,@GOSSIP,1,0,26,19832,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Belt"),
(15,@GOSSIP,1,1,8,8062,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Bracers is rewarded"),
(15,@GOSSIP,1,1,26,19833,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Bracers"),
(15,@GOSSIP,1,2,8,8067,0,0,0,"Only allow gossip option to be visible if quest Paragons of Power: The Predator's Mantle is rewarded"),
(15,@GOSSIP,1,2,26,19831,1,0,0,"Only allow gossip option to be visible if player does not have item Zandalar Predator's Mantle"),
(15,@GOSSIP,1,3,8,8148,0,0,0,"Only allow gossip option to be visible if quest Maelstrom's Wrath is rewarded"),
(15,@GOSSIP,1,3,26,19621,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Wrath"),
(15,@GOSSIP,1,4,8,8145,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@GOSSIP,1,4,26,19618,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril"),
(15,@GOSSIP,1,5,8,8146,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@GOSSIP,1,5,26,19619,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril"),
(15,@GOSSIP,1,6,8,8147,0,0,0,"Only allow gossip option to be visible if quest The Maelstrom's Tendril is rewarded"),
(15,@GOSSIP,1,6,26,19620,1,0,0,"Only allow gossip option to be visible if player does not have item Maelstrom's Tendril");

-- Gahz'ranka Dead (npc) should be dead and unselectable
-- This creature spawns when original Gahz'ranka body dissapears
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=15122;
DELETE FROM `creature_template_addon` WHERE `entry`=15122;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(15122,0,0,1,0,'29266');

-- Set spawnpoint of Gahz'ranka into water instead of at land
UPDATE `event_scripts` SET `x`=-11688.5136,`y`=-1737.743,`z`=2.6789,`o`=3.9 WHERE `id`=9104;

-- Set all Hooktooth Frenzies homeposition higher in water
UPDATE `creature` SET `position_z`=8.638660 WHERE `guid` IN (49731,49727,46069,49730,49071,51444,49074,51443,49072,49724,49068,51447,51446,51450,49723,49728,49076,49722,51964,51963,51448,51442,49073,49070,51445,51449,49726,49075,49725,49729);

-- Correct homeposition of Gurubashi Berserkers
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11777.142578,`position_y`=-1581.515991,`position_z`=20.997643,`orientation`=1.621398 WHERE `guid`=51395;
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11802.939453,`position_y`=-1582.822388,`position_z`=21.003288,`orientation`=1.621398 WHERE `guid`=48555;

-- Double spawned Soulflayer & Son of Hakkar group
DELETE FROM `creature` WHERE `guid` IN (49673,49674,51393) AND `id` IN (11357);
DELETE FROM `creature` WHERE `guid`=49672 AND `id`=11359;
DELETE FROM `creature_addon` WHERE `guid` IN (49672,49674,51393);

-- Hakkari Oracle pathing: 11346
SET @GUID := 736;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11880.799805,`position_y`=-1114.160034,`position_z`=83.378799 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11880.609375,-1096.299805,89.065399,0,0,0,100,0),
(@PATH,2,-11880.470703,-1075.671265,95.479660,0,0,0,100,0),
(@PATH,3,-11880.609375,-1096.299805,89.065399,0,0,0,100,0),
(@PATH,4,-11880.521484,-1136.912598,77.347404,0,0,0,100,0),
(@PATH,5,-11881.089844,-1142.275757,77.281197,0,0,0,100,0),
(@PATH,6,-11885.173828,-1146.204590,77.279572,0,0,0,100,0),
(@PATH,7,-11893.494141,-1147.923462,77.285706,0,0,0,100,0),
(@PATH,8,-11941.483398,-1149.618530,77.287071,0,0,0,100,0),
(@PATH,9,-11945.541992,-1148.230957,77.279755,0,0,0,100,0),
(@PATH,10,-11951.206055,-1141.635376,77.282402,0,0,0,100,0),
(@PATH,11,-11952.918945,-1133.938110,78.511307,0,0,0,100,0),
(@PATH,12,-11952.707031,-1113.114014,84.954788,0,0,0,100,0),
(@PATH,13,-11952.385742,-1092.186523,91.525848,0,0,0,100,0),
(@PATH,14,-11952.707031,-1113.114014,84.954788,0,0,0,100,0),
(@PATH,15,-11952.918945,-1133.938110,78.511307,0,0,0,100,0),
(@PATH,16,-11951.206055,-1141.635376,77.282402,0,0,0,100,0),
(@PATH,17,-11945.541992,-1148.230957,77.279755,0,0,0,100,0),
(@PATH,18,-11941.483398,-1149.618530,77.287071,0,0,0,100,0),
(@PATH,19,-11893.494141,-1147.923462,77.285706,0,0,0,100,0),
(@PATH,20,-11885.173828,-1146.204590,77.279572,0,0,0,100,0),
(@PATH,21,-11881.089844,-1142.275757,77.281197,0,0,0,100,0),
(@PATH,22,-11880.521484,-1136.912598,77.347404,0,0,0,100,0),
(@PATH,23,-11880.609375,-1096.299805,89.065399,0,0,0,100,0),
(@PATH,24,-11880.470703,-1075.671265,95.479660,0,0,0,100,0);

-- Make the six Hakkari Oracle and Gurubashi Warrior emote to talk
DELETE FROM `creature_addon` WHERE `guid` IN (739,740,741,742,743,744);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(739,0,0,0,0,1,''),(740,0,0,0,0,1,''),(741,0,0,0,0,1,''),(742,0,0,0,0,1,''),(743,0,0,0,0,1,''),(744,0,0,0,0,1,'');

-- Son of Hakkar pathing: 11357
SET @GUID := 49034;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11836.500000,`position_y`=-1599.979980,`position_z`=40.750099 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11836.160156,-1613.540039,40.456375,0,0,0,100,0),
(@PATH,2,-11836.692383,-1618.308838,36.998791,0,0,0,100,0),
(@PATH,3,-11836.348633,-1635.910522,36.999691,0,0,0,100,0),
(@PATH,4,-11836.131836,-1647.003418,33.733452,0,0,0,100,0),
(@PATH,5,-11835.504883,-1659.293457,36.999123,0,0,0,100,0),
(@PATH,6,-11833.794922,-1676.584351,36.986992,0,0,0,100,0),
(@PATH,7,-11833.675781,-1682.667236,40.679619,0,0,0,100,0),
(@PATH,8,-11833.439453,-1694.743042,40.748413,0,0,0,100,0),
(@PATH,9,-11833.675781,-1682.667236,40.679619,0,0,0,100,0),
(@PATH,10,-11833.794922,-1676.584351,36.986992,0,0,0,100,0),
(@PATH,11,-11835.504883,-1659.293457,36.999123,0,0,0,100,0),
(@PATH,12,-11836.131836,-1647.003418,33.733452,0,0,0,100,0),
(@PATH,13,-11836.348633,-1635.910522,36.999691,0,0,0,100,0),
(@PATH,14,-11836.692383,-1618.308838,36.998791,0,0,0,100,0),
(@PATH,15,-11836.160156,-1613.540039,40.456375,0,0,0,100,0),
(@PATH,16,-11836.500000,-1599.979980,40.750099,0,0,0,100,0);

-- Son of Hakkar pathing: 11357
SET @GUID := 49033;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11745.992188,`position_y`=-1620.595581,`position_z`=36.996082 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11743.156250,-1609.533691,40.685410,0,0,0,100,0),
(@PATH,2,-11743.031250,-1615.080078,36.998463,0,0,0,100,0),
(@PATH,3,-11739.655273,-1631.531128,36.998829,0,0,0,100,0),
(@PATH,4,-11739.375000,-1643.833984,33.733307,0,0,0,100,0),
(@PATH,5,-11739.109375,-1655.463013,36.796623,0,0,0,100,0),
(@PATH,6,-11740.051758,-1673.494141,37.093468,0,0,0,100,0),
(@PATH,7,-11740.300781,-1678.714233,40.658524,0,0,0,100,0),
(@PATH,8,-11740.165039,-1691.161987,40.748100,0,0,0,100,0),
(@PATH,9,-11740.300781,-1678.714233,40.658524,0,0,0,100,0),
(@PATH,10,-11740.051758,-1673.494141,37.093468,0,0,0,100,0),
(@PATH,11,-11739.109375,-1655.463013,36.796623,0,0,0,100,0),
(@PATH,12,-11739.375000,-1643.833984,33.733307,0,0,0,100,0),
(@PATH,13,-11739.655273,-1631.531128,36.998829,0,0,0,100,0),
(@PATH,14,-11743.031250,-1615.080078,36.998463,0,0,0,100,0),
(@PATH,15,-11742.692383,-1597.847656,40.750408,0,0,0,100,0);

-- Zulian Panther pathing: 11365
SET @GUID := 49320;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11626.807617,`position_y`=-1701.435425,`position_z`=38.823635 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11626.807617,-1701.435425,38.823635,0,0,0,100,0),
(@PATH,2,-11627.707031,-1727.870483,40.333164,0,0,0,100,0),
(@PATH,3,-11629.434570,-1760.955322,38.754513,0,0,0,100,0),
(@PATH,4,-11653.967773,-1807.740723,43.086334,0,0,0,100,0),
(@PATH,5,-11629.434570,-1760.955322,38.754513,0,0,0,100,0),
(@PATH,6,-11627.707031,-1727.870483,40.333164,0,0,0,100,0),
(@PATH,7,-11630.115234,-1687.330566,39.997681,0,0,0,100,0),
(@PATH,8,-11634.075195,-1596.245239,39.645630,0,0,0,100,0);

-- Make the two other panthers follow the leader
UPDATE `creature` SET `MovementType`=2 WHERE `guid` IN (49319,49318);
DELETE FROM `creature_formations` WHERE `leaderGUID`=49320;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49320,49320,0,0,2),
(49320,49319,3,225,2),
(49320,49318,3,90,2);

-- Soulflayer pathing: 11359
SET @GUID := 51397;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11857.572266,`position_y`=-1597.060181,`position_z`=21.108191 WHERE `guid`=@GUID;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11853.084961,`position_y`=-1689.830444,`position_z`=21.169413 WHERE `guid`=51398; -- Son of Hakkar on the left
UPDATE `creature` SET `MovementType`=2,`position_x`=-11859.287109,`position_y`=-1602.102905,`position_z`=21.126654 WHERE `guid`=51402; -- Son of Hakkar on the right
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11854.121094,-1704.387817,21.126833,0,0,0,100,0),
(@PATH,2,-11857.572266,-1597.060181,21.108191,0,0,0,100,0);

-- Make the two Son of Hakkars follow the Soulflayer
DELETE FROM `creature_formations` WHERE `leaderGUID`=51397;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(51397,51397,0,0,2),
(51397,51398,3,225,2),
(51397,51402,3,90,2);

-- Soulflayer pathing: 11359
SET @GUID := 49663;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11714.797852,`position_y`=-1701.325806,`position_z`=21.127512 WHERE `guid`=@GUID;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11722.087891,`position_y`=-1695.433838,`position_z`=21.128262 WHERE `guid`=49665; -- Son of Hakkar on the left
UPDATE `creature` SET `MovementType`=2,`position_x`=-11716.234375,`position_y`=-1695.188965,`position_z`=21.128262 WHERE `guid`=49664; -- Son of Hakkar on the right
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11718.995117,-1690.362915,21.128012,0,0,0,100,0),
(@PATH,2,-11723.005859,-1587.319458,21.028204,0,0,0,100,0),
(@PATH,3,-11719.233398,-1696.215698,21.127626,0,0,0,100,0);

-- Make the two Son of Hakkars follow the Soulflayer
DELETE FROM `creature_formations` WHERE `leaderGUID`=49663;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(49663,49663,0,0,2),
(49663,49665,3,225,2),
(49663,49664,3,90,2);

-- Soulflayer pathing: 11359
SET @GUID := 51421;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11762.890625,`position_y`=-1722.024536,`position_z`=19.575914 WHERE `guid`=@GUID;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11764.499023,`position_y`=-1719.525024,`position_z`=19.575289 WHERE `guid`=51422; -- Son of Hakkar on the left
UPDATE `creature` SET `MovementType`=2,`position_x`=-11764.550781,`position_y`=-1724.298218,`position_z`=19.625282 WHERE `guid`=51423; -- Son of Hakkar on the right
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11763.343750,-1722.480713,19.575899,0,0,0,100,0),
(@PATH,2,-11708.300781,-1720.306274,19.575914,0,0,0,100,0),
(@PATH,3,-11713.461914,-1566.296997,19.575914,0,0,0,100,0),
(@PATH,4,-11708.300781,-1720.306274,19.575914,0,0,0,100,0),
(@PATH,5,-11862.150391,-1725.399780,19.576309,0,0,0,100,0),
(@PATH,6,-11867.898438,-1571.811768,19.576309,0,0,0,100,0),
(@PATH,7,-11862.150391,-1725.399780,19.576309,0,0,0,100,0);

-- Make the two Son of Hakkars follow the Soulflayer
DELETE FROM `creature_formations` WHERE `leaderGUID`=51421;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(51421,51421,0,0,2),
(51421,51422,3,225,2),
(51421,51423,3,90,2);

-- Set one group to another platform and make the Sons of Hakkar group up with the Soulflayer
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11735.766602,`position_y`=-1585.883423,`position_z`=40.750748 WHERE `guid`=51427; -- Soulflayer
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11738.824219,`position_y`=-1586.245483,`position_z`=40.750748 WHERE `guid`=51428; -- Son of Hakkar
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11732.513672,`position_y`=-1591.200195,`position_z`=40.750748 WHERE `guid`=51429; -- Son of Hakkar
DELETE FROM `creature_formations` WHERE `leaderGUID`=51427;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(51427,51427,0,0,2),
(51427,51428,3,225,2),
(51427,51429,3,90,2);

-- Set one group to another platform and make the Sons of Hakkar group up with the Soulflayer
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11843.626953,`position_y`=-1593.210083,`position_z`=40.750298 WHERE `guid`=51390; -- Soulflayer
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11844.555664,`position_y`=-1589.202515,`position_z`=40.750298 WHERE `guid`=51425; -- Son of Hakkar
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`position_x`=-11846.154297,`position_y`=-1594.911377,`position_z`=40.750298 WHERE `guid`=51426; -- Son of Hakkar
DELETE FROM `creature_formations` WHERE `leaderGUID`=51390;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(51390,51390,0,0,2),
(51390,51425,3,225,2),
(51390,51426,3,90,2);

-- Insert missing Hooktooth Frenzy
DELETE FROM `creature` WHERE `guid`=49673;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES 
(49673,11374,309,1,1,15101,0,-11673.693359,-1623.402710,8.929444,4.587632,7200,0,0,9156,0,0,0,0,0);

-- Hooktooth Frenzy pathing: 11359
SET @GUID := 49673;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11673.693359,`position_y`=-1623.402710,`position_z`=8.638660 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11673.025391,-1622.384766,8.638660,0,1,0,100,0),
(@PATH,2,-11673.558594,-1686.983032,8.638660,0,1,0,100,0),
(@PATH,3,-11685.807617,-1714.556519,8.638660,0,1,0,100,0),
(@PATH,4,-11713.664063,-1759.057007,8.638660,0,1,0,100,0),
(@PATH,5,-11745.197266,-1778.084229,8.638660,0,1,0,100,0),
(@PATH,6,-11769.161133,-1780.376587,8.638660,0,1,0,100,0),
(@PATH,7,-11792.379883,-1767.869629,8.638660,0,1,0,100,0),
(@PATH,8,-11816.695313,-1739.452515,8.638660,0,1,0,100,0),
(@PATH,9,-11868.729492,-1734.182373,8.638660,0,1,0,100,0),
(@PATH,10,-11899.966797,-1680.415405,8.638660,0,1,0,100,0),
(@PATH,11,-11893.339844,-1632.780518,8.638660,0,1,0,100,0),
(@PATH,12,-11882.101563,-1558.908203,8.638660,0,1,0,100,0),
(@PATH,13,-11862.220703,-1522.576660,8.638660,0,1,0,100,0),
(@PATH,14,-11821.798828,-1434.877319,8.638660,0,1,0,100,0),
(@PATH,15,-11833.968750,-1368.541626,8.638660,0,1,0,100,0),
(@PATH,16,-11802.698242,-1365.827637,8.638660,0,1,0,100,0),
(@PATH,17,-11813.227539,-1424.008911,8.638660,0,1,0,100,0),
(@PATH,18,-11721.414063,-1441.936646,8.638660,0,1,0,100,0),
(@PATH,19,-11697.149414,-1525.417969,8.638660,0,1,0,100,0),
(@PATH,20,-11698.563477,-1591.051880,8.638660,0,1,0,100,0),
(@PATH,21,-11673.025391,-1622.384766,8.638660,0,1,0,100,0);

-- Hooktooth Frenzy pathing: 11359
SET @GUID := 49726;
SET @PATH := @GUID * 10;
UPDATE `creature` SET `MovementType`=2,`position_x`=-11679.599609,`position_y`=-1607.959961,`position_z`=8.638660 WHERE `guid`=@GUID;
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@GUID,@PATH,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-11673.025391,-1622.384766,8.638660,0,1,0,100,0),
(@PATH,2,-11698.563477,-1591.051880,8.638660,0,1,0,100,0),
(@PATH,3,-11697.149414,-1525.417969,8.638660,0,1,0,100,0),
(@PATH,4,-11721.414063,-1441.936646,8.638660,0,1,0,100,0),
(@PATH,5,-11813.227539,-1424.008911,8.638660,0,1,0,100,0),
(@PATH,6,-11802.698242,-1365.827637,8.638660,0,1,0,100,0),
(@PATH,7,-11833.968750,-1368.541626,8.638660,0,1,0,100,0),
(@PATH,8,-11821.798828,-1434.877319,8.638660,0,1,0,100,0),
(@PATH,9,-11862.220703,-1522.576660,8.638660,0,1,0,100,0),
(@PATH,10,-11882.101563,-1558.908203,8.638660,0,1,0,100,0),
(@PATH,11,-11893.339844,-1632.780518,8.638660,0,1,0,100,0),
(@PATH,12,-11899.966797,-1680.415405,8.638660,0,1,0,100,0),
(@PATH,13,-11868.729492,-1734.182373,8.638660,0,1,0,100,0),
(@PATH,14,-11816.695313,-1739.452515,8.638660,0,1,0,100,0),
(@PATH,15,-11792.379883,-1767.869629,8.638660,0,1,0,100,0),
(@PATH,16,-11769.161133,-1780.376587,8.638660,0,1,0,100,0),
(@PATH,17,-11745.197266,-1778.084229,8.638660,0,1,0,100,0),
(@PATH,18,-11713.664063,-1759.057007,8.638660,0,1,0,100,0),
(@PATH,19,-11685.807617,-1714.556519,8.638660,0,1,0,100,0),
(@PATH,20,-11673.558594,-1686.983032,8.638660,0,1,0,100,0);
-- kill startup errors introduced in 2011_08_06_00
DELETE FROM `creature_loot_template` WHERE `entry` IN ( 37655,38031,38057,38058,38059,38062,38063,38072,38073,38074,38075,38076,38098,38099,38100,38101,38102,38108,38197,38198,38258,38418,38445,38446,38479,38480,38481);
DELETE FROM `command` WHERE `name` = 'cast dest';
INSERT INTO `command` VALUES
('cast dest',3,'Syntax: .cast dest #spellid #x #y #z [triggered]\r\n  Selected target will cast #spellid at provided destination. If ''trigered'' or part provided then spell casted with triggered flag.');-- honor challenge
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=30037;
DELETE FROM `smart_scripts` WHERE `entryorguid`=30037 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(30037,0,0,0,8,0,100,0,21855,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Mjordin Combatant - set to phase 1 when aggroed by spell'),
(30037,0,1,0,6,1,100,0,0,0,0,0,33,30038,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Mjordin Combatant - give credit only when it has buff');

-- forgotten depths ambusher
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=30204;
DELETE FROM `smart_scripts` WHERE `entryorguid`=30204 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(30204,0,0,0,4,0,100,0,0,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Depths Ambusher - change flags when aggroed'),
(30204,0,1,0,4,0,100,0,0,0,0,0,28,56422,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Forgotten Depths Ambusher - remove submerge');

-- ocular
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|33555200 WHERE `entry`=29790;
UPDATE `creature_template` SET `dynamicflags`=`dynamicflags`|8, `unit_flags`=`unit_flags`|4, `InhabitType`=7 WHERE `entry` IN (29747,29790);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29747;
DELETE FROM `smart_scripts` WHERE `entryorguid`=29747 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(29747,0,0,0,0,0,100,0,1500,1500,4000,4000,11,55269,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Ocular - cast Deathly Stare every 3 secs'),
 -- (29747,0,1,0,6,0,100,0,0,0,0,0,11,55288,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Ocular - cast It''s All Fun and Games: The Ocular On Death'),
(29747,0,1,0,6,0,100,0,0,0,0,0,33,29803,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Ocular - cast It''s All Fun and Games: The Ocular On Death'), -- temporary hack
(29747,0,2,0,25,0,100,0,0,0,0,0,75,55162,1,0,0,0,0,1,0,0,0,0,0,0,0, 'Ocular - cast Transform on Spawn');
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=55288;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES 
(55288,55289,0, 'Ocular on script cast killcredit');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=55288;
INSERT INTO `conditions` (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, Comment) VALUES 
(17,0,55288,0,18,1,0,0,0, 'It''s All Fun and Games: The Ocular On Death');

-- shadow vault auras
DELETE FROM `spell_area` WHERE `spell`=30181 AND `area`=4477;
INSERT INTO `spell_area` VALUES 
(30181,4477,0,0,12896,0,1101,2,1),
(30181,4477,0,0,12897,0,690,2,1);

-- quests
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceEntry` IN (12897,12896);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ScriptName`, `Comment`) VALUES 
(19,0,12897,0,8,12893,0,0,'', 'If he cannot be turned - horde'),
(19,0,12896,0,8,12893,0,0,'', 'If he cannot be turned - alliance');

-- temp fix
SET @VILE := 29769;
SET @LADY := 29770;
SET @LEAPER := 29840;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@VILE,@LADY,@LEAPER) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@VILE,0,0,0,6,0,100,0,0,0,0,0,33,29845,0,0,0,0,0,7,0,0,0,0,0,0,0,'The Vile - On spell hit - Give kill credit'),
(@LADY,0,0,0,6,0,100,0,0,0,0,0,33,29846,0,0,0,0,0,7,0,0,0,0,0,0,0,'Lady Nightswood - On spell hit - Give kill credit'),
(@LEAPER,0,0,0,6,0,100,0,0,0,0,0,33,29847,0,0,0,0,0,7,0,0,0,0,0,0,0, 'The Leaper - On spell hit - Give kill credit');

-- vereth quests
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceEntry` IN (13146,13147,13160,13161,13162,13163,13164);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ScriptName`, `Comment`) VALUES 
(19,0,13146,0,8,13145,0,0,'', 'Generosity Abounds'),
(19,0,13160,0,8,13145,0,0,'', 'Stunning View'),
(19,0,13147,0,8,13145,0,0,'', 'Matchmaker'),
(19,0,13161,0,8,13146,0,0,'', 'The Rider of the Unholy'),
(19,0,13161,0,8,13147,0,0,'', 'The Rider of the Unholy'),
(19,0,13161,0,8,13160,0,0,'', 'The Rider of the Unholy'),
(19,0,13162,0,8,13146,0,0,'', 'The Rider of Frost'),
(19,0,13162,0,8,13147,0,0,'', 'The Rider of Frost'),
(19,0,13162,0,8,13160,0,0,'', 'The Rider of Frost'),
(19,0,13163,0,8,13146,0,0,'', 'The Rider of Blood'),
(19,0,13163,0,8,13147,0,0,'', 'The Rider of Blood'),
(19,0,13163,0,8,13160,0,0,'', 'The Rider of Blood'),
(19,0,13164,0,8,13161,0,0,'', 'The Fate of Bloodbane'),
(19,0,13164,0,8,13162,0,0,'', 'The Fate of Bloodbane'),
(19,0,13164,0,8,13163,0,0,'', 'The Fate of Bloodbane');

UPDATE `gameobject` SET `phasemask`=3 WHERE `guid`=62035;
UPDATE `creature_template` SET `faction_A`=974, `faction_H`=974 WHERE `entry`=29769;
UPDATE `creature_template` SET `faction_A`=21, `faction_H`=21 WHERE `entry`=29717;
UPDATE `creature_template` SET `faction_A`=21, `faction_H`=21 WHERE `entry`=29738;
UPDATE `creature_template` SET `faction_A`=21, `faction_H`=21 WHERE `entry`=29722;
UPDATE `creature_template` SET `faction_A`=974, `faction_H`=974 WHERE `entry`=29840;
UPDATE `creature_template` SET `faction_A`=974, `faction_H`=974 WHERE `entry`=29770;

-- lightbane from sniffs
DELETE FROM `event_scripts` WHERE `id`=19423;
INSERT INTO `event_scripts` VALUES
(19423,3,10,29851,300000,0,8593.944,2618.039,652.3534,3.174454);
-- Add loot table for Ahune <The Frost Lord>.
CALL `sp_get_go_lootid`(187892,@ENTRY);
-- Add loot table for Ahune <The Frost Lord>.
DELETE FROM `gameobject_loot_template` WHERE `entry`= @ENTRY;
INSERT INTO `gameobject_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES
(@ENTRY,35557,28,1,0,1,2), -- Huge Snowball
(@ENTRY,35723,12,1,0,1,1), -- Shards of Ahune
(@ENTRY,35498,3 ,1,0,1,1), -- Formula: Enchant Weapon - Deathfrost
(@ENTRY,35720,3 ,1,0,5,6), -- Lord of Frost's Private Label
-- CLOAKS
(@ENTRY,54805,0,1,1,1,1), -- Cloak of the Frigid Winds
(@ENTRY,54804,0,1,1,1,1), -- Shroud of Winter's Chill
(@ENTRY,54803,0,1,1,1,1), -- The Frost Lord's Battle Shroud
(@ENTRY,54802,0,1,1,1,1), -- The Frost Lord's War Cloak
(@ENTRY,54801,0,1,1,1,1); -- Icebound Cloak
-- Dual-Blade Butcher loot fix
DELETE FROM `reference_loot_template` WHERE `item` IN (47285,47446);
INSERT INTO `reference_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`) VALUES 
(34332,47285,0,1,1,1,1), -- normal
(34346,47446,0,1,1,1,1); -- heroic
SET @CGUID := 209079;

-- Insert a creature that shouldn't have been deleted
DELETE FROM `creature` WHERE `id`=29740;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(100065,29740,571,1,1,26471,0,3273.75,-2246.84,114.818,4.5204,300,0,0,9610,0,0,0,0,0);

-- Icecrown spawns
DELETE FROM `creature` WHERE `id` IN (29717,29719,29720,29722,29738,29770,29769,29804,29747,29840);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(152138,29717,571,1,2,0,0,8335.01,2815.44,655.279,1.91986,300,0,0,12175,3893,0),
(152139,29717,571,1,2,0,0,8416.89,2698.95,655.278,5.4655,300,0,0,12175,3893,0),
(152140,29717,571,1,2,0,0,8337.6,2803.88,655.317,4.75039,300,0,0,12175,3893,0),
(152141,29717,571,1,2,0,0,8313.91,2802.63,655.294,3.49066,300,0,0,12175,3893,0),
(152142,29717,571,1,2,0,0,8375.95,2711.55,655.283,4.58118,300,0,0,12175,3893,0),
(152143,29717,571,1,2,0,0,8353.96,2806.34,655.317,0.488692,300,0,0,12175,3893,0),
(152144,29717,571,1,2,0,0,8379.28,2778.25,655.28,0.471239,300,0,0,12175,3893,0),
(152145,29717,571,1,2,0,0,8364.14,2701.92,656.568,0.0349066,300,0,0,12175,3893,0),
(152146,29717,571,1,2,0,0,8477.41,2632.19,653.252,4.90438,300,0,0,12175,3893,0),
(152147,29717,571,1,2,0,0,8481.43,2626.01,652.453,2.44346,300,0,0,12175,3893,0),
(152148,29717,571,1,2,0,0,8487.49,2597.66,652.453,3.735,300,0,0,12175,3893,0),
(152149,29717,571,1,2,0,0,8482,2594.25,653.308,5.72468,300,0,0,12175,3893,0),
(152126,29719,571,1,2,0,0,8251.46,2788.82,642.024,3.15905,300,0,0,12175,0,0),
(152127,29719,571,1,2,0,0,8441.54,2736.37,760.141,5.28835,300,0,0,12175,0,0),
(152128,29719,571,1,2,0,0,8346.44,2669.66,689.96,5.49779,300,0,0,12175,0,0),
(152129,29719,571,1,2,0,0,8481.1,2684.45,652.537,2.75762,300,0,0,12175,0,0),
(152130,29719,571,1,2,0,0,8419.11,2731.21,656.928,3.83972,300,0,0,12175,0,0),
(152131,29719,571,1,2,0,0,8442.5,2591.95,760.057,2.81745,300,0,0,12175,0,0),
(152132,29719,571,1,2,0,0,8333.68,2713.6,658.645,1.27409,300,0,0,12175,0,0),
(152133,29719,571,1,2,0,0,8353.3,2769.46,656.19,4.17134,300,0,0,12175,0,0),
(152134,29719,571,1,2,0,0,8249.88,2766.01,642.024,2.84489,300,0,0,12175,0,0),
(152135,29719,571,1,2,0,0,8249.3,2792.87,641.876,4.50706,300,0,0,12175,0,0),
(152136,29719,571,1,2,0,0,8407.3,2792.75,717.842,3.32933,300,0,0,12175,0,0),
(152137,29719,571,1,2,0,0,8441.07,2731.16,760.057,3.90197,300,0,0,12175,0,0),
(152150,29720,571,1,2,0,0,8253.07,2778.52,641.94,5.84327,300,0,0,12175,0,0),
(152151,29720,571,1,2,0,0,8375.25,2827.48,717.925,1.25664,300,0,0,12175,0,0),
(152152,29720,571,1,2,0,0,8384.67,2727.19,655.276,0.523599,300,0,0,12175,0,0),
(152153,29720,571,1,2,0,0,8262.02,2742.37,643.984,2.56197,300,0,0,12175,0,0),
(152154,29720,571,1,2,0,0,8505.87,2684.41,654.01,4.31096,300,0,0,12175,0,0),
(152155,29720,571,1,2,0,0,8493.93,2656.29,653.637,4.39823,300,0,0,12175,0,0),
(152156,29720,571,1,2,0,0,8249.41,2794.36,642.251,3.02912,300,0,0,12175,0,0),
(152157,29720,571,1,2,0,0,8238,2798.22,638.909,2.10867,300,0,0,12175,0,0),
(152158,29720,571,1,2,0,0,8312.52,2676.2,689.168,3.89319,300,0,0,12175,0,0),
(152159,29720,571,1,2,0,0,8357.75,2724,662.616,1.15192,300,0,0,12175,0,0),
(152160,29720,571,1,2,0,0,8417.85,2644.77,760.057,0.294484,300,0,0,12175,0,0),
(152161,29720,571,1,2,0,0,8323.99,2775.64,655.539,0.820305,300,0,0,12175,0,0),
(152162,29720,571,1,2,0,0,8313.71,2730.07,666.374,1.41372,300,0,0,12175,0,0),
(152163,29720,571,1,2,0,0,8404.08,2751.16,666.536,3.59538,300,0,0,12175,0,0),
(152164,29720,571,1,2,0,0,8526.63,2647.68,654.274,5.81195,300,0,0,12175,0,0),
(@CGUID+00,29720,571,1,2,0,0,8510.63,2619.33,652.453,1.21255,300,0,0,12175,0,0),
(@CGUID+01,29722,571,1,2,0,0,8419.52,2697.4,760.141,4.81711,300,0,0,12175,0,0),
(@CGUID+02,29722,571,1,2,0,0,8413.14,2643.3,760.141,3.28122,300,0,0,12175,0,0),
(@CGUID+03,29722,571,1,2,0,0,8313.09,2684.89,689.96,5.93412,300,0,0,12175,0,0),
(@CGUID+04,29722,571,1,2,0,0,8407.96,2796.92,717.907,5.70723,300,0,0,12175,0,0),
(@CGUID+05,29722,571,1,2,0,0,8382.41,2828.45,717.247,5.77289,300,0,0,12175,0,0),
(@CGUID+06,29722,571,1,2,0,0,8418.25,2696.34,760.057,3.28026,300,0,0,12175,0,0),
(@CGUID+07,29722,571,1,2,0,0,8338.52,2740.88,655.542,6.19592,300,0,0,12175,0,0),
(@CGUID+08,29722,571,1,2,0,0,8284.4,2669.41,689.419,4.65308,300,0,0,12175,0,0),
(@CGUID+09,29722,571,1,2,0,0,8348.2,2813.92,655.394,2.53073,300,0,0,12175,0,0),
(@CGUID+10,29722,571,1,2,0,0,8320.35,2814.49,656.567,5.58505,300,0,0,12175,0,0),
(@CGUID+11,29722,571,1,2,0,0,8349.74,2669.86,689.877,0.32094,300,0,0,12175,0,0),
(@CGUID+12,29722,571,1,2,0,0,8367.34,2745.54,655.24,0.160263,300,0,0,12175,0,0),
(@CGUID+13,29738,571,1,2,0,0,8407.75,2712.33,655.278,0.593412,300,0,0,12175,3893,0),
(@CGUID+14,29738,571,1,2,0,0,8380.24,2751.93,655.466,2.37967,300,0,0,12175,3893,0),
(@CGUID+15,29738,571,1,2,0,0,8289.62,2759.84,656.208,2.9147,300,0,0,12175,3893,0),
(@CGUID+16,29738,571,1,2,0,0,8292.34,2783.9,656.208,3.15905,300,0,0,12175,3893,0),
(@CGUID+17,29738,571,1,2,0,0,8520.61,2728.09,652.537,4.99164,300,0,0,12175,3893,0),
(@CGUID+18,29738,571,1,2,0,0,8309.55,2775.3,655.197,4.70894,300,0,0,12175,3893,2),
(@CGUID+19,29840,571,1,2,0,0,8418.5,2620.67,759.958,4.90178,300,0,0,12600,0,2),
(@CGUID+20,29770,571,1,2,0,0,8402.52,2824.4,716.659,0.954007,300,0,0,10080,8814,0),
(@CGUID+21,29769,571,1,2,0,0,8298.21,2657.99,688.695,5.5676,300,0,0,12600,0,0),
(@CGUID+22,29804,571,1,2,0,0,8395.01,2675.19,657.913,1.32645,300,0,0,63000,19970,0),
(152165,29747,571,1,2,0,0,8526.228,2665.085,1045.04,2.670354,120,0,0,126000,0,0);

DELETE FROM `gameobject` WHERE `id` IN (191778,191779);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES 
(152116,191778,571,1,2,8600.93,2639.53,652.353,-3.12412,0,0,-0.999962,0.00873622,300,100,1),
(152117,191779,571,1,2,8594.72,2627.14,652.353,1.15192,0,0,0.54464,0.83867,300,100,1);
SET @Ithania = 17119;

DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=@Ithania);
DELETE FROM `creature_template_addon` WHERE `entry`=@Ithania;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@Ithania,0,8,257,0, NULL); -- Ithania

DELETE FROM `creature_text` WHERE `entry`=@Ithania;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@Ithania,0,0, 'I think I can make it to Brackenwall on my own. They''ve got the cargo at the top of the tower. Be careful!',12,0,0,0,0,0, 'Ithania - Escape');

-- Script
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@Ithania;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@Ithania AND `source_type`=0);
DELETE FROM `smart_scripts` WHERE (`entryorguid`=@Ithania*100 AND `source_type` IN (0,9));
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@Ithania, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 80, @Ithania*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ithania - On gossip hello run timed action list'),
(@Ithania*100, 9, 0, 0, 0, 0, 0, 0, 500, 500, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ithania - 0 - Remove kneeling'),
(@Ithania*100, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 83, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ithania - 1 - Remove gossip flag'),
(@Ithania*100, 9, 2, 0, 0, 0, 0, 0, 500, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Ithania - 2 - Say'),
(@Ithania*100, 9, 3, 0, 0, 0, 0, 0, 1500, 1500, 0, 0, 53, 1, @Ithania, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 'Ithania - 3 - Start waypoint'),
(@Ithania, 0, 1, 0, 40, 0, 0, 0, 2, @Ithania, 0, 0, 33, 17119, 0, 0, 0, 0, 0, 18, 60, 0, 0, 0, 0, 0, 0, 'Ithania - 5 - Give killcredit (adjust timer)'),
(@Ithania, 0, 2, 0, 40, 0, 0, 0, 2, @Ithania, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Ithania - 6 - Despawn');

DELETE FROM `waypoints` WHERE `entry`=@Ithania;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@Ithania, 1, -2873.96, -3424.76, 39.35, 'Ithania - Tower Entrance'),
(@Ithania, 2, -2833.36, -3415.22, 33.77, 'Ithania - Road');
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (29769,29770,29840);
-- Template updates for creature 25596 (Infected Kodo Beast)
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|512,`speed_run`=2 WHERE `entry`=25596;
UPDATE `creature_template_addon` SET `bytes1`=7,`bytes2`=1,`mount`=0,`emote`=0,`auras`='45771' WHERE `entry`=25596;

-- Tome
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=12938;
UPDATE `quest_template` SET `nextquestid`=12938, `exclusivegroup`=12898 WHERE `entry` in (12898,12899);

-- Aokromes
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=12891;
UPDATE `quest_template` SET `nextquestid`=12891, `exclusivegroup`=12887 WHERE `entry` in (12887,12892);
UPDATE `creature_template` SET `faction_A`=21,`faction_H`=21 WHERE `entry`=29851;
DELETE FROM `spell_dbc` WHERE `id`=18350;
DELETE FROM `spell_script_names` WHERE `spell_id`=18350;
UPDATE `prospecting_loot_template` SET `maxcount` = 2 WHERE `entry` = 36910;
UPDATE `creature` SET `position_z`=-6.03356	WHERE `guid`=46069 AND `id`=11741; -- Dredge Crusher
UPDATE `creature` SET `position_z`=8.638660 WHERE `guid`=49069 AND `id`=11374; -- Hooktooth Frenzies
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` = 37231; -- Robe Beam Stalker
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` = 38008; -- Blood Orb Controller
UPDATE `playercreateinfo_action` SET `action`=26297 WHERE `action` IN (20554,50621,26635,26296) AND `race`=8; -- Berserking - Troll racial
