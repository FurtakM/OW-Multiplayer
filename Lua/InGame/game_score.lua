
inGameScore = {};
inGameScore.Inited = false;
inGameScore.Icons = {
	[1] = 'sib',
	[2] = 'king',
	[3] = 'flag',
	[4] = 'football',
	[5] = 'hunt',
	[6] = 'wheel',
	[7] = 'night',
	[8] = 'time',
	[9] = 'amer',
	[10] = 'arab',
	[11] = 'rus',
	[12] = 'ally',
	[13] = 'leg',
	[14] = 'reb'
};
inGameScore.Rows = {};
inGameScore.Font = Tahoma_12B;
inGameScore.offSet = {
	width = 430,
	X = 75,
	Y = 28
};


inGameScore.ScoreArea = getElementEX(game,
	anchorLT,
	XYWH(
		inGameScore.offSet.X,
		inGameScore.offSet.Y,
		inGameScore.offSet.width,
		27			--24
	),
	true,
	{
		nomouseevent=true,
		colour1=BLACKA(0),
});

function resetScorebar()
	sgui_deletechildren(inGameScore.ScoreArea.ID);
	inGameScore.Rows = {};
	inGameScore.Inited  = false;
end;

function initScore(sides,ifPScore,yourSide,lockTeam)

	if not LockedTeams and lockTeam then
		LockedTeams = true;
		--initalizeDiplomacy();
	end;
	
	resetScorebar();

	inGameScore.Sides = {};
	inGameScore.Sides = sides;
	local total = 0;
	for k, v in pairs(sides) do
		if v == 1 then
			total = total +1;
		end;
	end;
	inGameScore.Total=total;
	
	if ifPScore == 1 then
		inGameScore.Public = true;
	else
		inGameScore.Public = false;
	end;
	inGameScore.You = yourSide;
	if DeveloperMode then
		inGameScore.offSetY = 20;
	else
		inGameScore.offSetY = 0;
	end;
	
	--517
	local x = interface.current.game.ui.toolBar.X;
	--local x = getX(game.ui.toolbar) + getWidth(game.ui.toolbar);
	local w = ScrWidth - x - interface.current.game.ui.resbar.width;
	local y = 0;
	
	if w < inGameScore.offSet.width then
		x=inGameScore.offSet.X;
		y=inGameScore.offSet.Y;
		w=inGameScore.offSet.width;
	end;
	
	setXYWHV(inGameScore.ScoreArea,x,y,w,27);
	inGameScore.Inited  = true;
end;


function getSailBool(item)
	if item == 0 or item == false then
		item = false;
	else
		item = true;
	end;
	return item;
end


function deleteScore(id)
	if not inGameScore.Rows[id] then
		return false;
	end;

	local thisH = getHeight(inGameScore.Rows[id]) +1;
	local thisOffSet = inGameScore.Rows[id].IGSOffSetY;

	for k, v in pairs(inGameScore.Rows) do
--		if v then
--			if not k == id then
				if v.IGSOffSetY > thisOffSet then
					v.IGSOffSetY = v.IGSOffSetY - thisH;
					setY(v, v.IGSOffSetY);
--					sgui_delete(v.ID);
				end;
--			end;
--		end;
	end;

	sgui_deletechildren(inGameScore.Rows[id].ID);
	sgui_delete(inGameScore.Rows[id].ID);
	inGameScore.Rows[id]= nil;
end;
-----------------------------------------------------------------------------------------------------------------------  Timer
--- can call AddScoreTimer(ID,TYPE,TOTALTIME);  automaticly set show_total to 0, and currentTime on 0
--- note, send time in seconds
function AST(id,type,totalTime,show_total,currentTime)
	addScoreTimer(id,type,totalTime,show_total,currentTime)
end;

function addScoreTimer(id,type,totalTime,show_total,currentTime)
	if not currentTime then
		currentTime = 0;
	end;
	if not show_total then
		show_total = 0;
	end;
	createScoreTimer(id,type,totalTime,currentTime,0,show_total);
end;
--- can call AddScoreTimer(ID,TYPE,TOTALTIME);  automaticly set show_total to 0, and currentTime on totalTime
--- note, send time in seconds
function ASRT(id,type,totalTime,show_total,currentTime)
	addScoreReversedTimer(id,type,totalTime,show_total,currentTime)
