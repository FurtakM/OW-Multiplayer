-----------------------------------------------------------------------------
---  Orig. File : /lua/ingame/game_diplomacy.lua
---  Version    : 4
---
---  Summary    : Dialog - Diplomacy.
---
---  Created    : Petr 'Sali' Salak, Freya Group

------------------------------------------------------------------------------
dialog.diplomacy       = getDialogEX(dialog.back,anchorNone,XYWH(LayoutWidth / 2 - 400,0,800,600),SKINTYPE_DIALOG1,{tile=true});

dialog.diplomacy.title = getLabelEX(dialog.diplomacy,
	anchorLT,
	XYWH(
		0,
		20,
		800,
		20
	),
	Tahoma_20B,
	loc(TID_InGame_Diplomacy_Title),
	{
		text_halign=ALIGN_MIDDLE,
		font_colour=RGB(120,35,35),
});

dialog.diplomacy.ok    = getImageButtonEX(dialog.diplomacy,
	anchorRB,
	XYWH(
		dialog.diplomacy.width-200,
		dialog.diplomacy.height-50,
		150,
		30
	),
	loc(TID_InGame_Mission_objectives_OK),'',
	'HideDialog(dialog.diplomacy);',
	SKINTYPE_BUTTON,
	{
		font_colour_disabled=GRAY(127)
});


dialog.diplomacy.alliedVictory    = getCheckBoxEX_UI(dialog.diplomacy,
	anchorLB,
	XYWH(
		60,
		dialog.diplomacy.height-50,
		20,
		20
	),
	loc(TID_InGame_Diplomacy_Check),
	{},
	'SetAlliedVictory(%value);',
	{
		checked=false,
});

dialog.diplomacy.relationship = getLabelEX(dialog.diplomacy,
	anchorLT,
	XYWH(
		20,
		55,
		130,
		20
	),
	Tahoma_14,
	loc(TID_InGame_Diplomacy_Attitude),
	{
		text_halign=ALIGN_MIDDLE,
		colour1=WHITEA(0),
		font_colour=RGB(100,200,200),
});

dialog.diplomacy.offers = getLabelEX(dialog.diplomacy,
	anchorLT,
	XYWH(
		10+130+225+15,
		55,
		280,
		20
	),
	Tahoma_14,
	loc(TID_InGame_Diplomacy_Possibilities),
	{
		text_halign=ALIGN_MIDDLE,
		colour1=WHITEA(0),
		font_colour=RGB(100,200,200),
});

dialog.diplomacy.panel = getElementEX(dialog.diplomacy,anchorLTRB,XYWH(20,80,dialog.diplomacy.width-40,dialog.diplomacy.height-50-60-80),true,{colour1=WHITEA(0),});

DipSides = {};
DipSides.SideCards = {};
DipSides.Teams = {};
function CreateDipSideCard(y,name,side,attitude,canSend)
	local colour = WHITE(255);
	local attitudeName = '';
	local fristOffer = false;
	local secoundOffer = false;
	local firstOfferText = '';
	local secoundOfferText = '';
	local firstOfferColour  = WHITE(255);
	local secoundOfferColour = WHITE(255);
	
	switch(attitude) : caseof {
		[0] = function (x) 
				colour = ATTITUDE_COLOURS.I; 
				attitudeName='';
				firstOffer = false;
				secoundOffer = false;
			end,
		[1] = function (x) 
				colour =ATTITUDE_COLOURS.FRIEND;
				attitudeName=loc(TID_InGame_Diplomacy_Alliance);
				secoundOffer = false;
				if LockedTeams then
					firstOffer = false;
				else
					firstOffer = true;
					firstOfferText = loc(TID_InGame_Diplomacy_War_Declare);
					firstOfferColour = ATTITUDE_COLOURS.ENEMY;
				end;
			end,
		[2] = function (x) 
				colour =ATTITUDE_COLOURS.NEUTRAL;
				attitudeName=loc(TID_InGame_Diplomacy_Ceasefire);
				firstOffer = true;
				firstOfferColour = ATTITUDE_COLOURS.ENEMY;
				firstOfferText = loc(TID_InGame_Diplomacy_Ceasefire_Break);
				if LockedTeams then
					secoundOffer=false;
				else
					secoundOffer=true;
					secoundOfferText=loc(TID_InGame_Diplomacy_Alliance_Offer);
					secoundOfferColour=ATTITUDE_COLOURS.FRIEND;
				end;
			end,
		[3] = function (x) 
				colour =ATTITUDE_COLOURS.ENEMY;
				attitudeName=loc(TID_InGame_Diplomacy_War);
				firstOffer = true;
				firstOfferColour = ATTITUDE_COLOURS.NEUTRAL;
				firstOfferText = loc(TID_InGame_Diplomacy_Ceasefire_Offer);
				if LockedTeams then
					secoundOffer=false;
				else
					secoundOffer=true;
					secoundOfferText=loc(TID_InGame_Diplomacy_Alliance_Offer);
					secoundOfferColour=ATTITUDE_COLOURS.FRIEND;
				end;
			end,
		[4] = function (x) 
				colour =ATTITUDE_COLOURS.SPEC;
				attitudeName=loc(TID_Multi_IsSpec);
				firstOffer = false;
				secoundOffer=false;
				end;
	};

	local sideRow = getElementEX(dialog.diplomacy.panel,
		anchorLT,
		XYWH(
			0,
			y,
			dialog.diplomacy.panel.width,
			30),
			true,
			{
				colour1=colour,
				texture='SGUI/Alien/dip_sidePanel.png',
	});

	sideRow.Attitude = getLabelEX(sideRow,
		anchorLT,
		XYWH(
			2,
			8,
			130,
			14
		),
		Tahoma_14,
		attitudeName,
		{
			text_halign=ALIGN_MIDDLE,
			font_colour=colour,
			colour1 = WHITEA(0),
	});

	sideRow.Name = getLabelEX(sideRow,
		anchorLT,
		XYWH(
			2+130+2,
			6,
			200,
			16
		),
		Tahoma_16B,
		name,
		{
			font_colour=SIDE_COLOURS[side],
			scissor = true,
	});

	sideRow.Offer1 = getImageButtonEX(sideRow,
			anchorLT,
			XYWH(
				sideRow.width-105-160,
				3,
				160,
				24
			),
			firstOfferText,
			'',
			'',
			SKINTYPE_BUTTON,
			{
				font_colour=firstOfferColour,
				font_colour_disabled=GRAY(127),
				shadowtext=true,
		});
		
	if not firstOffer then
		setVisible(sideRow.Offer1,false);
	end;
	
	sideRow.Offer2 = getImageButtonEX(sideRow,
			anchorLT,
			XYWH(
				sideRow.width-105-2-320,
				3,
				160,
				24
			),
			secoundOfferText,
			'',
			'',
			SKINTYPE_BUTTON,
			{
				font_colour=secoundOfferColour,
				font_colour_disabled=GRAY(127),
				shadowtext=true,
		});
		
	if not secoundOffer then
		setVisible(sideRow.Offer2,false);
	end;

	sideRow.mergedIcon = {};
	for i=1, 12 do
		sideRow.mergedIcon[i] = getElementEX(sideRow,
			anchorLT,
			XYWH(
				sideRow.width-100+8*(i-1),
				8,
				6,
				13
			),
			true,
			{
				colour1=SIDE_COLOURS[side],
				texture='SGUI/dip_icons.png',
				--nomouseevent=true,
				hint='',
		});
	end;

	sideRow.AttitudeState = attitude;
	sideRow.MainPlayerID = 0;
	
	return sideRow;
