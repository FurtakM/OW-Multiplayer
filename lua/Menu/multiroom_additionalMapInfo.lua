
include('Menu/multiroom_additionalMapInfo_loc');
-- modders use function  merge(this table, your table);
function getMapsCoors(mapName, gameTypeName)
	return mapsCoors[mapName..'+'..gameTypeName] or mapsCoors[mapName] or nil;
end;

mapsCoors ={
	["ALIEN BASE"] = {
		[1] = {X=126,Y=110},
		[2] = {X=244,Y=60},
		[3] = {X=356,Y=110},
		[4] = {X=360,Y=220},
		[5] = {X=250,Y=260},
		[6] = {X=136,Y=220},
	},

	["BABYLON"] = {
		[1] = {X=68,Y=64},
		[2] = {X=421,Y=52},
		[3] = {X=69,Y=267},
		[4] = {X=432,Y=273},
	},

	["RIVER OF LOST SOUL"] = {
		[1] = {X=86,Y=60},
		[2] = {X=406,Y=60},
		[3] = {X=80,Y=240},
		[4] = {X=400,Y=240},
	},

	["THE ABBYS"] = {
		[1] = {X=70,Y=100,X2=70,Y2=240},
		[3] = {X=436,Y=100,X2=436,Y2=240},
	},

	["THE ABBYS+CAPTURE THE FLAG"] = {
		[1] = {X=76,Y=165},
		[2] = {X=426,Y=165},
	},

	["BASTARD PASS"] = {
		[1] = {X=90,Y=236,X2=267,Y2=237},
		[2] = {X=424,Y=83,X2=232,Y2=72},
	},

	["BLOODY VALLEY"] = {
		[1] = {X=102,Y=69},
		[2] = {X=392,Y=69},
		[3] = {X=107,Y=262},
		[4] = {X=390,Y=250},
	},

	["HIGHLANDS"] = {
		[1] = {X=128,Y=80},
		[2] = {X=400,Y=100},
		[3] = {X=150,Y=237},
		[4] = {X=395,Y=250},
	},

	["PARTY"] = {
		[1] = {X=115,Y=99},
		[2] = {X=373,Y=78},
		[3] = {X=130,Y=230},
		[4] = {X=395,Y=225},
	},

	["RIVER OF LOST SOULS"] = {
		[1] = {X=93,Y=68},
		[2] = {X=346,Y=66},
		[3] = {X=88,Y=236},
		[4] = {X=410,Y=248},
	},

	["STONEHENGE"] = {
		[1] = {X=67,Y=276},
		[2] = {X=287,Y=276},
	},

	["TABLE MOUNTAIN"] = {
		[1] = {X=115,Y=98},
		[2] = {X=368,Y=48},
		[3] = {X=147,Y=277},
		[4] = {X=364,Y=230},
	},

	["FOOTBALL"] = {
		[1] = {X=79,Y=160},
		[2] = {X=431,Y=160},
	},

	["WILDERNESS"] = {
		[1] = {X=100,Y=110},
		[2] = {X=200,Y=110},
		[3] = {X=300,Y=110},
		[4] = {X=400,Y=110},
		[5] = {X=100,Y=220},
		[6] = {X=200,Y=220},
		[7] = {X=300,Y=220},
		[8] = {X=400,Y=220},
	},

	["ROCKY LAND"] = {
		[1] = {X=100,Y=110},
		[2] = {X=200,Y=110},
		[3] = {X=300,Y=110},
		[4] = {X=400,Y=110},
		[5] = {X=100,Y=220},
		[6] = {X=200,Y=220},
		[7] = {X=300,Y=220},
		[8] = {X=400,Y=220},
	},

	["FLAGS"] = {
		[1] = {X=86,Y=48},
		[2] = {X=244,Y=32},
		[3] = {X=395,Y=37},
		[4] = {X=424,Y=193},
		[5] = {X=405,Y=300},
		[6] = {X=247,Y=297},
		[7] = {X=84,Y=292},
		[8] = {X=79,Y=165},
	},

	["FOUR TO WIN"] = {
		[1] = {X=80,Y=60},
		[2] = {X=425,Y=60},
		[3] = {X=80,Y=265},
		[4] = {X=425,Y=265},
	},

	["FORESTLAND"] = {
		[1] = {X=80,Y=60},
		[2] = {X=425,Y=60},
		[3] = {X=80,Y=265},
		[4] = {X=425,Y=265},
	},

	["ROCKY PASS"] = {
		[1] = {X=117,Y=47},
		[2] = {X=96,Y=142},
		[3] = {X=99,Y=283},
		[4] = {X=402,Y=42},
		[5] = {X=410,Y=146},
		[6] = {X=400,Y=278},
	},

	["SIBERIA"] = {
		[1] = {X=48,Y=272},
		[2] = {X=48,Y=40},
		[3] = {X=64,Y=144},
		[4] = {X=405,Y=25},
		[5] = {X=465,Y=140},
		[6] = {X=453,Y=256},
	},

	["JUNGLE LAW"] = {
		[1] = {X=64,Y=41},
		[2] = {X=73,Y=285},
		[3] = {X=441,Y=42},
		[4] = {X=449,Y=283},
	},

	["NIGHT FIGHT"] = {
		[1] = {X=100,Y=110},
		[2] = {X=250,Y=110},
		[3] = {X=400,Y=110},
		[4] = {X=100,Y=220},
		[5] = {X=250,Y=220},
		[6] = {X=400,Y=220},
	},

	---------------------	Throwback    ---------------------
	-- TB04 The Last Battle - 3vsAlly
	['TB04 THE LAST BATTLE'] = {
		[1] = {X=70,Y=120},
		[2] = {X=250,Y=30},
		[3] = {X=400,Y=120},
		[4] = {X=420,Y=280},
	},

		['TB06 KASYR+ALLY VS REB'] = {
		[1] = {X=150,Y=40,X2=250,Y2=40,X3=350,Y3=40},
		[4] = {X=150,Y=290,X2=270,Y2=290,X3=350,Y3=290},
	},

	['TB08 SWASTIKA'] = {
		[1] = {X=80,Y=130,X2=100,Y2=80},
		[3] = {X=290,Y=60,X2=380,Y2=70},
		[5] = {X=130,Y=240,X2=210,Y2=265},
		[7] = {X=400,Y=240,X2=400,Y2=190},
	},

	--------------------- OW Cooperative ---------------------
	['3TH BATTLE OF OVSYENKO'] = {
		[1] = {X=200,Y=120},
		[2] = {X=350,Y=100},
		[3] = {X=350,Y=200},
		[4] = {X=380,Y=20},
		[5] = {X=20,Y=300},
	},

};

