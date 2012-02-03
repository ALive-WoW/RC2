DELETE FROM trinity_string WHERE entry IN (1137, 1138);
INSERT INTO trinity_string (`entry`,`content_default`) VALUES
(1137, 'Dev mode is ON'),
(1138, 'Dev mode is OFF'); 

DELETE FROM command WHERE name = 'dev';
INSERT INTO command VALUES
('dev', 3, 'Syntax: .dev [on/off]\r\n\r\nEnable or Disable in game Dev tag or show current state if on/off not provided.'); 