end;

function CreateDipTeam(y,name,teamNumber)
	local teamRow = getLabelEX(dialog.diplomacy.panel,
		anchorLT,
		XYWH(
			-9,
			y,
			200,
			15
		),
		Tahoma_14,
		name,
		{
			text_halign=ALIGN_LEFT,
			font_colour=TEAM_COLOURS[teamNumber],
			colour1 = WHITEA(0),
	});
	
	return teamRow;
end;

function ChangeMergedIcons(side,numberOfMerged)
	for i=1, 12 do
		if i <= numberOfMerged then
			setVisible(DipSides.SideCards[side].mergedIcon[i], true);
		else
			setVisible(DipSides.SideCards[side].mergedIcon[i], false);
		end;
	end;
end;

LockedTeams = true;
DipSides.Teams[1] = CreateDipTeam(0,'Team 1',1);
DipSides.SideCards[8] =CreateDipSideCard(15,'Sali',8,1);
ChangeMergedIcons(8,1);
DipSides.Teams[2] = CreateDipTeam(45,'Team 2',2);
DipSides.SideCards[4] =CreateDipSideCard(60,'Darius',4,1);
ChangeMergedIcons(4,1);
DipSides.Teams[3] = CreateDipTeam(90,'Team 3',3);
DipSides.SideCards[3] =CreateDipSideCard(105,'Harold',3,1);
ChangeMergedIcons(3,1);
DipSides.Teams[4] = CreateDipTeam(135,'Team 4',4);
DipSides.SideCards[7] =CreateDipSideCard(150,'Sasha',7,3);
ChangeMergedIcons(7,1);
DipSides.Teams[5] = CreateDipTeam(180,'Team 5',5);
DipSides.SideCards[5] =CreateDipSideCard(195,'Tekuwa+Adam',5,2);
ChangeMergedIcons(5,2);
DipSides.Teams[6] = CreateDipTeam(225,'Team 6',6);
DipSides.SideCards[2] =CreateDipSideCard(240,'Tania',2,3);
ChangeMergedIcons(2,1);
DipSides.Teams[7] = CreateDipTeam(270,'Team 7',7);
DipSides.SideCards[9] =CreateDipSideCard(285,'Tarie+Konie+Xarxas+ada',9,2);
ChangeMergedIcons(9,4);
DipSides.Teams[8] = CreateDipTeam(315,'Team 8',8);
DipSides.SideCards[6] =CreateDipSideCard(330,'Gevin',6,2);
ChangeMergedIcons(6,1);
DipSides.Teams[9] = CreateDipTeam(360,loc(TID_Multi_IsSpec),9);
DipSides.SideCards[1] =CreateDipSideCard(375,'Stucuk',1,4);
DipSides.SideCards[10] =CreateDipSideCard(405,'Stucuk',10,4);
--ChangeMergedIcons(1,1);
LockedTeams = false;

DipCoords = {};

game.ui.dip_request = getElementEX(game.ui,
	anchorLRB,
	XYWH(
		370,
		LayoutHeight-190,
		LayoutWidth - 370-290,
		176*2
	),
	true,
	{
		colour1=WHITEA(0);
});
bringToFront(game.ui.facepanel);
bringToFront(game.ui.logpanel);
bringToFront(game.ui.hintbar);