function getMapsModifeNations(mapName, gameTypeName)
	return fakeMapsModifeNations[mapName..'+'..gameTypeName] or fakeMapsModifeNations[mapName] or nil;
end;
fakeMapsModifeNations = {
	---------------------   Throwback    ---------------------
	['TB04 THE LAST BATTLE+3VSALLY'] = {
		[1] = {																		-- Position +1
			[4] = {																	-- Nation +1
				TEAMS = true,	-- modifed in team (1 isn't team, Player's team +1
				[3] = {
					NAME = loc(TID_Multi_Nation_Ally),
					ICON = 'ally.png',
				},
			},
		},
		[5] = {
			[4] = {																	-- Teams is nil or false, so available for all sides
				NAME = loc(TID_Multi_Nation_Ally),
				ICON = 'ally.png',
			},
		},
	},

	['TB06 KASYR+ALLY VS REB'] = {
		[2] = {
			[1] = {
				NAME = loc(TID_Multi_Nation_Ally),
				ICON = 'ally.png',
				},
			},

		[5] = {
			[1] = {
				NAME = loc(TID_Multi_Nation_Reb),
				ICON = 'reb.png',
			},
		},
	},

	-------------------- OW Cooperative -----------------------
	['3TH BATTLE OF OVSYENKO+COOPERATION'] = {
		[1] = {
			[3] = {
				[4] = {
					NAME = loc(TID_Multi_Nation_Leg),
					ICON = 'leg.png',
				},
				TEAMS = true,
			},
		},

		[3] = {
			[2] = {
				NAME = loc(TID_Multi_nation1),
				ICON = 'am2.png',
			},
		},

		[5] = {
			[4] = {
				NAME = loc(TID_Multi_nation3),
				ICON = 'ru2.png',
			},
		},

		[6] = {
			[3] = {
				NAME = loc(TID_Multi_Nation_Leg),
				ICON = 'leg.png',
			},
		},


	},

};

function getMapOptionsAddInfo(mapName, gameTypeName)
	return mapOptionsAddInfo[mapName..'+'..gameTypeName] or mapOptionsAddInfo[mapName] or nil;
end;
--- Note with type 20 and 21 will be used only  ENABLENAME, ENABLEHINT, MINNAME, MINHINT merged with exist and saved as TYPE 6
mapOptionsAddInfo ={
--[[
	["ALIEN BASE"] = {
		[0] = {
			IMGS = { [1]= 'NONE', [2] = 'DEPOT', [3] ='FORTS'},
		},
		[1] = {
			VALUE=8,
			MIN=4,
			MAX=24,
			STEP=1,
			MINNAME='4',
		},
		[4] = {
			VALUE=10,
			MIN=50,
			MAX=150,
			STEP=1,
			VALUESTRING='<value>%',
		},
		[11] = {
			ENABLENAME=AMILoc(TAMIID_Enable),
		},
		[13] = {
			VALUE=1,
			MIN=50,
			MAX=100,
			STEP=10,
			VALUESTRING='<value>%',
			ENABLENAME=AMILoc(TAMIID_Enable),
		},
		[14] = {
			VALUE=1,
			MIN=30,
			MAX=90,
			STEP=10,
			VALUESTRING='<value>%',
			ENABLENAME=AMILoc(TAMIID_Enable),
		},
		[15] = {
			VALUE=4,
			MIN=30,
			MAX=200,
			STEP=5,
		},
		[17] = {
			VALUE=1,
			MIN=0,
			MAX=120,
			STEP=10,
			MINNAME=AMILoc(TAMIID_SibBomb_Min),
			MAXNAME=AMILoc(TAMIID_SibBomb_Max),
			VALUESTRING=AMILoc(TAMIID_SibBomb_Text),
		},
		[20] = {
			MIN=5,
			MAX=15,
			STEP=1,
			VALUESTRING=AMILoc(TAMIID_Minutes_String),
			ENABLENAME=AMILoc(TAMIID_Enable),
		},
	},

	["ALIEN BASE ST"] = {
		[0] = {
			IMGS = { [1]= 'NONE', [2] = 'DEPOT', [3] ='FORTS'},
		},
		[1] = {
			VALUE=8,
			MIN=4,
			MAX=24,
			STEP=1,
			MINNAME='4',
		},
		[4] = {
			VALUE=10,
			MIN=50,
			MAX=150,
			STEP=1,
			VALUESTRING='<value>%',
		},
		[11] = {
			ENABLENAME=AMILoc(TAMIID_Enable),
		},
		[13] = {
			VALUE=1,
			MIN=50,
			MAX=100,
			STEP=10,
			VALUESTRING='<value>%',
			ENABLENAME=AMILoc(TAMIID_Enable),
		},
		[14] = {
			VALUE=1,
			MIN=30,
			MAX=90,
			STEP=10,
			VALUESTRING='<value>%',
			ENABLENAME=AMILoc(TAMIID_Enable),
		},
		[15] = {
			VALUE=4,
			MIN=30,
			MAX=200,
			STEP=5,
		},
		[17] = {
			VALUE=1,
			MIN=0,
			MAX=120,
			STEP=10,
			MINNAME=AMILoc(TAMIID_SibBomb_Min),
			MAXNAME=AMILoc(TAMIID_SibBomb_Max),
			VALUESTRING=AMILoc(TAMIID_SibBomb_Text),
		},
		[20] = {
			MIN=5,
			MAX=15,
			STEP=1,
			VALUESTRING=AMILoc(TAMIID_Minutes_String),
			ENABLENAME=AMILoc(TAMIID_Enable),
		},
	},
--]]
};

function getLockedTeams(mapName, gameTypeName)
	return lockedTeams[mapName..'+'..gameTypeName] or lockedTeams[mapName] or nil;
end;

lockedTeams ={
	["ALIEN BASE+1V1 RANKED"] = {true,true},
	["ALIEN BASE+2V2 RANKED"] = {true,true},
	["ALIEN BASE+3V3 RANKED"] = {true,true},
	["ALIEN BASE+COMPETITION"] = {true,true},
	["ALIEN BASE+COMPETITION (3 TEAMS)"] = {true,true},
	["BABYLON+1V1 RANKED"] = {true,true},
	["BABYLON+2V2 RANKED"] = {true,true},
	["BABYLON+MASTER OF THE ISLAND"] = {true,true},
	["BASTARD PASS"] = {true,true},
	["BLOODY VALLEY+1V1 RANKED"] = {true,true},
	["BLOODY VALLEY+2V2 RANKED"] = {true,true},
	["FOOTBALL"] = {true,true},
	["FOUR TO WIN+1V1 RANKED"] = {true,true},
	["FOUR TO WIN+2V2 RANKED"] = {true,true},
	["FOUR TO WIN+KING OF THE HILL"] = {true,true},
	["HIGHLANDS+1V1 RANKED"] = {true,true},
	["HIGHLANDS+2V2 RANKED"] = {true,true},
	["PARTY"] = {true,false},
	["ROCKY LAND"] = {true,true},
	["TABBLE MONNTAIN"] = {true,true},
	["THE ABBYS"] = {true,true},
	["WILDERNESS"] = {true,true},
	["STONEHENGE"] = {true,true},
	["JINGLE LAW+MASTER OF THE CRATER"] = {true,true},
	["JINGLE LAW+MASTER OF THE CRATER (2 TEAMS)"] = {true,true},
	["JINGLE LAW+WAR FOR TERRITORY"] = {true,true},
	["JINGLE LAW+WAR FOR TERRITORY (2 TEAMS)"] = {true,true},
	["JINGLE LAW+1V1 RANKED"] = {true,true},
	["JINGLE LAW+2V2 RANKED"] = {true,true},
};

function getTechnologyLimits(mapName, gameTypeName)
	return fakeTechnologyLimits[mapName..'+'..gameTypeName] or fakeTechnologyLimits[mapName] or nil;
end;

fakeTechnologyLimits ={
	["ALIEN BASE"] = {true,true},
	["ALIEN BASE+1V1 RANKED"] = {true,true},
	["ALIEN BASE+2V2 RANKED"] = {true,true},
	["ALIEN BASE+3V3 RANKED"] = {true,true},
	["ALIEN BASE+COMPETITION"] = {true,true},
	["ALIEN BASE+COMPETITION (3 TEAMS)"] = {true,true},
	["BABYLON"] = {true,false},
	["BABYLON+1V1 RANKED"] = {true,true},
	["BABYLON+2V2 RANKED"] = {true,true},
	["BABYLON+MASTER OF THE ISLAND"] = {true,true},
	["BASTARD PASS"] = {true,false},
	["BLOODY VALLEY"] = {true,true},
	["BLOODY VALLEY+1V1 RANKED"] = {true,true},
	["BLOODY VALLEY+2V2 RANKED"] = {true,true},
	["FLAGS"] = {true,true},
	["FOOTBALL"] = {true,true},
	["FORRESTLAND"] = {true,true},
	["FOUR TO WIN"] = {true,true},
	["FOUR TO WIN+1V1 RANKED"] = {true,true},
	["FOUR TO WIN+2V2 RANKED"] = {true,true},
	["FOUR TO WIN+KING OF THE HILL"] = {true,true},
	["HIGHLANDS"] = {true,true},
	["HIGHLANDS+1V1 RANKED"] = {true,true},
	["HIGHLANDS+2V2 RANKED"] = {true,true},
	["PARTY"] = {true,true},
	["RIVEL OF LOST SOULS"] = {true,true},
	["ROCKY LAND"] = {true,true},
	["ROCKY PASS"] = {true,true},
	["SIBERIA"] = {true,true},
	["TABBLE MONNTAIN"] = {true,true},
	["TABBLE MONNTAIN+TWO ALLIANCES"] = {true,true},
	["TABBLE MONNTAIN+KILL 'EM ALL"] = {true,true},
	["THE ABBYS"] = {true,true},
	["WILDERNESS"] = {true,true},
	["STONEHENGE"] = {true,true},
	["JINGLE LAW"] = {true,true},
	["JINGLE LAW+MASTER OF THE CRATER"] = {true,true},
	["JINGLE LAW+MASTER OF THE CRATER (2 TEAMS)"] = {true,true},
	["JINGLE LAW+WAR FOR TERRITORY"] = {true,true},
	["JINGLE LAW+WAR FOR TERRITORY (2 TEAMS)"] = {true,true},
	["JINGLE LAW+1V1 RANKED"] = {true,true},
	["JINGLE LAW+2V2 RANKED"] = {true,true},
	["NIGHT FIGHT"] = {true,true},
};

function getRestritions(mapName, gameTypeName)
	--return copytable(mapsRestritions[mapName..'+'..gameTypeName]) or copytable(mapsRestritions[mapName]) or nil;
	return copytable(mapsRestritions[mapName..'+'..gameTypeName]) or copytable(mapsRestritions[mapName]) or nil;
end;

mapsRestritions ={
	["ALIEN BASE"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["ALIEN BASE+MINE THE SIBERITE"] = {
		ISLOCKEDALL=false,
		LOCKED_T = {[tech_SibDet] =true,},
		LOCKED_B = {[bud_depot] =true,},
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["BABYLON"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
		LOCKED_T = {[tech_SibDet] =true,[tech_SibPow] =true,[tech_Artifact] =true,},
		LOCKED_B = {[bud_depot] =true,[bud_lab_basic] =true,[bud_lab_siberium] =true,},
	},

	["BABYLON+KILL 'EM ALL"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["BABYLON+MASTER OF THE ISLAND"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
		LOCKED_T = {[tech_PartInvis] =false,},
		LOCKED_B = {[bud_depot] =true,},
	},

	["JUNGLE LAW"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["JUNGLE LAW+MASTER OF THE CRATER"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
		LOCKED_T = {[tech_PartInvis] =false,},
		LOCKED_B = {[bud_depot] =true,},
	},

	["JUNGLE LAW+MASTER OF THE CRATER (2 TEAMS)"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
		LOCKED_T = {[tech_PartInvis] =false,},
		LOCKED_B = {[bud_depot] =true,},
	},

	["BASTARD PASS"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["BLOODY VALLEY"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["FLAGS"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["FORRESTLAND"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["FOUR TO WIN"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["FOUR TO WIN+KING OF THE HILL"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
		LOCKED_T = {[tech_PartInvis] =false,},
		LOCKED_B = {[bud_depot] =true,},
	},

	["HIGHLANDS"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["PARTY"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["ROCKY PASS"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["SIBERIA"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["TABBLE MONNTAIN"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["THE ABBYS"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
	},

	["STONEHENGE"] = {
		LOCKED_T = {[tech_SibFiss] = false,},
	},

	["NIGHT FIGHT"] = {
		LOCKED_T_OPT = {tech_SibFiss,},
		LOCKED_B = {[bud_power_solar] =false,},
		LOCKED_T = {[tech_SolPow] =false,[tech_SolEng] =false,},
	},

};

