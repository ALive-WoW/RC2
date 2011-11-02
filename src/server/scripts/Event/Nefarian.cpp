/*
 * Copyright (C) 2008-2010 TrinityCore <http://www.trinitycore.org/>
 *
 * Copyright (C) 2005-2012 ALiveCore <http://www.wow-alive.de/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 */

/*
Autor: DarkSoe
Complete: 80%
Onyxias Hord

thx to Shiro for GPS locations
*/

/* SQL's
INSERT INTO `creature_template` VALUES ('400001', '', '0', '0', '0', '0', '8570', '0', '0', '0', 'Onyxia', 'Kinder von Todesschwinge', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '350', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', 'boss_onyxia_event', '12340');
INSERT INTO `creature_template` VALUES ('400002', '', '0', '0', '0', '0', '11380', '0', '0', '0', 'Nefarian', 'Kinder von Todesschwinge', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '350', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', 'boss_nefarian_event', '12340');

INSERT INTO `creature_template` VALUES ('400003', '', '0', '0', '0', '0', '17519', '0', '0', '0', 'Lava', 'null', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '350', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'mob_lava_flame', '12340');
INSERT INTO `creature_template` VALUES ('400004', '', '0', '0', '0', '0', '17519', '0', '0', '0', 'Lava_trigger', 'null', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '350', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'mob_lava_flame2', '12340');
-- INSERT INTO `creature_template` VALUES ('400005', '', '0', '0', '0', '0', '17519', '0', '0', '0', 'Lava_trigger', 'null', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '350', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'mob_lava_trigger', '12340');

INSERT INTO `creature_template` VALUES ('400006', '', '0', '0', '0', '0', '17519', '0', '0', '0', 'Meteor', 'null', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '350', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', 'mob_meteor_nef', '12340');
INSERT INTO `creature_template` VALUES ('400007', '', '0', '0', '0', '0', '17519', '0', '0', '0', 'Meteor', 'null', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '350', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', '', '12340');

INSERT INTO `creature_template` VALUES ('400008', '38061', '0', '0', '0', '0', '31092', '0', '0', '0', 'Belebter Knochenkrieger', '', '', '0', '80', '80', '2', '16', '16', '0', '1', '1.14286', '1', '1', '422', '586', '0', '642', '7.7', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '345', '509', '103', '6', '72', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '38', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'mob_knochenkrieger', '12340');
INSERT INTO `creature_template` VALUES ('400009', '38061', '0', '0', '0', '0', '26919', '0', '0', '0', 'Chromatischer Prototyp', '', '', '0', '80', '80', '2', '16', '16', '0', '1', '1.14286', '1', '1', '422', '586', '0', '642', '7.7', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '345', '509', '103', '6', '72', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '38', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'mob_prototype', '12340');

INSERT INTO `creature_template` VALUES ('400010', '', '0', '0', '0', '0', '17519', '0', '0', '0', 'Meteor_ress', 'null', null, '0', '83', '83', '2', '103', '103', '0', '1', '1.29', '1', '3', '509', '683', '0', '805', '35', '1500', '1800', '1', '64', '8', '0', '0', '0', '0', '0', '371', '535', '135', '2', '108', '0', '0', '0', '0', '0', '100', '0', '0', '0', '15847', '18351', '18435', '18564', '0', '0', '0', '0', '0', '0', '93755', '122438', '', '1', '3', '350', '1', '1', '0', '18705', '0', '0', '0', '0', '0', '0', '1', '0', '650854267', '257', 'mob_resser_dummy', '12340');

INSERT INTO `creature_template` VALUES ('400011', '38061', '0', '0', '0', '0', '31092', '0', '0', '0', 'Belebter Knochenkrieger Dummy', '', '', '0', '80', '80', '2', '16', '16', '0', '1', '1.14286', '1', '1', '422', '586', '0', '642', '7.7', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '345', '509', '103', '6', '72', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '38', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'mob_knochenkrieger_dummy', '12340');

UPDATE `creature_template` SET `speed_walk`='0.001', `speed_run`='0.001' WHERE `entry`='400009';
UPDATE `creature_template` SET `health_mod`='505.0659' WHERE `entry`='400001';
UPDATE `creature_template` SET `health_mod`='2044.90096' WHERE `entry`='400002';
*/

#include "ScriptPCH.h"
#include "ObjectMgr.h"


//Intro
#define SAY_INTRO1 "Ha ha ha ha ha! Die Helden haben es in das glorreiche Finale geschafft! Ich nehme an, Ihr seid in guter Stimmung? Vorbereitet für die letzte Schlacht? Dann werft jetzt einen Blick auf meine ultimative Schöpfung! AUFERSTANDEN, Schwester!" //Nefarian
#define SAY_INTRO2 "Siehe, dieBrutmutter ... Onyxia ... WIEDERGEBOREN. Vermutlich meine beste Arbeit." //Nefarian
#define SAY_INTRO3 "Mein liebster Bruder ... Hast du Hunger? Dann speisen Wir an unseren Feinden!" //Onyxia

//Skelet reborn
#define SAY_SKELETION_REPORN "Seht, wie die Schattenflamme ihre Knochen mit Leben erfüllt! Sie gehorchen meinem Befehl!" //Nefarian

//Lava
#define SAY_LAVA "Ich hoffe, ihr könnt schwimmen... in geschmolzener Lava!" //Nefarian

//Phase3
#define SAY_PHASE "Ich habe versucht, ein guter Gastgeber zu sein, aber ihr wollt einfach nicht sterben! Genug der Spielchen! Ich werde euch einfach... ALLE TÖTEN!" //Nefarian

//Shadow Breth
#define SAY_NEF_BRETH "Fleisch wird zu Asche!" //Nefarian

//Kill Player
#define SAY_KILL1 "Ihr müsst es wirklich wollen."
#define SAY_KILL2 "Es war mir eine Freude!"

//Death
#define SAY_DEATH "Keine Niederlage hat je bitterer geschmeckt..." //Nefarian
#define SAY_ONY_DEATH "Verfluchte Sterbliche! Ein solcher Umgang mit dem Eigentum anderer verlangt nach Gewalt!" //Nefarian


enum eSpells
{
	// Onyxia
	SPELL_FLAME_BREATH          = 74527,
	SPELL_TAIL_SWEEP            = 74531,
	SPELL_CLEAVE                = 74524,

	//Nefarian
	SPELL_ATEM_BIG              = 17086,
	SPELL_DARK_BREATH           = 75955,
	SPELL_GESCHOSSE             = 41229,

	//Belebter Knochenkrieger
	SPELL_SHADOWFORM		    = 15473,

	// Chromatischer Prototyp
	SPELL_BLAST_WAVE	        = 11113,
	SPELL_DRUCKNOVA				= 68958,

	//Lavatrigger
	SPELL_METEOR_FLAME			= 74718,

	//Kinder von Todesschwinge
	SPELL_KINDER_VON_TODESSCHWINGE = 26615,

	//Meteor
	SPELL_VISUAL				= 55928,
};

#define NPC_NEFARIAN 400002
#define NPC_ONYXIA 400001

#define NPC_LAVA2 400004
#define NPC_LAVA 400003

#define NPC_PROTOTYP 400009
#define NPC_KRIEGER 400008