DipCoords.HideY = -190;
DipCoords.ZeroY = -190-70;
DipCoords.OneRequestH = -40;
DipCoords.Max = -190-176;


game.ui.dip_request.left = getElementEX(game.ui.dip_request,
	anchorLTB,
	XYWH(
		0,
		0,
		11,
		176*2
	),
	true,
	{
		colour1=WHITEA(255),
		texture = 'SGUI/Rus/dip_request_left.png',
});

game.ui.dip_request.right = getElementEX(game.ui.dip_request,
	anchorTRB,
	XYWH(
		game.ui.dip_request.width-11,
		0,
		11,
		176*2
	),
	true,
	{
		colour1=WHITEA(255),
		texture = 'SGUI/Rus/dip_request_right.png',
});

game.ui.dip_request.middle = getElementEX(game.ui.dip_request,
	anchorLRB,
	XYWH(
		11,
		0,
		game.ui.dip_request.width-22,
		176*2
	),
	true,
	{
		colour1=WHITEA(255),
		texture = 'SGUI/Rus/dip_request_back.png',
		tile = true;
});

allRequests = {};
allRequestsCount = 0;

function CreateDiplomacyRequest(pos,type,name,side)
	local hintA = '';
	local hintB = '';
	local requestText='';
	local y = pos*40;
	switch(type) : caseof {
		[1] = function (x)  --Aliance
				hintA=loc(TID_InGame_Diplomacy_Alliance_Accept);
				hintB=loc(TID_InGame_Diplomacy_Alliance_Reject);
				requestText= loc_format(TID_InGame_Diplomacy_Messange_RequestAlliance,{name});
			end,
		[0] = function (x)  -- Ceasefire
				hintA=loc(TID_InGame_Diplomacy_Ceasefire_Accept);
				hintB=loc(TID_InGame_Diplomacy_Ceasefire_Reject);
				requestText =loc_format(TID_InGame_Diplomacy_Messange_RequestCeasefire,{name});
			end,
	};
	
	local row = getElementEX(game.ui.dip_request.middle,
		anchorLT,
		XYWH(
			0,
			y,
			getWidth(game.ui.dip_request.middle),
			40
		),
		true,
		{
			colour1 = WHITEA(0);
	});
	

	row.Accept = getImageButtonEX(row,
			anchorLT,
			XYWH(
				5,
				2,
				26,
				26
			),
			'',
			'',
			'',
			nil,
			{
				texture='SGUI/'.. interface.current.side ..'/'..'dip_request_accept.png',
				hint=hintA,
	});

	row.Reject = getImageButtonEX(row,
			anchorLT,
			XYWH(
				5+30,
				2,
				26,
				26
			),
			'',
			'',
			'',
			nil,
			{
				texture='SGUI/'.. interface.current.side ..'/'..'dip_request_reject.png',
				hint=hintB,
	});

	row.Text = getLabelEX(row,
		anchorLT,
		XYWH(
			5+2*30,
			2,
			row.width-40,
			26
		),
		Tahoma_16B,
		requestText,
		{
			font_colour=SIDE_COLOURS[side],
			shadowtext = true,
	});

	row.Progress = getElementEX(row,
		anchorLT,
		XYWH(
			5,
			32,
			row.width-10,
			5
		),
		true,
		{
			colour1=RGB(64,126,126),
	});
	
	setAlpha(row,0);
	
	row.Type = type;
	row.Side = side;
	row.Pos = pos;
	row.Showed=true;
	return row;
end;

function CreateAnswer(pos,type,name,side)
	local hintA = '';
	local hintB = '';
	local requestText='';
	local y = pos*40;
	switch(type) : caseof {
		[1] = function (x)  -- Accept
				requestText= loc_format(TID_InGame_Diplomacy_Messange_AcceptedRequest,{name});
			end,
		[2] = function (x)  -- Decline
				requestText =loc_format(TID_InGame_Diplomacy_Messange_DeclinedRequest,{name});
			end,
		[3] = function (x)  -- Break Ceasefire
				requestText= loc_format(TID_InGame_Diplomacy_Messange_BreakCeasefire,{name});
			end,
		[4] = function (x)  -- Declare War
				requestText =loc_format(TID_InGame_Diplomacy_Messange_DeclareWar,{name});
			end,
	};
	
	local row = getElementEX(game.ui.dip_request.middle,
		anchorLT,
		XYWH(
			0,
			y,
			getWidth(game.ui.dip_request.middle),
			40
		),
		true,
		{
			colour1 = WHITEA(0);
	});
	
	row.Text = getLabelEX(row,
		anchorLT,
		XYWH(
			5+2*30,
			2,
			row.width-40,
			26
		),
		Tahoma_16B,
		requestText,
		{
			font_colour=SIDE_COLOURS[side],
			shadowtext = true,
	});

	row.Progress = getElementEX(row,
		anchorLT,
		XYWH(
			5,
			32,
			row.width-10,
			5
		),
		true,
		{
			colour1=RGB(64,126,126),
	});
	
	setAlpha(row,0);
	
	row.Type = type;
	row.Side = side;
	row.Pos = pos;
	row.Showed=true;
	return row;
end;

