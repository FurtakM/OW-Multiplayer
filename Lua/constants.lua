-----------------------------------------------------------------------------
---  Orig. File : /lua/constants.lua
---  Version    : 5
---
---  Summary    : constants
---
---  Created    : Stuart 'Stucuk' Carey, OW Support
---               Petr 'Sali' Salak, Freya Group
------------------------------------------------------------------------------

function makeAnchor(L,T,R,B)
	return {left=L,top=T,right=R,bottom=B};
end;

-- [Anchors] --
anchorLB=makeAnchor(true,false,false,true);
anchorLT=makeAnchor(true,true,false,false);
anchorL =makeAnchor(true,false,false,false);
anchorLR =makeAnchor(true,false,true,false);

anchorRB=makeAnchor(false,false,true,true);
anchorTR=makeAnchor(false,true,true,false);
anchorR =makeAnchor(false,false,true,false);

anchorT  = makeAnchor(false,true,false,false);
anchorB  = makeAnchor(false,false,false,true);
anchorTB = makeAnchor(false,true,false,true);

anchorNone =makeAnchor(false,false,false,false);
anchorLTRB =makeAnchor(true,true,true,true);

anchorLTB = makeAnchor(true,true,false,true);
anchorTRB =makeAnchor(false,true,true,true);

anchorLTR =makeAnchor(true,true,true,false);
anchorLRB =makeAnchor(true,false,true,true);

-- [] --
IS_EDITOR = getvalue(OWV_ISEDITOR);

-- [Building Kinds] --
bud_depot			        = 0;
bud_warehouse				= 1;

bud_workshop				= 2;
bud_factory				= 3;

bud_armoury				= 4;
bud_barracks				= 5;

bud_lab					= 6;
bud_lab1				= 7;
bud_lab2				= 8;

bud_lab_basic				= 9;
bud_lab_weapon				= 10;
bud_lab_siberium			= 11;
bud_lab_computer			= 12;
bud_lab_biological			= 13;
bud_lab_spacetime                       = 14;
bud_lab_optoelectronics                 = 15;

bud_ext_track				= 16;
bud_ext_gun				= 17;
bud_ext_rocket				= 18;
bud_ext_noncombat			= 19;
bud_ext_radar				= 20;
bud_ext_siberium			= 21;
bud_ext_radio				= 22; -- Cancelled
bud_ext_stitch				= 23;
bud_ext_computer			= 24;
bud_ext_laser				= 25;

bud_power_oil				= 26;
bud_power_solar				= 27;
bud_power_siberium			= 28;

bud_mine_oil				= 29;
bud_mine_siberium			= 30;

bud_breast				= 31;
bud_bunker				= 32;
bud_turret				= 33;

bud_teleport				= 34;

bud_fort				= 35;

bud_control_tower			= 36;
bud_behemoth				= 37;
bud_eon					= 38;
bud_alien				= 39;

bud_wall				= 40;

bud_types_factory                       = {bud_workshop,bud_factory};
bud_types_bunker                        = {bud_breast,bud_bunker,bud_turret};
bud_types_bunker_weapon                 = {bud_bunker,bud_turret};
bud_types_lab                           = {bud_lab,bud_lab1,bud_lab2,bud_alien};
-- [Technologies]
  tech_ApeLang=1;
  tech_ApePsych=2;
  tech_ApeNeural=3;
  tech_ApeBrain=4;
  tech_StimDrugs=5;
  tech_Radar=6;
  tech_MatDet=7;
  tech_BioDet=8;
  tech_MatPred=9;
  tech_Laser=10;
  tech_ApeAgres=11;
  tech_LasSight=12;
  tech_Soporific=13;
  tech_LasDouble=14;
  tech_RemCont=15;
  tech_PartInvis=16;
  tech_HidCam=17;
  tech_RemCharge=18;
  tech_SibLoc=19;
  tech_SibDet=20;
  tech_SibPow=21;
  tech_SibEng=22;
  tech_Behemoth=23;
  tech_Artifact=24;
  tech_SibFiss=25;
  tech_SibContam=26;
  tech_AdvAI=27;
  tech_TauRad=28;
  tech_SpacAnom=29;
  tech_TauField=30;
  tech_Lapser=31;
  tech_AI=32;
  tech_Virus=33;
  tech_AdvMet=34;
  tech_SolPow=35;
  tech_AdvChassis=36;
  tech_LimTeleport=37;
  tech_TargTeleport=38;
  tech_Gun=39;
  tech_Rocket=40;
  tech_Mortar=41;
  tech_Explos=42;
  tech_SelfDest=43;
  tech_Bazooka=44;
  tech_SolEng=45;
  tech_OilPow=46;
  tech_OilEng=47;
  tech_Tech1=48;
  tech_Tech2=49;
  tech_Tech3=50;
  tech_Weap1=51;
  tech_Weap2=52;
  tech_Weap3=53;
  tech_Sib1=54;
  tech_Sib2=55;
  tech_Sib3=56;
  tech_Comp1=57;
  tech_Comp2=58;
  tech_Comp3=59;
  tech_Opto1=60;
  tech_Opto2=61;
  tech_Opto3=62;
  tech_ST1=63;
  tech_ST2=64;
  tech_ST3=65;
  tech_Bio1=66;
  tech_Bio2=67;
  tech_Bio3=68;
  tech_Gatling=69;
  tech_Flame=70;
  tech_AdvRocket=71;
  tech_SibImpl=72;


-- [Human Classes] --

class_soldier				= 1;
class_engineer				= 2;
class_mechanic				= 3;
class_scientist				= 4;
class_sniper				= 5;
--class_upgsniper			= 6;
--class_terrorist			= 7;
class_mortarer				= 8;
class_bazooker				= 9;
--class_taubazooker			= 10;
class_noble				= 11;
class_apeman				= 12;
class_baggie				= 13;
class_tiger				= 14;
class_apeman_soldier		        = 15;
class_apeman_engineer		        = 16;
class_apeman_kamikaze		        = 17;
class_phororhacos			= 18;
class_frog				= 19;
class_fish				= 20;
class_prakun				= 21;

class_animal                            = {class_baggie,class_tiger,class_phororhacos,class_frog,class_fish,class_prakun};

-- [Vehicle Driver Types] --

controller_human			= 1;
controller_remote			= 2;
controller_computer			= 3;
controller_desertrider		        = 4;
controller_apeman			= 5;

-- [Activities] --
act_none				= 0;
act_forward_left			= 1;
act_forward				= 2;
act_forward_right			= 3;
act_back_right				= 4;
act_back				= 5;
act_back_left				= 6;
act_left				= 7;
act_right				= 8;
act_wait				= 9;
act_change_tracks			= 10;
act_animate				= 11;
act_fly_up				= 12;
act_fly_down				= 13;
act_heal				= 14;
act_repair_vehicle			= 15;
act_up					= 16;
act_down				= 17;
act_build				= 18; --construct_himself
act_help_build				= 19; --help_to_construct
act_repair_building			= 20; --repair_building
act_materialize				= 21;
act_change_class			= 22;
act_factory_construct		        = 23; --construct_vehicle/turret
act_factory_inside			= 24;
act_factory_leave			= 25; --move_out
act_research				= 26;
act_mine				= 27;
act_make_power				= 28;
act_suspend				= 29;
act_stand_by				= 30;
act_on_hold				= 31;
act_attack				= 32;
act_attack_left				= 33;
act_attack_right			= 34;
act_tame				= 35;
act_capture				= 36;
act_wait_for_weapon			= 37;
act_push_vehicle			= 38;
act_bulldozer_forward		        = 39;
act_bulldozer_backwards		        = 40;
act_place_mine				= 41;
act_make_invisible			= 42;
act_invisible				= 43;
act_hack				= 44;
act_shift_unit				= 45;
act_teleport_unit			= 46;
act_contaminate				= 47;
act_teleport_recharge		        = 48;
act_pp_no_oil				= 49;
act_dismantle				= 50;
act_enter_factory			= 51;
act_recycle				= 52;
act_place_behemoth			= 53;
act_wait_for_construction	        = 54;
act_siberite_rocket_ignition            = 55;
act_eon					= 56;
act_behemoth_power_up		        = 57;
act_custom				= 58;
act_unplaced				= 59;
act_wait_for_material		        = 60;

-- [IconType] --