#define NPC_NEF_METEOR_HAG 400006
#define NPC_ONY_METEOR 400007

#define NPC_NEF_METEOR_RES 400010

#define NPC_KRIEGER_DUMMY 400011

class boss_onyxia_event : public CreatureScript
{
public:
    boss_onyxia_event() : CreatureScript("boss_onyxia_event") { }

    struct boss_onyxia_eventAI : public ScriptedAI
    {
        boss_onyxia_eventAI(Creature* creature) : ScriptedAI(creature)
        {
            Reset();
        }

		uint32 time;
        uint32 uiBreathTimer;
		uint32 uiTailSweepTimer;
		uint32 uiCleaveTimer;
		uint32 uiNefarianSummonTimer;
		uint32 uiIntroTimer;
		uint32 uiSummontimer;
		uint32 uiSumonCounter;
		uint64 uiNefarianGUID;
		bool isIntro;
		bool isIntroDone;

        void Reset()
        {
			uiBreathTimer = urand(14000, 20000);
			uiTailSweepTimer = urand(10000, 12000);
			uiCleaveTimer = urand(5000, 7000);
			uiNefarianSummonTimer = 40000;
			uiSummontimer = 10000;
			uiSumonCounter = 0;
			uiIntroTimer = 0;
			isIntro = false;
			isIntroDone = false;
			time = 0;
        }

        void EnterCombat(Unit* /*who*/)
        {
            me->SetInCombatWithZone();
			uiNefarianGUID = me->FindNearestCreature(NPC_NEFARIAN, 300.0f, true)->GetGUID();
			isIntro = true;
			me->SetReactState(REACT_PASSIVE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE);
        }

        void JustDied(Unit* /*killer*/)
        {
			if (Creature* nefarian = ObjectAccessor::GetCreature(*me, uiNefarianGUID))
			{
				nefarian->MonsterYell(SAY_ONY_DEATH, LANG_UNIVERSAL, 0);
				nefarian->AI()->DoAction(1);

				if(nefarian->HasAura(SPELL_KINDER_VON_TODESSCHWINGE))
					nefarian->RemoveAura(SPELL_KINDER_VON_TODESSCHWINGE);
			}
        }

        void KilledUnit(Unit* /*victim*/)
        {

        }

		void Intro(uint32 time, Creature *creature)
		{
			if (time == 1)
				creature->MonsterYell(SAY_INTRO1, LANG_UNIVERSAL, 0);

			if (time == 2)
				creature->MonsterYell(SAY_INTRO2, LANG_UNIVERSAL, 0);

			if (time == 3)
			{
				creature->MonsterYell(SAY_INTRO3, LANG_UNIVERSAL, 0);
				creature->SetReactState(REACT_AGGRESSIVE);
                creature->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE);
			}
		}

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

			if (isIntro == true)
			{
				if (Creature* nefarian = ObjectAccessor::GetCreature(*me, uiNefarianGUID))
				{
					while(time <= 3)
					{
						if (uiIntroTimer <= diff)
						{
							if (time == 3)
							{
								Intro(time, me);
								time++;
								isIntro = false;
								isIntroDone = true;
								uiIntroTimer = 3000;
							}else{
								Intro(time, nefarian);
								time++;
								uiIntroTimer = 3000;
							}
						}else{
							uiIntroTimer -= diff;
						}
					}
				}
			}

			if (isIntroDone == true)
			{
				if (uiBreathTimer <= diff)
				{
					DoCast(SPELL_FLAME_BREATH);

					uint32 counter = 0;
					while (counter < 7)
					{
						if(Creature* npc_dummy = me->FindNearestCreature(NPC_KRIEGER_DUMMY, 300.0f, true))
							if (me->IsWithinDistInMap(npc_dummy, 5))
								npc_dummy->AI()->DoAction(1);

						counter++;
					}

					uiBreathTimer = urand(14000, 20000);
				}else{
					uiBreathTimer -= diff;
				}

				if (uiTailSweepTimer <= diff)
				{
					DoCast(SPELL_TAIL_SWEEP);
					uiTailSweepTimer = urand(10000, 12000);
				}else{
					uiTailSweepTimer -= diff;
				}

				if (uiCleaveTimer <= diff)
				{
					me->CastSpell(me->getVictim(),SPELL_CLEAVE);
					uiCleaveTimer = urand(5000, 7000);
				}else{
					uiCleaveTimer -= diff;
				}

				if (uiNefarianSummonTimer <= diff)
				{
					if (Creature* nefarian = ObjectAccessor::GetCreature(*me, uiNefarianGUID))
					{
						nefarian->GetMotionMaster()->MovePoint(0, -32.448929f, -215.120041f, -88.244644f);
						nefarian->SetVisible(true);
						nefarian->SetReactState(REACT_AGGRESSIVE);
					}

					uiNefarianSummonTimer = 40000000;
				}else{
					uiNefarianSummonTimer -= diff;
				}

				if (uiSummontimer <= diff)
				{
					if (uiSumonCounter < 7)
					{
						uint32 randompos = urand(1,4);

						if (randompos == 1)
							if(Creature* npc_krieger = me->SummonCreature(NPC_KRIEGER, -59.786640f, -237.508774f, -85.126755f))
								npc_krieger->AI()->AttackStart(SelectTarget(SELECT_TARGET_RANDOM, 0));

						if (randompos == 2)
							if(Creature* npc_krieger = me->SummonCreature(NPC_KRIEGER, -59.195885f, -192.058212f, -85.163864f))
								npc_krieger->AI()->AttackStart(SelectTarget(SELECT_TARGET_RANDOM, 0));

						if (randompos == 3)
							if(Creature* npc_krieger = me->SummonCreature(NPC_KRIEGER, 2.153522f, -177.686417f, -85.340370f))
								npc_krieger->AI()->AttackStart(SelectTarget(SELECT_TARGET_RANDOM, 0));

						if (randompos == 4)
							if(Creature* npc_krieger = me->SummonCreature(NPC_KRIEGER, 21.815638f, -230.836456f, -84.749527f))
								npc_krieger->AI()->AttackStart(SelectTarget(SELECT_TARGET_RANDOM, 0));

						uiSumonCounter++;
						uiSummontimer = 10000;
					}
				}else{
					uiSummontimer -= diff;
				}

				DoMeleeAttackIfReady();
			}

			if (Creature* nefarian = ObjectAccessor::GetCreature(*me, uiNefarianGUID))
			{
				if (me->IsWithinDistInMap(nefarian, 25))
				{
					if(!nefarian->HasAura(SPELL_KINDER_VON_TODESSCHWINGE))
						nefarian->AddAura(SPELL_KINDER_VON_TODESSCHWINGE,nefarian);

					if(!me->HasAura(SPELL_KINDER_VON_TODESSCHWINGE))
						me->AddAura(SPELL_KINDER_VON_TODESSCHWINGE,me);
				}else{
					if(nefarian->HasAura(SPELL_KINDER_VON_TODESSCHWINGE))
						nefarian->RemoveAura(SPELL_KINDER_VON_TODESSCHWINGE);

					if(me->HasAura(SPELL_KINDER_VON_TODESSCHWINGE))
						me->RemoveAura(SPELL_KINDER_VON_TODESSCHWINGE);
				}
			}
        }
    };

	CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_onyxia_eventAI (creature);
    }
};