function moveRequestPanel(newPosition)
	local NP = ScrHeight+DipCoords.ZeroY+newPosition*DipCoords.OneRequestH;
	if newPosition == 0 then
		NP = ScrHeight+DipCoords.HideY;
	end;
	if getY(game.ui.dip_request) ~= NP then
		local moveSpeed = (math.abs(getY(game.ui.dip_request)-NP)/80)*0.2;
		AddEventSlideY(game.ui.dip_request.ID,NP,moveSpeed,nil);
		--AddEventHeight(game.ui.dip_request.ID,newPosition*40 + 40,moveSpeed,nil);
	end;
end;

function moveRequestOrDiplomacy(r,nP)
	if getY(r) ~= nP then
		AddEventSlideY(r.ID,nP,0.2,nil);
	end;
end;

function autoReject(ID)
	if (allRequests[ID] ~= nil) and (allRequests[ID].Showed == true) then
		hideRequest(ID);
		--ToOW_Dip_Accept( allRequests[ID].Side , 2);
		AddSingleUseTimer(1,'sgui_deletechildren(allRequests['..ID..'].ID);sgui_delete(allRequests['..ID..'].ID); allRequests['..ID..'] = nil;');
	elseif (allRequests[ID] ~= nil) then
		sgui_deletechildren(allRequests[ID].ID);
		sgui_delete(allRequests[ID].ID);
		allRequests[ID] = nil;
	end;
end;

function addRequest(type,name,side)
	local y = 0;
	for i=1, allRequestsCount do
		if (allRequests[i] ~= nil) and (allRequests[i].Showed == true) then
			y=y+1;
		end;
	end;
	

	for i=1, allRequestsCount do
		if (allRequests[i] == nil) then
			allRequests[i] = CreateDiplomacyRequest(y,type,name,side);
			AddEventFade(allRequests[i].ID,255,0.4,nil);
			set_Callback(allRequests[i].Accept.ID,CALLBACK_MOUSECLICK,'ToOW_Dip_Accept('.. side .. ',' .. type.. '); hideRequest('..i..');');
			set_Callback(allRequests[i].Reject.ID,CALLBACK_MOUSECLICK,'hideRequest('..i..');');
			recalYRPanel();
			return i;
		end;
	end;
	allRequestsCount= allRequestsCount+1;
	allRequests[allRequestsCount] = CreateDiplomacyRequest(y,type,name,side);
	AddEventFade(allRequests[allRequestsCount].ID,255,0.4,nil);
	set_Callback(allRequests[allRequestsCount].Accept.ID,CALLBACK_MOUSECLICK,'ToOW_Dip_Accept('.. side .. ',' .. type.. '); hideRequest('..allRequestsCount..');');
	set_Callback(allRequests[allRequestsCount].Reject.ID,CALLBACK_MOUSECLICK,'hideRequest('..allRequestsCount..');');
	
	recalYRPanel();
	
	return allRequestsCount;
end;

function addAnswer(type,name,side)
	local y = 0;
	for i=1, allRequestsCount do
		if (allRequests[i] ~= nil) and (allRequests[i].Showed == true) then
			y=y+1;
		end;
	end;
	

	for i=1, allRequestsCount do
		if (allRequests[i] == nil) then
			allRequests[i] = CreateAnswer(y,type,name,side);
			AddEventFade(allRequests[i].ID,255,0.4,nil);
			recalYRPanel();
			return i;
		end;
	end;
	allRequestsCount= allRequestsCount+1;
	allRequests[allRequestsCount] = CreateAnswer(y,type,name,side);
	AddEventFade(allRequests[allRequestsCount].ID,255,0.4,nil);
	
	recalYRPanel();
	
	return allRequestsCount;
end;

WaitForAnswer = {};
IdeclareIt = false;
function registryWatForAnswer(side)
	OW_MULTI_GET_ATTITUDES();
	WaitForAnswer[side] = MULTI_ATTITUDESINFO_CURRENT[mySide][side];
	AddSingleUseTimer(26,'checkAnswer('..side..');');
end;

function checkAnswer(side)
	OW_MULTI_GET_ATTITUDES();
	if WaitForAnswer[side] and MULTI_ATTITUDESINFO_CURRENT[mySide][side] == WaitForAnswer[side] then
		local req = addAnswer(2,getText(DipSides.SideCards[side].Name),side);
		AddEventWidth(allRequests[req].Progress.ID,0,10,'autoReject('..req..');');
	end;
	WaitForAnswer[side]  = nil;
end;

function disableOffers(side)
	local card = DipSides.SideCards[side];
	setEnabled(card.Offer1,false);
	setEnabled(card.Offer2,false);
	AddSingleUseTimer(30,'enableOffers('..side..');');

end;

function enableOffers(side)
	local card = DipSides.SideCards[side];
	setEnabled(card.Offer1,true);
	setEnabled(card.Offer2,true);
	
end;

function hideRequest(ID)
	if (allRequests[ID] ~= nil) and (allRequests[ID].Showed == true) then
		allRequests[ID].Showed=false;
		AddEventFade(allRequests[ID].ID,0,0.4,nil);
		local IDsY = allRequests[ID].Pos;
		for i, v in pairs(allRequests) do
			if v ~= nil and v.Showed == true then
				if v.Pos > IDsY then
					v.Pos = v.Pos-1;
					moveRequestOrDiplomacy(v,v.Pos*40);
					
				end;
			end;
		end;
	end;
	recalYRPanel();
