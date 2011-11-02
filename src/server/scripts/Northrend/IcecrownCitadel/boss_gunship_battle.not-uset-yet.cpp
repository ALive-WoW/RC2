/*
 * Copyright (C) 2008-2010 TrinityCore <http://www.trinitycore.org/>
 *
 * Copyright (C) Blackcore, Desarrollo completo Blackcore.
 *
 * Copyright (C) ALiveCore 2011-2012 <wow-alive.de>
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
by wow-alive // http://wow-alive.de/
Base Script by BlacCore , thx to the Devs of BlackCore

thx to wowhead Team for right canon entry's
*/

#include "ScriptPCH.h"
#include "icecrown_citadel.h"
#include "MapManager.h"
#include "Transport.h"

/*
Dedails from :
http://www.wowwiki.com/Gunship_Battle
http://www.youtube.com/watch?v=00FbefuBzF0
http://wowhead.com/
*/

#define NPC_ZAFOD_BOOMBOX                               37184
#define ITEM_GOBLIN_ROCKET_PACK                         49278

const Position SpawnZafodAlliance               =       {0.0f, 0.0f, 0.0f, 0.0f};
const Position SpawnZafodHorde                  =       {0.0f, 0.0f, 0.0f, 0.0f};

#define ZAFOD_BOOMBOX_GOSSIP_GET                        1000
#define ZAFOD_BOOMBOX_GOSSIP_CANCEL                     1001

// Do_Action
#define DO_ACTION_START_GUNSHIP_BATTLE          0
#define DO_ACTION_FINISH_GUNSHIP_BATTLE         1
#define DO_ACTION_BATTLE_START					2

// tp
const Position DeathbringerRise = { -549.80548f, 2211.19238f, 539.29119f, 6.27718f};

// Spawn NPCs
#define SPAWN_SERGEANT                                          0
#define SPAWN_DISTANCE_0                                        1       
#define SPAWN_CAC                                                       2       
#define SPAWN_CAST                                                      3       
#define SPAWN_DISTANCE_1                                        4       


const Position SpawnPosAlliance[] =
{
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f}
};
const Position SpawnPosHorde[] =
{
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f},
        {0.0f, 0.0f, 0.0f, 0.0f}
};

//-----------------------------------------------------------------------
// Alianz :
#define GO_SKYBREAKER                                           192242
#define GO_GUNSHIP_STAIRS_ALLIANCE                      201709  
#define GO_ALLIANCE_GUNSHIP_PORTAL                      195371  
#define NPC_GUNSHIP_CANNON_ALLIANCE                     36838

#define SKYBREAKER_X                                            0
#define SKYBREAKER_Y                                            0
#define SKYBREAKER_Z                                            0
#define SKYBREAKER_RAYON                                        0

#define NPC_MURADIN_BRONZEBEARD                         36948

// Dialog
#define ALLIANCE_GOSSIP_ACTION_START            10875
#define ALLIANCE_GOSSIP_ACTION_CANCEL           1001
#define ALLIANCE_GOSSIP_ACTION_TP                       1002

const Position PosMuradinBronzebeard[]=
{
    {-472.596f, 2466.8701f, 190.7371f, 6.204f}, 
    {0.0f, 0.0f, 0.0f, 0.0f}                                    
};

#define NPC_SKYBREAKER_SERGEANT                         36961
#define NPC_SKYBREAKER_MORTAR_SOLDIER           36978
#define NPC_SKYBREAKER_MARINE                           36950
#define NPC_SKYBREAKER_SORCERER                         37026
#define NPC_SKYBREAKER_RIFLEMAN                         36969

#define AURA_ON_SKYBREAKER                                      70120

//-----------------------------------------------------------------------

//-----------------------------------------------------------------------
// Horde :
#define GO_OGRIM_HAMMER                                         192241
#define GO_GUNSHIP_STAIRS_HORDE                         202211  
#define GO_HORDE_GUNSHIP_PORTAL                         196413  
#define NPC_GUNSHIP_CANNON_HORDE                        36839

#define OGRIM_HAMMER_X                                          0
#define OGRIM_HAMMER_Y                                          0
#define OGRIM_HAMMER_Z                                          0
#define OGRIM_HAMMER_RAYON                                      0

#define NPC_HIGH_OVERLORD_VAROK_SAURFANG        36939

// Dialog
#define HORDE_GOSSIP_ACTION_START                       10876
#define HORDE_GOSSIP_ACTION_CANCEL                      1004
#define HORDE_GOSSIP_ACTION_TP                          1005

const Position PosHighOverlordVarokSaurfang[]=
{
        {0.0f, 0.0f, 0.0f, 0.0f},       
    {0.0f, 0.0f, 0.0f, 0.0f}    
};

#define NPC_KORKRON_SERGEANT                            36960
#define NPC_KORKRON_ROCKETEER                           36982
#define NPC_KORKRON_REAVER                                      36957
#define NPC_KORKRON_BATTLE_MAGE                         37117
#define NPC_KORKRON_AXETHROWER                          36968

#define AURA_ON_OGRIM_HAMMER                            70121

//-----------------------------------------------------------------------

// CANON_GUNSHIP
#define SPELL_CANNON_BLAST                                      69400
#define SPELL_INCINERATING_BLAST                        69402

// MURADIN BARBABRONCE
#define SPELL_CLEAVE                                            15284
#define SPELL_RENDING_THROW                                     70309
#define SPELL_TASTE_OF_BLOOD                            69634

#define AURA_BATTLE_FURY_10                                     72306
#define AURA_BATTLE_FURY_25                                     72307


#define SPELL_BURNING_PITCH                                     71335


#define SPELL_BELOW_ZERO                                        69705

#define SPELL_ROCKET_ARTILLERY                          69679
#define SPELL_EXPLOSION                                         69680   


#define SPELL_BLADESTORM                                        69652
#define SPELL_BLADESTORM_TRIGGER                        69653   
#define SPELL_DESPERATE_RESOLVE_10_NM           69647
#define SPELL_DESPERATE_RESOLVE_10_HM           72537
#define SPELL_DESPERATE_RESOLVE_25_NM           72536
#define SPELL_DESPERATE_RESOLVE_25_HM           72538
#define SPELL_WOUNDING_STRIKE_10_NM                     69651
#define SPELL_WOUNDING_STRIKE_10_HM                     72570
#define SPELL_WOUNDING_STRIKE_25_NM                     72569
#define SPELL_WOUNDING_STRIKE_25_HM                     72571


#define SPELL_SHOOT_10_NM                                       70162
#define SPELL_SHOOT_10_HM                                       72567
#define SPELL_SHOOT_25_NM                                       72566
#define SPELL_SHOOT_25_HM                                       72568


#define SPELL_HURL_AXE_10_NM                            70161
#define SPELL_HURL_AXE_10_HM                            72540
#define SPELL_HURL_AXE_25_NM                            72539
#define SPELL_HURL_AXE_25_HM                            72541