class boss_nefarian_event : public CreatureScript
{
public:
    boss_nefarian_event() : CreatureScript("boss_nefarian_event") { }

    struct boss_nefarian_eventAI : public ScriptedAI
    {
        boss_nefarian_eventAI(Creature* creature) : ScriptedAI(creature)
        {
            Reset();
        }

        uint64 uiOnyxiaGUID;
		uint32 uiPhase;
		uint32 uiBreathTimer;
		uint32 uiTailSweepTimer;
		uint32 uiCleaveTimer;
		uint32 uiGeschossTimer;
		uint32 uiUebergangTimer;
		uint32 uiUebergangTimerSec;
		uint32 uiRessTimer;
		uint32 uiCount;
		uint32 uilavatimer;
		uint32 uiProtoCounter;
		bool health90;
		bool health80;
		bool health70;
		bool health60;
		bool health50;
		bool health40;
		bool health30;
		bool health20;
		bool health10;
		bool isLava;
		bool isLava2;

        void Reset()
        {
			uiBreathTimer = urand(14000, 20000);
			uiTailSweepTimer = urand(10000, 12000);
			uiCleaveTimer = urand(5000, 7000);
			uiGeschossTimer = urand(15000, 17000);
			uiRessTimer = urand(20000, 30000);
			uilavatimer = 1000;
			uiUebergangTimer = 0;
			uiUebergangTimerSec = 0;
			uiOnyxiaGUID = 0;
			uiPhase = 1;

			uiCount = 0;
			uiProtoCounter = 0;

			health90 = false;
			health80 = false;
			health70 = false;
			health60 = false;
			health50 = false;
			health40 = false;
			health30 = false;
			health20 = false;
			health10 = false;

			isLava = false;
			isLava2 = true;

			me->SetFlying(true);
			me->AddUnitMovementFlag(MOVEMENTFLAG_LEVITATING);

			me->SetPhaseMask(4, true);
			me->SetVisible(false);
			me->SetReactState(REACT_PASSIVE);	
        }

        void EnterCombat(Unit* /*who*/)
        {
            me->SetInCombatWithZone();
			uiOnyxiaGUID = me->FindNearestCreature(NPC_ONYXIA, 300.0f, true)->GetGUID();
			uiPhase = 1;
			me->SetFlying(false);
			me->RemoveUnitMovementFlag(MOVEMENTFLAG_LEVITATING);

			isLava = false;

			SetCombatMovement(true);

			if (Unit* target = me->FindNearestPlayer(100.0f))
				me->AI()->AttackStart(target);
        }

        void JustDied(Unit* /*killer*/)
        {
			me->MonsterYell(SAY_DEATH, LANG_UNIVERSAL, 0);
        }

		void DoAction(int32 data)
		{
			if(data == 1)
			{
				uiPhase = 2;
				me->SetReactState(REACT_PASSIVE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE);
				uiUebergangTimerSec = 5000;
			}
			if(data == 2)
			{
				uiProtoCounter++;
				if(uiProtoCounter == 3)
					uiPhase = 5;
			}
		}

		void HealthCheck()
		{
			if (me->GetHealthPct() <= 90 && health90 == false)
			{
				SummonHagel();
				health90 = true;
			}
			if (me->GetHealthPct() <= 80 && health80 == false)
			{
				SummonHagel();
				health80 = true;
			}
			if (me->GetHealthPct() <= 70 && health70 == false)
			{
				SummonHagel();
				health70 = true;
			}
			if (me->GetHealthPct() <= 60 && health60 == false)
			{
				SummonHagel();
				health60 = true;
			}
			if (me->GetHealthPct() <= 50 && health50 == false)
			{
				SummonHagel();
				health50 = true;
			}
			if (me->GetHealthPct() <= 40 && health40 == false)
			{
				SummonHagel();
				health40 = true;
			}
			if (me->GetHealthPct() <= 30 && health30 == false)
			{
				SummonHagel();
				health30 = true;
			}
			if (me->GetHealthPct() <= 20 && health20 == false)
			{
				SummonHagel();
				health20 = true;
			}
			if (me->GetHealthPct() <= 10 && health10 == false)
			{
				SummonHagel();
				health10 = true;
			}
		}