end;

function recalYRPanel()
	local newYPanel=0;
	for i, v in pairs(allRequests) do
		if v ~= nil and v.Showed == true then
			newYPanel=newYPanel+1;
		end;
	end;
	moveRequestPanel(newYPanel);
end;
mySide = 0;
usedSides = {};
dipplayers = {};
function initalizeDiplomacy()
	local players = MULTI_PLAYERINFO_CURRENT_PLID;
	dipplayers = players;
	local merged = {};
	usedSides = {};
	
	for i=1,10 do
		if i ~= 10 then
			setVisible(DipSides.Teams[i],false);
		end;
		setVisible(DipSides.SideCards[i],false);
		setVisible(game.chat.Checker[i],false);
		game.chat.Checker[i].visible = false;
	end;
	local k = 1;
	--for i = 1, MULTI_PLAYERINFO_CURRENT.COUNT do
	for i, v in pairs(MULTI_PLAYERINFO_CURRENT_PLID) do
		if v.ALIVE  then
			local player = Players[i];
			if player and player.IsMerged then
				local colour = players[player.withMerged].COLOUR+1;
				if merged[colour] == nil then
					merged[colour] = {};
				end;
				merged[colour][table.getn(merged[colour])+1] = player.ID;
			else
				local colour = players[i].COLOUR+1;
				--if players[i].ISSPEC then
				--	colour = 1;
				--end;
				setVisible(DipSides.SideCards[colour],true);
				setText(DipSides.SideCards[colour].Name,players[i].NAME);
				setVisible(DipSides.SideCards[colour].Offer1,false);
				setVisible(DipSides.SideCards[colour].Offer2,false);
				DipSides.SideCards[colour].MainPlayerID = i;
				usedSides[colour] = true;
				DipSides.SideCards[colour].IsComp = players[i].ISCOMP;
				DipSides.SideCards[colour].IsSpec = players[i].ISSPEC;
				if colour ~= players[MyID].COLOUR+1 then
					setVisible(game.chat.Checker[colour],true);
					game.chat.Checker[colour].visible = true;
					setHint(game.chat.Checker[colour],players[i].NAME);
					setXYV(game.chat.Checker[colour],2,game.chat.CheckersArea.height-18*(5+k)-2)
					k = k+1;
					--setText(game.chat.CheckerText[colour].Name,players[i].NAME);
				end;
			end;
		end;
	end;
	for i=1, 10 do
		if usedSides[i] then
			local mergedCount = 1;
			if merged[i] then
				for v=1, table.getn(merged[i]) do
					setText(DipSides.SideCards[i].Name,getText(DipSides.SideCards[i].Name) .. '+' .. players[merged[i][v]].NAME);
					--setHint(game.chat.Checker[i],getHint(game.chat.Checker[i]) .. '+' .. players[merged[i][v]].NAME);
					setHint(game.chat.Checker[i],getText(DipSides.SideCards[i].Name));
					mergedCount = mergedCount+1;
				end;
			end;
			if DipSides.SideCards[i].IsComp then
				mergedCount = 0;
			end;
			ChangeMergedIcons(i,mergedCount);
		end;
	end;
	

	mySide = players[MyID].COLOUR+1;
	iSpec = players[MyID].ISSPEC;

	OW_MULTI_GET_ATTITUDES();

	game.chat.you = mySide;
	setChatPool(3);
	game.chat.custom = {mySide};
	if iSpec then
		setVisible(game.chat.CheckersArea,false);
	else
		setVisible(game.chat.CheckersArea,true);
	end;

	Dip_Resort();

	
end;

