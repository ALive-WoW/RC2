-- NPC : Zafod Transistor

UPDATE `creature_template` SET `npcflag`='1', `ScriptName`='npc_zafod_boombox', `AIName` = '', `gossip_menu_id` = '10885' WHERE `entry` = '37184';
DELETE FROM `gossip_menu` WHERE `entry` = 10885;
INSERT INTO `gossip_menu` ( `entry`, `text_id`) VALUES ( 10885, 15134);
DELETE FROM `npc_text` WHERE `ID` = 15134;
INSERT INTO `npc_text` ( `ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ( 15134, "¡Espere unos breves momentos, $c y le atenderé gustosamente! Estoy probando un nuevo dispositivo para cohetes que vuelan, ¡ y necesito tu ayuda ! $B$B ¡No hay tiempo que perder, debe de tomar uno de estos arneses y ponerselo debajo de su armadura! Haga click en el lateral y ya podrás volar. $B$B, espero que no robes mi trabajo. Cada uno de estos cohetes, tiene un localizador de funcionamiento en mi mano. Si te alejas demasiado, se detendrá el cohete principal y no podrás despegar hasta volver. $B$B Resumiendo, ¿ donde he puesto los formularios de responsabilidad ?", '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 11723);


-- JEFE : Muradin Barbaronce

UPDATE `creature_template` SET `npcflag`='1', `ScriptName` = 'boss_muradin_bronzebeard', AIName = '' , `gossip_menu_id` = 10875 WHERE `entry` = 36948;
DELETE FROM `gossip_menu` WHERE `entry` = 10875;
INSERT INTO `gossip_menu` ( `entry`, `text_id`) VALUES ( 10875, 15101);
DELETE FROM `npc_text` WHERE `ID` = 15101;
INSERT INTO `npc_text` ( `ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ( 15101, "Las viejas heridas aún están presentes, $g chico:chica;. Las puedo sentir en mis huesos incluso ahora.  Sí, tengo una oportunidad a escoger con Arthas y usted puede, lo daré todo contra ese monstruo. Una cosa que debería haber hecho cuando era joven  ... Siempre supe que algo andaba mal con él. $B$B Avisarme cuanto estéis listos y pondré camino hacia la ciudadela. $B$B ¡Arthas nos esta esperando!", '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 11723);



-- JEFE : Alto Señor Colmillosaurio Varok

UPDATE `creature_template` SET `npcflag`='1', `ScriptName` = 'boss_high_overlord_varok_saurfang', AIName = '', `gossip_menu_id` = 10876 WHERE `entry` = 36939;
DELETE FROM `gossip_menu` WHERE `entry` = 10876;
INSERT INTO `gossip_menu` ( `entry`, `text_id`) VALUES ( 10876, 15103);
DELETE FROM `npc_text` WHERE `ID` = 15103;
INSERT INTO `npc_text` ( `ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES ( 15103, "Esta es nuestra posición final. Todo lo que sucederá aquí tendrá su eco a través de los siglos. Sea cual sea el resultado, ellos sabrán que luchamos con honor. Los que lucharon por la libertad y la seguridad de nuestro pueblo. $B$B Usted, el heroe, el miedo es su peor enemigo en estos sucios lugares. Tu corazón es de acero y tu alma brilla mas que mil soles. El enemigo se debilitará con tu simple mirada. ¡Caeran sobre una luz de justícia!", '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 11723);

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

INSERT INTO `creature_template` VALUES ('400030', '', '0', '0', '0', '0', '24719', '0', '0', '0', 'Orgrim\'s Hammer', 'null', null, '0', '83', '83', '2', '35', '35', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '43.0261742', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', 'npc_GunShip_healthtrigger', '12340');

INSERT INTO `creature_template` VALUES ('400031', '', '0', '0', '0', '0', '24719', '0', '0', '0', 'Himmelsbrecher', 'null', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '43.0261742', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', 'npc_GunShip_healthtrigger', '12340');

INSERT INTO `creature_template` VALUES ('400032', '', '0', '0', '0', '0', '24719', '0', '0', '0', 'Gunship Gun', 'null', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '350', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', '', '12340');

INSERT INTO `creature_template` VALUES ('400033', '', '0', '0', '0', '0', '24719', '0', '0', '0', 'Combat Trigger', 'null', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '350', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', 'npc_combattrigger', '12340');

INSERT INTO `creature_template` VALUES ('400034', '', '0', '0', '0', '0', '30615', '0', '0', '0', 'Portal', 'null', null, '0', '83', '83', '2', '35', '35', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '350', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', 'npc_portal_icc', '12340');

INSERT INTO `creature_template` VALUES ('400035', '', '0', '0', '0', '0', '24719', '0', '0', '0', 'Orgrim\'s Hammer', 'null', null, '0', '83', '83', '2', '35', '35', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '86.0523485', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', 'npc_GunShip_healthtrigger', '12340');

INSERT INTO `creature_template` VALUES ('400036', '', '0', '0', '0', '0', '24719', '0', '0', '0', 'Himmelsbrecher', 'null', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '86.0523485', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', 'npc_GunShip_healthtrigger', '12340');

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

DELETE FROM `creature_template` WHERE `entry` IN ('36838', '36839');

 INSERT INTO `creature_template` VALUES ('36839', '0', '0', '0', '0', '0', '29489', '0', '0', '0', 'Horde Gunship Cannon', '', 'Gunner', '0', '80', '80', '0', '1735', '1735', '16777216', '0', '0', '1', '1', '252', '357', '0', '304', '7.5', '2000', '0', '1', '33570816', '8', '0', '0', '0', '0', '0', '215', '320', '44', '9', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '69400', '69402', '0', '0', '0', '0', '0', '0', '0', '453', '0', '0', '', '0', '3', '8.64198', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');

 INSERT INTO `creature_template` VALUES ('36838', '0', '0', '0', '0', '0', '29488', '0', '0', '0', 'Alliance Gunship Cannon', '', 'Gunner', '0', '80', '80', '0', '1735', '1735', '16777216', '0', '0', '1', '1', '252', '357', '0', '304', '7.5', '2000', '0', '1', '33570816', '8', '0', '0', '0', '0', '0', '215', '320', '44', '9', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '69400', '69402', '0', '0', '0', '0', '0', '0', '0', '453', '0', '0', '', '0', '3', '8.64198', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '', '12340');

INSERT IGNORE INTO npc_spellclick_spells VALUES (36838, 65403, 0, 0, 0, 1, 0, 0, 0);
INSERT IGNORE INTO npc_spellclick_spells VALUES (36839, 65403, 0, 0, 0, 1, 0, 0, 0);

UPDATE `creature_template` SET `VehicleId`=554 WHERE `entry` IN ('36838', '36839');

UPDATE `creature_template` SET `Health_mod` = '65.5185', `Spell1` = '69399', `Spell2` = '70174' WHERE `entry` IN ('36838', '36839');

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

UPDATE `creature_template` SET `ScriptName` = 'npc_sergeant', AIName = '' WHERE `entry` = 36960;
UPDATE `creature_template` SET `ScriptName` = 'npc_sergeant', AIName = '' WHERE `entry` = 36961;
UPDATE `creature_template` SET `ScriptName` = 'npc_skybreaker_rifleman', AIName = '' WHERE `entry` = 36969;
UPDATE `creature_template` SET `ScriptName` = 'npc_korkron_axethrower', AIName = '' WHERE `entry` = 36968;
UPDATE `creature_template` SET `ScriptName` = 'npc_marine_or_reaver', AIName = '' WHERE `entry` = 36957;
UPDATE `creature_template` SET `ScriptName` = 'npc_marine_or_reaver', AIName = '' WHERE `entry` = 36950;
UPDATE `creature_template` SET `ScriptName` = 'npc_mortar_soldier_or_rocketeer', AIName = '' WHERE `entry` = 36982;
UPDATE `creature_template` SET `ScriptName` = 'npc_mortar_soldier_or_rocketeer', AIName = '' WHERE `entry` = 36978;
UPDATE `creature_template` SET `ScriptName` = 'npc_sorcerer_or_battle_mage', AIName = '' WHERE `entry` = 37116;
UPDATE `creature_template` SET `ScriptName` = 'npc_sorcerer_or_battle_mage', AIName = '' WHERE `entry` = 37117;

UPDATE `creature_template` SET `AIName` = '', `spell1` = 69400, `spell2` = 69402, `speed_walk` = 0, `speed_run` = 0 WHERE `entry` = 34935;
UPDATE `creature_template` SET `AIName` = '', `spell1` = 69400, `spell2` = 69402, `speed_walk` = 0, `speed_run` = 0 WHERE `entry` = 35427;
UPDATE `creature_template` SET `AIName` = '', `spell1` = 69400, `spell2` = 69402, `speed_walk` = 0, `speed_run` = 0 WHERE `entry` = 34929;
UPDATE `creature_template` SET `AIName` = '', `spell1` = 69400, `spell2` = 69402, `speed_walk` = 0, `speed_run` = 0 WHERE `entry` = 35410;

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

DELETE FROM `creature_template` WHERE `entry`='120000';
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES ( '120000','0','0','0','0','0','18783','15435','0','0','Alliance Buff Area','','','0','1','1','0','974','974','0','1','1.14286','1','0','1','2','0','0','1','2000','2000','1','0','0','0','0','0','0','0','1','2','0','10','1024','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.0238095','1','1','0','0','0','0','0','0','0','0','1','0','0','130','npc_alliance_buff_area','11723');

DELETE FROM `creature_template` WHERE `entry`='120001';
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES ( '120001','0','0','0','0','0','18783','15435','0','0','Horde Buff Area','','','0','1','1','0','974','974','0','1','1.14286','1','0','1','2','0','0','1','2000','2000','1','0','0','0','0','0','0','0','1','2','0','10','1024','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','0.0238095','1','1','0','0','0','0','0','0','0','0','1','0','0','130','npc_horde_buff_area','11723');

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

DELETE FROM `gameobject_template` WHERE `entry` IN ('1915001', '1914901', '1915002', '1914902');

INSERT INTO gameobject_template 
VALUES('1915001','11','9151','Orgrim\'s Hammer','','','','0','8','1','0','0','0','0','0','0','8','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1');

INSERT INTO gameobject_template VALUES ('1914901','11','9150','Himmelsbrecher','','','','0','8','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1');

INSERT INTO gameobject_template VALUES
('1915002','11','9151','Orgrim\'s Hammer','','','','0','8','1','0','0','0','0','0','0','8','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1');

INSERT INTO gameobject_template VALUES ('1914902','11','9150','Himmelsbrecher','','','','0','8','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1');

INSERT INTO gameobject_template VALUES
('1915003','14','9151','Orgrim\'s Hammer','','','','0','8','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','1');

INSERT INTO gameobject_template VALUES ('1914903','14','9150','Himmelsbrecher','','','','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','go_Alli_GS','1');

--  ALIANZA
DELETE FROM `gameobject` WHERE `id`='19149', AND `map`='631';
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
( '', '19149', '631', '15', '1', '8.5475', '2280.5', '674.901', '6.06136', '0', '0', '0.110685', '-0.993856', '300', '0', '1');

-- HORDA
DELETE FROM `gameobject` WHERE `id`='19150', AND `map`='631';
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
( '', '19150', '631', '15', '1', '444,689', '1916,21', '179,734', '3,16', '0', '0', '0,998231', '0,059459', '300', '0', '1');

-- delete from `gameobject` where `id` IN (1915003, 1914903);

INSERT INTO `gameobject` VALUES ('', '1915003', '631', '1', '1', '-70.0564', '2236.57', '492.255', '4.63985', '0', '0', '0.732281', '-0.681002', '300', '0', '1');
INSERT INTO `gameobject` VALUES ('', '1914903', '631', '1', '1', '16.1135', '2230.3', '506.46', '4.56947', '0', '0', '0.755787', '-0.654817', '300', '0', '1');

INSERT INTO `gameobject` VALUES ('', '1915002', '631', '1', '1', '-70.0564', '2236.57', '492.155', '4.63985', '0', '0', '0.732281', '-0.681002', '300', '0', '1');
INSERT INTO `gameobject` VALUES ('', '1914902', '631', '1', '1', '16.1135', '2230.3', '506.36', '4.56947', '0', '0', '0.755787', '-0.654817', '300', '0', '1');

-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- CAÑONES ALIANZA
INSERT INTO `creature` ( `guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
( '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

INSERT INTO `creature` ( `guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
( '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- CAÑONES HORDA
INSERT INTO `creature` ( `guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
( '', '34935', '631', '2', '128', '0', '0', '-30.4334', '2244.73', '696.839', '1.23728', '300', '0', '0', '34030', '0', '0', '0', '0', '0');

INSERT INTO `creature` ( `guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
( '', '34935', '631', '2', '128', '0', '0', '0.192982', '2238.87', '694.756', '1.65621', '300', '0', '0', '35000', '0', '0', '0', '0', '0');

INSERT INTO `creature` ( `guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
( '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');