		void SummonHagel()
		{
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()+10, me->GetPositionY()+10, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()-10, me->GetPositionY()-10, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()+10, me->GetPositionY()-10, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()-10, me->GetPositionY()+10, me->GetPositionZ()+30);

			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()+15, me->GetPositionY()+15, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()-15, me->GetPositionY()-15, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()+15, me->GetPositionY()-15, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()-15, me->GetPositionY()+15, me->GetPositionZ()+30);

			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()+10, me->GetPositionY()+15, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()-10, me->GetPositionY()-15, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()+10, me->GetPositionY()-15, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()-10, me->GetPositionY()+15, me->GetPositionZ()+30);

			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()+10, me->GetPositionY()+15, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()-10, me->GetPositionY()-15, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()+10, me->GetPositionY()-15, me->GetPositionZ()+30);
			me->SummonCreature(NPC_NEF_METEOR_HAG, me->GetPositionX()-10, me->GetPositionY()+15, me->GetPositionZ()+30);

			Map::PlayerList const &players = me->GetMap()->GetPlayers();
			for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
			{
				Player* player = itr->getSource();
			    if(me->IsWithinDistInMap(player, 10))
					player->DealDamage(player,20000,0,DIRECT_DAMAGE);
			}
		}

		void RessKrieger()
		{
			if(Creature* npc_dummy = me->FindNearestCreature(NPC_KRIEGER_DUMMY, 300.0f, true))
			{
				if(Creature* npc_resser = me->SummonCreature(NPC_NEF_METEOR_RES, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ()))
					npc_resser->GetMotionMaster()->MovePoint(0, npc_dummy->GetPositionX(), npc_dummy->GetPositionY(), npc_dummy->GetPositionZ());
			}
		}

        void JustSummoned(Creature* summoned)
        {
           /* summoned->SetInCombatWithZone();
            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                summoned->AI()->AttackStart(target);*/
        }

        void KilledUnit(Unit* /*victim*/)
        {
			uint32 randsay = urand(1,3);

			if (randsay == 1)
				me->MonsterYell(SAY_KILL1, LANG_UNIVERSAL, 0);

			if (randsay == 2)
				me->MonsterYell(SAY_KILL2, LANG_UNIVERSAL, 0);

			if (randsay == 3)
				me->SetUInt32Value(UNIT_NPC_EMOTESTATE, TEXT_EMOTE_LAUGH);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

			if (uiPhase == 1)
			{
				if (uiBreathTimer <= diff)
				{
					DoCast(SPELL_DARK_BREATH);

					uint32 counter = 0;
					while (counter < 7)
					{
						if(Creature* npc_dummy = me->FindNearestCreature(NPC_KRIEGER_DUMMY, 300.0f, true))
							if (me->IsWithinDistInMap(npc_dummy, 5))
								npc_dummy->AI()->DoAction(1);

						counter++;
					}

					uiBreathTimer = urand(14000, 20000);
				}else{
					uiBreathTimer -= diff;
				}

				if (uiTailSweepTimer <= diff)
				{
					DoCast(SPELL_TAIL_SWEEP);
					uiTailSweepTimer = urand(10000, 12000);
				}else{
					uiTailSweepTimer -= diff;
				}

				if (uiCleaveTimer <= diff)
				{
					me->CastSpell(me->getVictim(),SPELL_CLEAVE);
					uiCleaveTimer = urand(5000, 7000);
				}else{
					uiCleaveTimer -= diff;
				}

				HealthCheck();
				
				DoMeleeAttackIfReady();
			}	

			if (uiPhase == 2)
			{
				me->GetMotionMaster()->MovePoint(0, -32.448929f, -215.120041f, -88.244644f);
				uiPhase = 3;
			}

			if (uiPhase == 3)
			{
				if(uiUebergangTimerSec <= diff)
				{
					me->SetFlying(true);
					me->AddUnitMovementFlag(MOVEMENTFLAG_LEVITATING);
					me->GetMotionMaster()->MovePoint(0, -32.448929f, -215.120041f, -62.246643f);
					uiUebergangTimerSec = 400000;
					uiPhase = 4;
				}else{
					uiUebergangTimerSec -= diff;
				}
			}

			if (uiPhase == 4)
			{
				if (uiGeschossTimer <= diff)
				{
					if(Unit *target = SelectTarget(SELECT_TARGET_RANDOM, 1, 300.0f, true))
					   me->CastSpell(target, SPELL_GESCHOSSE);

					uiGeschossTimer = urand(4000, 6000);
				}else{
					uiGeschossTimer -= diff;
				}

				if (isLava == false)
				{
					if (uilavatimer <= diff)
					{
						if (uiCount == 10)
						{
							me->SummonCreature(NPC_LAVA2, -37.189178f, -208.017792f, -85.646370f);
							me->SummonCreature(NPC_LAVA2, -42.419720f, -207.878555f, -85.484497f);
							me->SummonCreature(NPC_LAVA2, -49.260517f, -207.990860f, -85.054367f);
							me->SummonCreature(NPC_LAVA2, -54.359821f, -207.779099f, -84.513092f);
							me->SummonCreature(NPC_LAVA2, -60.662411f, -207.863342f, -83.843269f);
							me->SummonCreature(NPC_LAVA2, -68.699493f, -208.214508f, -83.065056f);
							me->SummonCreature(NPC_LAVA2, -74.318138f, -207.910461f, -82.473259f);
							me->SummonCreature(NPC_LAVA2, -81.317001f, -207.861984f, -81.648163f);

							me->SummonCreature(NPC_LAVA2, -35.662731f, -203.856888f, -85.783012f);
							me->SummonCreature(NPC_LAVA2, -39.566349f, -203.795746f, -85.193825f);
							me->SummonCreature(NPC_LAVA2, -43.597610f, -203.675461f, -85.154144f);
							me->SummonCreature(NPC_LAVA2, -48.835484f, -203.777191f, -85.092682f);
							me->SummonCreature(NPC_LAVA2, -54.601597f, -203.378128f, -84.502220f);
							me->SummonCreature(NPC_LAVA2, -59.687840f, -203.312897f, -84.004089f);
							me->SummonCreature(NPC_LAVA2, -64.767288f, -203.281067f, -83.564034f);
							me->SummonCreature(NPC_LAVA2, -70.265335f, -203.246613f, -83.034088f);
							me->SummonCreature(NPC_LAVA2, -76.423462f, -203.208023f, -82.152199f);
							me->SummonCreature(NPC_LAVA2, -63.438950f, -186.666763f, -84.046768f);
							me->SummonCreature(NPC_LAVA2, -43.265385f, -199.191620f, -86.139580f);
							me->SummonCreature(NPC_LAVA2, -33.929340f, -198.970688f, -87.788467f);

							me->SummonCreature(NPC_LAVA2, -66.730751f, -195.792511f, -83.546074f);
							me->SummonCreature(NPC_LAVA2, -68.147789f, -190.755768f, -83.678001f);
							me->SummonCreature(NPC_LAVA2, -74.673019f, -195.795135f, -82.617836f);
							me->SummonCreature(NPC_LAVA2, -47.919098f, -197.661652f, -85.101189f);
							me->SummonCreature(NPC_LAVA2, -49.983715f, -192.133987f, -84.976791f);
							me->SummonCreature(NPC_LAVA2, -52.301704f, -185.278305f, -84.799744f);
							me->SummonCreature(NPC_LAVA2, -58.924854f, -184.229980f, -84.266762f);
							me->SummonCreature(NPC_LAVA2, -41.912109f, -182.679947f, -86.326759f);
							me->SummonCreature(NPC_LAVA2, -40.729645f, -188.272751f, -86.554382f);
							me->SummonCreature(NPC_LAVA2, -39.912693f, -191.925766f, -86.360123f);
							me->SummonCreature(NPC_LAVA2, -38.916538f, -196.380081f, -86.024696f);
							me->SummonCreature(NPC_LAVA2, -46.650707f, -186.550217f, -86.358932f);
							me->SummonCreature(NPC_LAVA2, -44.199684f, -193.792526f, -85.240280f);

							me->SummonCreature(NPC_LAVA2, -61.873497f, -245.423981f, -84.045082f);
							me->SummonCreature(NPC_LAVA2, -68.052002f, -241.905823f, -83.933243f);
							me->SummonCreature(NPC_LAVA2, -72.750725f, -237.728104f, -83.041275f);
							me->SummonCreature(NPC_LAVA2, -76.865967f, -231.302963f, -82.611702f);
							me->SummonCreature(NPC_LAVA2, -79.731369f, -225.544830f, -81.696640f);
							me->SummonCreature(NPC_LAVA2, -82.427803f, -220.916473f, -81.314102f);
							me->SummonCreature(NPC_LAVA2, -76.631729f, -221.367142f, -82.213547f);
							me->SummonCreature(NPC_LAVA2, -67.058357f, -222.646500f, -83.220047f);
							me->SummonCreature(NPC_LAVA2, -58.063286f, -222.272446f, -84.083374f);
							me->SummonCreature(NPC_LAVA2, -50.266846f, -222.877457f, -84.958115f);
							me->SummonCreature(NPC_LAVA2, -42.927364f, -222.904907f, -85.352425f);

							me->SummonCreature(NPC_LAVA2, -36.289387f, -223.421249f, -85.699623f);
							me->SummonCreature(NPC_LAVA2, -38.479832f, -230.490280f, -85.573601f);
							me->SummonCreature(NPC_LAVA2, -39.324089f, -235.337402f, -86.095650f);
							me->SummonCreature(NPC_LAVA2, -40.133553f, -239.984741f, -86.626228f);
							me->SummonCreature(NPC_LAVA2, -41.012341f, -245.404053f, -86.499390f);
							me->SummonCreature(NPC_LAVA2, -45.502541f, -244.780060f, -85.671463f);
							me->SummonCreature(NPC_LAVA2, -51.039959f, -245.907211f, -84.948708f);
							me->SummonCreature(NPC_LAVA2, -55.463791f, -245.902817f, -84.585976f);
							me->SummonCreature(NPC_LAVA2, -68.096069f, -234.723877f, -83.470749f);
							me->SummonCreature(NPC_LAVA2, -66.496536f, -229.213165f, -83.449120f);
							me->SummonCreature(NPC_LAVA2, -70.783859f, -228.466980f, -82.947762f);
							me->SummonCreature(NPC_LAVA2, -48.016544f, -229.626580f, -85.023682f);
							me->SummonCreature(NPC_LAVA2, -48.174538f, -237.490723f, -84.987785f);
							me->SummonCreature(NPC_LAVA2, -63.193043f, -219.172577f, -84.546371f);
							me->SummonCreature(NPC_LAVA2, -72.183578f, -221.241501f, -83.724228f);
							me->SummonCreature(NPC_LAVA2, -44.294853f, -232.752960f, -86.157028f);
							me->SummonCreature(NPC_LAVA2, -62.266579f, -225.213898f, -84.712997f);

							me->SummonCreature(NPC_LAVA2, -5.056026f, -190.609955f, -87.443298f);
							me->SummonCreature(NPC_LAVA2, -14.18675f, -193.975006f, -88.007156f);
							me->SummonCreature(NPC_LAVA2, -10.460916f, -200.928360f, -87.473938f);
							me->SummonCreature(NPC_LAVA2, 2.807514f, -179.727081f, -85.625031f);
							me->SummonCreature(NPC_LAVA2, 10.840423f, -180.180740f, -85.827034f);
							me->SummonCreature(NPC_LAVA2, 14.169421f, -187.602142f, -85.645615f);
							me->SummonCreature(NPC_LAVA2, 14.239048f, -196.463196f, -85.488266f);
							me->SummonCreature(NPC_LAVA2, 6.546776f, -202.319672f, -86.220001f);
							me->SummonCreature(NPC_LAVA2, -16.027685f, -201.397232f, -88.207344f);
							me->SummonCreature(NPC_LAVA2, -17.702066f, -190.597424f, -88.206596f);
							me->SummonCreature(NPC_LAVA2, -27.473810f, -187.989304f, -89.180115f);

							me->SummonCreature(NPC_LAVA2, -18.362936f, -185.557968f, -88.246635f);
							me->SummonCreature(NPC_LAVA2, -20.537601f, -179.477249f, -88.171791f);
							me->SummonCreature(NPC_LAVA2, -21.088615f, -175.220398f, -87.970375f);
							me->SummonCreature(NPC_LAVA2, -18.834196f, -173.667175f, -86.954636f);
							me->SummonCreature(NPC_LAVA2, -15.342985f, -178.618362f, -87.503944f);
							me->SummonCreature(NPC_LAVA2, -14.107983f, -183.719009f, -87.551247f);
							me->SummonCreature(NPC_LAVA2, -11.756255f, -187.747604f, -87.650291f);
							me->SummonCreature(NPC_LAVA2, -3.954544f, -197.241776f, -87.124580f);
							me->SummonCreature(NPC_LAVA2, -1.796960f, -202.638794f, -86.560516f);
							me->SummonCreature(NPC_LAVA2, -4.921417f, -207.091705f, -86.667870f);
							me->SummonCreature(NPC_LAVA2, -10.060147f, -208.564377f, -87.614227f);

							me->SummonCreature(NPC_LAVA2, -9.653639f, -195.215561f, -87.589706f);
							me->SummonCreature(NPC_LAVA2, -6.242408f, -183.973328f, -87.194466f);
							me->SummonCreature(NPC_LAVA2, -8.056359f, -180.162109f, -86.985741f);
							me->SummonCreature(NPC_LAVA2, -9.126258f, -176.220139f, -86.414291f);
							me->SummonCreature(NPC_LAVA2, -12.078761f, -173.034882f, -85.703857f);
							me->SummonCreature(NPC_LAVA2, -5.857386f, -176.696625f, -86.177803f);
							me->SummonCreature(NPC_LAVA2, -4.647462f, -180.705902f, -86.907951f);
							me->SummonCreature(NPC_LAVA2, -2.042911f, -184.465210f, -86.975952f);
							me->SummonCreature(NPC_LAVA2, -2.600584f, -176.469391f, -85.620956f);
							me->SummonCreature(NPC_LAVA2, 2.294007f, -174.730179f, -85.201195f);

							me->SummonCreature(NPC_LAVA2, 6.992770f, -174.446716f, -85.505692f);
							me->SummonCreature(NPC_LAVA2, 11.665627f, -174.587067f, -85.640167f);
							me->SummonCreature(NPC_LAVA2, 16.0636696f, -177.826157f, -85.527328f);
							me->SummonCreature(NPC_LAVA2, 18.990198f, -181.666046f, -85.593803f);
							me->SummonCreature(NPC_LAVA2, 15.323992f, -182.676331f, -85.727493f);
							me->SummonCreature(NPC_LAVA2, 20.319420f, -184.227615f, -85.407799f);
							me->SummonCreature(NPC_LAVA2, 22.598141f, -187.680466f, -84.879784f);
							me->SummonCreature(NPC_LAVA2, 24.980659f, -191.291275f, -84.216797f);
							me->SummonCreature(NPC_LAVA2, 27.931480f, -195.801804f, -84.093399f);
							me->SummonCreature(NPC_LAVA2, 30.287895f, -201.493225f, -83.597107f);
							me->SummonCreature(NPC_LAVA2, 31.323082f, -206.975342f, -83.789421f);

							me->SummonCreature(NPC_LAVA2, 1.632710f, -207.458282f, -86.282066f);
							me->SummonCreature(NPC_LAVA2, 7.647750f, -207.870773f, -86.177200f);
							me->SummonCreature(NPC_LAVA2, 13.927866f, -208.279129f, -85.845200f);
							me->SummonCreature(NPC_LAVA2, 18.747223f, -208.121063f, -85.409424f);
							me->SummonCreature(NPC_LAVA2, 25.294333f, -207.725494f, -84.811409f);
							me->SummonCreature(NPC_LAVA2, 23.804552f, -203.411133f, -84.777824f);
							me->SummonCreature(NPC_LAVA2, 19.652693f, -203.797729f, -85.195747f);
							me->SummonCreature(NPC_LAVA2, 13.354495f, -204.403885f, -85.779938f);
							me->SummonCreature(NPC_LAVA2, 21.354490f, -198.005478f, -84.810654f);
							me->SummonCreature(NPC_LAVA2, 19.222794f, -193.540298f, -85.031792f);
							me->SummonCreature(NPC_LAVA2, 17.374262f, -189.668274f, -85.337967f);

							me->SummonCreature(NPC_LAVA2, 8.519139f, -196.081024f, -86.122261f);
							me->SummonCreature(NPC_LAVA2, 2.929580f, -195.433563f, -86.746986f);
							me->SummonCreature(NPC_LAVA2, 1.837197f, -191.001862f, -86.862381f);
							me->SummonCreature(NPC_LAVA2, 7.985447f, -191.224991f, -86.220535f);
							me->SummonCreature(NPC_LAVA2, 8.751531f, -186.327271f, -86.143875f);
							me->SummonCreature(NPC_LAVA2, 4.422209f, -183.968323f, -86.420341f);
							me->SummonCreature(NPC_LAVA2, 16.028902f, -200.605499f, -85.421616f);
							me->SummonCreature(NPC_LAVA2, -50.867344f, -241.126343f, -85.903374f);

							me->SummonCreature(NPC_LAVA2, 11.807159f, -229.598343f, -85.764336f);
							me->SummonCreature(NPC_LAVA2, 13.954147f, -223.636444f, -85.752037f);
							me->SummonCreature(NPC_LAVA2, 20.766052f, -223.515594f, -85.147095f);
							me->SummonCreature(NPC_LAVA2, 25.697437f, -224.214981f, -84.565804f);
							me->SummonCreature(NPC_LAVA2, 31.054564f, -224.003479f, -83.709572f);
							me->SummonCreature(NPC_LAVA2, 4.803531f, -233.891022f, -86.530716f);
							me->SummonCreature(NPC_LAVA2, -2.044513f, -231.471573f, -86.909836f);
							me->SummonCreature(NPC_LAVA2, -5.771610f, -225.665375f, -86.736359f);
							me->SummonCreature(NPC_LAVA2, -6.701577f, -221.761841f, -87.007439f);
							me->SummonCreature(NPC_LAVA2, -2.462500f, -232.137863f, -86.998817f);
							me->SummonCreature(NPC_LAVA2, -6.830939f, -231.903900f, -87.312981f);
							me->SummonCreature(NPC_LAVA2, 31.693243f, -226.285202f, -83.454460f);

							me->SummonCreature(NPC_LAVA2, -10.250365f, -234.341125f, -87.558479f);
							me->SummonCreature(NPC_LAVA2, -13.361696f, -240.467392f, -87.717484f);
							me->SummonCreature(NPC_LAVA2, -16.623087f, -244.274734f, -87.865540f);
							me->SummonCreature(NPC_LAVA2, -18.171564f, -249.361053f, -87.812149f);
							me->SummonCreature(NPC_LAVA2, -19.345192f, -255.084732f, -87.127686f);
							me->SummonCreature(NPC_LAVA2, -11.210235f, -254.694229f, -85.999687f);
							me->SummonCreature(NPC_LAVA2, -5.305142f, -254.507172f, -85.495850f);
							me->SummonCreature(NPC_LAVA2, 2.858395f, -254.383362f, -85.220474f);
							me->SummonCreature(NPC_LAVA2, 11.967433f, -253.073074f, -85.698273f);
							me->SummonCreature(NPC_LAVA2, 18.349943f, -248.213867f, -85.557549f);
							me->SummonCreature(NPC_LAVA2, 21.066214f, -243.316727f, -85.233749f);
							me->SummonCreature(NPC_LAVA2, 25.297581f, -238.292313f, -84.211678f);
							me->SummonCreature(NPC_LAVA2, 30.345833f, -232.188248f, -83.927948f);

							me->SummonCreature(NPC_LAVA2, 23.706770f, -231.288177f, -84.412537f);
							me->SummonCreature(NPC_LAVA2, 17.873377f, -231.427338f, -85.159607f);
							me->SummonCreature(NPC_LAVA2, 12.599525f, -236.332993f, -85.685905f);
							me->SummonCreature(NPC_LAVA2, 16.265810f, -240.255783f, -85.451683f);
							me->SummonCreature(NPC_LAVA2, 11.101682f, -245.641006f, -85.915817f);
							me->SummonCreature(NPC_LAVA2, 6.029814f, -247.916733f, -85.647522f);
							me->SummonCreature(NPC_LAVA2, 4.620743f, -241.031219f, -86.532661f);
							me->SummonCreature(NPC_LAVA2, -0.464005f, -240.866226f, -86.952232f);
							me->SummonCreature(NPC_LAVA2, -1.301937f, -247.799896f, -86.669258f);
							me->SummonCreature(NPC_LAVA2, -7.721613f, -247.639694f, -87.062477f);
							me->SummonCreature(NPC_LAVA2, -6.509147f, -240.469940f, -87.496246f);
							me->SummonCreature(NPC_LAVA2, 28.143986f, -220.008850f, -84.402557f);

							me->SummonCreature(NPC_LAVA2, -12.430228f, -213.947540f, -87.995926f);
							me->SummonCreature(NPC_LAVA2, -5.4735530f, -211.636780f, -86.903900f);
							me->SummonCreature(NPC_LAVA2, -15.289239f, -231.161606f, -87.997940f);
							me->SummonCreature(NPC_LAVA2, -20.728392f, -241.141617f, -88.660904f);
							me->SummonCreature(NPC_LAVA2, -23.009832f, -249.939362f, -88.493492f);
							me->SummonCreature(NPC_LAVA2, -23.769638f, -257.389282f, -88.198051f);
							me->SummonCreature(NPC_LAVA2, -14.762550f, -257.747681f, -85.644112f);
							me->SummonCreature(NPC_LAVA2, -53.012257f, -226.270599f, -85.605576f);
							me->SummonCreature(NPC_LAVA2, -28.944429f, -221.922485f, -88.892220f);

							isLava = true;
						}
						if (uiCount == 9)
						{
							me->SummonCreature(NPC_LAVA2, -34.219036f, -215.049854f, -86.694847f);
							me->SummonCreature(NPC_LAVA2, -40.519036f, -215.049854f, -86.094847f);
							me->SummonCreature(NPC_LAVA2, -47.219036f, -215.049854f, -85.694847f);
							me->SummonCreature(NPC_LAVA2, -53.519036f, -215.049854f, -85.094847f);
							me->SummonCreature(NPC_LAVA2, -59.219036f, -215.049854f, -84.694847f);
							me->SummonCreature(NPC_LAVA2, -66.519036f, -215.049854f, -84.094847f);
							me->SummonCreature(NPC_LAVA2, -72.219036f, -215.049854f, -83.694847f);
							me->SummonCreature(NPC_LAVA2, -78.519036f, -215.049854f, -83.094847f);
							me->SummonCreature(NPC_LAVA2, -85.219036f, -215.049854f, -82.394847f);
							me->SummonCreature(NPC_LAVA2, -86.219036f, -215.049854f, -81.094847f);

							me->SummonCreature(NPC_LAVA2, -8.807964f, -216.443695f, -86.468697f);
							me->SummonCreature(NPC_LAVA2, -2.892893f, -216.302719f, -85.458534f);
							me->SummonCreature(NPC_LAVA2, 11.689567f, -215.955124f, -85.074989f);
							me->SummonCreature(NPC_LAVA2, 16.091665f, -215.850189f, -84.698822f);
							me->SummonCreature(NPC_LAVA2, 20.928343f, -215.734894f, -84.247520f);
							me->SummonCreature(NPC_LAVA2, 25.668446f, -215.621902f, -83.805954f);
							me->SummonCreature(NPC_LAVA2, 29.821066f, -215.522919f, -83.155205f);
							me->SummonCreature(NPC_LAVA2, 34.255356f, -215.417236f, -82.439919f);					
							me->SummonCreature(NPC_LAVA2, 4.145600f, -212.772018f, -86.075676f);

							uiCount++;
							uilavatimer = 4000;
						}
						if (uiCount == 8)
						{
							//rechts
							me->SummonCreature(NPC_LAVA2, -19.035107f, -234.553085f, -88.633469f);
							me->SummonCreature(NPC_LAVA2, -11.066120f, -233.071136f, -88.363075f);
							//links
							me->SummonCreature(NPC_LAVA2, -27.650883f, -194.059235f, -88.811172f);
							me->SummonCreature(NPC_LAVA2, -20.786175f, -296.350372f, -88.340942f);

							uiCount++;
							uilavatimer = 5000;
						}
						if (uiCount == 7)
						{
							//rechts
							me->SummonCreature(NPC_LAVA2, -21.035107f, -227.553085f, -88.633469f);
							me->SummonCreature(NPC_LAVA2, -13.066120f, -226.071136f, -88.363075f);
							//links
							me->SummonCreature(NPC_LAVA2, -28.650883f, -202.059235f, -88.811172f);
							me->SummonCreature(NPC_LAVA2, -21.786175f, -204.350372f, -88.340942f);

							uiCount++;
							uilavatimer = 2000;
						}
						if (uiCount == 6)
						{
							//rechts
							me->SummonCreature(NPC_LAVA2, -23.035107f, -220.553085f, -88.633469f);
							me->SummonCreature(NPC_LAVA2, -15.066120f, -219.071136f, -88.363075f);
							//links
							me->SummonCreature(NPC_LAVA2, -29.650883f, -210.059235f, -88.811172f);
							me->SummonCreature(NPC_LAVA2, -22.786175f, -212.350372f, -88.340942f);

							uiCount++;
							uilavatimer = 2000;
						}
						if (uiCount == 5)
						{
							//rechts
							me->SummonCreature(NPC_LAVA2, -25.035107f, -213.553085f, -88.633469f);
							me->SummonCreature(NPC_LAVA2, -17.066120f, -212.071136f, -88.363075f);
							//links
							me->SummonCreature(NPC_LAVA2, -30.650883f, -216.059235f, -88.811172f);
							me->SummonCreature(NPC_LAVA2, -23.786175f, -218.350372f, -88.340942f);

							uiCount++;
							uilavatimer = 2000;
						}
						if (uiCount == 4)
						{
							//rechts
							me->SummonCreature(NPC_LAVA2, -27.035107f, -206.553085f, -88.633469f);
							me->SummonCreature(NPC_LAVA2, -19.066120f, -205.071136f, -88.363075f);
							//links
							me->SummonCreature(NPC_LAVA2, -31.650883f, -226.059235f, -88.811172f);
							me->SummonCreature(NPC_LAVA2, -24.786175f, -228.350372f, -88.340942f);

							uiCount++;
							uilavatimer = 2000;
						}
						if (uiCount == 3)
						{
							//rechts
							me->SummonCreature(NPC_LAVA2, -29.035107f, -199.553085f, -88.633469f);
							me->SummonCreature(NPC_LAVA2, -21.066120f, -198.071136f, -88.363075f);
							//links
							me->SummonCreature(NPC_LAVA2, -32.650883f, -234.059235f, -88.811172f);
							me->SummonCreature(NPC_LAVA2, -25.786175f, -236.350372f, -88.340942f);

							uiCount++;
							uilavatimer = 2000;
						}
						if (uiCount == 2)
						{
							//rechts
							me->SummonCreature(NPC_LAVA2, -31.035107f, -192.553085f, -88.633469f);
							me->SummonCreature(NPC_LAVA2, -23.066120f, -191.071136f, -88.363075f);
							//links
							me->SummonCreature(NPC_LAVA2, -33.650883f, -242.059235f, -88.811172f);
							me->SummonCreature(NPC_LAVA2, -26.786175f, -244.350372f, -88.340942f);

							uiCount++;
							uilavatimer = 2000;
						}
						if (uiCount == 1)
						{
							//rechts
							me->SummonCreature(NPC_LAVA2, -33.035107f, -185.553085f, -88.633469f);
							me->SummonCreature(NPC_LAVA2, -25.066120f, -184.071136f, -88.363075f);
							//links
							me->SummonCreature(NPC_LAVA2, -34.650883f, -250.059235f, -88.811172f);
							me->SummonCreature(NPC_LAVA2, -27.786175f, -252.350372f, -88.340942f);

							uiCount++;
							uilavatimer = 2000;
						}
						if (uiCount == 0)
						{
							//rechts
							me->SummonCreature(NPC_LAVA2, -35.035107f, -178.553085f, -88.633469f);
						    me->SummonCreature(NPC_LAVA2, -27.066120f, -177.071136f, -88.363075f);
							//links
							me->SummonCreature(NPC_LAVA2, -35.650883f, -258.059235f, -88.811172f);
							me->SummonCreature(NPC_LAVA2, -28.786175f, -260.350372f, -88.340942f);

							me->SummonCreature(NPC_LAVA2, -35.144539f, -171.566772f, -89.644150f);
							me->SummonCreature(NPC_LAVA2, -29.048862f, -169.518417f, -89.339264f);

							//spawn Prototypen
							me->SummonCreature(NPC_PROTOTYP, -58.581100f, -193.680359f, -85.198311f);
							me->SummonCreature(NPC_PROTOTYP, -58.238270f, -235.656067f, -85.258484f);
							me->SummonCreature(NPC_PROTOTYP, 4.031528f, -222.759369f, -86.138206f);
						
							uiCount++;
							uilavatimer = 2000;
						}
					}else{
						uilavatimer -= diff;
					}
				}

			}

			if (uiPhase == 5)
			{
				me->GetMotionMaster()->MovePoint(0, -32.448929f, -215.120041f, -88.244644f);
				me->SetFlying(false);
				me->RemoveUnitMovementFlag(MOVEMENTFLAG_LEVITATING);
				me->SetReactState(REACT_AGGRESSIVE);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE);
				me->AI()->AttackStart(me->getVictim());
				SetCombatMovement(true);
				uiPhase = 6;
			}

			if (uiPhase == 6)
			{
				if (uiBreathTimer <= diff)
				{
					DoCast(SPELL_DARK_BREATH);

					uint32 counter = 0;
					while (counter < 7)
					{
						if(Creature* npc_dummy = me->FindNearestCreature(NPC_KRIEGER_DUMMY, 300.0f, true))
							if (me->IsWithinDistInMap(npc_dummy, 5))
								npc_dummy->AI()->DoAction(1);

						counter++;
					}

					uiBreathTimer = urand(14000, 20000);
				}else{
					uiBreathTimer -= diff;
				}

				if (uiTailSweepTimer <= diff)
				{
					DoCast(SPELL_TAIL_SWEEP);
					uiTailSweepTimer = urand(10000, 12000);
				}else{
					uiTailSweepTimer -= diff;
				}

				if (uiCleaveTimer <= diff)
				{
					me->CastSpell(me->getVictim(),SPELL_CLEAVE);
					uiCleaveTimer = urand(5000, 7000);
				}else{
					uiCleaveTimer -= diff;
				}

				if (uiRessTimer <= diff)
				{
					RessKrieger();
					uiRessTimer = urand(20000, 30000);
				}else{
					uiRessTimer -= diff;
				}

				HealthCheck();

				DoMeleeAttackIfReady();
			}
        }
    };

	CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_nefarian_eventAI (creature);
    }
};