function Dip_Resort()
	local sorte = {[1]={COUNT = 0},[2]={COUNT = 0},[3]={COUNT = 0},[4]={COUNT = 0},[5]={COUNT = 0},[6]={COUNT = 0},[7]={COUNT = 0},[8]={COUNT = 0},[9]={COUNT = 0}};
	if LockedTeams and teamGame then
		local players = MULTI_PLAYERINFO_CURRENT_PLID;
		for i=1,10 do
			if usedSides[i] then
				
				local plid = DipSides.SideCards[i].MainPlayerID;
				if players[plid].ISPEC then
					sorte[9][sorte[9].COUNT+1] = i;
					sorte[9].COUNT = sorte[9].COUNT+1;
				else
					sorte[players[plid].TEAM][sorte[players[plid].TEAM].COUNT+1] = i;
					sorte[players[plid].TEAM].COUNT = sorte[players[plid].TEAM].COUNT+1;
				end;
				local pos = 0;		-- team +15, side card + 30
				for i=1,9 do
					if sorte[i].COUNT > 0 then
						local tCard = DipSides.Teams[i];
						setVisible(tCard,true);
						setY(tCard,pos);
						if i==9 then
							setText(tCard,loc(TID_Multi_IsSpec));
						else
							setText(tCard,MultiDef.TeamDef[i+1].NAME);
						end;
						pos=pos+15;
						for _, v in pairs(sorte[i]) do 
							local card = DipSides.SideCards[v];
							setY(card,pos);
							pos = pos+30;
							if DipSides.SideCards[v].IsSpec then
								setColour1(card, ATTITUDE_COLOURS.SPEC); 
								setText(card.Attitude,loc(TID_Multi_IsSpec));
								setFontColour(card.Attitude,ATTITUDE_COLOURS.SPEC);
								setVisible(card.Offer1, false);
								setVisible(card.Offer2, false);
							elseif  v == mySide or iSpec then
								setColour1(card, ATTITUDE_COLOURS.I); 
								setText(card.Attitude,'');
								setVisible(card.Offer1, false);
								setVisible(card.Offer2, false);
							elseif MULTI_ATTITUDESINFO_CURRENT[mySide][v] == 1 then
								setColour1(card, ATTITUDE_COLOURS.FRIEND);
								setText(card.Attitude,loc(TID_InGame_Diplomacy_Alliance));
								setFontColour(card.Attitude,ATTITUDE_COLOURS.FRIEND);
								setVisible(card.Offer1, false);
								setVisible(card.Offer2, false);
							elseif MULTI_ATTITUDESINFO_CURRENT[mySide][v] == 0 then
								setColour1(card, ATTITUDE_COLOURS.NEUTRAL);
								setText(card.Attitude,loc(TID_InGame_Diplomacy_Ceasefire));
								setFontColour(card.Attitude,ATTITUDE_COLOURS.NEUTRAL);
								setVisible(card.Offer1, true);
								setText(card.Offer1, loc(TID_InGame_Diplomacy_Ceasefire_Break));
								setFontColour(card.Offer1,ATTITUDE_COLOURS.ENEMY);
								set_Callback(card.Offer1.ID,CALLBACK_MOUSECLICK,'ToOW_Dip_Req('..v ..',' .. 2 ..'); disableOffers('..v..'); IdeclareIt = true;');
								setVisible(card.Offer2, false);
							elseif MULTI_ATTITUDESINFO_CURRENT[mySide][v] == 2 then
								setColour1(card, ATTITUDE_COLOURS.ENEMY);
								setText(card.Attitude,loc(TID_InGame_Diplomacy_War));
								setFontColour(card.Attitude,ATTITUDE_COLOURS.ENEMY);
								setVisible(card.Offer1, true);
								setText(card.Offer1, loc(TID_InGame_Diplomacy_Ceasefire_Offer));
								setFontColour(card.Offer1,ATTITUDE_COLOURS.NEUTRAL);
								set_Callback(card.Offer1.ID,CALLBACK_MOUSECLICK,'ToOW_Dip_Req('..v ..',' .. 0 ..'); disableOffers('..v..'); registryWatForAnswer('..v..');');
								setVisible(card.Offer2, false);
							end;
							if card.IsComp then
								setVisible(card.Offer1, false);
								setVisible(card.Offer2, false);
							end;
						end;
					end;
				end;
				
				
			end;
		end;
	else
		for i=1,10 do
			if usedSides[i] then
				if DipSides.SideCards[i].IsSpec then
					sorte[5][sorte[5].COUNT+1] = i;
					sorte[5].COUNT = sorte[5].COUNT+1;
				elseif i == mySide or iSpec then
					sorte[1][sorte[1].COUNT+1] = i;
					sorte[1].COUNT = sorte[1].COUNT+1;
				elseif MULTI_ATTITUDESINFO_CURRENT[mySide][i] == 1 then
					sorte[2][sorte[2].COUNT+1] = i;
					sorte[2].COUNT = sorte[2].COUNT+1;
				elseif MULTI_ATTITUDESINFO_CURRENT[mySide][i] == 0 then
					sorte[3][sorte[3].COUNT+1] = i;
					sorte[3].COUNT = sorte[3].COUNT+1;
				elseif MULTI_ATTITUDESINFO_CURRENT[mySide][i] == 2 then
					sorte[4][sorte[4].COUNT+1] = i;
					sorte[4].COUNT = sorte[4].COUNT+1;
				end;
			end;
		end;
		local pos = 0;		-- side card + 30
		for i=1, 5 do
			for v=1, sorte[i].COUNT do 
				local card = DipSides.SideCards[sorte[i][v]];
				--moveRequestOrDiplomacy(card,pos);
				setY(card,pos);
				pos = pos+30;
				switch(i) : caseof {
					[1] = function (x) 
							setColour1(card, ATTITUDE_COLOURS.I); 
							setText(card.Attitude,'');
							setVisible(card.Offer1, false);
							setVisible(card.Offer2, false);
						end,
					[2] = function (x) 
							setColour1(card, ATTITUDE_COLOURS.FRIEND);
							setText(card.Attitude,loc(TID_InGame_Diplomacy_Alliance));
							setFontColour(card.Attitude,ATTITUDE_COLOURS.FRIEND);
							setVisible(card.Offer1, false);
							if LockedTeams then
								setVisible(card.Offer2, false);
							else
								setVisible(card.Offer2, true);
								setText(card.Offer2, loc(TID_InGame_Diplomacy_War_Declare));
								setFontColour(card.Offer2,ATTITUDE_COLOURS.ENEMY);
								set_Callback(card.Offer2.ID,CALLBACK_MOUSECLICK,'ToOW_Dip_Req('..sorte[i][v] ..',' .. 2 ..'); disableOffers('..sorte[i][v] ..'); IdeclareIt = true;');
							end;
						end,
					[3] = function (x) 
							setColour1(card, ATTITUDE_COLOURS.NEUTRAL);
							setText(card.Attitude,loc(TID_InGame_Diplomacy_Ceasefire));
							setFontColour(card.Attitude,ATTITUDE_COLOURS.NEUTRAL);
							setVisible(card.Offer1, true);
							setText(card.Offer1, loc(TID_InGame_Diplomacy_Ceasefire_Break));
							setFontColour(card.Offer1,ATTITUDE_COLOURS.ENEMY);
							set_Callback(card.Offer1.ID,CALLBACK_MOUSECLICK,'ToOW_Dip_Req('..sorte[i][v] ..',' .. 2 ..'); disableOffers('..sorte[i][v] ..'); IdeclareIt = true;');
							if LockedTeams then
								setVisible(card.Offer2, false);
							else
								setVisible(card.Offer2, true);
								setText(card.Offer2, loc(TID_InGame_Diplomacy_Alliance_Offer));
								setFontColour(card.Offer2,ATTITUDE_COLOURS.FRIEND);
								set_Callback(card.Offer2.ID,CALLBACK_MOUSECLICK,'ToOW_Dip_Req('..sorte[i][v] ..',' .. 1 ..'); disableOffers('..sorte[i][v] ..'); registryWatForAnswer('..sorte[i][v] ..');');
							end;
						end,
					[4] = function (x) 
							setColour1(card, ATTITUDE_COLOURS.ENEMY);
							setText(card.Attitude,loc(TID_InGame_Diplomacy_War));
							setFontColour(card.Attitude,ATTITUDE_COLOURS.ENEMY);
							setVisible(card.Offer1, true);
							setText(card.Offer1, loc(TID_InGame_Diplomacy_Ceasefire_Offer));
							setFontColour(card.Offer1,ATTITUDE_COLOURS.NEUTRAL);
							set_Callback(card.Offer1.ID,CALLBACK_MOUSECLICK,'ToOW_Dip_Req('..sorte[i][v] ..',' .. 0 ..'); disableOffers('..sorte[i][v] ..'); registryWatForAnswer('..sorte[i][v] ..');');
							if LockedTeams then
								setVisible(card.Offer2, false);
							else
								setVisible(card.Offer2, true);
								setText(card.Offer2, loc(TID_InGame_Diplomacy_Alliance_Offer));
								setFontColour(card.Offer2,ATTITUDE_COLOURS.FRIEND);
								set_Callback(card.Offer2.ID,CALLBACK_MOUSECLICK,'ToOW_Dip_Req('..sorte[i][v] ..',' .. 1 ..'); disableOffers('..sorte[i][v] ..'); registryWatForAnswer('..sorte[i][v] ..');');
							end;
						end,
					[5] = function (x) 
							setColour1(card, ATTITUDE_COLOURS.SPEC); 
							setText(card.Attitude,loc(TID_Multi_IsSpec));
							setFontColour(card.Attitude,ATTITUDE_COLOURS.SPEC);
							setVisible(card.Offer1, false);
							setVisible(card.Offer2, false);
						end;
				};
				if card.IsComp then
					setVisible(card.Offer1, false);
					setVisible(card.Offer2, false);
				end;
			end;
		end;
	end;
