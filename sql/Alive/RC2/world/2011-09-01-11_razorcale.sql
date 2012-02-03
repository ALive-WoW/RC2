UPDATE `creature_template` SET `ScriptName`='boss_razorscale' WHERE `entry`=33186;
UPDATE `creature_template` SET `ScriptName`='boss_razorscale_controller' WHERE `entry`=33233;
UPDATE `gameobject_template` SET `ScriptName`='go_razorscale_harpoon' WHERE `entry` IN(194519,194541,194542,194543);
UPDATE `creature_template` SET `ScriptName`='npc_mole_machine_trigger' WHERE `entry`=33245;
UPDATE `creature_template` SET `ScriptName`='npc_expedition_commander' WHERE `entry`=33210;
UPDATE `creature_template` SET `ScriptName`='npc_darkrune_guardian' WHERE `entry`=33388;
UPDATE `creature_template` SET `ScriptName`='npc_darkrune_sentinel' WHERE `entry`=33846;
UPDATE `creature_template` SET `ScriptName`='npc_darkrune_watcher' WHERE `entry`=33453;

INSERT IGNORE INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
( 63308, 'spell_razorscale_devouring_flame');