class mob_lava_flame : public CreatureScript
{
public:
    mob_lava_flame() : CreatureScript("mob_lava_flame") { }

    struct mob_lava_flameAI : public ScriptedAI
    {
        mob_lava_flameAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            Reset();
        }

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_OOC_NOT_ATTACKABLE );
            me->SetDisplayId(11686);
            me->SetRespawnDelay(7*DAY);
            SetCombatMovement(false);
            me->SetInCombatWithZone();
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!me->HasAura(SPELL_METEOR_FLAME))
                DoCast(SPELL_METEOR_FLAME);
        }

    };

	CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_lava_flameAI(pCreature);
    }
};

class mob_lava_flame2 : public CreatureScript
{
public:
    mob_lava_flame2() : CreatureScript("mob_lava_flame2") { }

    struct mob_lava_flame2AI : public ScriptedAI
    {
        mob_lava_flame2AI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            Reset();
        }

		uint32 uiCheckTimer;

        void Reset()
        {
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_OOC_NOT_ATTACKABLE );
            me->SetDisplayId(11686);
            me->SetRespawnDelay(7*DAY);
            SetCombatMovement(false);
            me->SetInCombatWithZone();

			uiCheckTimer = 30000;
        }

        void UpdateAI(const uint32 uiDiff)
        {
            if (!me->HasAura(SPELL_METEOR_FLAME))
                DoCast(SPELL_METEOR_FLAME);

			if(uiCheckTimer <= uiDiff)
			{
				if(!me->FindNearestCreature(NPC_PROTOTYP, 300.0f, true))
					me->UnitKill(me);
			}else{
				uiCheckTimer -= uiDiff;
			}
        }

    };

	CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_lava_flame2AI(pCreature);
    }
};

