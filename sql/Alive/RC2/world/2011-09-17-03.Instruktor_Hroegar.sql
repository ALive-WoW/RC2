DELETE FROM `creature_loot_template` WHERE `entry`=29915 AND `item`=41843;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`) VALUES (29915, 41843, -100, 1);
UPDATE `creature_loot_template` SET `groupid`=2 WHERE `entry`=29915 AND `item`=41989 LIMIT 1;
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=29915 LIMIT 1;