end;

function addScoreReversedTimer(id,type,totalTime,show_total,currentTime)
	if not currentTime then
		currentTime = totalTime;
	end;
	if not show_total then
		show_total = 0;
	end;
	createScoreTimer(id,type,totalTime,currentTime,1,show_total);
end;

function createScoreTimer(id,typ,totalTime,currentTime,reverse,showTotalTime)
	if not inGameScore.Inited then
		return false;
	end;

	if not currentTime then
		currentTime = totalTime;
	end;
	
	if type(typ) == "number" then
		typ = inGameScore.Icons[typ];
	end;
	
	currentTime = math.max(0,math.min(currentTime,totalTime));
	
	local row = getElementEX(inGameScore.ScoreArea,
		anchorLT,
		XYWH(
			0,
			inGameScore.offSetY,
			getWidth(inGameScore.ScoreArea),
			14
		),
		true,
		{
			nomouseevent=true,
			colour1=BLACKA(50),
	});
	row.r = getSailBool(reverse);
	row.sT = getSailBool(showTotalTime);

	local tex = 'SGUI/icons/empty.png';
	if typ then
		tex = 'SGUI/icons/' .. typ .. '.png';
	end;
	
	row.icon = getElementEX(row,
		anchorLT,
		XYWH(
			0,
			0,
			14,
			14
		),
		true,
		{
			nomouseevent=true,
			colour1=SIDE_COLOURS[inGameScore.You+1],
			texture=tex,
	});

	row.timeArea = getElementEX(row,
		anchorLT,
		XYWH(
			15,
			1,
			row.width-80-15,
			12
		),
		true,
		{
			nomouseevent=true,
			colour1=BLACKA(50),
	});
	
	
	row.rightTime = getLabelEX(row,
		anchorLT,
		XYWH(
			row.width-80,
			1,
			80,
			12
		),
		inGameScore.Font,--Tahoma_10,
		getTime(totalTime/10),
		{
			shadowtext = true,
			font_colour = WHITEA(200),
			text_halling = ALIGN_MIDDLE,
			text_valling = ALIGN_MIDDLE
	});

	row.timeAW = row.timeArea.width;
	row.nTime = totalTime;

	row.slider = getElementEX(row.timeArea,
	anchorLT,
	XYWH(
		0,
		0,
		(row.timeAW/totalTime)*currentTime,
		12
	),
	true,
	{
		colour1 = SIDE_COLOURS[inGameScore.You+1],
		hint = points,
		tile=true,
		texture= 'SGUI/scoreBar.png'
	});
	if getSailBool(showTotalTime) then
		row.leftTime = getLabelEX(row.timeArea,
			anchorLT,
			XYWH(
				0,
				1,
				row.timeAW,
				12
			),
			inGameScore.Font,--Tahoma_10,
			getTime(currentTime/10),
			{
				shadowtext = true,
				font_colour = WHITEA(255),
				text_halling = ALIGN_MIDDLE,
				text_valling = ALIGN_MIDDLE
		});
	end;
	row.IGSOffSetY = inGameScore.offSetY
	row.height = 15;
	inGameScore.Rows[id] = row;
	inGameScore.offSetY = inGameScore.offSetY + 15;
end;

-- totalTime only when you want to change it
function UST(id,currentTime,totalTime)
	updateScoreTimer(id,currentTime,totalTime)
end;

function updateScoreTimer(id,currentTime,totalTime)
	if not inGameScore.Rows[id] then
		return false;
	end;
	local row = inGameScore.Rows[id];
	if totalTime then
		row.nTime = totalTime;
	end;
	currentTime = math.max(0,math.min(currentTime,row.nTime));

	if row.sT then
		setText(row.leftTime, getTime(currentTime/10) );
		if totalTime then
			setText(row.rightTime, getTime(totalTime/10) );
		end;
	else
		setText(row.rightTime, getTime(currentTime/10) );
	end;
	if row.r then
		setWidth(row.slider,(row.timeAW/row.nTime)*(row.nTime-currentTime) );
	else
		setWidth(row.slider,(row.timeAW/row.nTime)*currentTime);
	end;
end;