class mob_prototype : public CreatureScript
{
public:
    mob_prototype() : CreatureScript("mob_prototype") { }

    struct mob_prototypeAI : public ScriptedAI
    {
        mob_prototypeAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            Reset();
        }

		uint32 casttimer;

        void Reset()
        {
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
            SetCombatMovement(false);

			casttimer = 1000;
        }

		void SpellHitTarget(Unit* target, SpellEntry const* spell)
            {
                if (spell->Id == SPELL_DRUCKNOVA)
                {
					me->CastSpell(target,SPELL_BLAST_WAVE);
                }
            }

		void JustDied(Unit* /*killer*/)
        {
			if(Creature* npc_nef = me->FindNearestCreature(NPC_NEFARIAN, 300.0f, true))
				npc_nef->AI()->DoAction(2);
        }

        void UpdateAI(const uint32 diff)
        {
			if(me->getVictim())
			{
				if (casttimer <= diff)
				{
					me->CastSpell(me->getVictim(), SPELL_DRUCKNOVA);
					casttimer =  20000;
				}else{
					casttimer -= diff;
				}
			}
        }

    };

	CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_prototypeAI(pCreature);
    }
};

class mob_knochenkrieger : public CreatureScript
{
public:
    mob_knochenkrieger() : CreatureScript("mob_knochenkrieger") { }