#define SPELL_EXPERIENCED                                       71188
#define SPELL_VETERAN                                           71193
#define SPELL_ELITE                                                     71195



//-----------------------------------------------------------------------
// Horde ----------------------------------------------------------------
//-----------------------------------------------------------------------
// PRIMERA_ESCUADRA_ASISTIDA
#define SAY_KORKRON_FIRST_SQUAD_0       "Thank the spirits for you, brothers and sisters. The Skybreaker has already left. Quickly now, to Orgrim's Hammer! If you leave soon, you may be able to catch them."
#define SAY_KORKRON_FIRST_SQUAD_1       "This should be helpin'ya!"

// SEGUNDA_ESCUADRA_ASISTIDA
#define SAY_KORKRON_SECOND_SQUAD_0      "Aka'Magosh, brave warriors. The alliance is in great number here."
#define SAY_KORKRON_SECOND_SQUAD_1      "Captain Saurfang will be pleased to see you aboard Orgrim's Hammer. Make haste, we will secure the area until you are ready for take-off."

// COMIENZA_EL_EVENTO
#define YELL_EVENT_BEGIN_HORDE_HIGH_OVERLORD_SAURFANG_4 "ALL HANDS ON DECK!"
#define YELL_EVENT_BEGIN_HORDE_HIGH_OVERLORD_SAURFANG_0 "Rise up, sons and daughters of the Horde! Today we battle a hated enemy of the Horde! LOK'TAR OGAR! Kor'kron, take us out!"
#define YELL_EVENT_BEGIN_HORDE_HIGH_OVERLORD_SAURFANG_1 "What is that?! Something approaching in the distance!"
#define YELL_EVENT_BEGIN_HORDE_HIGH_OVERLORD_SAURFANG_2 "ALLIANCE GUNSHIP!"
#define YELL_EVENT_BEGIN_HORDE_MURADIN_BRONZEBEARD_0    "Move yer jalopy or we'll blow it out of the sky, orc! The Horde's got no business here!"
#define YELL_EVENT_BEGIN_HORDE_HIGH_OVERLORD_SAURFANG_3 "You will know our business soon! KOR'KRON, ANNIHILATE THEM!"

// EMBARQUE AL MARTILLO ORGRIMMAR
#define YELL_BOARDING_ORGRIM_S_HAMMER_MURADIN_BRONZEBEARD_0             "Marines, Sergeants, attack!"
#define YELL_BOARDING_ORGRIM_S_HAMMER_HIGH_OVERLORD_SAURFANG_0  "You DARE board my ship? Your death will come swiftly."

// NUEVO_FUSILERO
#define YELL_NEW_RIFLEMEN_MURADIN               "Riflemen, shoot faster!"
// NUEVO_EQUIPO_DE_MORTERO
#define YELL_NEW_MORTAR_TEAM_MURADIN    "Mortar team, reload!"
// NUEVO_MAGO
#define YELL_NEW_MAGE_MURADIN                   "We're taking hull damage, get a sorcerer out here to shut down those cannons!"
// VICTORIA_HORDA
#define YELL_HORDE_VICTORY_SAURFANG             "The Alliance falter. Onward to the Lich King!"
// DERROTA_HORDA
#define YELL_HORDE_DEFEAT_SAURFANG              "Damage control! Put those fires out! You haven't seen the last of the Horde!"



//-----------------------------------------------------------------------
// ALIANZ -------------------------------------------------------------
//-----------------------------------------------------------------------
// PRIMERA_ESCUADRA_ASISTIDA
#define SAY_SKYBREAKER_FIRST_SQUAD_0    "Thank goodness you arrived when you did, heroes. Orgrim's Hammer has already left. Quickly now, to The Skybreaker! If you leave soon, you may be able to catch them."
#define SAY_SKYBREAKER_FIRST_SQUAD_1    "This ought to help!"

// SEGUNDA_ESCUADRA_ASISTIDA
#define SAY_SKYBREAKER_SECOND_SQUAD_0   "You have my thanks. We were outnumbered until you arrived."
#define SAY_SKYBREAKER_SECOND_SQUAD_1   "Captain Muradin is waiting aboard The Skybreaker. We'll secure the area until you are ready for take off."
#define SAY_SKYBREAKER_SECOND_SQUAD_2   "Skybreaker infantry, hold position!"

// COMIENZA_EL_EVENTO
#define YELL_EVENT_BEGIN_ALLIANCE_MURADIN_BRONZEBEARD_0         "Fire up the engines! We got a meetin' with destiny, lads!"
#define YELL_EVENT_BEGIN_ALLIANCE_MURADIN_BRONZEBEARD_1         "Hold on to yer hats!"
#define YELL_EVENT_BEGIN_ALLIANCE_MURADIN_BRONZEBEARD_2         "What in the world is that? Grab me spyglass, crewman!"
#define YELL_EVENT_BEGIN_ALLIANCE_MURADIN_BRONZEBEARD_3         "By me own beard! HORDE SAILIN' IN FAST 'N HOT!"
#define YELL_EVENT_BEGIN_ALLIANCE_MURADIN_BRONZEBEARD_4         "EVASIVE ACTION! MAN THE GUNS!"
#define YELL_EVENT_BEGIN_ALLIANCE_MURADIN_BRONZEBEARD_5         "Cowardly dogs! Ye blindsided us!"
#define YELL_EVENT_BEGIN_ALLIANCE_HIGH_OVERLORD_SAURFANG_0      "This is not your battle, dwarf. Back down or we will be forced to destroy your ship."
#define YELL_EVENT_BEGIN_ALLIANCE_MURADIN_BRONZEBEARD_6         "Not me battle? I dunnae who ye? think ye are, mister, but I got a score to settle with Arthas and yer not gettin' in me way! FIRE ALL GUNS! FIRE! FIRE!"

// EMBARCANDO_EL_ROMPECIELOS
#define YELL_BOARDING_THE_SKYBREAKER_HIGH_OVERLORD_SAURFANG_0   "Reavers, Sergeants, attack!"
#define YELL_BOARDING_THE_SKYBREAKER_MURADIN_BRONZEBEARD_0              "What's this then?! Ye won't be takin' this son o' Ironforge's vessel without a fight!."

// NUEVO_LANZAHACHAS
#define YELL_NEW_AXETHROWERS_HIGH_OVERLORD_SAURFANG_0   "Axethrowers, hurl faster!"

// NUEVO_FUSILEROS
#define YELL_NEW_ROCKETEERS_HIGH_OVERLORD_SAURFANG_0    "Rocketeers, reload!"

// NUEVO_MAGO_DE_BATALLA
#define YELL_NEW_BATTLE_MAGE_HIGH_OVERLORD_SAURFANG_0   "We're taking hull damage, get a battle-mage out here to shut down those cannons!"