IT_IconGroupCancel                      = 0;
IT_IconGroupCancel2                     = 1;
IT_Move                                 = 2;
IT_Stop                                 = 3;
IT_FortStop                             = 4;
IT_Attack                               = 5;
IT_AttackGround                         = 6;
IT_AttackPrior                          = 7;
IT_AttackNo                             = 8;
IT_ExitVehicle                          = 9;
IT_Free                                 = 10;
IT_Hold                                 = 11;
IT_StandGround                          = 12;
IT_SleepOn                              = 13;
IT_SleepOff                             = 14;
IT_NormalGrenades                       = 15;
IT_SpaceShifting                        = 16;
IT_TimeShifting                         = 17;
IT_Walk                                 = 18;
IT_Crawl                                = 19;
IT_PlaceDelayedCharge                   = 20;
IT_PlaceExp                             = 21;
IT_FireExp                              = 22;
IT_RepairVehicle                        = 23;
IT_RecycleVehicle                       = 24;
IT_DismantleBuilding                    = 25;
IT_Heal                                 = 26;
IT_Tame                                 = 27;
IT_TameAr                               = 28;
IT_Ghandi                               = 29;
IT_Dumb                                 = 30;
IT_Harakir                              = 31;
IT_Berserk                              = 32;
IT_Hack                                 = 33;
IT_Infect                               = 34;
IT_Contaminate                          = 35;
IT_PlaceTeleportExit                    = 36;
IT_PlaceTeleportExit2                   = 37;
IT_RepairBuilding                       = 38;
IT_CraneRepairBuilding                  = 39;
IT_PlaceSecurityLaser                   = 40;
IT_PlaceHiddenCamera                    = 41;
IT_Destruct=42;
IT_UpgradeBuilding=43;
IT_UpgradeArmory=44;
IT_EverybodyExit=45;
IT_ExitBuilding=46;
IT_ConstructVehicle=47;
IT_SabreOn=48;
IT_CarabineOn=49;
IT_SelfDestruction=50;
IT_CargoUnload=51;
IT_CargoUnload2=52;
IT_PutDown=53;
IT_Speed=54;
IT_SelectionUndo=55;
IT_SelectionRedo=56;
IT_B_Depot=57;
IT_B_WorkShop=58;
IT_B_Armoury=59;
IT_B_BasicLab=60;
IT_B_RemoteCT=61;
IT_B_Teleport=62;
IT_B_PowerPlantSolar=63;
IT_B_PowerPlantOil=64;
IT_B_PowerPlantSiberium=65;
IT_B_OilDrillingTower=66;
IT_B_SiberiumMine=67;
IT_B_BWorks=68;
IT_B_Bunker=69;
IT_B_Turret=70;
IT_BuildBehemoth=71;
IT_RebuildToBunker=72;
IT_RebuildToTurret=73;
IT_LR_First=74;
IT_LR_SolPow=75;
IT_LR_SolEng=76;
IT_LR_OilPow=77;
IT_LR_OilEng=78;
IT_LR_ApeLang=79;
IT_LR_ApePsych=80;
IT_LR_ApeAgres=81;
IT_LR_ApeNeural=82;
IT_LR_ApeBrain=83;
IT_LR_StimDrugs=84;
IT_LR_Radar=85;
IT_LR_MatDet=86;
IT_LR_BioDet=87;
IT_LR_MatPred=88;
IT_LR_LasSight=89;
IT_LR_Soporific=90;
IT_LR_Laser=91;
IT_LR_LasDouble=92;
IT_LR_RemCont=93;
IT_LR_RemCharge=94;
IT_LR_PartInvis=95;
IT_LR_HidCam=96;
IT_LR_SibDet=97;
IT_LR_SibLoc=98;
IT_LR_SibPow=99;
IT_LR_SibEng=100;
IT_LR_Behemoth=101;
IT_LR_Artifact=102;
IT_LR_SibFiss=103;
IT_LR_SibImpl=104;
IT_LR_SibContam=105;
IT_LR_TauRad=106;
IT_LR_SpacAnom=107;
IT_LR_TauField=108;
IT_LR_Lapser=109;
IT_LR_LimTeleport=110;
IT_LR_TargTeleport=111;
IT_LR_AI=112;
IT_LR_AdvAI=113;
IT_LR_Virus=114;
IT_LR_AdvChassis=115;
IT_LR_Flame=116;
IT_LR_Gatling=117;
IT_LR_Gun=118;
IT_LR_AdvMet=119;
IT_LR_Rocket=120;
IT_LR_AdvRocket=121;
IT_LR_Mortar=122;
IT_LR_Explos=123;
IT_LR_SelfDest=124;
IT_LR_Bazooka=125;
IT_LR_Tech1=126;
IT_LR_Tech2=127;
IT_LR_Tech3=128;
IT_LR_Weap1=129;
IT_LR_Weap2=130;
IT_LR_Weap3=131;
IT_LR_Sib1=132;
IT_LR_Sib2=133;
IT_LR_Sib3=134;
IT_LR_Comp1=135;
IT_LR_Comp2=136;
IT_LR_Comp3=137;
IT_LR_Opto1=138;
IT_LR_Opto2=139;
IT_LR_Opto3=140;
IT_LR_ST1=141;
IT_LR_ST2=142;
IT_LR_ST3=143;
IT_LR_Bio1=144;
IT_LR_Bio2=145;
IT_LR_Bio3=146;
IT_LR_Last=147;
IT_CP_Soldier=148;
IT_CP_Mechanic=149;
IT_CP_Scientist=150;
IT_CP_Engineer=151;
IT_CP_AmericanSniper=152;
IT_CP_RussianBazooker=153;
IT_CP_ArabianMortarer=154;
IT_CP_Kamikaze=155;
IT_CP_SoldierF=156;
IT_CP_MechanicF=157;
IT_CP_ScientistF=158;
IT_CP_EngineerF=159;
IT_LabWeapon=160;
IT_LabSiberium=161;
IT_LabComputer=162;
IT_LabBio=163;
IT_LabSpace=164;
IT_LabOpto=165;
IT_FE_Track=166;
IT_FE_Gun=167;
IT_FE_Rocket=168;
IT_FE_NonCombat=169;
IT_FE_Radar=170;
IT_FE_Siberium=171;
IT_FE_Radio=172;
IT_FE_Stitching=173;
IT_FE_Computer=174;
IT_FE_Laser=175;
IT_TransportCans=176;
IT_TransportOil=177;
IT_TransportSib=178;
IT_Transport1=179;
IT_Transport2=180;
IT_TransportStop=181;
ITG_UpgradeLab1=182;
ITG_UpgradeLab2=183;
ITG_OptoResearch1=184;
ITG_OptoResearch2=185;
ITG_BioResearch1=186;
ITG_BioResearch2=187;
ITG_WeaponResearch1=188;
ITG_WeaponResearch2=189;
ITG_TimeResearch1=190;
ITG_TimeResearch2=191;
ITG_CompResearch1=192;
ITG_CompResearch2=193;
ITG_SibResearch1=194;
ITG_SibResearch2=195;
ITG_Transport=196;
ITG_VehTransport=197;
ITG_DepotTransport=198;
ITG_Infect=199;
ITG_Build=200;
ITG_VehBuild=201;
ITG_BuildResources=202;
ITG_BuildMine=203;
ITG_Build_Fortification=204;
ITG_FactoryAddExtension=205;
ITG_LabBasicResearch=206;
ITG_ReplaceWeapon=207;
IT_ActionPause=208;
IT_ActionResume=209;
IT_ActionCancel=210;
IT_Link=211;
IT_Unlink=212;
IT_CT_Link=213;
IT_CT_Unlink=214;
IT_MakeInvisible=215;
IT_PlaceWeapon=216;
IT_PlaceWeapon2=217;
IT_CancelPlaceWeapon=218;
IT_UseArtefact1=219;
IT_UseArtefact2=220;
IT_UseArtefact3=221;
IT_UseArtefact4=222;
IT_UseArtefact5=223;
IT_UseArtefact6=224;
IT_UseArtefact7=225;
IT_UseArtefact8=226;
IT_UseArtefact9=227;
IT_UseArtefact10=228;
IT_UseArtefact11=229;
IT_UseArtefact12=230;
IT_UseArtefact13=231;
IT_UseArtefact14=232;
IT_UseArtefact15=233;
IT_Patrol=234;
IT_Patrol2=235;
IT_LinkToBase=236;
IT_Bury=237;
IT_Maintenance=238;

_Tech2ITTable={
  IT_LR_ApeLang,
  IT_LR_ApePsych,
  IT_LR_ApeNeural,
  IT_LR_ApeBrain,
  IT_LR_StimDrugs,
  IT_LR_Radar,
  IT_LR_MatDet,
  IT_LR_BioDet,
  IT_LR_MatPred,
  IT_LR_Laser,
  IT_LR_ApeAgres,
  IT_LR_LasSight,
  IT_LR_Soporific,
  IT_LR_LasDouble,
  IT_LR_RemCont,
  IT_LR_PartInvis,
  IT_LR_HidCam,
  IT_LR_RemCharge,
  IT_LR_SibLoc,
  IT_LR_SibDet,
  IT_LR_SibPow,
  IT_LR_SibEng,
  IT_LR_Behemoth,
  IT_LR_Artifact,
  IT_LR_SibFiss,
  IT_LR_SibContam,
  IT_LR_AdvAI,
  IT_LR_TauRad,
  IT_LR_SpacAnom,
  IT_LR_TauField,
  IT_LR_Lapser,
  IT_LR_AI,
  IT_LR_Virus,
  IT_LR_AdvMet,
  IT_LR_SolPow,
  IT_LR_AdvChassis,
  IT_LR_LimTeleport,
  IT_LR_TargTeleport,
  IT_LR_Gun,
  IT_LR_Rocket,
  IT_LR_Mortar,
  IT_LR_Explos,
  IT_LR_SelfDest,
  IT_LR_Bazooka,
  IT_LR_SolEng,
  IT_LR_OilPow,
  IT_LR_OilEng,
  IT_LR_Tech1,
  IT_LR_Tech2,
  IT_LR_Tech3,
  IT_LR_Weap1,
  IT_LR_Weap2,
  IT_LR_Weap3,
  IT_LR_Sib1,
  IT_LR_Sib2,
  IT_LR_Sib3,
  IT_LR_Comp1,
  IT_LR_Comp2,
  IT_LR_Comp3,
  IT_LR_Opto1,
  IT_LR_Opto2,
  IT_LR_Opto3,
  IT_LR_ST1,
  IT_LR_ST2,
  IT_LR_ST3,
  IT_LR_Bio1,
  IT_LR_Bio2,
  IT_LR_Bio3,
  IT_LR_Gatling,
  IT_LR_Flame,
  IT_LR_AdvRocket,
  IT_LR_SibImpl};

SIDE_COLOURS = {};
SIDE_COLOURS[1] = RGB(144,144,144);
SIDE_COLOURS[2] = RGB(64,128,255);
SIDE_COLOURS[3] = RGB(255,255,128);
SIDE_COLOURS[4] = RGB(224,64,64);
SIDE_COLOURS[5] = RGB(128,255,255);
SIDE_COLOURS[6] = RGB(255,192,64);
SIDE_COLOURS[7] = RGB(255,128,255);
SIDE_COLOURS[8] = RGB(64,255,64);
SIDE_COLOURS[9] = RGB(240,240,240);
SIDE_COLOURS[10] = RGB(120,120,120);

SIDE_COLOURS_HEX = {};
SIDE_COLOURS_HEX[1] = 'd0d0d0';
SIDE_COLOURS_HEX[2] = 'ff8040';
SIDE_COLOURS_HEX[3] = '80ffff';
SIDE_COLOURS_HEX[4] = '4040e0';
SIDE_COLOURS_HEX[5] = 'ffff80';
SIDE_COLOURS_HEX[6] = 'ffc040';
SIDE_COLOURS_HEX[7] = 'ff80ff';
SIDE_COLOURS_HEX[8] = '40ff40';
SIDE_COLOURS_HEX[9] = 'e0e0e0';
SIDE_COLOURS_HEX[10] = 'c0c0c0';

TEAM_COLOURS = {};
TEAM_COLOURS[1] = SIDE_COLOURS[4];
TEAM_COLOURS[2] = SIDE_COLOURS[2];
TEAM_COLOURS[3] = SIDE_COLOURS[3];
TEAM_COLOURS[4] = SIDE_COLOURS[8];
TEAM_COLOURS[5] = SIDE_COLOURS[9];
TEAM_COLOURS[6] = SIDE_COLOURS[6];
TEAM_COLOURS[7] = SIDE_COLOURS[7];
TEAM_COLOURS[8] = SIDE_COLOURS[5];
TEAM_COLOURS[9] = SIDE_COLOURS[1];

ATTITUDE_COLOURS = {};
ATTITUDE_COLOURS.FRIEND = RGB(44,235,44);
ATTITUDE_COLOURS.ENEMY = RGB(204,44,44);
ATTITUDE_COLOURS.NEUTRAL = RGB(220,200,108);
ATTITUDE_COLOURS.I = WHITE(255);
ATTITUDE_COLOURS.SPEC = RGB(100,100,100);

