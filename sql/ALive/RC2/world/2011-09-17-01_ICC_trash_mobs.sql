-- Diener des Throns
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='36724');
INSERT INTO `creature_ai_scripts` VALUES 
('3672401', '36724', '0', '6', '100', '31', '15000', '15000', '15000', '15000', '11', '71029', '4', '1', '', '', '', '', '', '', '', '', 'Servant of the Throne - Glacial Blast');

-- Todesgeweihter Wächter
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37007');
INSERT INTO `creature_ai_scripts` VALUES 
('3700701', '37007', '0', '6', '100', '31', '5000', '5000', '5000', '5000', '11', '71021', '1', '1', '', '', '', '', '', '', '', '', 'Todesgeweihter Waechter - Saebelhieb'),
('3700702', '37007', '0', '6', '100', '31', '19000', '19000', '19000', '19000', '11', '71022', '0', '1', '', '', '', '', '', '', '', '', 'Todesgeweihter Waechter - Unterbrechender Schrei');

-- Gefräßige Monstrosität
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37886');
INSERT INTO `creature_ai_scripts` VALUES 
('3788601', '37886', '0', '6', '100', '3', '20000', '20000', '20000', '20000', '11', '70633', '1', '1', '', '', '', '', '', '', '', '', 'Gefraessige Monstrositaet - Magensaeure 10'),
('3788602', '37886', '0', '6', '100', '5', '20000', '20000', '20000', '20000', '11', '71283', '1', '1', '', '', '', '', '', '', '', '', 'Gefraessige Monstrositaet - Magensaeure 25'),
('3788603', '37886', '0', '6', '100', '9', '20000', '20000', '20000', '20000', '11', '72025', '1', '1', '', '', '', '', '', '', '', '', 'Gefraessige Monstrositaet - Magensaeure 10h'),
('3788604', '37886', '0', '6', '100', '17', '20000', '20000', '20000', '20000', '11', '72026', '1', '1', '', '', '', '', '', '', '', '', 'Gefraessige Monstrositaet - Magensaeure 25h');

-- Loderndes Skelett
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='36791');
INSERT INTO `creature_ai_scripts` VALUES 
('3679101', '36791', '0', '6', '100', '3', '6000', '6000', '6000', '6000', '11', '70754', '1', '1', '', '', '', '', '', '', '', '', 'Loderndes Skelett - Feuerball 10'),
('3679102', '36791', '0', '6', '100', '5', '6000', '6000', '6000', '6000', '11', '71748', '1', '1', '', '', '', '', '', '', '', '', 'Loderndes Skelett - Feuerball 25'),
('3679103', '36791', '0', '6', '100', '9', '6000', '6000', '6000', '6000', '11', '72023', '1', '1', '', '', '', '', '', '', '', '', 'Loderndes Skelett - Feuerball 10h'),
('3679104', '36791', '0', '6', '100', '17', '6000', '6000', '6000', '6000', '11', '72024', '1', '1', '', '', '', '', '', '', '', '', 'Loderndes Skelett - Feuerball 25h'),
('3679105', '36791', '0', '6', '100', '11', '20000', '20000', '20000', '20000', '11', '69325', '0', '1', '', '', '', '', '', '', '', '', 'Loderndes Skelett - Verwuesten 10'),
('3679106', '36791', '0', '6', '100', '21', '20000', '20000', '20000', '20000', '11', '71730', '0', '1', '', '', '', '', '', '', '', '', 'Loderndes Skelett - Verwuesten 25');

-- Sinistrer Berater
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37571');
INSERT INTO `creature_ai_scripts` VALUES 
('3757101', '37571', '0', '6', '100', '11', '6000', '6000', '6000', '6000', '11', '72057', '1', '1', '', '', '', '', '', '', '', '', 'Sinistrer Berater - Lichslap 10'),
('3757102', '37571', '0', '6', '100', '21', '6000', '6000', '6000', '6000', '11', '72421', '1', '1', '', '', '', '', '', '', '', '', 'Sinistrer Berater - Lichslap 25'),
('3757103', '37571', '0', '6', '100', '31', '19000', '22000', '19000', '22000', '11', '72065', '1', '1', '', '', '', '', '', '', '', '', 'Sinistrer Berater - Shroud of Protection'),
('3757104', '37571', '0', '6', '100', '31', '19000', '22000', '19000', '22000', '11', '72066', '1', '1', '', '', '', '', '', '', '', '', 'Sinistrer Berater - Shroud of Spell Warding');