// VICTORIA_ALIANZA
#define YELL_ALLIANCE_VICTORY_MURADIN_BRONZEBEARD_0             "Don't say I didn't warn ya, scoundrels! Onward, brothers and sisters!"

// DERROTA_ALIANZA
#define YELL_ALLIANCE_DEFEAT_MURADIN_BRONZEBEARD_0              "Captain Bartlett, get us out of here! We're taken too much damage to stay afloat!"


//-----------------------------------------------------------------------

#define SPELL_ACHIEVEMENT                                                               72959

enum eAchievements
{
    IM_ON_A_BOAT_10    = 4536,
    IM_ON_A_BOAT_25    = 4612
};

//-----------------------------------------------------------------------
#define PHASE_NOT_STARTED       0
#define PHASE_DISTANCE          1
#define PHASE_BOARDING          2
#define PHASE_END                       3

#define EXP_NULL                        0
#define EXP_EXPERIENCED         20000
#define EXP_VETERAN                     40000
#define EXP_ELITE                       80000

#define SPELL1	69400
#define SPELL2	70174

//-----------------------------------------------------------------------



class boss_high_overlord_varok_saurfang : public CreatureScript
{
    public:
                boss_high_overlord_varok_saurfang() : CreatureScript("boss_high_overlord_varok_saurfang") { }

                struct boss_high_overlord_varok_saurfangAI : public BossAI
                {
                        boss_high_overlord_varok_saurfangAI(Creature* pCreature) : BossAI(pCreature, DATA_GUNSHIP_BATTLE_EVENT)
                        {
							_Reset();
                        }

						void Reset()
                        {
							bDialog = false;
                            dialogID = 0;
                            dialogTimer = 0;
							bBattleStart = false;
							instance->SetBossState( DATA_GUNSHIP_BATTLE_EVENT, NOT_STARTED);
                        }

						void DoAction(const int32 param)
                        {
							switch( param) 
							{
								case DO_ACTION_BATTLE_START :
								{
									uint32 m_ALLIGSTRIGGER = DIFFICULTY(NPC_ALLIGSTRIGGER_10, NPC_ALLIGSTRIGGER_25, NPC_ALLIGSTRIGGER_10, NPC_ALLIGSTRIGGER_25);
                                    uint32 m_HORDEGSTRIGGER = DIFFICULTY(NPC_HORDEGSTRIGGER_10, NPC_HORDEGSTRIGGER_25, NPC_HORDEGSTRIGGER_10, NPC_HORDEGSTRIGGER_25);

									if (Creature *m_AlliGS = me->SummonCreature(m_ALLIGSTRIGGER, 18.637676f, 2247.624023f, 527.277039f))
									{
										instance->SendEncounterUnit(ENCOUNTER_FRAME_ADD, m_AlliGS);
									}

									if (Creature *m_HordeGS = me->SummonCreature(m_HORDEGSTRIGGER, -71.189644f, 2226.092285f, 527.117432f))
									{
										instance->SendEncounterUnit(ENCOUNTER_FRAME_ADD, m_HordeGS);
									}

									uint32 Count = DIFFICULTY(2, 4, 2, 4);

									if (Count == 4)
									{
										if (Creature *canon = me->SummonCreature(NPC_GUNSHIP_CANNON_HORDE, -38.841675f, 2258.511963f, 526.378174f))
											canon->SetOrientation(6.169659f);
										if (Creature *canon = me->SummonCreature(NPC_GUNSHIP_CANNON_HORDE, -38.193577f, 2253.306885f, 526.427917f))
											canon->SetOrientation(6.169659f);
										if (Creature *canon = me->SummonCreature(NPC_GUNSHIP_CANNON_HORDE, -39.107193f, 2236.982422f, 526.979919f))
											canon->SetOrientation(6.169659f);
										if (Creature *canon = me->SummonCreature(NPC_GUNSHIP_CANNON_HORDE, -38.604717f, 2241.389404f, 526.657288f))
											canon->SetOrientation(6.169659f);
									}else{
										if (Creature *canon = me->SummonCreature(NPC_GUNSHIP_CANNON_HORDE, -38.841675f, 2258.511963f, 526.378174f))
											canon->SetOrientation(6.169659f);
										if (Creature *canon = me->SummonCreature(NPC_GUNSHIP_CANNON_HORDE, -38.604717f, 2241.389404f, 526.657288f))
											canon->SetOrientation(6.169659f);
									}

									//me->SummonCreature(NPC_CANONTRIGGER, 39.714436f, 2230.390625f, 528.113281f);
									//me->SummonCreature(NPC_CANONTRIGGER, 43.005005f, 2256.538574f, 528.131104f);
												
									me->SummonCreature(NPC_FIGHTTRIGGER, 26.312359f, 2246.370850f, 527.267151f);
								}
                                case DO_ACTION_START_GUNSHIP_BATTLE :
								{
									if (!bBattleStart)
									{
										instance->SetBossState( DATA_GUNSHIP_BATTLE_EVENT, IN_PROGRESS);
										bDialog = true;
										dialogID = 0;
										dialogTimer = 0;
									}
                                    break;
								}
                                case DO_ACTION_FINISH_GUNSHIP_BATTLE :
								{
									Position tp = DeathbringerRise;
                                    Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
                                    if( !PlayerList.isEmpty()) 
									{
										for(Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i) 
										{
											if( Player *pCurrent = i->getSource()) 
											{
												if( me->GetDistance(pCurrent) <= 100.0f)
													DoTeleportPlayer( pCurrent, tp.GetPositionX(), tp.GetPositionY(), tp.GetPositionZ(), tp.GetOrientation());
											}
										}
									}
                                    break;
								}
                            }
                        }