CHAR13 = string.char(13);

--| Constants |--

LayoutWidth=1024;
LayoutWidthHalf=512;
LayoutHeight=768;
LayoutHeightHalf=384;

--if japanese then -- Japanese uses Unicode Fonts
--	Arial_10='Arial Unicode MS 12,0';
--	Arial_12='Arial Unicode MS 12,0';
--	Arial_13='Arial unicode MS 14,0';
--	Arial_14='Arial Unicode MS 14,0';
--	Arial_20='Arial Unicode MS 21,0';
 --       Arial_20b='Arial Unicode MS 21,0';

--	ADMUI3S = 'Arial Unicode MS 12,0';
--else -- Only use Arial for Japanese as others languages don't have it
--  FONTS ---
	Arial_12='Arial Unicode MS 12,0';		-- Not necesary Alphabeta
	Arial_14='Arial Unicode MS 14,0';
	Arial_15='Arial Unicode MS 15,0';
	Arial_19='Arial Unicode MS 19,0';
	Arial_21='Arial Unicode MS 21,0';

	CourierNew_18='Courier New_70_Fixed_16_2.DFF;0.5';--'Courier New 18,0';
	CourierNew_12B='Courier New_70_Fixed_16_2.DFF;0.29;0.01;0.6;2';

	Tahoma_10='Tahoma_70_Fixed_16_2.DFF;0.26;0.25;0.6;1';--'tahoma10';					-- Missing only 1 not necessary symbol
	Tahoma_11='Tahoma_70_Fixed_16_2.DFF;0.275;0.3;0.6;1';--'tahoma11';
	Tahoma_12='Tahoma_70_Fixed_16_2.DFF;0.29;0.38;0.6;1';--'tahoma12';
	Tahoma_13='Tahoma_70_Fixed_16_2.DFF;0.35;0.34;0.6;0';--'tahoma13';
	Tahoma_14='Tahoma_70_Fixed_16_2.DFF;0.38;0.38;0.6;0';--'tahoma14';
	Tahoma_16='Tahoma_70_Fixed_16_2.DFF;0.43;0.38;0.6;0';--'tahoma16';
	Tahoma_20='Tahoma_70_Fixed_16_2.DFF;0.64;0.38;0.6;0';--'tahoma20';
	Tahoma_30='Tahoma_70_Fixed_16_2.DFF;0.8;0.38;0.6;0';--'tahoma20';

	Tahoma_10B='Tahoma_70_Fixed_16_2.DFF;0.26;0.01;0.6;2';--'tahoma_bold_10';
	Tahoma_11B='Tahoma_70_Fixed_16_2.DFF;0.275;0.01;0.6;2';--'tahoma_bold_11';
	Tahoma_12B='Tahoma_70_Fixed_16_2.DFF;0.29;0.01;0.6;2';--'tahoma_bold_12';
	Tahoma_13B='Tahoma_70_Fixed_16_2.DFF;0.35;0.13;0.5;1';--'tahoma_bold_13';
	Tahoma_14B='Tahoma_70_Fixed_16_2.DFF;0.38;0.14;0.5;1';


	ADMUI3LB='tahoma_bold_13';
	Tahoma_16B='Tahoma_70_Fixed_16_2.DFF;0.43;0.15;0.5;1';--'tahoma_bold_16';
	Tahoma_20B='Tahoma_70_Fixed_16_2.DFF;0.64;0.2;0.5;1';--'tahoma_bold_20';
	Tahoma_30B='Tahoma_70_Fixed_16_2.DFF;0.8;0.3;0.5;1';--'tahoma_bold_30';
        Tahoma_60B='Tahoma_70_Fixed_16_2.DFF;1.5;0.35;0.6;1';--'tahoma_bold_30';

	BankGotic_14 = 'BankGothic Lt BTH14W7';		-- Missing many, I must find this font
	Lucida_14B = 'Lucida ConsoleH14W7B';		-- Missing not necessary symbols and not necesary latins & alphabeta chars
	OrbitAt_14 = 'OrbitB AT 14,0';				-- Missing many, I must find this font
	SmallFontrs_10 = 'Small Fonts 10-6'			-- Missing not necessary symbols and completly alphabeta and cyrilic

	ADMUI3S = 'ADMUI3SmH10W10';					-- Missing not necessary symbols, complet cyrilic and some latins
	ADMUI3L = 'ADMUI3Lg10x10';					-- Missing not necessary symbols, complet cyrilic and some latins

	Trebuchet_18='Trebuchet MS_70_Fixed_16_2.DFF;0.42;0.2;0.6;1';--'Trebuchet MS 18,0';			-- Missing not necessary symbols and non necesary latins & alphabeta chars
	Trebuchet_19='Trebuchet MS_70_Fixed_16_2.DFF;0.45;0.2;0.6;1';--'Trebuchet MS 19,0';
	Trebuchet_20='Trebuchet MS_70_Fixed_16_2.DFF;0.52;0.3;0.5;1';--'trebuchet ms H20Wdefault';
        Trebuchet_30='Trebuchet MS_70_Fixed_16_2.DFF;0.8;0.3;0.5;1';--'Trebuchet MS 30,0';

        Eurostile_70_1 = 'Eurostile_70_Fixed_16_2.dff;1;0.3;0.6;1';
        Eurostile_70_16 = 'Eurostile_70_Fixed_16_2.dff;1.6;0.38;0.5;1';
        Eurostile_70_18 = 'Eurostile_70_Fixed_16_2.dff;1.8;0.4;0.5;1';
        Eurostile_70_2 = 'Eurostile_70_Fixed_16_2.dff;2;0.4;0.5;1';
        Eurostile_70_25 = 'Eurostile_70_Fixed_16_2.dff;2.5;0.4;0.5;1';
        Eurostile_55 = 'Eurostile_70_Fixed_16_2.dff;1;0.3;0.5;2';--'Eurostile 55,0'; 		-- OWS Logo Text

        Inconsolata_70_06 = 'Inconsolata_70_Fixed_16_2.dff;0.6;0;0;0';
        Inconsolata_70_1 = 'Inconsolata_70_Fixed_16_2.dff;1;0;0;0';
        Inconsolata_70_12 = 'Inconsolata_70_Fixed_16_2.dff;1.2;0.38;0.55;0';

        Orbitron_14 = 'Orbitron_70_Fixed_16_2.DFF;0.40;0.35;0.62;0';
        Orbitron = 'Orbitron_70_Fixed_16_2.DFF;0.40;0.15;0.55;1';
        Orbitron_2 = 'Orbitron_70_Fixed_16_2.DFF;2;0.4;0.5;0';
--end;

COLOURS_DIALOG_EDIT      = {colour1=GRAYA(10,150), bevel_colour1=GRAY(22), bevel_colour2=GRAY(30),};
COLOURS_DIALOG_LISTBOX   = {colour1=GRAYA(10,150), bevel_colour1=GRAY(22), bevel_colour2=GRAY(30),};
COLOURS_DIALOG_RADIO     = {colour1=BLACKA(127),   colour2=GRAY(150),};
COLOURS_DIALOG_SCROLLBAR = {colour1=GRAYA(60,127), colour2=WHITE(),};


COLOURS_LOBBY_EDIT       = {colour1=GRAYA(40,250), bevel=true, bevel_colour1=GRAY(14), bevel_colour2=GRAY(14), gradient=true, gradient_colour1=GRAY(44), gradient_colour2=GRAY(20),};

Bevel_Highlight=GRAY(62);
Bevel_Shadow=GRAY(22);
Button_Colour=GRAY(45);
Window_Colour=GRAYA(20,127);
CheckBox_Colour1=GRAYA(20,150);
CheckBox_Colour2=GRAY(150);
CheckBox_Gradient_Colour1=GRAY(70);
CheckBox_Gradient_Colour2=GRAY(150);
ProgressBar_Colour1=GRAYA(20,150);
ProgressBar_Colour2=GRAY(150);
ProgressBar_Gradient_Colour1=GRAY(70);
ProgressBar_Gradient_Colour2=GRAY(150);
Edit_Colour1=GRAYA(6,200);
Edit_Colour2=WHITEA(153);

Scrollbar_Colour1=GRAYA(60,127);
Scrollbar_Colour2=WHITE();
ListBox_Colour1=GRAYA(20,200);

Window_Back={bevel=true,
	bevel_colour1=GRAY(10),
	bevel_colour2=GRAY(10),
	gradient_colour1=GRAYA(50,240),
	gradient_colour2=GRAYA(50,240),
	gradient=true};

WINDOW_BACKGROUND={bevel=true,
	bevel_colour1=GRAY(10),
	bevel_colour2=GRAY(10),
	gradient_colour1=GRAYA(50,240),
	gradient_colour2=GRAYA(50,240),
	gradient=true};

Window_Back2={bevel=true,
	bevel_colour1=GRAY(10),
	bevel_colour2=GRAY(10),
	gradient_colour1=GRAY(30),
	gradient_colour2=GRAY(50),
	gradient=true};

progressbar_merge={
	bevel_colour1=GRAY(10),
	bevel_colour2=GRAY(40),
	colour1=ProgressBar_Colour1,
	colour2=ProgressBar_Colour2,
	gradient=true,
	gradient_colour1=ProgressBar_Gradient_Colour1,
	gradient_colour2=ProgressBar_Gradient_Colour2,
};

checkbox_merge={
	bevel_colour1=GRAY(10),
	bevel_colour2=GRAY(40),
	colour1=CheckBox_Colour1,
	colour2=CheckBox_Colour2,
	gradient=true,
	gradient_colour1=CheckBox_Gradient_Colour1,
	gradient_colour2=CheckBox_Gradient_Colour2,
};

GradButton_Green = {
	highlight1=RGB(28,52,31),
	highlight2=RGB(22,40,24),
	col1=RGB(20,38,23),
	col2=RGB(16,29,18),
	b_highlight1=RGB(23,40,22),
	b_highlight2=RGB(32,55,30),
	b_shadow1=RGB(14,24,13),
	b_shadow2=RGB(19,33,18),
}

GradButton_Grey_Light = {
	highlight1=GRAY(106),
	highlight2=GRAY(63),
	col1=GRAY(86),
	col2=GRAY(43),
	b_highlight1=GRAY(60),
	b_highlight2=GRAY(90),
	b_shadow1=GRAY(30),
	b_shadow2=GRAY(50),
}

GradButton_Grey_Dark = {
	highlight1=GRAY(86/2),
	highlight1=GRAY(106/2),
	highlight2=GRAY(63/2),
	col1=GRAY(86/2),
	col2=GRAY(43/2),
	b_highlight1=GRAY(60/2),
	b_highlight2=GRAY(90/2),
	b_shadow1=GRAY(30/2),
	b_shadow2=GRAY(50/2),
}


