UPDATE `creature_template` SET `ScriptName`='npc_auriaya_seeping_trigger' WHERE `entry` =34098;
UPDATE `creature_template` SET `ScriptName`='npc_feral_defender' WHERE `entry`=34035;
UPDATE `creature_template` SET `ScriptName`='npc_sanctum_sentry' WHERE `entry`=34014;
UPDATE `creature_template` SET `ScriptName`='boss_elder_brightleaf' WHERE `entry`=32915;
UPDATE `creature_template` SET `ScriptName`='boss_elder_ironbranch' WHERE `entry`=32913;
UPDATE `creature_template` SET `ScriptName`='boss_elder_stonebark' WHERE `entry`=32914;
UPDATE `creature_template` SET `ScriptName`='npc_ancient_conservator' WHERE `entry`=33203;
UPDATE `creature_template` SET `ScriptName`='npc_snaplasher' WHERE `entry`=32916;
UPDATE `creature_template` SET `ScriptName`='npc_storm_lasher' WHERE `entry`=32919;
UPDATE `creature_template` SET `ScriptName`='npc_ancient_water_spirit' WHERE `entry`=33202;
UPDATE `creature_template` SET `ScriptName`='npc_detonating_lasher' WHERE `entry`=32918;
UPDATE `creature_template` SET `ScriptName`='npc_sun_beam' WHERE `entry`=33170;
UPDATE `creature_template` SET `ScriptName`='npc_eonars_gift' WHERE `entry`=33228;
UPDATE `creature_template` SET `ScriptName`='npc_healthy_spore' WHERE `entry`=33215;
UPDATE `creature_template` SET `ScriptName`='npc_unstable_sun_beam' WHERE `entry`=33050;
UPDATE `creature_template` SET `ScriptName`='npc_iron_roots' WHERE `entry` IN (33088,33168);
UPDATE `creature_template` SET `ScriptName`='npc_ice_block' WHERE `entry`=32938;

UPDATE `spell_script_names` SET `ScriptName`='spell_marrowgar_coldflame_bonestorm' WHERE `spell_id`=72705 AND `ScriptName`='spell_marrowgar_coldflame';
UPDATE `spell_script_names` SET `ScriptName`='spell_marrowgar_coldflame_bonestorm' WHERE `spell_id`=72705;

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_rotface_mutated_infection';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_auriaya_strenght_of_the_pack';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dreamwalker_summon_suppresser_effect';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_dreamwalker_twisted_nightmares';

INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(64381,'spell_auriaya_strenght_of_the_pack'),
(70936,'spell_dreamwalker_summon_suppresser_effect'),
(71941,'spell_dreamwalker_twisted_nightmares'),
(69674,'spell_rotface_mutated_infection'),
(71224,'spell_rotface_mutated_infection'),
(73022,'spell_rotface_mutated_infection'),
(73023,'spell_rotface_mutated_infection');