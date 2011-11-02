-- Angreifer der Schmorschuppe
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='40419');
INSERT INTO `creature_ai_scripts` VALUES 
('4041901', '40419', '0', '6', '100', '31', '7000', '10000', '10000', '13000', '11', '75417', '1', '0', '', '', '', '', '', '', '', '', 'Angreifer der Schmorschuppen Schockwelle'),
('4041902', '40419', '0', '6', '100', '31', '10000', '12000', '8000', '11000', '11', '15248', '1', '0', '', '', '', '', '', '', '', '', 'Angreifer der Schmorschuppen Spalten');



-- Herbeirufer der Schmorschuppe
DELETE FROM `creature_ai_scripts` WHERE (`creature_id` = '40417');
Insert INTO `creature_ai_scripts` VALUES
('4041701', '40417', '0', '6', '100', '31', '7000', '10000', '10000', '13000', '11', '75413', '1', '0', '', '', '', '', '', '', '', '', 'Herbeirufer der Schmorschuppe Flammenwelle'),
('4041702', '40417', '0', '6', '100', '31', '5000', '7000', '8000', '13000', '11', '75412', '1', '0', '', '', '', '', '', '', '', '', 'Herbeirufer der Schmorschuppe Versengen');

-- Elite der Schmorschuppe
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='40421');
INSERT INTO `creature_ai_scripts` VALUES 
('4042101', '40421', '0', '6', '100', '31', '3000', '8000', '6000', '12000', '11', '15621', '1', '0', '', '', '', '', '', '', '', '', 'Elite der Schmorschuppe Schaedelkracher');

-- Kommandant der Schmorschuppen
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='40423');
INSERT INTO `creature_ai_scripts` VALUES 
('4042301', '40423', '0', '6', '100', '31', '5000', '7000', '8000', '12000', '11', '75414', '0', '0', '', '', '', '', '', '', '', '', 'Kommandant der Schmorschuppen Sammelruf'),
('4042302', '40423', '0', '6', '100', '31', '7000', '10000', '6000', '11000', '11', '13737', '1', '0', '', '', '', '', '', '', '', '', 'Kommandant der Schmorschuppen Toedlicher stoss');

-- Use AI
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` IN ('40419', '40417', '40421', '40423');

-- Spawntime
UPDATE `creature` SET `spawntimesecs`= '604800' WHERE `id` IN ('40419', '40417', '40421', '40423');

-- DMG Multiplier
-- Boss Zarithrian
UPDATE `creature_template` SET `dmg_multiplier` = '45' WHERE `entry` = '39746';
UPDATE `creature_template` SET `dmg_multiplier` = '55' WHERE `entry` = '39805';
-- Trash
UPDATE `creature_template` SET `dmg_multiplier` = '30' WHERE `entry` IN ('40419', '40417', '40421', '40423');
UPDATE `creature_template` SET `dmg_multiplier` = '50' WHERE `entry` IN ('40420', '40418', '40422', '40424');