----- Multiplayer room -----
GradButton_Red = {
	col1=RGB(119,0,0),
	col2=RGB(65,0,0),
	highlight1=RGB(149,0,0),
	highlight2=RGB(95,0,0),
	b_highlight1=RGB(108,0,0),
	b_highlight2=RGB(138,0,0),
	b_shadow1=RGB(36,0,0),
	b_shadow2=RGB(66,0,0),
}

GradButton_Green = {
	col1=RGB(0,119,0),
	col2=RGB(0,65,0),
	highlight1=RGB(0,149,0),
	highlight2=RGB(0,95,0),
	b_highlight1=RGB(0,108,0),
	b_highlight2=RGB(0,138,0),
	b_shadow1=RGB(0,36,0),
	b_shadow2=RGB(0,66,0),
}

GradButton_Blue = {
	col1=RGB(0,0,119),
	col2=RGB(0,0,65),
	highlight1=RGB(0,0,149),
	highlight2=RGB(0,0,95),
	b_highlight1=RGB(0,0,108),
	b_highlight2=RGB(0,0,138),
	b_shadow1=RGB(0,0,36),
	b_shadow2=RGB(0,0,66),
}

GradButton_Blue_Light = {
	col1=RGB(50,50,220),
	col2=RGB(10,10,120),
	highlight1=RGB(50,50,250),
	highlight2=RGB(40,40,150),
	b_highlight1=RGB(40,40,216),
	b_highlight2=RGB(50,50,250),
	b_shadow1=RGB(10,10,70),
	b_shadow2=RGB(25,25,120),
}

GradButton_Purple = {
	col2=RGB(88,27,88),
	col1=RGB(110,55,110),
	highlight1=RGB(135,65,135),
	highlight2=RGB(103,47,103),
	b_highlight1=RGB(135,65,135),
	b_highlight2=RGB(145,75,145),
	b_shadow1=RGB(41,36,41),
	b_shadow2=RGB(135,65,135),
}

GradButton_BlueStu = {
	col1=RGB(52,85,108),
	col2=RGB(109,142,165),
	highlight1=RGB(87,147,189),
	highlight2=RGB(29,89,131),
	b_highlight1=RGB(46,27,27),
	b_highlight2=RGB(46,27,27),
	b_shadow1=RGB(6,2,2),
	b_shadow2=RGB(6,2,2),
}

GradButton_DarkGreen = {
	col1=RGB(15,69,15),
	col2=RGB(14,35,14),
	highlight1=RGB(20,69,20),
	highlight2=RGB(5,15,5),
	b_highlight1=RGB(10,28,10),
	b_highlight2=RGB(27,48,27),
	b_shadow1=RGB(27,46,27),
	b_shadow2=RGB(2,6,2),
}

GradButton_GreenStu = {
	col1=RGB(38,58,37),
	col2=RGB(55,80,55),
	highlight1=RGB(32,105,35),
	highlight2=RGB(17,73,17),
	b_highlight1=RGB(27,46,27),
	b_highlight2=RGB(27,46,27),
	b_shadow1=RGB(2,6,2),
	b_shadow2=RGB(2,6,2),
}

GradButton_PurpleStu = {
	col1=RGB(58,37,58),
	col2=RGB(80,55,80),
	highlight1=RGB(105,35,105),
	highlight2=RGB(73,17,73),
	b_highlight1=RGB(46,27,46),
	b_highlight2=RGB(46,27,46),
	b_shadow1=RGB(6,2,6),
	b_shadow2=RGB(6,2,6),
}

GradButton_RedStu = {
	col1=RGB(58,38,37),
	col2=RGB(80,55,55),
	highlight1=RGB(105,32,35),
	highlight2=RGB(73,17,17),
	b_highlight1=RGB(46,27,27),
	b_highlight2=RGB(46,27,27),
	b_shadow1=RGB(6,2,2),
	b_shadow2=RGB(6,2,2),
}
--- Technologies levels
-- inside will be 1 (true), everything else will be 0 (false)
maxTechlevel = 7;
tech_levels = {
	[0] = {
		name=loc(TID_Multi_TechLevel_0),--'Stone Age',
		hint=loc(TID_Multi_TechLevel_0_Hint),
		techs={},
		buildings={},
	},

	[1] = {
		name=loc(TID_Multi_TechLevel_1),--'Welcome to the Past',
		hint=loc(TID_Multi_TechLevel_1_Hint),
		techs={tech_SolPow,tech_SolEng,tech_OilPow,tech_OilEng},
		buildings={bud_depot, bud_workshop, bud_armoury, bud_lab_basic,bud_mine_oil,bud_breast},
	},

	[2] = {
		name=loc(TID_Multi_TechLevel_2),--'The Great Hunt',
		hint=loc(TID_Multi_TechLevel_2_Hint),
		techs={tech_SolPow,tech_SolEng,tech_OilPow,tech_OilEng,tech_ApeLang,tech_ApePsych,tech_ApeAgres},
		buildings={bud_depot, bud_workshop, bud_armoury, bud_lab_basic,bud_mine_oil,bud_breast},
	},

	[3] = {
		name=loc(TID_Multi_TechLevel_3),--'Natural Born Heroes',
		hint=loc(TID_Multi_TechLevel_3_Hint),
		techs={tech_SolPow,tech_SolEng,tech_OilPow,tech_OilEng,tech_ApeLang,tech_ApePsych,tech_ApeAgres,tech_Tech1,tech_Gatling,tech_Gun,tech_SelfDest,tech_Weap1,tech_Radar},
		buildings={bud_depot, bud_workshop,bud_factory, bud_ext_track,bud_ext_gun,bud_ext_radar, bud_armoury, bud_lab_basic, bud_lab_weapon,bud_lab_optoelectronics,bud_power_solar,bud_mine_oil,bud_power_oil,bud_breast,bud_bunker},
	},

	[4] = {
		name=loc(TID_Multi_TechLevel_4),--'Pursuit of Progress',
		hint=loc(TID_Multi_TechLevel_4_Hint),
		techs={
			tech_SolPow,tech_SolEng,tech_OilPow,tech_OilEng,tech_ApeLang,tech_ApePsych,tech_ApeAgres,tech_SibDet,tech_Tech1,tech_Tech2,
			tech_Gatling,tech_Gun,tech_AdvMet,tech_Explos,tech_Bazooka,tech_Mortar,tech_SelfDest,tech_Flame,tech_Weap1,tech_Weap2,
			tech_Radar,tech_RemCont,tech_MatDet,tech_LasSight,tech_RemCharge,tech_Opto1,
			tech_MatPred,
			tech_TauField, tech_LimTeleport,
			tech_StimDrugs, tech_Bio1,
			tech_SibPow, tech_SibEng, tech_Sib1,
		},
		buildings={
			bud_depot,bud_warehouse,
			bud_workshop, bud_factory, bud_ext_track,bud_ext_gun,bud_ext_radar,bud_ext_noncombat,bud_ext_siberium, bud_ext_stitch,
			bud_armoury, bud_barracks,
			bud_lab_basic, bud_lab_weapon,bud_lab_siberium,bud_lab_computer,bud_lab_biological,bud_lab_spacetime,bud_lab_optoelectronics,
			bud_power_solar,bud_mine_oil,bud_power_oil,bud_mine_siberium,bud_power_siberium,
			bud_breast,bud_bunker,
			bud_control_tower,
		},
	},

	[5] = {
		name=loc(TID_Multi_TechLevel_5),--'Escalation',
		hint=loc(TID_Multi_TechLevel_5_Hint),
		techs={
			tech_SolPow,tech_SolEng,tech_OilPow,tech_OilEng,tech_ApeLang,tech_ApePsych,tech_ApeAgres,tech_SibDet,tech_Tech1,tech_Tech2,
			tech_Gatling,tech_Gun,tech_AdvMet,tech_Explos,tech_Bazooka,tech_Mortar,tech_Rocket,tech_SelfDest,tech_Flame,tech_Weap1,tech_Weap2,
			tech_Radar,tech_RemCont,tech_MatDet,tech_LasSight,tech_HidCam,tech_RemCharge,tech_Opto1,
			tech_AI,tech_MatPred,tech_Comp1,
			tech_TauField, tech_LimTeleport,tech_ST1,
			tech_ApeNeural,tech_ApeBrain,tech_StimDrugs, tech_Bio1,
			tech_SibPow, tech_SibEng, tech_SibDet, tech_Sib1, tech_Sib2
		},
		buildings={
			bud_depot,bud_warehouse,
			bud_workshop, bud_factory, bud_ext_track,bud_ext_gun,bud_ext_rocket,bud_ext_noncombat,bud_ext_radar,bud_ext_siberium, bud_ext_stitch,
			bud_armoury, bud_barracks,
			bud_lab_basic, bud_lab_weapon,bud_lab_siberium,bud_lab_computer,bud_lab_biological,bud_lab_spacetime,bud_lab_optoelectronics,
			bud_power_solar,bud_mine_oil,bud_power_oil,bud_mine_siberium,bud_power_siberium,
			bud_breast,bud_bunker,bud_turret,
			bud_control_tower,
		},
	},

	[6] = {
		name=loc(TID_Multi_TechLevel_6),--'Cold War',
		hint=loc(TID_Multi_TechLevel_6_Hint),
		techs={
			tech_SolPow,tech_SolEng,tech_OilPow,tech_OilEng,tech_ApeLang,tech_ApePsych,tech_ApeAgres,tech_SibDet,tech_Tech1,tech_Tech2,tech_Tech3,
			tech_Gatling,tech_Gun,tech_AdvMet,tech_Explos,tech_Bazooka,tech_Mortar,tech_Soporific,tech_Rocket,tech_SelfDest,tech_Flame,tech_AdvRocket,tech_Behemoth,tech_Weap1,tech_Weap2,
			tech_Radar,tech_RemCont,tech_MatDet,tech_LasSight,tech_Laser,tech_HidCam,tech_RemCharge,tech_Opto1,tech_Opto2,
			tech_AI,tech_AdvAI,tech_AdvChassis,tech_Virus,tech_MatPred,tech_TargTeleport,tech_Comp1,tech_Comp2,
			tech_TauRad, tech_SpacAnom, tech_TauField,tech_LimTeleport,tech_ST1, tech_ST2,
			tech_ApeNeural,tech_ApeBrain,tech_StimDrugs, tech_BioDet, tech_Bio1, tech_Bio2,
			tech_SibPow, tech_SibEng, tech_SibLoc, tech_SibContam, tech_Sib1, tech_Sib2
		},
		buildings={
			bud_depot,bud_warehouse,
			bud_workshop, bud_factory, bud_ext_track,bud_ext_gun,bud_ext_rocket,bud_ext_noncombat,bud_ext_radar,bud_ext_siberium, bud_ext_stitch,bud_ext_computer,bud_ext_laser,
			bud_armoury, bud_barracks,
			bud_lab_basic, bud_lab_weapon,bud_lab_siberium,bud_lab_computer,bud_lab_biological,bud_lab_spacetime,bud_lab_optoelectronics,
			bud_power_solar,bud_mine_oil,bud_power_oil,bud_mine_siberium,bud_power_siberium,
			bud_breast,bud_bunker,bud_turret,
			bud_control_tower,bud_teleport,bud_behemoth
		},
	},

	[7] = {
		name=loc(TID_Multi_TechLevel_7),--'Final Countdown',
		hint=loc(TID_Multi_TechLevel_7_Hint),
		techs={
			tech_SolPow,tech_SolEng,tech_OilPow,tech_OilEng,tech_ApeLang,tech_ApePsych,tech_ApeAgres,tech_SibDet,tech_Tech1,tech_Tech2,tech_Tech3,
			tech_Gatling,tech_Gun,tech_AdvMet,tech_Explos,tech_Bazooka,tech_Mortar,tech_Soporific,tech_Rocket,tech_SelfDest,tech_Flame,tech_AdvRocket,tech_Behemoth,tech_Weap1,tech_Weap2,tech_Weap3,
			tech_Radar,tech_RemCont,tech_MatDet,tech_LasSight,tech_Laser,tech_LasDouble,tech_HidCam,tech_RemCharge,tech_PartInvis, tech_Opto1,tech_Opto2,tech_Opto3,
			tech_AI,tech_AdvAI,tech_AdvChassis,tech_Virus,tech_MatPred,tech_TargTeleport,tech_Comp1,tech_Comp2,tech_Comp3,
			tech_TauRad, tech_SpacAnom, tech_TauField,tech_Lapser,tech_LimTeleport,tech_ST1, tech_ST2,tech_ST3,
			tech_ApeNeural,tech_ApeBrain,tech_StimDrugs, tech_BioDet, tech_Bio1, tech_Bio2,tech_Bio3,
			tech_SibPow, tech_SibEng, tech_SibLoc, tech_SibContam,tech_SibImpl, tech_SibFiss, tech_Sib1, tech_Sib2,tech_Sib3,
		},
		buildings={
			bud_depot,bud_warehouse,
			bud_workshop, bud_factory, bud_ext_track,bud_ext_gun,bud_ext_rocket,bud_ext_noncombat,bud_ext_radar,bud_ext_siberium, bud_ext_stitch,bud_ext_computer,bud_ext_laser,
			bud_armoury, bud_barracks,
			bud_lab_basic, bud_lab_weapon,bud_lab_siberium,bud_lab_computer,bud_lab_biological,bud_lab_spacetime,bud_lab_optoelectronics,
			bud_power_solar,bud_mine_oil,bud_power_oil,bud_mine_siberium,bud_power_siberium,
			bud_breast,bud_bunker,bud_turret,
			bud_control_tower,bud_teleport,bud_behemoth
		},
	},

};