						void UpdateAI( const uint32 diff) 
                        {
							if (bDialog) 
							{
							   if (!bBattleStart && instance->GetBossState( DATA_GUNSHIP_BATTLE_EVENT) == NOT_STARTED)
							   {
								 if (dialogTimer <= diff) 
								 {
									switch( dialogID) 
									{
										case 0 :
										{
											me->MonsterYell( YELL_EVENT_BEGIN_HORDE_HIGH_OVERLORD_SAURFANG_0, LANG_UNIVERSAL, 0);
											if( GameObject* AlliGunShip = GameObject::GetGameObject(*me, instance->GetData64(GO_ALLI_GUNSHIP_2)))
											{
												/* Position pos; 
												pos.m_positionX = AlliGunShip->GetPositionX();
												pos.m_positionY = AlliGunShip->GetPositionY();
												pos.m_positionZ = AlliGunShip->GetPositionZ();
												
												uint32 dist = AlliGunShip->GetDistance(-436.745209f,1829.303101f,190.945770f);
												uint32 angle = AlliGunShip->GetAngle(-436.745209f,1829.303101f);

												const char *say = "Ich bin das AlliGunship";

												//Position = (-436.745209f,1829.303101f,190.945770f,2.994648f);
												AlliGunShip->MovePosition(pos,dist,angle);
												AlliGunShip->Yell(*say, LANG_UNIVERSAL, 0); */
											}

                                            dialogID = 1;
                                            dialogTimer = 8000;
                                            break;
										}
										case 1 :
										{
											me->MonsterYell( YELL_EVENT_BEGIN_HORDE_HIGH_OVERLORD_SAURFANG_4, LANG_UNIVERSAL, 0);
											me->GetMotionMaster()->MovePoint(0, -437.100830f, 1987.904297f, 191.234131f);
											dialogID = 2;
                                            dialogTimer = 2000;
											break;
										}
										case 2 :
										{
											me->GetMotionMaster()->MovePoint(0, -437.477875f, 1948.863892f, 214.638245f);
											dialogID = 3;
                                            dialogTimer = 6000;
											break;
										}
										case 3 :
										{
											me->GetMotionMaster()->MovePoint(0, -443.602417f, 1935.741455f, 214.005554f);
											dialogID = 4;
                                            dialogTimer = 2000;
											break;
										}
										case 4 :
										{
											me->MonsterYell( YELL_EVENT_BEGIN_HORDE_HIGH_OVERLORD_SAURFANG_1, LANG_UNIVERSAL, 0);
											me->GetMotionMaster()->MovePoint(0, -484.726990f, 1915.420776f, 216.699356f);
											dialogID = 5;
                                            dialogTimer = 7000;
											break;
										}
										case 5 :
										{
											me->GetMotionMaster()->MovePoint(0, -482.312256f, 1915.456787f, 216.481705f);
											dialogID = 6;
											dialogTimer = 1000;
											break;
										}
                                        case 6 :
										{
                                            dialogID = 7;
                                            dialogTimer = 3000;
                                            break;
										}
                                        case 7 :
										{
											me->MonsterYell( YELL_EVENT_BEGIN_HORDE_HIGH_OVERLORD_SAURFANG_2, LANG_UNIVERSAL, 0);
                                            dialogID = 8;
                                            dialogTimer = 5000;
                                            break;
										}
                                        case 8 :
										{
											if( Creature* pMuradinBronzebeard = Unit::GetCreature(*me, instance->GetData64(NPC_MURADIN_BRONZEBEARD))) 
											{
												pMuradinBronzebeard->MonsterYell( YELL_EVENT_BEGIN_HORDE_MURADIN_BRONZEBEARD_0, LANG_UNIVERSAL, 0);
                                                dialogID = 9;
                                                dialogTimer = 2000;
                                            }
                                            break;
										}
                                        case 9 :
										{
											me->MonsterYell( YELL_EVENT_BEGIN_HORDE_HIGH_OVERLORD_SAURFANG_3, LANG_UNIVERSAL, 0);
                                            dialogID = 10;
                                            dialogTimer = 2000;
                                            break;
										}
                                        case 10 :
                                        {
											Position tp;
											tp.m_positionX = -73.149117f;
											tp.m_positionY = 2202.202393f;
											tp.m_positionZ = 530.593140f;
											tp.m_orientation = 1.495439f;

											//Dont need teleport anymore when Move works
                                            Map::PlayerList const &PlayerList = me->GetMap()->GetPlayers();
                                            if( !PlayerList.isEmpty()) 
											{
												for(Map::PlayerList::const_iterator i = PlayerList.begin(); i != PlayerList.end(); ++i) 
												{
													if( Player *pCurrent = i->getSource()) 
													{
														if( me->GetDistance(pCurrent) <= 100.0f)
															DoTeleportPlayer( pCurrent, tp.GetPositionX(), tp.GetPositionY(), tp.GetPositionZ(), tp.GetOrientation());
													}
                                                }
											}
											// In this Version not needed anymore
											// me->NearTeleportTo(tp.GetPositionX(), tp.GetPositionY(), tp.GetPositionZ(), tp.GetOrientation());
											// me->SetHomePosition(tp);
                                            dialogID = 11;
                                            dialogTimer = 10000;
                                            break;
										}
										case 11 :
										{
											if( Creature* pMuradinBronzebeard = Unit::GetCreature(*me, instance->GetData64( NPC_MURADIN_BRONZEBEARD))) 
											{
												pMuradinBronzebeard->MonsterYell( YELL_BOARDING_ORGRIM_S_HAMMER_MURADIN_BRONZEBEARD_0, LANG_UNIVERSAL, 0);
                                                dialogID = 12;
                                                dialogTimer = 2000;
											}
											break;
										}
                                        case 12 :
										{
											me->MonsterYell( YELL_BOARDING_ORGRIM_S_HAMMER_HIGH_OVERLORD_SAURFANG_0, LANG_UNIVERSAL, 0);
                                            dialogID = 13;
                                            dialogTimer = 2000;
                                            break;
										}
										case 13 :
										{
											bBattleStart = true;
											bDialog = false;
											DoAction(DO_ACTION_BATTLE_START);
											dialogTimer = 2000;
											me->NearTeleportTo(-444.588928f, 2001.904297f, 191.235092f, 1.098127f);
											me->AI()->Reset();
											break;
										}
									}
								 } else dialogTimer -= diff;
							  }
						   }
						}
						
						bool bBattleStart;
                        bool bDialog;
                        uint32 dialogID;
                        uint32 dialogTimer;
				};

				bool OnGossipHello(Player* pPlayer, Creature* pCreature)
				{
		            InstanceScript* pInstance = pCreature->LoadInstanceScript();
						if (pInstance->GetBossState( DATA_GUNSHIP_BATTLE_EVENT) == IN_PROGRESS)
						{
							pPlayer->ADD_GOSSIP_ITEM(0, "Battle in Progress", 631, HORDE_GOSSIP_ACTION_CANCEL);
						}
						if (pInstance->GetBossState( DATA_GUNSHIP_BATTLE_EVENT) == NOT_STARTED)
						{
							pPlayer->ADD_GOSSIP_ITEM(0, "Ready for battle", 631, HORDE_GOSSIP_ACTION_START);
						}
						if (pInstance && pInstance->GetBossState(DATA_GUNSHIP_BATTLE_EVENT) == DONE)
						{
						pPlayer->ADD_GOSSIP_ITEM(0, "Go to the top of the Deathbringer", 631, HORDE_GOSSIP_ACTION_TP);
						}
                        pPlayer->ADD_GOSSIP_ITEM(0, "Return Later", 631, HORDE_GOSSIP_ACTION_CANCEL);
                        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
                        return true;

					/*if (pInstance && pInstance->GetBossState(DATA_GUNSHIP_BATTLE_EVENT) == DONE)
					{
						pPlayer->ADD_GOSSIP_ITEM(0, "Go to the top of the Deathbringer", 631, HORDE_GOSSIP_ACTION_TP);
                        pPlayer->ADD_GOSSIP_ITEM(0, "Return Later", 631, HORDE_GOSSIP_ACTION_CANCEL);
                        pPlayer->SEND_GOSSIP_MENU(pPlayer->GetGossipTextId(pCreature), pCreature->GetGUID());
                        return true;
					}*/
					return false;
				}