function CCST(ID,COLOUR)
	changeColorScoreTimer(ID,COLOUR);
end;

function changeColorScoreTimer(id,colour)
	if not inGameScore.Rows[id] then
		return false;
	end;
	local row = inGameScore.Rows[id];
	if type(colour) == "number" then
		if colour < 1 or colour > 8 then
			colour = 0;
		end;
		colour = SIDE_COLOURS[colour+1];
	else
		colour[1] = math.max(0,math.min(colour[1],255));
		colour[2] = math.max(0,math.min(colour[2],255));
		colour[3] = math.max(0,math.min(colour[3],255));
		colour = RGB(colour[1],colour[2],colour[3]);
	end;
	
	setColour1(row.slider,colour);
	setColour1(row.icon,colour);
end;
-------------------------------------------------------------------------------------------------------------  Single points Bar
--- current automatic 0, reverse 0
function ASSP(id,type,totalPoint,show_total, currentPoints)
	addScoreSinglePoints(id,type,totalPoint,currentPoints,0,show_total);
end;

function ASRSP(id,type,totalPoint,show_total,currentPoints)
	addScoreSinglePoints(id,type,totalPoint,currentPoints,1,show_total);
end;

function addScoreSinglePoints(id,type,totalPoints,currentPoints,reverse,showTotalPoints)
	if not showTotalPoints then
		showTotalPoints = 1;
	end;
	if not currentPoints then
		currentPoints = 0;
	end;
	if not reverse then
		reverse = 0;
	end;
	createScoreSinglePoints(id,type,totalPoints,currentPoints,reverse,showTotalPoints);
end;

function createScoreSinglePoints(id,typ,totalPoints,currentPoints,reverse,showTotalPoints)
	if not inGameScore.Inited then
		return false;
	end;

	if not currentPoints then
		currentPoints = 0;
	end;
	
	if type(typ) == "number" then
		typ = inGameScore.Icons[typ];
	end;
	
	currentPoints = math.max(0, math.min(currentPoints,totalPoints) );
	
	local row = getElementEX(inGameScore.ScoreArea,
		anchorLT,
		XYWH(
			0,
			inGameScore.offSetY,
			getWidth(inGameScore.ScoreArea),
			14
		),
		true,
		{
			nomouseevent=true,
			colour1=BLACKA(50),
	});
	row.r = getSailBool(reverse);
	row.sT = getSailBool(showTotalPoints);

	local tex = 'SGUI/icons/empty.png';
	if typ then
		tex = 'SGUI/icons/' .. typ .. '.png';
	end;
	
	row.icon = getElementEX(row,
		anchorLT,
		XYWH(
			0,
			0,
			14,
			14
		),
		true,
		{
			nomouseevent=true,
			colour1=SIDE_COLOURS[inGameScore.You+1],
			texture=tex,
	});

	row.pointsArea = getElementEX(row,
		anchorLT,
		XYWH(
			15,
			1,
			row.width-50-15,
			12
		),
		true,
		{
			nomouseevent=true,
			colour1=BLACKA(50),
	});
	
	
	row.rightPoints = getLabelEX(row,
		anchorLT,
		XYWH(
			row.width-50,
			1,
			50,
			12
		),
		inGameScore.Font,--Tahoma_10,
		totalPoints,
		{
			shadowtext = true,
			font_colour = WHITEA(200),
			text_halling = ALIGN_MIDDLE,
			text_valling = ALIGN_MIDDLE
	});

	row.pointsAW = row.pointsArea.width;
	row.nPoints = totalPoints;

	row.slider = getElementEX(row.pointsArea,
	anchorLT,
	XYWH(
		0,
		0,
		(row.pointsAW/totalPoints)*currentPoints,
		12
	),
	true,
	{
		colour1 = SIDE_COLOURS[inGameScore.You+1],
		hint = points,
		tile=true,
		texture= 'SGUI/scoreBar.png'
	});
	if getSailBool(showTotalPoints) then
		row.leftTime = getLabelEX(row.pointsArea,
			anchorLT,
			XYWH(
				0,
				1,
				row.timeAW,
				12
			),
			inGameScore.Font,--Tahoma_10,
			currentPoints,
			{
				shadowtext = true,
				font_colour = WHITEA(255),
				text_halling = ALIGN_MIDDLE,
				text_valling = ALIGN_MIDDLE
		});
	end;

	row.IGSOffSetY = inGameScore.offSetY + 15
	row.height = 15;
	inGameScore.Rows[id] = row;
	inGameScore.offSetY = inGameScore.offSetY + 15;