-- Debriefings

ev_vehicle_constructed = 1;
ev_building_built = 2;
ev_vehicle_captured = 3;
ev_building_captured = 4;
ev_capture_vehicle = 5;
ev_capture_building = 6;
ev_human_killed = 7;
ev_vehicle_destroyed = 8;
ev_building_destroyed = 9;
ev_kill_human = 10;
ev_destroy_vehicle = 11;
ev_destroy_building = 12;
ev_ape_tamed = 13;
ev_technology_invented = 14;
-- currently isn't work
ev_tiger_tamed = 15;
ev_mastodon_tamed = 16;
ev_ape_killed = 17;
ev_mastodon_killed = 18;
ev_tiger_killed = 19;
ev_animal_killed = 20;
ev_kill_ape = 21;
ev_kill_mastodon = 22;
ev_kill_tiger = 23;
ev_kill_animal = 24;
ev_fortification_built = 25;
ev_fortification_captured = 26;
ev_capture_fortification = 27;
ev_fortification_destroyed = 28;
ev_destroy_fortification =29;


evGroups = {
	created = {
		[ev_vehicle_constructed] = true,
		[ev_building_built] = true,
		[ev_fortification_built] = true,
	},
	createdBul = {
		[ev_building_built] = true,
		[ev_fortification_built] = true,
	},
	createdVeh = {
		[ev_vehicle_constructed] = true,
	},
	tamed = {
		[ev_ape_tamed] = true,
		[ev_tiger_tamed] = true,
		[ev_mastodon_tamed] = true,
	},
	capture = {
		[ev_capture_vehicle] = true,
		[ev_capture_building] = true,
		[ev_capture_fortification] = true,
	},
	captureBul = {
		[ev_capture_building] = true,
		[ev_capture_fortification] = true,
	},
	captureVeh = {
		[ev_capture_vehicle] = true,
	},
	destroyed = {
		[ev_kill_human] = true,
		[ev_destroy_vehicle] = true,
		[ev_destroy_building] = true,
		[ev_kill_ape] = true,
		[ev_kill_mastodon] = true,
		[ev_kill_tiger] = true,
		[ev_kill_animal] = true,
		[ev_destroy_fortification] = true,
	},
	killed = {
		[ev_kill_human] = true,
		[ev_kill_ape] = true,
		[ev_kill_tiger] = true,
		[ev_kill_animal] = true,
	},
	desVeh = {
		[ev_destroy_vehicle] = true,
		[ev_kill_mastodon] = true,
	},
	desBuil = {
		[ev_destroy_building] = true,
		[ev_destroy_fortification] = true,
	},
	lost = {
		[ev_human_killed] = true,
		[ev_vehicle_destroyed] = true,
		[ev_building_destroyed] = true,
		[ev_ape_killed] = true,
		[ev_mastodon_killed] = true,
		[ev_tiger_killed] = true,
		[ev_animal_killed] = true,
		[ev_fortification_destroyed] = true,
	},
	lostHumans = {
		[ev_human_killed] = true,
		[ev_ape_killed] = true,
		[ev_tiger_killed] = true,
		[ev_animal_killed] = true,
	},
	lostVeh = {
		[ev_vehicle_destroyed] = true,
		[ev_mastodon_killed] = true,
	},
	lostBuil = {
		[ev_building_destroyed] = true,
		[ev_fortification_destroyed] = true,
	},
	captured = {
		[ev_vehicle_captured] = true,
		[ev_building_captured] = true,
		[ev_fortification_captured] = true,
	},
	capturedVeh = {
		[ev_vehicle_captured] = true,
	},
	capturedBuil = {
		[ev_building_captured] = true,
		[ev_fortification_captured] = true,
	},
	technologies = {
		[ev_technology_invented] = true,
	},
};

evHints = {
	[ev_ape_tamed] = loc(TID_Debrief_Tamed),
	[ev_vehicle_constructed] = loc(TID_Debrief_Constructed),
	[ev_building_built] = loc(TID_Debrief_Built),
	[ev_technology_invented] = loc(TID_Debrief_Invented),
	[ev_capture_vehicle] = loc(TID_Debrief_Captured),
	[ev_capture_building] = loc(TID_Debrief_Captured),
	[ev_kill_human] = loc(TID_Debrief_Killed),
	[ev_destroy_vehicle] = loc(TID_Debrief_Destroyed),
	[ev_destroy_building] = loc(TID_Debrief_Destroyed),
	[ev_human_killed] = loc(TID_Debrief_Killed),
	[ev_vehicle_destroyed] = loc(TID_Debrief_Destroyed),
	[ev_building_destroyed] = loc(TID_Debrief_Destroyed),
	[ev_vehicle_captured] = loc(TID_Debrief_Captured),
	[ev_building_captured] = loc(TID_Debrief_Captured),

	[ev_tiger_tamed] = loc(TID_Debrief_Tamed),
	[ev_mastodon_tamed] = loc(TID_Debrief_Tamed),
	[ev_ape_killed] = loc(TID_Debrief_Killed),
	[ev_mastodon_killed] = loc(TID_Debrief_Killed),
	[ev_tiger_killed] = loc(TID_Debrief_Killed),
	[ev_animal_killed] = loc(TID_Debrief_Killed),
	[ev_kill_ape] = loc(TID_Debrief_Killed),
	[ev_kill_mastodon] = loc(TID_Debrief_Killed),
	[ev_kill_tiger] = loc(TID_Debrief_Killed),
	[ev_kill_animal] = loc(TID_Debrief_Killed),
	[ev_fortification_built] = loc(TID_Debrief_Built),
	[ev_fortification_captured] = loc(TID_Debrief_Captured),
	[ev_capture_fortification] = loc(TID_Debrief_Captured),
	[ev_fortification_destroyed] = loc(TID_Debrief_Destroyed),
	[ev_destroy_fortification] = loc(TID_Debrief_Destroyed),
};

evIcons = {
	[ev_ape_tamed] = SUBCOORD(0,0,11,12),
	[ev_vehicle_constructed] = SUBCOORD(0,27,14,11),
	[ev_building_built] = SUBCOORD(0,39,11,12),
	[ev_technology_invented] = SUBCOORD(0,52,10,12),
	[ev_capture_vehicle] = SUBCOORD(0,27,14,11),
	[ev_capture_building] = SUBCOORD(0,39,11,12),
	[ev_kill_human] = SUBCOORD(0,13,6,13),
	[ev_destroy_vehicle] = SUBCOORD(0,27,14,11),
	[ev_destroy_building] = SUBCOORD(0,39,11,12),
	[ev_human_killed] = SUBCOORD(0,13,6,13),
	[ev_vehicle_destroyed] = SUBCOORD(0,27,14,11),
	[ev_building_destroyed] = SUBCOORD(0,39,11,12),
	[ev_vehicle_captured] = SUBCOORD(0,27,14,11),
	[ev_building_captured] = SUBCOORD(0,39,11,12),

	[ev_tiger_tamed] = SUBCOORD(0,65,14,11),
	[ev_mastodon_tamed] = SUBCOORD(0,77,14,14),
	[ev_ape_killed] = SUBCOORD(0,0,11,12),
	[ev_mastodon_killed] = SUBCOORD(0,77,14,14),
	[ev_tiger_killed] = SUBCOORD(0,65,14,11),
	[ev_animal_killed] = SUBCOORD(0,92,12,12),
	[ev_kill_ape] = SUBCOORD(0,0,11,12),
	[ev_kill_mastodon] = SUBCOORD(0,77,14,14),
	[ev_kill_tiger] = SUBCOORD(0,65,14,11),
	[ev_kill_animal] = SUBCOORD(0,92,12,12),
	[ev_fortification_built] = SUBCOORD(0,0,11,12),
	[ev_fortification_captured] = SUBCOORD(0,105,13,11),
	[ev_capture_fortification] = SUBCOORD(0,105,13,11),
	[ev_fortification_destroyed] = SUBCOORD(0,105,13,11),
	[ev_destroy_fortification] = SUBCOORD(0,105,13,11),

};