                bool OnGossipSelect(Player* player, Creature* pCreature, uint32 /*sender*/, uint32 action)
                {
					player->PlayerTalkClass->ClearMenus();
                    player->CLOSE_GOSSIP_MENU();

					switch( action) 
					{
						case HORDE_GOSSIP_ACTION_START :
							pCreature->AI()->DoAction(DO_ACTION_START_GUNSHIP_BATTLE);
                            return true;
                        case HORDE_GOSSIP_ACTION_TP :
							pCreature->AI()->DoAction(DO_ACTION_FINISH_GUNSHIP_BATTLE);
                            return true;
						case HORDE_GOSSIP_ACTION_CANCEL :
							return true;
					};
					return false;
                }

		CreatureAI* GetAI(Creature* pCreature) const
        {
            return new boss_high_overlord_varok_saurfangAI(pCreature);
        }
};



class npc_zafod_boombox : public CreatureScript
{
        public:
                npc_zafod_boombox() : CreatureScript("npc_zafod_boombox") { }

                struct npc_zafod_boomboxAI : public ScriptedAI
                {
                        npc_zafod_boomboxAI(Creature* pCreature) : ScriptedAI(pCreature)
						{
							pInstance = me->LoadInstanceScript(); 
						}
	
                        void UpdateAI( const uint32 diff) { }

                        InstanceScript* pInstance;
                };

				bool OnGossipHello(Player* pPlayer, Creature* pCreature)
				{
					pPlayer->ADD_GOSSIP_ITEM( 2, "Give me one of these machines" , GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF +1);
					pPlayer->ADD_GOSSIP_ITEM( 2, "Maybe later" , GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF +2);
					pPlayer->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE,pCreature->GetGUID());
					return true;
				}

				void SendDefaultMenu_ACTION(Player* pPlayer, Creature* pCreature, uint32 uiAction)   
				{
					switch (uiAction)
					{
                        case GOSSIP_ACTION_INFO_DEF +1: 
							pPlayer->AddItem(49278,1);
							pPlayer->CLOSE_GOSSIP_MENU();
							break;
                
                        case GOSSIP_ACTION_INFO_DEF +2:
							pPlayer->CLOSE_GOSSIP_MENU();
							break;        
					}
				}
  
				bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
				{
					if (uiSender == GOSSIP_SENDER_MAIN)
					{
                        SendDefaultMenu_ACTION(pPlayer, pCreature, uiAction);
					}        
					return true;
				} 

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_zafod_boomboxAI(pCreature);
        }
};

class boss_muradin_bronzebeard : public CreatureScript
{
    public:
        boss_muradin_bronzebeard() : CreatureScript("boss_muradin_bronzebeard") { }

                struct boss_muradin_bronzebardAI : public BossAI
                {
                        boss_muradin_bronzebardAI(Creature* pCreature) : BossAI(pCreature, DATA_GUNSHIP_BATTLE_EVENT)
						{
                                instance->SetBossState( DATA_GUNSHIP_BATTLE_EVENT, NOT_STARTED);

                                instance->SetData( DATA_GUNSHIP_EVENT, PHASE_NOT_STARTED);
                        }

                        void Reset()
                        {
                                timer_Cleave            =       urand( 8000, 10000);
                                timer_RendingThrow      =       urand( 10000, 12000);
                                timer_TasteOfBlood      =       0;
                        }


                        void UpdateAI( const uint32 diff) 
                        {
							if (!UpdateVictim())
								return;
                                
                            if( ( me->GetHealth() / me->GetMaxHealth()) <= 0.4) 
							{
								if( timer_TasteOfBlood <= diff) {
                                   DoCast( me, SPELL_TASTE_OF_BLOOD);
                                   timer_TasteOfBlood = 120000;
                                }else{
									timer_TasteOfBlood -= diff;
                                }
                                
                                if( timer_Cleave <= diff) {
                                    DoCastVictim( SPELL_CLEAVE);
                                    timer_Cleave = urand( 8000, 10000);
                                } else timer_Cleave -= diff;

                                if( timer_RendingThrow <= diff) {
                                    DoCastVictim( SPELL_RENDING_THROW);
                                    timer_RendingThrow = urand( 10000, 12000);
                                } else timer_RendingThrow -= diff;

                                DoMeleeAttackIfReady();
                          }

                        }

                        uint32 timer_Cleave;
                        uint32 timer_RendingThrow;
                        uint32 timer_TasteOfBlood;
                };
                
        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new boss_muradin_bronzebardAI(pCreature);
        }
};

class boss_high_overlord_varok_saurfang_fighter : public CreatureScript
{
    public:
                boss_high_overlord_varok_saurfang_fighter() : CreatureScript("boss_high_overlord_varok_saurfang_fighter") { }

                struct boss_high_overlord_varok_saurfang_fighterAI : public BossAI
                {
                        boss_high_overlord_varok_saurfang_fighterAI(Creature* pCreature) : BossAI(pCreature, DATA_GUNSHIP_BATTLE_EVENT)
                        {
                                instance->SetBossState( DATA_GUNSHIP_BATTLE_EVENT, NOT_STARTED);

                                instance->SetData( DATA_GUNSHIP_EVENT, PHASE_NOT_STARTED);
                        }

						void Reset()
                        {
                                timer_Cleave            =       urand( 8000, 10000);
                                timer_RendingThrow      =       urand( 10000, 12000);
                                timer_TasteOfBlood      =       0;
                        }

						void UpdateAI( const uint32 diff) 
                        {
							if (UpdateVictim())
							{   
								if( ( me->GetHealth() / me->GetMaxHealth()) <= 0.4) 
								{
									if( timer_TasteOfBlood <= diff) 
									{
										DoCast( me, SPELL_TASTE_OF_BLOOD);
                                        timer_TasteOfBlood = 120000;
                                    } else timer_TasteOfBlood -= diff;
								}
                                
								if( timer_Cleave <= diff) 
								{
									DoCastVictim( SPELL_CLEAVE);
                                    timer_Cleave = urand( 8000, 10000);
								} else timer_Cleave -= diff;

								if( timer_RendingThrow <= diff) 
								{
									DoCastVictim( SPELL_RENDING_THROW);
                                    timer_RendingThrow = urand( 10000, 12000);
								} else timer_RendingThrow -= diff;

								DoMeleeAttackIfReady();
						}
					}

					uint32 timer_Cleave;
					uint32 timer_RendingThrow;
					uint32 timer_TasteOfBlood;
			};