-- Sinistrer Erzmagier
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37664');
INSERT INTO `creature_ai_scripts` VALUES 
('3766401', '37664', '0', '6', '100', '11', '20000', '20000', '20000', '20000', '11', '70408', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Archmage - Amplify Magic 10'),
('3766402', '37664', '0', '6', '100', '21', '20000', '20000', '20000', '20000', '11', '72336', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Archmage - Amplify Magic 25'),
('3766403', '37664', '0', '6', '100', '11', '10000', '12000', '10000', '12000', '11', '70407', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Archmage - Blast Wave 10'),
('3766404', '37664', '0', '6', '100', '21', '10000', '12000', '10000', '12000', '11', '71151', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Archmage - Blast Wave 25'),
('3766405', '37664', '0', '6', '100', '11', '15000', '17000', '15000', '17000', '11', '70409', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Archmage - Fireball 10'),
('3766406', '37664', '0', '6', '100', '21', '15000', '17000', '15000', '17000', '11', '71153', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Archmage - Fireball 25'),
('3766407', '37664', '0', '6', '100', '31', '10000', '14000', '10000', '14000', '11', '71153', '5', '1', '', '', '', '', '', '', '', '', 'Darkfallen Archmage - Polymorph');

-- Sinistrer Blutritter
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37595');
INSERT INTO `creature_ai_scripts` VALUES 
('3759501', '37595', '11', '6', '100', '31', '', '', '', '', '11', '71736', '0', '1', '', '', '', '', '', '', '', '', 'Darkfallen Blood Knight - Vampiric Aura'),
('3759502', '37595', '0', '6', '100', '31', '7000', '7000', '7000', '7000', '11', '70437', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Blood Knight - Unholy Strike');

-- Sinistrer Kommandant
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37662');
INSERT INTO `creature_ai_scripts` VALUES 
('3766201', '37662', '0', '6', '100', '31', '1', '10', '30000', '35000', '11', '70750', '0', '1', '', '', '', '', '', '', '', '', 'Darkfallen Commander - Battle Shout'),
('3766202', '37662', '0', '6', '100', '11', '18000', '22000', '18000', '22000', '11', '70449', '5', '1', '', '', '', '', '', '', '', '', 'Darkfallen Commander - Vampire Rush 10'),
('3766203', '37662', '0', '6', '100', '21', '18000', '22000', '18000', '22000', '11', '71155', '5', '1', '', '', '', '', '', '', '', '', 'Darkfallen Commander - Vampire Rush 25');

-- Sinistrer Leutnant
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37665');
INSERT INTO `creature_ai_scripts` VALUES 
('3766501', '37665', '0', '6', '100', '11', '13000', '17000', '13000', '17000', '11', '70435', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Lieutnant - Rend Flash 10'),
('3766502', '37665', '0', '6', '100', '21', '13000', '17000', '13000', '17000', '11', '71154', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Lieutnant - Rend Flash 25'),
('3766503', '37665', '0', '6', '100', '31', '10000', '12000', '25000', '27000', '11', '70423', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Lieutnant - Vampiric Curse');

-- Sinistrer Adliger
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37663');
INSERT INTO `creature_ai_scripts` VALUES 
('3766301', '37663', '0', '6', '100', '31', '15000', '19000', '15000', '19000', '11', '70645', '5', '1', '', '', '', '', '', '', '', '', 'Darkfallen Noble - Chains of Shadow'),
('3766302', '37663', '0', '6', '100', '11', '6000', '10000', '6000', '10000', '11', '72960', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Noble - Shadowbolt 10'),
('3766303', '37663', '0', '6', '100', '21', '6000', '10000', '6000', '10000', '11', '72961', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Noble - Shadowbolt 25');

-- Sinistrer Taktiker
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37666');
INSERT INTO `creature_ai_scripts` VALUES 
('3766601', '37666', '0', '6', '100', '31', '13000', '17000', '13000', '17000', '11', '70432', '5', '1', '', '', '', '', '', '', '', '', 'Darkfallen Tactican - Blood Sap'),
('3766602', '37666', '0', '6', '100', '31', '13000', '17000', '13000', '17000', '11', '70431', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Tactican - Shadowstep'),
('3766603', '37666', '0', '6', '100', '31', '8000', '12000', '8000', '12000', '11', '70437', '1', '1', '', '', '', '', '', '', '', '', 'Darkfallen Tactican - Unholy Strike');

-- Knecht der Todessprecher
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='36811');
INSERT INTO `creature_ai_scripts` VALUES 
('3681101', '36811', '0', '6', '100', '31', '8000', '12000', '8000', '12000', '11', '69387', '1', '1', '', '', '', '', '', '', '', '', 'Deathspeak Attendant - Shadow Bolt'),
('3681102', '36811', '0', '6', '100', '11', '10000', '14000', '10000', '14000', '11', '69355', '0', '1', '', '', '', '', '', '', '', '', 'Deathspeak Attendant - Shadow Nova 10'),
('3681103', '36811', '0', '6', '100', '21', '10000', '14000', '10000', '14000', '11', '71106', '0', '1', '', '', '', '', '', '', '', '', 'Deathspeak Attendant - Shadow Nova 25');

-- Jünger der Todessprecher
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='36807');
INSERT INTO `creature_ai_scripts` VALUES 
('3680701', '36807', '0', '6', '100', '31', '15000', '19000', '15000', '19000', '11', '69391', '0', '1', '', '', '', '', '', '', '', '', 'Deathspeaker Disciple - Dark Blessing'),
('3680702', '36807', '0', '6', '100', '31', '10000', '14000', '10000', '14000', '11', '69387', '1', '1', '', '', '', '', '', '', '', '', 'Deathspeaker Disciple - Shadow Bolt'),
('3680703', '36807', '0', '6', '100', '11', '20000', '30000', '20000', '30000', '11', '69389', '0', '1', '', '', '', '', '', '', '', '', 'Deathspeaker Disciple - Shadow Mend 10'),
('3680704', '36807', '0', '6', '100', '21', '20000', '30000', '20000', '30000', '11', '71107', '0', '1', '', '', '', '', '', '', '', '', 'Deathspeaker Disciple - Shadow Mend 25');

-- Hohepriester der Todessprecher
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='36829');
INSERT INTO `creature_ai_scripts` VALUES 
('3682901', '36829', '11', '6', '100', '31', '', '', '', '', '11', '69491', '0', '1', '', '', '', '', '', '', '', '', 'Deathspeaker High Priest - Aura of Darkness'),
('3682902', '36829', '0', '6', '100', '31', '8000', '12000', '8000', '12000', '11', '69483', '1', '1', '', '', '', '', '', '', '', '', 'Deathspeaker High Priest - Dark Reckoning');

-- Diener der Todessprecher
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='36805');
INSERT INTO `creature_ai_scripts` VALUES 
('3680501', '36805', '0', '6', '100', '11', '13000', '17000', '13000', '17000', '11', '69576', '1', '1', '', '', '', '', '', '', '', '', 'Deathspeaker Servant - Chaos Bolt 10'),
('3680502', '36805', '0', '6', '100', '21', '13000', '17000', '13000', '17000', '11', '71108', '1', '1', '', '', '', '', '', '', '', '', 'Deathspeaker Servant - Chaos Bolt 25'),
('3680503', '36805', '0', '6', '100', '31', '18000', '22000', '18000', '22000', '11', '69405', '4', '1', '', '', '', '', '', '', '', '', 'Deathspeaker Servant - Consuming Shadows'),
('3680504', '36805', '0', '6', '100', '11', '24000', '26000', '24000', '26000', '11', '69404', '4', '1', '', '', '', '', '', '', '', '', 'Deathspeaker Servant - Curse of Agony 10'),
('3680505', '36805', '0', '6', '100', '21', '24000', '26000', '24000', '26000', '11', '71112', '4', '1', '', '', '', '', '', '', '', '', 'Deathspeaker Servant - Curse of Agony 25');

-- Zelot der Todessprecher
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='36808');
INSERT INTO `creature_ai_scripts` VALUES 
('3680801', '36808', '0', '6', '100', '31', '8000', '12000', '8000', '12000', '11', '69492', '1', '1', '', '', '', '', '', '', '', '', 'Deathspeaker Zealot - Shadow Cleave');

-- Verwesender Koloss
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='36880');
INSERT INTO `creature_ai_scripts` VALUES 
('3688001', '36880', '0', '6', '100', '11', '8000', '12000', '8000', '12000', '11', '71114', '1', '1', '', '', '', '', '', '', '', '', 'Decaying Colossus - Massive Stomp 10'),
('3688002', '36880', '0', '6', '100', '21', '8000', '12000', '8000', '12000', '11', '71115', '1', '1', '', '', '', '', '', '', '', '', 'Decaying Colossus - Massive Stomp 25');

-- Empowered Vampiric Fiend
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37919');
INSERT INTO `creature_ai_scripts` VALUES 
('3791901', '37919', '11', '6', '100', '31', '', '', '', '', '11', '41290', '0', '1', '', '', '', '', '', '', '', '', 'Empowered Vampiric Fiend - Disease Cloud'),
('3791902', '37919', '0', '6', '100', '31', '30000', '35000', '60000', '65000', '11', '70711', '0', '1', '', '', '', '', '', '', '', '', 'Empowered Vampiric Fiend - Empowered Blood'),
('3791903', '37919', '0', '6', '100', '31', '13000', '17000', '13000', '17000', '11', '70710', '1', '1', '', '', '', '', '', '', '', '', 'Empowered Vampiric Fiend - Leeching Rot');

-- Rasende Monstrosität
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37546');
INSERT INTO `creature_ai_scripts` VALUES 
('3754601', '37546', '0', '6', '100', '31', '6000', '10000', '6000', '10000', '11', '70191', '1', '1', '', '', '', '', '', '', '', '', 'Frenzied Abomination - Cleave'),
('3754602', '37546', '0', '6', '100', '31', '30000', '30000', '30000', '30000', '11', '70371', '0', '1', '', '', '', '', '', '', '', '', 'Frenzied Abomination - Enrage');

-- Tierführer der Frostwächter
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37531');
INSERT INTO `creature_ai_scripts` VALUES 
('3753101', '37531', '0', '6', '100', '11', '8000', '12000', '8000', '12000', '11', '71337', '0', '1', '', '', '', '', '', '', '', '', 'Frostwarden Handler - Concussive Shock 10'),
('3753102', '37531', '0', '6', '100', '21', '8000', '12000', '8000', '12000', '11', '71338', '0', '1', '', '', '', '', '', '', '', '', 'Frostwarden Handler - Concussive Shock 25'),
('3753103', '37531', '0', '6', '100', '31', '10000', '15000', '10000', '15000', '11', '71357', '0', '1', '', '', '', '', '', '', '', '', 'Frostwarden Handler - Order Whelp');

-- Zauberin der Frostwächter
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37229');
INSERT INTO `creature_ai_scripts` VALUES 
('3722901', '37229', '0', '6', '100', '31', '13000', '17000', '13000', '17000', '11', '71320', '0', '1', '', '', '', '', '', '', '', '', 'Frostwarden Sorceress - Frost Nova'),
('3722902', '37229', '0', '6', '100', '31', '6000', '10000', '6000', '10000', '11', '71318', '1', '1', '', '', '', '', '', '', '', '', 'Frostwarden Sorceress - Frostbolt'),
('3722903', '37229', '0', '6', '100', '21', '12000', '16000', '12000', '16000', '11', '71331', '1', '1', '', '', '', '', '', '', '', '', 'Frostwarden Sorceress - Ice Tomb 25');

-- Krieger der Frostwächter
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37228');
INSERT INTO `creature_ai_scripts` VALUES 
('3722801', '37228', '0', '6', '100', '31', '18000', '22000', '18000', '22000', '11', '71325', '0', '1', '', '', '', '', '', '', '', '', 'Frostwarden Warrior - Frostblade'),
('3722802', '37228', '0', '6', '100', '11', '10000', '14000', '10000', '14000', '11', '71316', '1', '1', '', '', '', '', '', '', '', '', 'Frostwarden Warrior - Glacial Strike 10'),
('3722803', '37228', '0', '6', '100', '21', '10000', '14000', '10000', '14000', '11', '71317', '1', '1', '', '', '', '', '', '', '', '', 'Frostwarden Warrior - Glacial Strike 25');

-- Frostschwingenwelpe
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37532');
INSERT INTO `creature_ai_scripts` VALUES 
('3753201', '37532', '4', '6', '100', '31', '', '', '', '', '11', '71350', '1', '1', '', '', '', '', '', '', '', '', 'Frostwing Whelp - Focus Fire'),
('3753202', '37532', '0', '6', '100', '11', '6000', '10000', '6000', '10000', '11', '71361', '1', '1', '', '', '', '', '', '', '', '', 'Frostwing Whelp - Frost Blast 10'),
('3753203', '37532', '0', '6', '100', '21', '6000', '10000', '6000', '10000', '11', '71362', '1', '1', '', '', '', '', '', '', '', '', 'Frostwing Whelp - Frost Blast 25');

-- Seuchenwissenschaftler
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37023');
INSERT INTO `creature_ai_scripts` VALUES 
('3702301', '37023', '0', '6', '100', '31', '13000', '17000', '13000', '17000', '11', '71103', '1', '1', '', '', '', '', '', '', '', '', 'Plague Scientist - Combobulating Spray'),
('3702302', '37023', '0', '6', '100', '31', '6000', '10000', '6000', '10000', '11', '73079', '4', '1', '', '', '', '', '', '', '', '', 'Plague Scientist - Plague Blast'),
('3702303', '37023', '0', '6', '100', '31', '25000', '29000', '25000', '29000', '11', '69871', '1', '1', '', '', '', '', '', '', '', '', 'Plague Scientist - Plague Stream');

-- Eiternder Schrecken
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='10404');
INSERT INTO `creature_ai_scripts` VALUES 
('1040401', '10404', '0', '6', '100', '31', '15000', '30000', '15000', '30000', '11', '71088', '0', '1', '', '', '', '', '', '', '', '', 'Pusutlating Horror - Blight Bomb'),
('1040402', '10404', '0', '6', '100', '11', '8000', '12000', '8000', '12000', '11', '71089', '4', '1', '', '', '', '', '', '', '', '', 'Pusutlating Horror - Bubbling Pus 10'),
('1040403', '10404', '0', '6', '100', '21', '8000', '12000', '8000', '12000', '11', '71090', '4', '1', '', '', '', '', '', '', '', '', 'Pusutlating Horror - Bubbling Pus 25');

-- Auferstandener Erzmagier
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37868');
INSERT INTO `creature_ai_scripts` VALUES 
('3786801', '37868', '0', '6', '100', '31', '10000', '14000', '10000', '14000', '11', '70602', '4', '1', '', '', '', '', '', '', '', '', 'Risen Archmage - Corruption'),
('3786802', '37868', '0', '6', '100', '3', '7000', '9000', '7000', '9000', '11', '70759', '0', '1', '', '', '', '', '', '', '', '', 'Risen Archmage - Frostbolt Volley 10 nhc'),
('3786803', '37868', '0', '6', '100', '9', '7000', '9000', '7000', '9000', '11', '72015', '0', '1', '', '', '', '', '', '', '', '', 'Risen Archmage - Frostbolt Volley 10 hc'),
('3786804', '37868', '0', '6', '100', '5', '7000', '9000', '7000', '9000', '11', '71889', '0', '1', '', '', '', '', '', '', '', '', 'Risen Archmage - Frostbolt Volley 25 nhc'),
('3786805', '37868', '0', '6', '100', '17', '7000', '9000', '7000', '9000', '11', '72016', '0', '1', '', '', '', '', '', '', '', '', 'Risen Archmage - Frostbolt Volley 25 hc'),
('3786806', '37868', '0', '6', '100', '11', '13999', '17000', '13000', '17000', '11', '71179', '4', '1', '', '', '', '', '', '', '', '', 'Risen Archmage - Mana Void 10'),
('3786807', '37868', '0', '6', '100', '21', '13999', '17000', '13000', '17000', '11', '71741', '4', '1', '', '', '', '', '', '', '', '', 'Risen Archmage - Mana Void 25');

-- Auferstandener Diener der Todessprecher
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='36844');
INSERT INTO `creature_ai_scripts` VALUES 
('3684401', '36844', '0', '6', '100', '11', '13000', '17000', '13000', '17000', '11', '69576', '1', '1', '', '', '', '', '', '', '', '', 'Risen Deathspeaker Servant - Chaos Bolt 10'),
('3684402', '36844', '0', '6', '100', '21', '13000', '17000', '13000', '17000', '11', '71108', '1', '1', '', '', '', '', '', '', '', '', 'Risen Deathspeaker Servant - Chaos Bolt 25'),
('3684403', '36844', '0', '6', '100', '31', '18000', '22000', '18000', '22000', '11', '69405', '1', '1', '', '', '', '', '', '', '', '', 'Risen Deathspeaker Servant - Consuming Shadows'),
('3684404', '36844', '0', '6', '100', '11', '24000', '26000', '24000', '26000', '11', '69404', '1', '1', '', '', '', '', '', '', '', '', 'Risen Deathspeaker Servant - Curse of Agony 10'),
('3684405', '36844', '0', '6', '100', '21', '24000', '26000', '24000', '26000', '11', '71112', '1', '1', '', '', '', '', '', '', '', '', 'Risen Deathspeaker Servant - Curse of Agony 25');

-- Die Verdammten
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`='37011');
INSERT INTO `creature_ai_scripts` VALUES 
('3701101', '37011', '0', '6', '100', '31', '10000', '14000', '10000', '14000', '11', '70960', '0', '0', '', '', '', '', '', '', '', '', 'The Damned - Bone Flurry'),
('3701102', '37011', '6', '6', '100', '31', '', '', '', '', '11', '70961', '0', '1', '', '', '', '', '', '', '', '', 'The Damned - Shattered Bones');

-- Use AI
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` IN ('36724', '37007', '37886', '36791', '37571', '37664', '37595', '37662', '37665', '37663', '37666', '36811', '36807', '36829', '36805', '36808', '36880', '37919', '37546', '37531', '37229', '37228', '37532', '37023', '10404', '37868', '36844', '37011');