---------------------------------------------  Shortcuts ----------------------
listOfShorcutsText = {
	Commands = {
		TID_ui_comm_bt_hint_Move,
		TID_ui_comm_bt_hint_Attack,
		TID_ui_comm_bt_hint_Hold,
		TID_ui_comm_bt_hint_Free,
		TID_ui_comm_bt_hint_StandGround,
		TID_ui_comm_bt_hint_AttackGround,
		TID_ui_comm_bt_hint_MakeInvisible,
		TID_ui_comm_bt_hint_Walk,
		TID_ui_comm_bt_hint_Crawl,
		TID_ui_comm_bt_hint_PlaceDelayedCharge,
		TID_ui_comm_bt_hint_PlaceExp,
		TID_ui_comm_bt_hint_FireExp,
		TID_ui_comm_bt_hint_SleepOn,
--		TID_ui_comm_bt_hint_SleepOff,
		TID_ui_comm_bt_hint_SpaceOn,
		TID_ui_comm_bt_hint_TimeOn,
--		TID_ui_comm_bt_hint_NormalOn,
		TID_ui_comm_bt_hint_SabreOn,
		TID_ui_comm_bt_hint_CarabineOn,
		TID_ui_comm_bt_hint_TameAr,
		TID_ui_comm_bt_hint_RepairVehicle,
		TID_ui_comm_bt_hint_Transport,
		TID_ui_comm_bt_hint_DismantleBuilding,
		TID_ui_comm_bt_hint_PlaceHiddenCamera,
		TID_ui_comm_bt_hint_Heal,
		TID_ui_comm_bt_hint_Tame,
		TID_ui_comm_bt_hint_Contaminate,
		TID_ui_comm_bt_hint_Infect,
		TID_ui_comm_bt_hint_PlaceTeleportExit,
		TID_ui_comm_bt_hint_ExitVehicle,
		TID_ui_comm_bt_hint_LinkToCT,
		TID_ui_comm_bt_hint_Unlink,
		TID_ui_comm_bt_hint_Maintenance,
		TID_ui_comm_bt_hint_SelfDestruction,
		TID_ui_comm_bt_hint_RecycleVehicle,
		TID_ui_comm_bt_hint_CraneRepairBuilding,
		TID_ui_comm_bt_hint_VehTransport,
		TID_ui_comm_bt_hint_CargoUnload,
		TID_ui_comm_bt_hint_CargoUnload2,
--		TID_ui_comm_bt_hint_TimeLapserOn,
--		TID_ui_comm_bt_hint_TimeLapserOff,
--		TID_ui_comm_bt_hint_DoubleLaserOn,
--		TID_ui_comm_bt_hint_DoubleLaserOff,
		TID_ui_comm_bt_hint_ExitBuilding,
		TID_ui_comm_bt_hint_EverybodyExit,
		TID_ui_comm_bt_hint_CP_Scientist,
		TID_ui_comm_bt_hint_CP_Mechanic,
		TID_ui_comm_bt_hint_CP_Engineer,
		TID_ui_comm_bt_hint_DepotTransport,
		TID_ui_comm_bt_hint_CP_Soldier,
		TID_ui_comm_bt_hint_CP_AmericanSniper,
		TID_ui_comm_bt_hint_CP_RussianBazooker,
		TID_ui_comm_bt_hint_CP_ArabianMortarer,
		TID_ui_comm_bt_hint_CP_Kamikaze,
		TID_ui_comm_bt_hint_FortStop,
		TID_ui_comm_bt_hint_CT_Link,
		TID_ui_comm_bt_hint_CT_Unlink,
		TID_ui_comm_bt_hint_TransportCans,
		TID_ui_comm_bt_hint_TransportOil,
		TID_ui_comm_bt_hint_TransportSib,
		TID_ui_comm_bt_hint_Transport1,
		TID_ui_comm_bt_hint_Transport2,
		TID_ui_comm_bt_hint_PutDown,
		TID_ui_comm_bt_hint_TransportStop,
		TID_ui_comm_bt_hint_PlaceTeleportExit2,
		TID_ui_comm_bt_hint_AttackPrior,
		TID_ui_comm_bt_hint_AttackNo,
		TID_ui_comm_bt_hint_Stop,
		TID_ui_comm_bt_hint_IconGroupCancel,
		TID_ui_comm_bt_hint_IconGroupCancel2,
		TID_ui_comm_bt_hint_ActionCancel,
		TID_ui_comm_bt_hint_ActionPause,
		TID_ui_comm_bt_hint_ActionResume,
		TID_ui_comm_bt_hint_Patrol,
		TID_ui_comm_bt_hint_Patrol2,
		TID_ui_comm_bt_hint_Bury

	},

	Buildings = {
		TID_ui_comm_bt_hint_BuildBehemoth,
		TID_ui_comm_bt_hint_Build,
		TID_ui_comm_bt_hint_B_Depot,
		TID_ui_comm_bt_hint_B_WorkShop,
		TID_ui_comm_bt_hint_B_Armoury,
		TID_ui_comm_bt_hint_B_BasicLab,
		TID_ui_comm_bt_hint_BuildResources,
		TID_ui_comm_bt_hint_B_PowerPlantSolar,
		TID_ui_comm_bt_hint_B_PowerPlantOil,
		TID_ui_comm_bt_hint_B_PowerPlantSiberium,
		TID_ui_comm_bt_hint_B_OilDrillingTower,
		TID_ui_comm_bt_hint_B_SiberiumMine,
		TID_ui_comm_bt_hint_BuildFortification,
		TID_ui_comm_bt_hint_B_BWorks,
		TID_ui_comm_bt_hint_B_Bunker,
		TID_ui_comm_bt_hint_B_Turret,
		TID_ui_comm_bt_hint_FactoryAddExtension,
		TID_ui_comm_bt_hint_FE_Track,
		TID_ui_comm_bt_hint_FE_Gun,
		TID_ui_comm_bt_hint_FE_Rocket,
		TID_ui_comm_bt_hint_FE_NonCombat,
		TID_ui_comm_bt_hint_FE_Radar,
		TID_ui_comm_bt_hint_FE_Siberium,
		TID_ui_comm_bt_hint_FE_Stitching,
		TID_ui_comm_bt_hint_FE_Computer,
		TID_ui_comm_bt_hint_FE_Radio,
		TID_ui_comm_bt_hint_FE_Laser,
--		TID_ui_comm_bt_hint_FactoryAddExtension2,
--		TID_ui_comm_bt_hint_FE_Solar2,
--		TID_ui_comm_bt_hint_FE_Computer2,
--		TID_ui_comm_bt_hint_FE_Radio2,
--		TID_ui_comm_bt_hint_FE_Laser2,
		TID_ui_comm_bt_hint_B_RemoteCT,
		TID_ui_comm_bt_hint_B_Teleport,
		TID_ui_comm_bt_hint_RepairBuilding,
		TID_ui_comm_bt_hint_VehBuild,
		TID_ui_comm_bt_hint_UpgradeBuilding,
		TID_ui_comm_bt_hint_ConstructVehicle,
		TID_ui_comm_bt_hint_UpgradeArmory,
		TID_ui_comm_bt_hint_LinkToBase,
		TID_ui_comm_bt_hint_PlaceWeapon,
		TID_ui_comm_bt_hint_PlaceWeapon2,
		TID_ui_comm_bt_hint_ReplaceWeapon,
		TID_ui_comm_bt_hint_CancelPlaceWeapon,
		TID_ui_comm_bt_hint_RebuildToBunker,
		TID_ui_comm_bt_hint_RebuildToTurret,

	},

	Research = {

		TID_ui_comm_bt_hint_UpgradeLab1,
		TID_ui_comm_bt_hint_UpgradeLab2,
		TID_ui_comm_bt_hint_LabWeapon,
		TID_ui_comm_bt_hint_LabSiberium,
		TID_ui_comm_bt_hint_LabComputer,
		TID_ui_comm_bt_hint_LabBio,
		TID_ui_comm_bt_hint_LabSpace,
		TID_ui_comm_bt_hint_LabOpto,
		TID_ui_comm_bt_hint_LabBasicResearch,
		TID_ui_comm_bt_hint_LR_OilPow,
		TID_ui_comm_bt_hint_LR_OilEng,
		TID_ui_comm_bt_hint_LR_SibDet,
		TID_ui_comm_bt_hint_LR_ApeLang,
		TID_ui_comm_bt_hint_LR_SolPow,
		TID_ui_comm_bt_hint_LR_SolEng,
		TID_ui_comm_bt_hint_LR_ApePsych,
		TID_ui_comm_bt_hint_LR_ApeAgres,
		TID_ui_comm_bt_hint_LR_Tech1,
		TID_ui_comm_bt_hint_LR_Tech2,
		TID_ui_comm_bt_hint_LR_Tech3,
		TID_ui_comm_bt_hint_BioResearch1,
		TID_ui_comm_bt_hint_BioResearch2,
		TID_ui_comm_bt_hint_LR_ApeNeural,
		TID_ui_comm_bt_hint_LR_ApeBrain,
		TID_ui_comm_bt_hint_LR_StimDrugs,
		TID_ui_comm_bt_hint_LR_BioDet,
		TID_ui_comm_bt_hint_LR_Bio1,
		TID_ui_comm_bt_hint_LR_Bio2,
		TID_ui_comm_bt_hint_LR_Bio3,
		TID_ui_comm_bt_hint_CompResearch1,
		TID_ui_comm_bt_hint_CompResearch2,
		TID_ui_comm_bt_hint_LR_AI,
		TID_ui_comm_bt_hint_LR_AdvAI,
		TID_ui_comm_bt_hint_LR_AdvChassis,
		TID_ui_comm_bt_hint_LR_Virus,
		TID_ui_comm_bt_hint_LR_MatPred,
		TID_ui_comm_bt_hint_LR_TargTeleport,
		TID_ui_comm_bt_hint_LR_Comp1,
		TID_ui_comm_bt_hint_LR_Comp2,
		TID_ui_comm_bt_hint_LR_Comp3,
		TID_ui_comm_bt_hint_OptoResearch1,
		TID_ui_comm_bt_hint_OptoResearch2,
		TID_ui_comm_bt_hint_LR_Radar,
		TID_ui_comm_bt_hint_LR_RemCont,
		TID_ui_comm_bt_hint_LR_MatDet,
		TID_ui_comm_bt_hint_LR_LasSight,
		TID_ui_comm_bt_hint_LR_Laser,
		TID_ui_comm_bt_hint_LR_LasDouble,
		TID_ui_comm_bt_hint_LR_RemCharge,
		TID_ui_comm_bt_hint_LR_PartInvis,
		TID_ui_comm_bt_hint_LR_HidCam,
		TID_ui_comm_bt_hint_LR_Opto1,
		TID_ui_comm_bt_hint_LR_Opto2,
		TID_ui_comm_bt_hint_LR_Opto3,
		TID_ui_comm_bt_hint_SibResearch1,
		TID_ui_comm_bt_hint_SibResearch2,
		TID_ui_comm_bt_hint_LR_SibPow,
		TID_ui_comm_bt_hint_LR_SibEng,
		TID_ui_comm_bt_hint_LR_Artifact,
		TID_ui_comm_bt_hint_LR_SibLoc,
		TID_ui_comm_bt_hint_LR_SibFiss,
		TID_ui_comm_bt_hint_LR_SibContam,
		TID_ui_comm_bt_hint_LR_SibImpl,
		TID_ui_comm_bt_hint_LR_Sib1,
		TID_ui_comm_bt_hint_LR_Sib2,
		TID_ui_comm_bt_hint_LR_Sib3,
		TID_ui_comm_bt_hint_TimeResearch1,
		TID_ui_comm_bt_hint_TimeResearch2,
		TID_ui_comm_bt_hint_LR_TauRad,
		TID_ui_comm_bt_hint_LR_SpacAnom,
		TID_ui_comm_bt_hint_LR_TauField,
		TID_ui_comm_bt_hint_LR_Lapser,
		TID_ui_comm_bt_hint_LR_LimTeleport,
		TID_ui_comm_bt_hint_LR_ST1,
		TID_ui_comm_bt_hint_LR_ST2,
		TID_ui_comm_bt_hint_LR_ST3,
		TID_ui_comm_bt_hint_WeaponResearch1,
		TID_ui_comm_bt_hint_WeaponResearch2,
		TID_ui_comm_bt_hint_LR_Gatling,
		TID_ui_comm_bt_hint_LR_Gun,
		TID_ui_comm_bt_hint_LR_Rocket,
		TID_ui_comm_bt_hint_LR_AdvRocket,
		TID_ui_comm_bt_hint_LR_AdvMet,
		TID_ui_comm_bt_hint_LR_Soporific,
		TID_ui_comm_bt_hint_LR_Bazooka,
		TID_ui_comm_bt_hint_LR_Behemoth,
		TID_ui_comm_bt_hint_LR_Explos,
		TID_ui_comm_bt_hint_LR_Mortar,
		TID_ui_comm_bt_hint_LR_SelfDest,
		TID_ui_comm_bt_hint_LR_Flame,
		TID_ui_comm_bt_hint_LR_Weap1,
		TID_ui_comm_bt_hint_LR_Weap2,
		TID_ui_comm_bt_hint_LR_Weap3,
		TID_ui_comm_bt_hint_UseArtefact1,
		TID_ui_comm_bt_hint_UseArtefact2,
		TID_ui_comm_bt_hint_UseArtefact3,
		TID_ui_comm_bt_hint_UseArtefact4,
		TID_ui_comm_bt_hint_UseArtefact5,
		TID_ui_comm_bt_hint_UseArtefact6,
		TID_ui_comm_bt_hint_UseArtefact7,
		TID_ui_comm_bt_hint_UseArtefact8,
		TID_ui_comm_bt_hint_UseArtefact9,
		TID_ui_comm_bt_hint_UseArtefact10,
		TID_ui_comm_bt_hint_UseArtefact11,
		TID_ui_comm_bt_hint_UseArtefact12,
		TID_ui_comm_bt_hint_UseArtefact13,
		TID_ui_comm_bt_hint_UseArtefact14,
		TID_ui_comm_bt_hint_UseArtefact15,

	},

};