		CreatureAI* GetAI(Creature* pCreature) const
        {
            return new boss_high_overlord_varok_saurfang_fighterAI(pCreature);
        }
};

class npc_sergeant : public CreatureScript
{
    public:
        npc_sergeant() : CreatureScript("npc_sergeant") { }

                struct npc_sergeantAI : public ScriptedAI
                {
                        npc_sergeantAI(Creature* pCreature) : ScriptedAI(pCreature)
            { pInstance = me->LoadInstanceScript(); }

                        void Reset()
                        {
							Player *target = me->FindNearestPlayer(400);
							me->AI()->AttackStart(target);

                            timer_Bladestorm                =       7000;
                            timer_WoundingStrike    =       urand( 10000, 12000);
                            timer_BurningPitch              =       60000;
                            timer_DesperateResolve  =       0; // -40% de Vida
                        }

                        void UpdateAI( const uint32 diff) 
                        {
								if(pInstance->GetData(DATA_GUNSHIP_EVENT) == true)
									me->UnitKill(me);

								// Need a Check , creature should not leaf the Bout.

								if (!UpdateVictim())
									return;

                                if( ( me->GetHealth() / me->GetMaxHealth()) <= 0.4) {
                                        if( timer_DesperateResolve <= diff) {
                                                DoCast( me, DIFFICULTY( SPELL_DESPERATE_RESOLVE_10_NM, SPELL_DESPERATE_RESOLVE_25_NM, SPELL_DESPERATE_RESOLVE_10_HM, SPELL_DESPERATE_RESOLVE_25_HM));
                                                timer_DesperateResolve = 120000;
                                        } else timer_DesperateResolve -= diff;
                                }

                                if( timer_Bladestorm <= diff) {
                                        DoCast( me, SPELL_BLADESTORM);
                                        timer_Bladestorm = 7000;
                                } else timer_Bladestorm -= diff;

                                if( timer_BurningPitch <= diff) {
                                        if( Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 10000, true)) {
                                                DoCast( pTarget, SPELL_BURNING_PITCH);
                                                timer_BurningPitch = 60000;
                                        }
                                } else timer_BurningPitch -= diff;

                                if( timer_WoundingStrike <= diff) {
                                        DoCastVictim( DIFFICULTY( SPELL_WOUNDING_STRIKE_10_NM, SPELL_WOUNDING_STRIKE_25_NM, SPELL_WOUNDING_STRIKE_10_HM, SPELL_WOUNDING_STRIKE_25_HM));
                                        timer_WoundingStrike = urand( 10000, 12000);
                                } else timer_WoundingStrike -= diff;

                DoMeleeAttackIfReady();
                        }

                        uint32 timer_Bladestorm;
                        uint32 timer_WoundingStrike;
                        uint32 timer_DesperateResolve;
                        uint32 timer_BurningPitch;

                        uint32 timer_Spawn;
						InstanceScript* pInstance;
                };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_sergeantAI(pCreature);
        }
};

class npc_skybreaker_rifleman : public CreatureScript
{
    public:
        npc_skybreaker_rifleman() : CreatureScript("npc_skybreaker_rifleman") { }

                struct npc_skybreaker_riflemanAI : public ScriptedAI
                {
                        npc_skybreaker_riflemanAI(Creature* pCreature) : ScriptedAI(pCreature)
            { pInstance = me->LoadInstanceScript(); }

                        void Reset()
                        {
							Player *target = me->FindNearestPlayer(400);
							me->AI()->AttackStart(target);

							timer_Shoot = urand( 2000, 4000);
                            timer_BurningPitch = 60000;

							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                        }

						void EnterCombat(Unit* /*who*/)
                        {
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
							SetCombatMovement(false);
                        }

                        void UpdateAI( const uint32 diff)
                        {
								if(pInstance->GetData(DATA_GUNSHIP_EVENT) == true)
									me->UnitKill(me);

								 if (!UpdateVictim())
									return;

                                if( timer_BurningPitch <= diff) {
                                        if( Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 10000, true)) {
                                                DoCast( pTarget, SPELL_BURNING_PITCH);
                                                timer_BurningPitch = 60000;
                                        }
                                } else timer_BurningPitch -= diff;

                                if( timer_Shoot <= diff) {
                                        DoCastVictim( DIFFICULTY( SPELL_SHOOT_10_NM, SPELL_SHOOT_25_NM, SPELL_SHOOT_10_HM, SPELL_SHOOT_25_HM));
                                        timer_Shoot = urand( 2000, 4000);
                                } else timer_Shoot -= diff;
                        }

                        uint32 timer_Shoot;
                        uint32 timer_BurningPitch;
                        
                        uint32 timer_Spawn;
						InstanceScript* pInstance;
                };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_skybreaker_riflemanAI(pCreature);
        }
};

class npc_korkron_axethrower : public CreatureScript
{
    public:
        npc_korkron_axethrower() : CreatureScript("npc_korkron_axethrower") { }

                struct npc_korkron_axethrowerAI : public ScriptedAI
                {
                        npc_korkron_axethrowerAI(Creature* pCreature) : ScriptedAI(pCreature)
            { pInstance = me->LoadInstanceScript(); }

                        void Reset()
                        {
							Player *target = me->FindNearestPlayer(400);
							me->AI()->AttackStart(target);

							timer_HurlAxe = urand( 2000, 4000);
                            timer_BurningPitch = 60000;

							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                        }

						void EnterCombat(Unit* /*who*/)
                        {
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
							SetCombatMovement(false);
                        }

                        void UpdateAI( const uint32 diff)
                        {
								if(pInstance->GetData(DATA_GUNSHIP_EVENT) == true)
									me->UnitKill(me);

								if (!UpdateVictim())
									return;

                                if( timer_BurningPitch <= diff) {
                                        if( Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 10000, true)) {
                                                DoCast( pTarget, SPELL_BURNING_PITCH);
                                                timer_BurningPitch = 60000;
                                        }
                                } else timer_BurningPitch -= diff;

                                if( timer_HurlAxe <= diff) {
                                        DoCastVictim( DIFFICULTY( SPELL_HURL_AXE_10_NM, SPELL_HURL_AXE_25_NM, SPELL_HURL_AXE_10_HM, SPELL_HURL_AXE_25_HM));
                                        timer_HurlAxe = urand( 2000, 4000);
                                } else timer_HurlAxe -= diff;
                        }

                        uint32 timer_HurlAxe;
                        uint32 timer_BurningPitch;
                        
                        uint32 timer_Spawn;
						InstanceScript* pInstance;
                };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_korkron_axethrowerAI(pCreature);
        }
};

class npc_marine_or_reaver : public CreatureScript
{
    public:
        npc_marine_or_reaver() : CreatureScript("npc_marine_or_reaver") { }