end;

-- totalTime only when you want to change it
function USSP(id,currentPoints,totalPoints)
	updateScoreSinglePoints(id,currentPoints,totalPoints);
end;

function updateScoreSinglePoints(id,currentPoints,totalPoints)
	if not inGameScore.Rows[id] then
		return false;
	end;
	local row = inGameScore.Rows[id];
	if row.sT then
		setText(row.leftPoints,currentPoints );
		if totalPoints then
			setText(row.rightPoints, currentPoints );
			row.nTime = totalPoints;
		end;
	else
		setText(row.rightPoints, currentPoints );
		if totalPoints then
			row.nPoints = totalPoints;
		end;
	end;
	if row.r then
		setWidth(row.slider,(row.pointsAW/row.nPoints)*(row.nPoints-currentPoints) );
	else
		setWidth(row.slider,(row.pointsAW/row.nPoints)*currentPoints);
	end;
end;

function CCSSP(id,colour)
	changeColorScoreSinglePoints(id,colour);
end;

function changeColorScoreSinglePoints(id,colour)
	if not inGameScore.Rows[id] then
		return false;
	end;
	local row = inGameScore.Rows[id];
	if type(colour) == "number" then
		if colour < 1 or colour > 8 then
			colour = 0;
		end;
		colour = SIDE_COLOURS[colour+1];
	else
		colour[1] = math.max(0,math.min(colour[1],255));
		colour[2] = math.max(0,math.min(colour[2],255));
		colour[3] = math.max(0,math.min(colour[3],255));
		colour = RGB(colour[1],colour[2],colour[3]);
	end;
	
	setColour1(row.slider,colour);
	setColour1(row.icon,colour);
end;
--------------------------------------------------------------------------------------------------------------  Multi Points Bar
function ASP(id,typ,goal)
	addScorePoints(id,typ,goal)
end;