end;

function FROMOW_MULTI_DIPLOMACY_REQUEST(DATA)
--{SIDE,STATE}
	--debugIngameChat(DATA.SIDE .. ' ' .. DATA.STATE);
	local req = addRequest(DATA.STATE,getText(DipSides.SideCards[DATA.SIDE+1].Name),DATA.SIDE+1);
	AddEventWidth(allRequests[req].Progress.ID,0,25,'autoReject('..req..');');
end;

function ToOW_Dip_Req(SIDE,STATE)
	OW_MULTI_DIPLOMACY_REQUEST_STATE(SIDE-1,STATE);
end;

function ToOW_Dip_Accept(SIDE,STATE)
	OW_MULTI_DIPLOMACY_ACCEPT_STATE(SIDE-1,STATE);
end;


function FROMOW_DIPLOMACY_CHANGED(DATA)
--{SIDE1,SIDE2,STATE}
	--debugIngameChat(DATA.SIDE1 .. ' '.. DATA.SIDE2 .. ' ' .. DATA.STATE);

	if DATA.SIDE1 ~= DATA.SIDE2 then
		if getVisible(dialog.diplomacy,true) then
			if LockedTeams and teamGame then
				--debugIngameChat('LockedTeams and teamGame');
				local ms = 0;
				local ss = 0;
				if DATA.SIDE1+1 == mySide then
					ms = DATA.SIDE1+1;
					ss = DATA.SIDE2+1;
				elseif DATA.SIDE2+1 == mySide then
					ms = DATA.SIDE2+1;
					ss = DATA.SIDE1+1;
				end;
				
				--debugIngameChat(ms .. ' ' .. ss);
				
				if ms > 0 and ss > 0 then
					local card = DipSides.SideCards[ss];
					if DATA.STATE == 1 then
						setColour1(card, ATTITUDE_COLOURS.FRIEND);
						setText(card.Attitude,loc(TID_InGame_Diplomacy_Alliance));
						setFontColour(card.Attitude,ATTITUDE_COLOURS.FRIEND);
						setVisible(card.Offer1, false);
						setVisible(card.Offer2, false);
						
						--debugIngameChat('state 1');
						
					elseif DATA.STATE == 0 then
						setColour1(card, ATTITUDE_COLOURS.NEUTRAL);
						setText(card.Attitude,loc(TID_InGame_Diplomacy_Ceasefire));
						setFontColour(card.Attitude,ATTITUDE_COLOURS.NEUTRAL);
						setVisible(card.Offer1, true);
						setText(card.Offer1, loc(TID_InGame_Diplomacy_Ceasefire_Break));
						setFontColour(card.Offer1,ATTITUDE_COLOURS.ENEMY);
						set_Callback(card.Offer1.ID,CALLBACK_MOUSECLICK,'ToOW_Dip_Req('..v ..',' .. 2 ..')');
						setVisible(card.Offer2, false);
						
						--debugIngameChat('state 0');
						
					elseif DATA.STATE == 2 then
						setColour1(card, ATTITUDE_COLOURS.ENEMY);
						setText(card.Attitude,loc(TID_InGame_Diplomacy_War));
						setFontColour(card.Attitude,ATTITUDE_COLOURS.ENEMY);
						setVisible(card.Offer1, true);
						setText(card.Offer1, loc(TID_InGame_Diplomacy_Ceasefire_Offer));
						setFontColour(card.Offer1,ATTITUDE_COLOURS.NEUTRAL);
						set_Callback(card.Offer1.ID,CALLBACK_MOUSECLICK,'ToOW_Dip_Req('..v ..',' .. 0 ..')');
						setVisible(card.Offer2, false);
						
						--debugIngameChat('state 2');
						
					end;
					if card.IsComp then
						setVisible(card.Offer1, false);
						setVisible(card.Offer2, false);
						
						--debugIngameChat('Comp');
						
					end;
				end;
			else
				--debugIngameChat('not (LockedTeams and teamGame) ');
				
				OW_MULTI_GET_ATTITUDES();
				
				--debugIngameChat('Called Attitudes');
				
				Dip_Resort();
				
				--debugIngameChat('Called Dup Resort');
				
			end;
		end;

		local ms = 0;
		local ss = 0;
		if DATA.SIDE1+1 == mySide then
			ms = DATA.SIDE1+1;
			ss = DATA.SIDE2+1;
		end;
							--- 2 < 0 < 1
		--debugIngameChat(ms .. ' ' .. ss);
		if ms == mySide and DATA.STATE+1 ~= MULTI_ATTITUDESINFO_CURRENT[ms][ss] then
			--debugIngameChat(DATA.STATE+1 .. ' ' .. MULTI_ATTITUDESINFO_CURRENT[ms][ss]);
			local nppp = {1,2,0};
			local newState = nppp[DATA.STATE+1];
			local oldState = nppp[MULTI_ATTITUDESINFO_CURRENT[ms][ss]+1]
			if newState ~= nil and oldState ~= nil then
				if newState < oldState and IdeclareIt == false then
					if oldState == 1 then
						local req =  addAnswer(3,getText(DipSides.SideCards[ss].Name),ss);
						AddEventWidth(allRequests[req].Progress.ID,0,10,'autoReject('..req..');');
					elseif oldState == 2 then
						local req =  addAnswer(4,getText(DipSides.SideCards[ss].Name),ss);
						AddEventWidth(allRequests[req].Progress.ID,0,10,'autoReject('..req..');');
					end;
					IdeclareIt = false;
				elseif oldState < newState and WaitForAnswer[ss] then
				-- IDK why, but this fuck up isn't work
					local req =  addAnswer(1,getText(DipSides.SideCards[ss].Name),ss);
					AddEventWidth(allRequests[req].Progress.ID,0,10,'autoReject('..req..');');
					WaitForAnswer[ss] = nil;

				end;
				OW_MULTI_GET_ATTITUDES();
			else
				--debugIngameChat('some nil    newState is ' .. newState .. '   and old state is' .. oldState);
			end;


		end;
	end;