    struct mob_knochenkriegerAI : public ScriptedAI
    {
        mob_knochenkriegerAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            Reset();
        }

		uint32 healthtimer;
		uint32 bufftimer;
		uint32 random;
		uint32 current;

        void Reset()
        {
			bufftimer = 2000;
			healthtimer = 4000;
			me->CastSpell(me,SPELL_SHADOWFORM);
			random = urand(1, 5);
			current = 0;
        }

		void JustDied(Unit* /*killer*/)
        {
			me->SummonCreature(NPC_KRIEGER_DUMMY, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
        }

        void UpdateAI(const uint32 diff)
        {
			Map::PlayerList const &players = me->GetMap()->GetPlayers();
			for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
			{
				current++;
				Player* player = itr->getSource();
				if(current == random)
					me->AI()->AttackStart(itr->getSource());
			}

			if(me->getVictim())
			{
				if (healthtimer <= diff)
				{
					me->SetHealth(me->GetHealth() - me->GetMaxHealth() / 100);
					healthtimer =  4000;
				}else{
					healthtimer -= diff;
				}

				if (bufftimer <= diff)
				{
					
					bufftimer =  2000;
				}else{
					bufftimer -= diff;
				}
			}
        }

    };

	CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_knochenkriegerAI(pCreature);
    }
};