function addScorePoints(id,typ,goal)
	if not inGameScore.Inited then
		return false;
	end;

	if type(typ) == "number" then
		typ = inGameScore.Icons[typ];
	end;

	local hRow = 26;
	if inGameScore.Total > 4 then
		hRow = 45;
	elseif inGameScore.Total > 7 then
		hRow = 50;
	end;

	local row = getElementEX(inGameScore.ScoreArea,
		anchorLT,
		XYWH(
			0,
			inGameScore.offSetY,
			getWidth(inGameScore.ScoreArea),
			hRow			--24
		),
		true,
		{
			nomouseventthis=true,
			colour1=BLACKA(50),
	});

	local tex = 'SGUI/icons/empty.png';
	if typ then
		tex = 'SGUI/icons/' .. typ .. '.png';
	end;
	
	row.icon = getElementEX(row,
		anchorLT,
		XYWH(
			1,
			hRow/2 - 12,
			24,
			24
		),
		true,
		{
			nomouseevent=true,
			colour1=SIDE_COLOURS[inGameScore.You+1],
			texture=tex,
	});
	
	row.pointsArea = getElementEX(row,
		anchorLT,
		XYWH(
			26,
			1,
			row.width-26-50,
			hRow			--24
		),
		true,
		{
			nomouseevent=true,
			colour1=BLACKA(50),
	});
	
	row.goal = getLabelEX(row,
		anchorLT,
		XYWH(
			row.width-50,
			1,
			48,
			hRow
		),
		inGameScore.Font,--Tahoma_10,
		goal,
		{
			shadowtext = true,
			font_colour = WHITEA(200),
	});
	row.sides = {};

	if inGameScore.Public then
		local h = 0;
		if inGameScore.Total ~= 0 then
			h = hRow/inGameScore.Total;
		end;
		local current = 1;
		for k,v in pairs(inGameScore.Sides) do
			if v == 1 then
				row.sides[k] = getElementEX(row.pointsArea,
					anchorLT,
					XYWH(
						0,
						h*(current-1),
						0,
						h
					),
					true,
					{
						colour1 = SIDE_COLOURS[k+1],
						hint = points,
--						tile=true,
						texture= 'SGUI/scoreBar.png',
						nomouseventthis = false,
						subtexture=true,
						subcoords=SUBCOORD(0,h*(current-1),570,h),
				});
				
				current = current +1;
			end;
		end;
	else
		row.sides[inGameScore.You] = getElementEX(row.pointsArea,
			anchorLT,
			XYWH(
				0,
				0,
				0,
				hRow
			),
			true,
			{
				colour1 = SIDE_COLOURS[inGameScore.You+1],
				hint = points,
		});

	end;
	row.maxWidth = row.pointsArea.width;
	row.nGoal = goal;

	row.firstLine= getElementEX(row,
		anchorLT,
		XYWH(
			25,
			0,
			1,
			hRow
		),
		true,
		{
			nomouseevent=true,
			colour1=WHITEA(255),
	});

	row.lastLine = getElementEX(row,
		anchorLT,
		XYWH(
			25+row.maxWidth,
			0,
			1,
			hRow
		),
		true,
		{
			nomouseevent=true,
			colour1=WHITEA(255),
	});

	local piece = 1;
	if goal < 100 and goal > 20 then
		piece = 10;
	elseif goal < 400 then
		piece = 50;
	elseif goal < 1001 then
		piece = 150;
	elseif goal < 3001 then
		piece = 500;
	elseif goal < 10001 then
		piece = 1000;
	end;
	local pieces = div(goal,piece);
	
	if goal == piece * pieces then
		pieces = pieces -1 ;
	end;
	
	row.Pieces ={};
	local line = 1;
	for i =1, pieces do
		row.Pieces[i] = getElementEX(row.pointsArea,
			anchorLT,
			XYWH(
				0+row.pointsArea.width * (100/goal*((goal/ pieces * line)/100)),
				2,
				1,
				hRow-4
			),
			true,
			{
				nomouseevent=true,
				colour1=WHITEA(255),
		});
		line = line +1;
	end;

	row.IGSOffSetY = inGameScore.offSetY
	row.height = hRow+1;
	inGameScore.Rows[id] = row;
	inGameScore.offSetY = inGameScore.offSetY + hRow+1;
end;

function USPA(id,points)
	for i=1, 8 do
		USP(id,i,points[i]);
	end;
end;

function USP(id,side,points)
	updateScorePoints(id,side,points)
end;

function updateScorePoints(id,side,points)
	if not inGameScore.Rows[id] then
		return false;
	end;
	
	local goal = inGameScore.Rows[id].nGoal;
	local maxW = inGameScore.Rows[id].maxWidth;
	local rowPoints = inGameScore.Rows[id].sides[side];
	if rowPoints then
		if points == 0 then
			setWidth(inGameScore.Rows[id].sides[side],0);
		elseif points > 0 then
			local w = maxW * ((100/ goal * points  )/100);
			if w > maxW then 
				w = maxW;
			end;
			setX(inGameScore.Rows[id].sides[side],0);
			setWidth(inGameScore.Rows[id].sides[side],w);
			setHint(inGameScore.Rows[id].sides[side],points);
			setSubCoords(inGameScore.Rows[id].sides[side],SUBCOORD(0, inGameScore.Rows[id].sides[side].y, w ,inGameScore.Rows[id].sides[side].height))
		elseif points < 0 then
			local w = maxW * ((100/ goal * (points*-1))/100);
			if w > maxW then 
				w = maxW;
			end;
			setX(inGameScore.Rows[id].sides[side],maxW-w);
			setWidth(inGameScore.Rows[id].sides[side],w);
			setHint(inGameScore.Rows[id].sides[side],points);
			setSubCoords(inGameScore.Rows[id].sides[side],SUBCOORD(maxW - w , inGameScore.Rows[id].sides[side].y, w ,inGameScore.Rows[id].sides[side].height))
		end;
		

	end;

end;

---------------------------------------------------------------------------------------------------------------  Pieces
function ASC(id,typ,goal,total)
	addScorePieces(id,typ,goal,total);
end;

