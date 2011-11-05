/*
Approximate damage of NPCs before armor reduction
75k-90k - The Lich King
25k-30k - Shambling Horror
3.5-5k - Drudge Ghoul
30k-40k - Raging Spirit
10k-12k - Spirit Warden
10k-12k - Terenas Menethil

Multipliers
1.2 = 10H/25N
1.5 = 25H
*/

UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=150 WHERE `entry`=36597;
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=180 WHERE `entry`=39167; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=180 WHERE `entry`=39168; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=225 WHERE `entry`=39169; 

UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=50 WHERE `entry`=37698; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=60 WHERE `entry`=39299; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=60 WHERE `entry`=39300; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=75 WHERE `entry`=39301; 

UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=7 WHERE `entry`=37695; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=8.4 WHERE `entry`=39309; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=8.4 WHERE `entry`=39310; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=10.5 WHERE `entry`=39311; 

UPDATE `creature_template` SET `difficulty_entry_1`=39302,`difficulty_entry_2`=39303,`difficulty_entry_3`=39304 WHERE `entry`=36701; 
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857,`exp`=2,`minlevel`=83,`maxlevel`=83,`faction_A`=14,`faction_H`=14,`dynamicflags`=0 WHERE `entry` IN (39302,39303,39304); 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=60 WHERE `entry`=36701; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=72 WHERE `entry`=39302; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=72 WHERE `entry`=39303; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=90 WHERE `entry`=39304; 

UPDATE `creature_template` SET `difficulty_entry_1`=39296 WHERE `entry`=36824; 
UPDATE `creature_template` SET `minlevel`=83,`maxlevel`=83,`exp`=2,`faction_A`=14,`faction_H`=14,`flags_extra`=256 WHERE `entry`=39296; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=20 WHERE `entry`=36824; 
UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=20 WHERE `entry`=39296; 

UPDATE `creature_template` SET `mindmg`=509,`maxdmg`=683,`attackpower`=805,`dmg_multiplier`=20 WHERE `entry`=36823; 