                struct npc_marine_or_reaverAI : public ScriptedAI
                {
                        npc_marine_or_reaverAI(Creature* pCreature) : ScriptedAI(pCreature)
            { pInstance = me->LoadInstanceScript(); }

                        void Reset()
                        {
                            Player *target = me->FindNearestPlayer(400);
							me->AI()->AttackStart(target);

                            timer_BurningPitch              =       60000;
                            timer_DesperateResolve  =       0;
                        }

                        void UpdateAI( const uint32 diff)
                        {
								if(pInstance->GetData(DATA_GUNSHIP_EVENT) == true)
									me->UnitKill(me);

								// Need a Check , creature should not leaf the Bout.
                           
								if (!UpdateVictim())
									return;
                                
                                if( ( me->GetHealth() / me->GetMaxHealth()) <= 0.4) {
                                        if( timer_DesperateResolve <= diff) {
                                                DoCast( me, DIFFICULTY( SPELL_DESPERATE_RESOLVE_10_NM, SPELL_DESPERATE_RESOLVE_25_NM, SPELL_DESPERATE_RESOLVE_10_HM, SPELL_DESPERATE_RESOLVE_25_HM));
                                                timer_DesperateResolve = 120000;
                                        } else timer_DesperateResolve -= diff;
                                }

                                if( timer_BurningPitch <= diff) {
                                        if( Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 10000, true)) {
                                                DoCast( pTarget, SPELL_BURNING_PITCH);
                                                timer_BurningPitch = 60000;
                                        }
                                } else timer_BurningPitch -= diff;

							 DoMeleeAttackIfReady();
                        }

                        uint32 timer_DesperateResolve;
                        uint32 timer_BurningPitch;
                        
                        uint32 timer_Spawn;
						InstanceScript* pInstance;
                };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_marine_or_reaverAI(pCreature);
        }
};

class npc_mortar_soldier_or_rocketeer : public CreatureScript
{
    public:
        npc_mortar_soldier_or_rocketeer() : CreatureScript("npc_mortar_soldier_or_rocketeer") { }

                struct npc_mortar_soldier_or_rocketeerAI : public ScriptedAI
                {
                        npc_mortar_soldier_or_rocketeerAI(Creature* pCreature) : ScriptedAI(pCreature)
            { pInstance = me->LoadInstanceScript(); }

                        void Reset()
                        {
							Player *target = me->FindNearestPlayer(400);
							me->AI()->AttackStart(target);

							timer_RocketArtillery = urand( 10000, 15000);
							timer_BurningPitch = 60000;

							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                        }

						void EnterCombat(Unit* /*who*/)
                        {
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
							SetCombatMovement(false);
                        }

                        void UpdateAI( const uint32 diff)
                        {
								if(pInstance->GetData(DATA_GUNSHIP_EVENT) == true)
									me->UnitKill(me);

							if (!UpdateVictim())
								return;
                                
                                if( timer_BurningPitch <= diff) {
                                        if( Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 10000, true)) {
                                                DoCast( pTarget, SPELL_BURNING_PITCH);
                                                timer_BurningPitch = 60000;
                                        }
                                } else timer_BurningPitch -= diff;

                                if( timer_RocketArtillery <= diff) {
                                        if( Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 10000, true)) {
                                                DoCast( pTarget, SPELL_ROCKET_ARTILLERY);
                                                timer_RocketArtillery   =       urand( 10000, 15000);
                                        }
                                } else timer_RocketArtillery -= diff;
                        }

                        uint32 timer_RocketArtillery;
                        uint32 timer_BurningPitch;
                        
                        uint32 timer_Spawn;
						InstanceScript* pInstance;
                };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_mortar_soldier_or_rocketeerAI(pCreature);
        }
};

class npc_sorcerer_or_battle_mage : public CreatureScript
{
    public:
        npc_sorcerer_or_battle_mage() : CreatureScript("npc_sorcerer_or_battle_mage") { }

                struct npc_sorcerer_or_battle_mageAI : public ScriptedAI
                {
                        npc_sorcerer_or_battle_mageAI(Creature* pCreature) : ScriptedAI(pCreature)
            { pInstance = me->LoadInstanceScript(); }

                        void Reset()
                        {
                                timer_BurningPitch              =       60000;
                                timer_BelowZero                 =       urand( 10000, 15000);

								me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                        }

						void EnterCombat(Unit* /*who*/)
                        {
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
							SetCombatMovement(false);
                        }

                        void UpdateAI( const uint32 diff)
                        {
								if(pInstance->GetData(DATA_GUNSHIP_EVENT) == true)
									me->UnitKill(me);

								if (!UpdateVictim())
									return;
                                
                                if( timer_BurningPitch <= diff) {
                                        if( Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 10000, true)) {
                                                DoCast( pTarget, SPELL_BURNING_PITCH);
                                                timer_BurningPitch = 60000;
                                        }
                                } else timer_BurningPitch -= diff;

                                if( timer_BelowZero <= diff) {
                                        if( Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 10000, true)) {
                                                DoCast( pTarget, SPELL_BELOW_ZERO);
                                                timer_BelowZero = urand( 10000, 15000);
                                        }
                                } else timer_BelowZero -= diff;
                        }

                        uint32 timer_BelowZero;
                        uint32 timer_BurningPitch;
                        
                        uint32 timer_Spawn;
						InstanceScript* pInstance;
                };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_sorcerer_or_battle_mageAI(pCreature);
        }
};

class npc_combattrigger : public CreatureScript
{
    public:
        npc_combattrigger() : CreatureScript("npc_combattrigger") { }

                struct npc_combattriggerAI : public ScriptedAI
                {
                        npc_combattriggerAI(Creature* pCreature) : ScriptedAI(pCreature)
						{ 
							pInstance = me->LoadInstanceScript(); 
						}

                        void Reset()
                        {
							CaseType = 1;
							CaseTimer = 10000;

							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE);
							me->SetVisible(false);

							Map::PlayerList const &players = me->GetMap()->GetPlayers();
							for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
							{
								AttackPlayerInMap(itr);
								break;
							}
                        }