function addScorePieces(id,typ,goal,total)
	if not inGameScore.Inited then
		return false;
	end;

	if type(typ) == "number" then
		typ = inGameScore.Icons[typ];
	end;

	local row = getElementEX(inGameScore.ScoreArea,
		anchorLT,
		XYWH(
			0,
			inGameScore.offSetY,
			getWidth(inGameScore.ScoreArea),
			18			--24
		),
		true,
		{
			nomouseevent=true,
			colour1=BLACKA(50),
	});
	
	local tex = 'SGUI/icons/empty.png';
	if typ then
		tex = 'SGUI/icons/' .. typ .. '.png';
	end;
	
	row.icon = getElementEX(row,
		anchorLT,
		XYWH(
			1,
			1,
			18,
			18			--24
		),
		true,
		{
			nomouseevent=true,
			colour1=SIDE_COLOURS[inGameScore.You+1],
			texture= tex,
	});
	
	row.pointsArea = getElementEX(row,
		anchorLT,
		XYWH(
			19,
			1,
			row.width-19-30,
			18			--24
		),
		true,
		{
			nomouseevent=true,
			colour1=BLACKA(70),
	});

	local wp = row.pointsArea.width / total;
	row.pieces = {};
	for i=1, total do
		if i == goal then
			row.goalLine = getElementEX(row.pointsArea,
				anchorLT,
				XYWH(
					wp*(i)-1,
					-1,
					3,
					18
				),
				true,
				{
					nomouseevent=true,
					colour1=WHITEA(255),
			});
		end;
		
		local TX = i*(wp-1);

		row.pieces[i] = getElementEX(row.pointsArea,
			anchorLT,
			XYWH(
				1+wp*(i-1),
				1,
				wp-1,
				16			--24
			),
			true,
			{
				nomouseevent=true,
				colour1=SIDE_COLOURS[1],
--				tile=true,
				texture= 'SGUI/scoreBar.png',
				subtexture=true,
				subcoords=SUBCOORD(TX,0,wp-1,24)
		});
		
	end;
	
	row.goal = getLabelEX(row,
		anchorLT,
		XYWH(
			row.width-30,
			1,
			28,
			16
		),
		inGameScore.Font,--Tahoma_10,
		goal,
		{
			shadowtext = true,
			font_colour = WHITEA(200),
	});
	row.Total = total;
	
	row.IGSOffSetY = inGameScore.offSetY
	row.height = 19;
	inGameScore.Rows[id] = row;
	inGameScore.offSetY = inGameScore.offSetY + 19;

end;

function USC(id,sidePoints)
	updateScorePieces(id,sidePoints)
end;

function updateScorePieces(id,sidePoints)
	if not inGameScore.Rows[id] then
		return false;
	end;
	local row = inGameScore.Rows[id];
	if inGameScore.Public then
		local sort = copytable(sidePoints);
		local sort = getKeysSortedByValue(sort, function(a, b) return a > b end);
		
		local localPoints = {};
		
		for _,k in pairs(sort) do
			for i=1, sidePoints[k] do
				localPoints[table.getn(localPoints)+1] = k;
			end;
		end;
		
		for i=1, row.Total do
			if localPoints[i] and localPoints[i] > 0 then
				setColour1(row.pieces[i],SIDE_COLOURS[localPoints[i]+1]);
			else
				setColour1(row.pieces[i],SIDE_COLOURS[1]);
			end;
		end;

	else
		for i=1, row.Total do
			if sidePoints[inGameScore.You] >= i then
				setColour1(row.pieces[i],SIDE_COLOURS[inGameScore.You+1]);
			else
				setColour1(row.pieces[i],SIDE_COLOURS[1]);
			end;
		end;
	end;
	
	
end;

---------------------------------------------------------------------------------------------------   Add score target Goal
function addScoreTargetGoal(id,type,goals,total)
	if not inGameScore.Inited then
		return false;
	end;

	local row = getElementEX(inGameScore.ScoreArea,
		anchorLT,
		XYWH(
			0,
			inGameScore.offSetY,
			getWidth(inGameScore.ScoreArea),
			26			--24
		),
		true,
		{
			nomouseevent=true,
			colour1=BLACKA(50),
	});
	
	local tex = 'SGUI/icons/empty.png';
	if inGameScore.Icons[type] then
		tex = 'SGUI/icons/' .. inGameScore.Icons[type] .. '.png';
	end;

end;