GridOfShortcuts = {
		[TID_ui_comm_bt_hint_Move] = "Q",
		[TID_ui_comm_bt_hint_Attack] = "W",
		[TID_ui_comm_bt_hint_Hold] = "E",
		[TID_ui_comm_bt_hint_Free] = "R",
		[TID_ui_comm_bt_hint_StandGround] = "E",
		[TID_ui_comm_bt_hint_AttackGround] = "S",
		[TID_ui_comm_bt_hint_MakeInvisible] = "X",
		[TID_ui_comm_bt_hint_Walk] = "A",
		[TID_ui_comm_bt_hint_Crawl] = "Z",
		[TID_ui_comm_bt_hint_PlaceDelayedCharge] = "S",
		[TID_ui_comm_bt_hint_PlaceExp] = "D",
		[TID_ui_comm_bt_hint_FireExp] = "D",
		[TID_ui_comm_bt_hint_SleepOn] = "A",
--		[TID_ui_comm_bt_hint_SleepOff] = "A",
		[TID_ui_comm_bt_hint_SpaceOn] = "A",
		[TID_ui_comm_bt_hint_TimeOn] = "D",
--		[TID_ui_comm_bt_hint_NormalOn,
		[TID_ui_comm_bt_hint_SabreOn] = "A",
		[TID_ui_comm_bt_hint_CarabineOn] = "A",
		[TID_ui_comm_bt_hint_TameAr] = "S",
		[TID_ui_comm_bt_hint_RepairVehicle] = "A",
		[TID_ui_comm_bt_hint_BuildBehemoth] = "S",
		[TID_ui_comm_bt_hint_Build] = "F",
		[TID_ui_comm_bt_hint_B_Depot] = "Q",
		[TID_ui_comm_bt_hint_B_WorkShop] = "W",
		[TID_ui_comm_bt_hint_B_Armoury] = "E",
		[TID_ui_comm_bt_hint_B_BasicLab] = "A",
		[TID_ui_comm_bt_hint_BuildResources] = "S",
		[TID_ui_comm_bt_hint_B_PowerPlantSolar] = "A",
		[TID_ui_comm_bt_hint_B_PowerPlantOil] = "S",
		[TID_ui_comm_bt_hint_B_PowerPlantSiberium] = "D",
		[TID_ui_comm_bt_hint_B_OilDrillingTower] = "W",
		[TID_ui_comm_bt_hint_B_SiberiumMine] = "E",
		[TID_ui_comm_bt_hint_BuildFortification] = "D",
		[TID_ui_comm_bt_hint_B_BWorks] = "Q",
		[TID_ui_comm_bt_hint_B_Bunker] = "W",
		[TID_ui_comm_bt_hint_B_Turret] = "E",
		[TID_ui_comm_bt_hint_FactoryAddExtension] = "Z",
		[TID_ui_comm_bt_hint_FE_Track] = "Q",
		[TID_ui_comm_bt_hint_FE_Gun] = "W",
		[TID_ui_comm_bt_hint_FE_Rocket] = "E",
		[TID_ui_comm_bt_hint_FE_NonCombat] = "A",
		[TID_ui_comm_bt_hint_FE_Radar] = "S",
		[TID_ui_comm_bt_hint_FE_Siberium] = "D",
		[TID_ui_comm_bt_hint_FE_Stitching] = "Z",
		[TID_ui_comm_bt_hint_FE_Computer] = "Z",
		[TID_ui_comm_bt_hint_FE_Radio] = "S",
		[TID_ui_comm_bt_hint_FE_Laser] = "X",
--		[TID_ui_comm_bt_hint_FactoryAddExtension2] = "",
--		[TID_ui_comm_bt_hint_FE_Solar2] = "",
--		[TID_ui_comm_bt_hint_FE_Computer2] = "",
--		[TID_ui_comm_bt_hint_FE_Radio2] = "",
--		[TID_ui_comm_bt_hint_FE_Laser2] = "",
		[TID_ui_comm_bt_hint_B_RemoteCT] = "X",
		[TID_ui_comm_bt_hint_B_Teleport] = "X",
		[TID_ui_comm_bt_hint_RepairBuilding] = "S",
		[TID_ui_comm_bt_hint_Transport] = "D",
		[TID_ui_comm_bt_hint_DismantleBuilding] = "Z",
		[TID_ui_comm_bt_hint_PlaceHiddenCamera] = "X",
		[TID_ui_comm_bt_hint_Heal] = "A",
		[TID_ui_comm_bt_hint_Tame] = "S",
		[TID_ui_comm_bt_hint_Contaminate] = "D",
		[TID_ui_comm_bt_hint_Infect] = "D",
		[TID_ui_comm_bt_hint_PlaceTeleportExit] = "Z",
		[TID_ui_comm_bt_hint_ExitVehicle] = "A",
		[TID_ui_comm_bt_hint_LinkToCT] = "A",
		[TID_ui_comm_bt_hint_Unlink] = "A",
		[TID_ui_comm_bt_hint_Maintenance] = "D",
		[TID_ui_comm_bt_hint_SelfDestruction] = "Z",
		[TID_ui_comm_bt_hint_RecycleVehicle] = "X",
		[TID_ui_comm_bt_hint_VehBuild] = "S",
		[TID_ui_comm_bt_hint_CraneRepairBuilding] = "W",
		[TID_ui_comm_bt_hint_VehTransport] = "S",
		[TID_ui_comm_bt_hint_CargoUnload] = "S",
		[TID_ui_comm_bt_hint_CargoUnload2] = "S",
--		[TID_ui_comm_bt_hint_TimeLapserOn] = "",
--		[TID_ui_comm_bt_hint_TimeLapserOff] = "",
--		[TID_ui_comm_bt_hint_DoubleLaserOn] = "",
--		[TID_ui_comm_bt_hint_DoubleLaserOff] = "",
		[TID_ui_comm_bt_hint_ExitBuilding] = "Q",
		[TID_ui_comm_bt_hint_EverybodyExit] = "Q",
		[TID_ui_comm_bt_hint_UpgradeBuilding] = "W",
		[TID_ui_comm_bt_hint_CP_Scientist] = "E",
		[TID_ui_comm_bt_hint_UpgradeLab1] = "S",
		[TID_ui_comm_bt_hint_UpgradeLab2] = "D",
		[TID_ui_comm_bt_hint_LabWeapon] = "Q",
		[TID_ui_comm_bt_hint_LabSiberium] = "W",
		[TID_ui_comm_bt_hint_LabComputer] = "E",
		[TID_ui_comm_bt_hint_LabBio] = "A",
		[TID_ui_comm_bt_hint_LabSpace] = "S",
		[TID_ui_comm_bt_hint_LabOpto] = "D",
		[TID_ui_comm_bt_hint_LabBasicResearch] = "A",
		[TID_ui_comm_bt_hint_LR_OilPow] = "Q",
		[TID_ui_comm_bt_hint_LR_OilEng] = "W",
		[TID_ui_comm_bt_hint_LR_SibDet] = "Z",
		[TID_ui_comm_bt_hint_LR_ApeLang] = "E",
		[TID_ui_comm_bt_hint_LR_SolPow] = "A",
		[TID_ui_comm_bt_hint_LR_SolEng] = "S",
		[TID_ui_comm_bt_hint_LR_ApePsych] = "D",
		[TID_ui_comm_bt_hint_LR_ApeAgres] = "F",
		[TID_ui_comm_bt_hint_LR_Tech1] = "X",
		[TID_ui_comm_bt_hint_LR_Tech2] = "X",
		[TID_ui_comm_bt_hint_LR_Tech3] = "X",
		[TID_ui_comm_bt_hint_BioResearch1] = "S",
		[TID_ui_comm_bt_hint_BioResearch2] = "D",
		[TID_ui_comm_bt_hint_LR_ApeNeural] = "Q",
		[TID_ui_comm_bt_hint_LR_ApeBrain] = "W",
		[TID_ui_comm_bt_hint_LR_StimDrugs] = "E",
		[TID_ui_comm_bt_hint_LR_BioDet] = "A",
		[TID_ui_comm_bt_hint_LR_Bio1] = "X",
		[TID_ui_comm_bt_hint_LR_Bio2] = "X",
		[TID_ui_comm_bt_hint_LR_Bio3] = "X",
		[TID_ui_comm_bt_hint_CompResearch1] = "D",
		[TID_ui_comm_bt_hint_CompResearch2] = "F",
		[TID_ui_comm_bt_hint_LR_AI] = "Q",
		[TID_ui_comm_bt_hint_LR_AdvAI] = "W",
		[TID_ui_comm_bt_hint_LR_AdvChassis] = "E",
		[TID_ui_comm_bt_hint_LR_Virus] = "E",
		[TID_ui_comm_bt_hint_LR_MatPred] = "A",
		[TID_ui_comm_bt_hint_LR_TargTeleport] = "S",
		[TID_ui_comm_bt_hint_LR_Comp1] = "X",
		[TID_ui_comm_bt_hint_LR_Comp2] = "X",
		[TID_ui_comm_bt_hint_LR_Comp3] = "X",
		[TID_ui_comm_bt_hint_OptoResearch1] = "S",
		[TID_ui_comm_bt_hint_OptoResearch2] = "D",
		[TID_ui_comm_bt_hint_LR_Radar] = "Q",
		[TID_ui_comm_bt_hint_LR_RemCont] = "W",
		[TID_ui_comm_bt_hint_LR_MatDet] = "E",
		[TID_ui_comm_bt_hint_LR_LasSight] = "A",
		[TID_ui_comm_bt_hint_LR_Laser] = "S",
		[TID_ui_comm_bt_hint_LR_LasDouble] = "D",
		[TID_ui_comm_bt_hint_LR_RemCharge] = "A",
		[TID_ui_comm_bt_hint_LR_PartInvis] = "Z",
		[TID_ui_comm_bt_hint_LR_HidCam] = "S",
		[TID_ui_comm_bt_hint_LR_Opto1] = "X",
		[TID_ui_comm_bt_hint_LR_Opto2] = "X",
		[TID_ui_comm_bt_hint_LR_Opto3] = "X",
		[TID_ui_comm_bt_hint_SibResearch1] = "S",
		[TID_ui_comm_bt_hint_SibResearch2] = "D",
		[TID_ui_comm_bt_hint_LR_SibPow] = "Q",
		[TID_ui_comm_bt_hint_LR_SibEng] = "W",
		[TID_ui_comm_bt_hint_LR_Artifact] = "E",
		[TID_ui_comm_bt_hint_LR_SibLoc] = "S",
		[TID_ui_comm_bt_hint_LR_SibFiss] = "A",
		[TID_ui_comm_bt_hint_LR_SibContam] = "D",
		[TID_ui_comm_bt_hint_LR_SibImpl] = "S",
		[TID_ui_comm_bt_hint_LR_Sib1] = "X",
		[TID_ui_comm_bt_hint_LR_Sib2] = "X",
		[TID_ui_comm_bt_hint_LR_Sib3] = "X",
		[TID_ui_comm_bt_hint_TimeResearch1] = "S",
		[TID_ui_comm_bt_hint_TimeResearch2] = "D",
		[TID_ui_comm_bt_hint_LR_TauRad] = "Q",
		[TID_ui_comm_bt_hint_LR_SpacAnom] = "W",
		[TID_ui_comm_bt_hint_LR_TauField] = "E",
		[TID_ui_comm_bt_hint_LR_Lapser] = "A",
		[TID_ui_comm_bt_hint_LR_LimTeleport] = "S",
		[TID_ui_comm_bt_hint_LR_ST1] = "X",
		[TID_ui_comm_bt_hint_LR_ST2] = "X",
		[TID_ui_comm_bt_hint_LR_ST3] = "X",
		[TID_ui_comm_bt_hint_WeaponResearch1] = "S",
		[TID_ui_comm_bt_hint_WeaponResearch2] = "D",
		[TID_ui_comm_bt_hint_LR_Gatling] = "Q",
		[TID_ui_comm_bt_hint_LR_Gun] = "W",
		[TID_ui_comm_bt_hint_LR_Rocket] = "S",
		[TID_ui_comm_bt_hint_LR_AdvRocket] = "D",
		[TID_ui_comm_bt_hint_LR_AdvMet] = "E",
		[TID_ui_comm_bt_hint_LR_Soporific] = "A",
		[TID_ui_comm_bt_hint_LR_Bazooka] = "A",
		[TID_ui_comm_bt_hint_LR_Behemoth] = "Z",
		[TID_ui_comm_bt_hint_LR_Explos] = "E",
		[TID_ui_comm_bt_hint_LR_Mortar] = "A",
		[TID_ui_comm_bt_hint_LR_SelfDest] = "D",
		[TID_ui_comm_bt_hint_LR_Flame] = "Z",
		[TID_ui_comm_bt_hint_LR_Weap1] = "X",
		[TID_ui_comm_bt_hint_LR_Weap2] = "X",
		[TID_ui_comm_bt_hint_LR_Weap3] = "X",
		[TID_ui_comm_bt_hint_CP_Mechanic] = "A",
		[TID_ui_comm_bt_hint_ConstructVehicle] = "E",
		[TID_ui_comm_bt_hint_CP_Engineer] = "Z",
		[TID_ui_comm_bt_hint_DepotTransport] = "D",
		[TID_ui_comm_bt_hint_UpgradeArmory] = "E",
		[TID_ui_comm_bt_hint_LinkToBase] = "A",
		[TID_ui_comm_bt_hint_CP_Soldier] = "Z",
		[TID_ui_comm_bt_hint_CP_AmericanSniper] = "X",
		[TID_ui_comm_bt_hint_CP_RussianBazooker] = "X",
		[TID_ui_comm_bt_hint_CP_ArabianMortarer] = "X",
		[TID_ui_comm_bt_hint_CP_Kamikaze] = "X",
		[TID_ui_comm_bt_hint_PlaceWeapon] = "E",
		[TID_ui_comm_bt_hint_PlaceWeapon2] = "E",
		[TID_ui_comm_bt_hint_ReplaceWeapon] = "E",
		[TID_ui_comm_bt_hint_CancelPlaceWeapon] = "C",
		[TID_ui_comm_bt_hint_RebuildToBunker] = "Z",
		[TID_ui_comm_bt_hint_RebuildToTurret] = "X",
		[TID_ui_comm_bt_hint_FortStop] = "S",
		[TID_ui_comm_bt_hint_CT_Link] = "S",
		[TID_ui_comm_bt_hint_CT_Unlink] = "D",
		[TID_ui_comm_bt_hint_TransportCans] = "Q",
		[TID_ui_comm_bt_hint_TransportOil] = "W",
		[TID_ui_comm_bt_hint_TransportSib] = "E",
		[TID_ui_comm_bt_hint_Transport1] = "A",
		[TID_ui_comm_bt_hint_Transport2] = "A",
		[TID_ui_comm_bt_hint_PutDown] = "D",
		[TID_ui_comm_bt_hint_TransportStop] = "C",
		[TID_ui_comm_bt_hint_PlaceTeleportExit2] = "D",
		[TID_ui_comm_bt_hint_UseArtefact1] = "Z",
		[TID_ui_comm_bt_hint_UseArtefact2] = "X",
		[TID_ui_comm_bt_hint_UseArtefact3] = "C",
		[TID_ui_comm_bt_hint_UseArtefact4] = "E",
		[TID_ui_comm_bt_hint_UseArtefact5] = "V",
		[TID_ui_comm_bt_hint_UseArtefact6] = "B",
		[TID_ui_comm_bt_hint_UseArtefact7] = "N",
		[TID_ui_comm_bt_hint_UseArtefact8] = "M",
		[TID_ui_comm_bt_hint_UseArtefact9] = "F",
		[TID_ui_comm_bt_hint_UseArtefact10] = "G",
		[TID_ui_comm_bt_hint_UseArtefact11] = "H",
		[TID_ui_comm_bt_hint_UseArtefact12] = "R",
		[TID_ui_comm_bt_hint_UseArtefact13] = "T",
		[TID_ui_comm_bt_hint_UseArtefact14] = "Y",
		[TID_ui_comm_bt_hint_UseArtefact15] = "U",
		[TID_ui_comm_bt_hint_AttackPrior] = "Q",
		[TID_ui_comm_bt_hint_AttackNo] = "W",
		[TID_ui_comm_bt_hint_Stop] = "C",
		[TID_ui_comm_bt_hint_IconGroupCancel] = "C",
		[TID_ui_comm_bt_hint_IconGroupCancel2] = "C",
		[TID_ui_comm_bt_hint_ActionCancel] = "D",
		[TID_ui_comm_bt_hint_ActionPause] = "S",
		[TID_ui_comm_bt_hint_ActionResume] = "S",
		[TID_ui_comm_bt_hint_Patrol] = "C",
		[TID_ui_comm_bt_hint_Patrol2] = "C",
		[TID_ui_comm_bt_hint_Bury] = "S"
};


--[[
	KEY ID's

	Note: All keys need to be converted from Hex to Decimal

	https://docs.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
	https://www.rapidtables.com/convert/number/hex-to-decimal.html
--]]

VK_RETURN     = 13;
VK_SHIFT      = 16;
VK_CTRL       = 17;
VK_ESC        = 27;
VK_SPACE      = 32;
VK_CTRL_LEFT  = 162;
VK_CTRL_RIGHT = 163;