						void EnterCombat(Unit* /*who*/)
                        {
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_DISABLE_MOVE);
							SetCombatMovement(false);
                        }

                        void UpdateAI( const uint32 diff)
                        {
							if(pInstance->GetData(DATA_GUNSHIP_EVENT) == true)
								me->UnitKill(me);

							if (CaseTimer <= diff)
							{
								switch (CaseType)
								{
									case 1 :
										{
											// Sumon Portal
											me->SummonCreature(NPC_PORTAL, -70.393806f, 2235.044678f, 526.761536f);
											CaseTimer = 4000;
											CaseType = 2;
											break;
										}
									case 2:
										{
											// Summon Deffer
											me->SummonCreature(NPC_SKYBREAKER_MORTAR_SOLDIER, 19.905600f, 2229.406738f, 526.922729f);
											me->SummonCreature(NPC_SKYBREAKER_MORTAR_SOLDIER, 21.892221f, 2244.537354f, 526.904419f);
											me->SummonCreature(NPC_SKYBREAKER_MORTAR_SOLDIER, 30.448759f, 2239.410156f, 526.872314f);
											me->SummonCreature(NPC_SKYBREAKER_MORTAR_SOLDIER, 30.509739f, 2229.745361f, 526.906372f);
											me->SummonCreature(NPC_SKYBREAKER_MORTAR_SOLDIER, 16.182817f, 2250.926025f, 526.981812f);
											me->SummonCreature(NPC_SKYBREAKER_RIFLEMAN, -6.278732f, 2239.198975f, 528.106934f);
											me->SummonCreature(NPC_SKYBREAKER_RIFLEMAN, -5.815511f, 2244.536865f, 528.089905f);
											me->SummonCreature(NPC_SKYBREAKER_RIFLEMAN, -4.562603f, 2250.770508f, 528.068665f);

											CaseTimer = 40000;
											CaseType = 3;
											break;
										}
									case 3:
										{
											// Summon BattleMage
											me->SummonCreature(NPC_SKYBREAKER_SORCERER, 18.254408f, 2242.593018f, 527.132568f);
											CaseTimer = 10000;
											CaseType = 1;
											break;
										}
								}
							}else{
								CaseTimer -= diff;
							}
						}

						Player* player;
						uint32 CaseType;
                        uint32 CaseTimer;

						InstanceScript* pInstance;
                };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_combattriggerAI(pCreature);
        }
};


class npc_GunShip_healthtrigger : public CreatureScript
{
    public:
        npc_GunShip_healthtrigger() : CreatureScript("npc_GunShip_healthtrigger") { }

                struct npc_GunShip_healthtriggerAI : public ScriptedAI
                {
                        npc_GunShip_healthtriggerAI(Creature* pCreature) : ScriptedAI(pCreature)
						{ 
							pInstance = me->LoadInstanceScript(); 
						}

                        void Reset()
                        {

							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
							//me->SetVisible(false); // Must see the NPC in Debug ;)

							Map::PlayerList const &players = me->GetMap()->GetPlayers();
							for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
							{
								AttackPlayerInMap(itr);
								break;
							}
                        }

						void JustDied(Unit* /*killer*/)
						{
							if(me->GetEntry() == DIFFICULTY(NPC_HORDEGSTRIGGER_10, NPC_HORDEGSTRIGGER_25, NPC_HORDEGSTRIGGER_10, NPC_HORDEGSTRIGGER_25))
							{
								if(pInstance->GetData(DATA_GUNSHIP_EVENT) == true)
								{
								}else{
									pInstance->SetBossState(DATA_GUNSHIP_BATTLE_EVENT, DONE);
									pInstance->SetBossState(DATA_GUNSHIP_BATTLE_EVENT, NOT_STARTED);
									pInstance->SetData(DATA_GUNSHIP_EVENT, true);
									pInstance->SetData(DATA_GUNSHIP_EVENT, false);
								}
							}
							if(me->GetEntry() == DIFFICULTY(NPC_ALLIGSTRIGGER_10, NPC_ALLIGSTRIGGER_25, NPC_ALLIGSTRIGGER_10, NPC_ALLIGSTRIGGER_25))
							{
								pInstance->SetBossState(DATA_GUNSHIP_BATTLE_EVENT, DONE);
								pInstance->DoCompleteAchievement(DIFFICULTY(IM_ON_A_BOAT_10,IM_ON_A_BOAT_25));
								pInstance->SetData(DATA_GUNSHIP_EVENT, true);
							}
						}

						void EnterCombat(Unit* /*who*/)
                        {
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
							SetCombatMovement(false);
                        }

                        void UpdateAI( const uint32 diff)
                        {
							if(pInstance->GetData(DATA_GUNSHIP_EVENT) == true)
								me->UnitKill(me);
						}

						uint32 m_me;
						Player* player;
						InstanceScript* pInstance;
                };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_GunShip_healthtriggerAI(pCreature);
        }
};

class npc_portal_icc : public CreatureScript
{
    public:
        npc_portal_icc() : CreatureScript("npc_portal_icc") { }

                struct npc_portal_iccAI : public ScriptedAI
                {
                        npc_portal_iccAI(Creature* pCreature) : ScriptedAI(pCreature)
						{ 
							instance = me->LoadInstanceScript(); 
						}

                        void Reset()
                        {
							SummonTimer = urand(2000, 4000);
							SummonCount = DIFFICULTY(4, 7, 5, 8);
							CurrentCount = 0;

							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);

							Map::PlayerList const &players = me->GetMap()->GetPlayers();
							for (Map::PlayerList::const_iterator itr = players.begin(); itr != players.end(); ++itr)
							{
								AttackPlayerInMap(itr);
								break;
							}
                        }

						void EnterCombat(Unit* /*who*/)
                        {
							me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE | UNIT_FLAG_NON_ATTACKABLE | UNIT_FLAG_OOC_NOT_ATTACKABLE | UNIT_FLAG_NOT_SELECTABLE);
							SetCombatMovement(false);
                        }
						
						void SummonOffer(uint32 data)
						{
							if(data == 1)
								me->SummonCreature(NPC_SKYBREAKER_SERGEANT, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
							else if(data == 2)
								me->SummonCreature(NPC_SKYBREAKER_MARINE, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ());
						}

                        void UpdateAI( const uint32 diff)
                        {
							if(instance->GetData(DATA_GUNSHIP_EVENT) == true)
								me->UnitKill(me);

							if (SummonTimer <= diff)
							{
								if (CurrentCount < SummonCount)
								{
									SummonTimer = urand(500, 2000);
									SummonOffer(urand(1,2));
									CurrentCount++;
								}else{
									me->SetVisible(false);
									me->UnitKill(me);
								}
							}else{
								SummonTimer -= diff;
							}
							
						}

						Player* pPlayer;
						uint32 CurrentCount;
						uint32 SummonCount;
						uint32 SummonTimer;
						InstanceScript *instance;
                };

        CreatureAI* GetAI(Creature* pCreature) const
        {
            return new npc_portal_iccAI(pCreature);
        }
};

void AddSC_boss_gunship_battle()
{
        new npc_sergeant();
        new npc_zafod_boombox();
        new npc_skybreaker_rifleman();
        new npc_korkron_axethrower();
        new npc_marine_or_reaver();
        new npc_mortar_soldier_or_rocketeer();
        new npc_sorcerer_or_battle_mage();
        new boss_muradin_bronzebeard();
        new boss_high_overlord_varok_saurfang();
		new boss_high_overlord_varok_saurfang_fighter();
		new npc_combattrigger();
		new npc_GunShip_healthtrigger();
		new npc_portal_icc();
}