end;

function display_diplomacy()
	OW_MULTI_GET_ATTITUDES();
	Dip_Resort()
--	setVisible(dialog.diplomacy,true);
--	setVisible(dialog.back,true);
	ShowDialog(dialog.diplomacy);

end;

--OW_MULTI_GET_ATTITUDES();
MULTI_ATTITUDESINFO_CURRENT = {};
function FROMOW_MULTI_ATTITUDES(DATA,ALLIED_VICTORY)
--Attitudes is a 2D Array so, DATA[1][1] or DATA[1,1] (At least i think lua can do the 2nd syntax example). As its lua 1 = 0. As the neutral side actually can be hostile/friendly to other sides (At least the attitudes array can have them being different states).

	MULTI_ATTITUDESINFO_CURRENT = DATA;
	setChecked(dialog.diplomacy.alliedVictory,ALLIED_VICTORY);
	--setChatGroups(DATA)
end;


function SetAlliedVictory(bool)
	if getChecked(dialog.diplomacy.alliedVictory) then
		OW_MULTI_DIPLOMACY_SET_ALLIEDVICTORY_STATE(1);
	else
		OW_MULTI_DIPLOMACY_SET_ALLIEDVICTORY_STATE(0);
	end;
end;

function FROMOW_PLAYERNOWSPECTATOR(PLAYERID)
	MULTI_PLAYERINFO_CURRENT_PLID[PLAYERID].ISPEC = true;
	if PLAYERID == MyID then
		iSpec = true;
		setChatPool(3);
		setVisible(game.chat.CheckersArea,false);
	end;
	
	DipSides.SideCards[MULTI_PLAYERINFO_CURRENT_PLID[PLAYERID].COLOUR+1].IsSpec = true;
	Dip_Resort();

end;