class mob_knochenkrieger_dummy : public CreatureScript
{
public:
    mob_knochenkrieger_dummy() : CreatureScript("mob_knochenkrieger_dummy") { }

    struct mob_knochenkrieger_dummyAI : public ScriptedAI
    {
        mob_knochenkrieger_dummyAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            Reset();
        }

		uint32 timer;

        void Reset()
        {
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_OOC_NOT_ATTACKABLE );
            // me->SetDisplayId(11686);
            SetCombatMovement(false);
			me->SetVisible(false);
			me->SetReactState(REACT_PASSIVE);

			timer = 1000;
		}

        void DoAction(int32 data)
		{
			if (data == 1)
			{
				me->SummonCreature(NPC_KRIEGER, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
				me->UnitKill(me);
			}
		}

		void UpdateAI(const uint32 diff)
        {
			if(timer <= diff)
			{
				if(Creature* npc_trigger = me->FindNearestCreature(NPC_NEF_METEOR_RES, 3.0f, true))
				{
					me->SummonCreature(NPC_KRIEGER, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
					npc_trigger->UnitKill(npc_trigger);
					me->UnitKill(me);
				}
				timer = 1000;
			}else{
				timer -= diff;
			}
		}
    };

	CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_knochenkrieger_dummyAI(pCreature);
    }
};

class mob_resser_dummy : public CreatureScript
{
public:
    mob_resser_dummy() : CreatureScript("mob_resser_dummy") { }

    struct mob_resser_dummyAI : public ScriptedAI
    {
        mob_resser_dummyAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            Reset();
        }

        void Reset()
        {
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE );
            me->SetDisplayId(11686);
            SetCombatMovement(false);
			//me->CastSpell(me, SPELL_VISUAL);
			me->AddAura(SPELL_VISUAL, me);
			me->AddAura(SPELL_SHADOWFORM, me);
			me->SetReactState(REACT_PASSIVE);
		}
    };

	CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_resser_dummyAI(pCreature);
    }
};

class mob_meteor_nef : public CreatureScript
{
public:
    mob_meteor_nef() : CreatureScript("mob_meteor_nef") { }

    struct mob_meteor_nefAI : public ScriptedAI
    {
        mob_meteor_nefAI(Creature* pCreature) : ScriptedAI(pCreature)
        {
            Reset();
        }

		uint32 timer;

        void Reset()
        {
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE | UNIT_FLAG_NON_ATTACKABLE);
			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE );
            me->SetDisplayId(11686);
            SetCombatMovement(false);
            me->SetReactState(REACT_PASSIVE);

			timer = 2000;

			me->CastSpell(me, SPELL_VISUAL);
		}

		void UpdateAI(const uint32 diff)
        {
			if(timer <= diff)
			{
				me->UnitKill(me);
				timer = 1000;
			}else{
				timer -= diff;
			}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_meteor_nefAI(pCreature);
    }
};

void AddSC_boss_nefarian_event()
{
    new mob_lava_flame();
	new mob_lava_flame2();
	new boss_nefarian_event();
	new boss_onyxia_event();
	new mob_prototype();
	new mob_knochenkrieger();
	new mob_knochenkrieger_dummy();
	new mob_resser_dummy();
	new mob_meteor_nef();
}