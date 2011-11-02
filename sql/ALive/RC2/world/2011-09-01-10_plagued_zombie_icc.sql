-- Set walk and run speed to 0,6 on plagued zombie (38104)
UPDATE `creature_template` SET `speed_walk` = '0.6' , `speed_run` = '0.6' WHERE `entry` = '38104';