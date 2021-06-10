game=AddElement({
	type=TYPE_ELEMENT,
	anchor=anchorLTRB,
	x=0,
	y=0,
	width=LayoutWidth,
	height=LayoutHeight,
	colour1=BLACK(),--A(0),
	visible=false,
	nomouseeventthis=true,
});  

gamewindow=AddElement({
	type=TYPE_ELEMENT,
	parent=game,
	anchor=anchorLT,
	x=0,
	y=0,
	width=LayoutWidth,
	height=LayoutHeight,
	colour1=WHITEA(0),
	texture_blend=false,
	--nomousevent=true,
	--nomouseeventthis=true,
	--visible=false,
});

gamewindow.overlaystatic = getElementEX(gamewindow,anchorLTRB,XYWH(0,0,LayoutWidth,LayoutHeight),true,{nomouseevent=true,colour1=BLACKA(0)});

gamewindow.overlay = getElementEX(gamewindow.overlaystatic,anchorLT,XYWH(0,0,0,0),true,{nomouseevent=true,colour1=BLACKA(0)});
gamewindow.overlay.time = 0;

function gamewindow.overlay.onTick(FRAMETIME)
	if getVisible(game) then
		gamewindow.overlay.time = gamewindow.overlay.time + FRAMETIME;
	        if gamewindow.overlay.time >= 1/60 then
			gamewindow.overlay.time = 0;
			local MVR = OW_GETMVRXY();
			setXY(gamewindow.overlay,-MVR.X,-MVR.Y);
        	end;
        end;
end;

regTickCallback('gamewindow.overlay.onTick(%frametime)');

gamewindow.pause=AddElement({
	type=TYPE_LABEL,
	parent=gamewindow,
	anchor=anchorLTRB,
	x=0,
	y=0,
	width=gamewindow.width,
	height=gamewindow.height,
	nomousevent=true,
	nomouseeventthis=true,
	visible=false,
	font_name=Trebuchet_30,
	text=loc(TID_msg_GamePaused),
	text_halign=ALIGN_MIDDLE,
	shadowtext=true,
	text_case=CASE_UPPER,
	font_colour=RGB(255,255,255),
});

OW_SETPAUSELABEL(gamewindow.pause.ID);

game.xicht=AddElement({
	type=TYPE_ELEMENT,
	parent=gamewindow,
	anchor=anchorLT,
	x=10,
	y=85+30,
	width=80,
	height=100,
	--colour1=WHITEA(0),
	texture_blend=false,
	nomousevent=true,
	nomouseeventthis=true,
	visible=false,
});

game.xicht.say=AddElement({
	type=TYPE_LABEL,
	parent=gamewindow,
	anchor=anchorLT,
	x=7,
	y=elementBottom(game.xicht)+2,
	width=550,
	height=15,
	font_colour_background=BLACKA(OW_GSETTING_READ_NUMBER(getvalue(OWV_USERNAME), 'GS_subBG', 127)),--BLACKA(127),
	font_name=Tahoma_13,
	text='',
	text_halign=ALIGN_LEFT,
	text_valign=ALIGN_TOP,
	wordwrap=true,
	nomousevent=true,
	nomouseeventthis=true,
	visible=false,
	automaxwidth=550,
	autosize=true,
	shadowtext=true,
});

game.ui = AddElement({
	type=TYPE_ELEMENT,
	parent=game,
	anchor=anchorLTRB,
	x=0,
	y=0,
	width=LayoutWidth,
	height=LayoutHeight,
	colour1=BLACKA(0),
	nomouseeventthis=true,
});


game.ui.toolbar = AddElement({
	type=TYPE_ELEMENT,
	parent=game.ui,
	anchor=anchorLT,
	x=0,
	y=0,
	width=517,
	height=54,
--        nomouseeventthis=true,
});

uisettings = interface.current.game.ui;

function OnToolbarClick(ID)
         switch(ID) : caseof {
			[1]   = function (x) OW_TOOLBARBUTTON(ID); end, -- Menu
			[2]   = function (x) end,          -- Team Review
			[3]   = function (x) if getvalue(OWV_MULTIPLAYER) then display_diplomacy(); else OW_TOOLBARBUTTON(ID); end; end, -- Objectives / Diplomacy
			[4]   = function (x) dialog.options.Show(); end, -- Options
			[5]   = function (x) end, -- Help
			[6]   = function (x) showIGAchievs() end,
		      }
end;

function makeToolbarButton(ID)
	return AddElement({
		type=TYPE_IMAGEBUTTON,
		parent=game.ui.toolbar,
		anchor=anchorLT,
		x=uisettings.toolBtns[1]+(ID-1)*uisettings.toolBtns[5],
		y=uisettings.toolBtns[2],
		width=uisettings.toolBtns[3],
		height=uisettings.toolBtns[4],
		text='',
		callback_mouseclick='OnToolbarClick('..ID..');',
	});
end;

game.ui.toolbtns = {};

for i=1,6 do
 game.ui.toolbtns[i] = makeToolbarButton(i);
end;

game.ui.toolbar.pause = AddElement({
	type=TYPE_IMAGEBUTTON,
	parent=game.ui.toolbar,
	anchor=anchorLT,
	x=0,
	y=0,
	width=0,
	height=0,
	callback_mouseclick='OW_PAUSE();',
	text='',
	hint=loc(TID_Game_window_button_Pause),
});

game.ui.minimap = getBlankElement(game.ui,anchorRB);

game.ui.minimap.map     = getBlankElementA(game.ui.minimap,anchorRB);
game.ui.minimap.map.img = getBlankElement(game.ui.minimap.map,anchorNone);

MMLeft = False;

function MinimapDown(X,Y,B)
	OW_MINIMAP_CLICK(X,Y,B);
	if (B == 0) then
		MMLeft = true;
                set_Callback(game.ui.minimap.map.img.ID,CALLBACK_MOUSEUPANY,'MinimapUp(%b)');
	end;
end;

function MinimapMove(X,Y)
	if (MMLeft) then
		OW_MINIMAP_CLICK(X,Y,0);
	end;
end;

function MinimapUp(B)
	if (B == 0) then
		MMLeft = false;
                set_Callback(game.ui.minimap.map.img.ID,CALLBACK_MOUSEUPANY,'');
	end;
end;

set_Callback(game.ui.minimap.map.img.ID,CALLBACK_MOUSEDOWN,'MinimapDown(%x,%y,%b)');
set_Callback(game.ui.minimap.map.img.ID,CALLBACK_MOUSEMOVE,'MinimapMove(%x,%y)');
--set_Callback(game.ui.minimap.map.img.ID,CALLBACK_MOUSEUPANY,'MinimapUp(%b)');
set_Property(game.ui.minimap.map.img.ID,PROP_BORDER_TYPE,BORDER_TYPE_OUTER);

function MakeMinimapCorner(I,X,Y)
	return AddElement({
		type=TYPE_ELEMENT,
		parent=game.ui.minimap.map.img,
		anchor=anchorLT,
		x=0,
		y=0,
		width=6,
		height=6,
		visible=false,
		texture='SGUI/minimap_corners.png',
		subtexture=true,
		subcoords=SUBCOORD(X,Y,6,6),
		nomouseevent=true,
	});
end;

game.ui.minimap.map.img.corners = {};

game.ui.minimap.map.img.corners[1] = MakeMinimapCorner(1,1,1);
game.ui.minimap.map.img.corners[2] = MakeMinimapCorner(2,9,1);
game.ui.minimap.map.img.corners[3] = MakeMinimapCorner(3,1,9);
game.ui.minimap.map.img.corners[4] = MakeMinimapCorner(4,9,9);

game.ui.infopanel = getBlankElement(game.ui,anchorLB);

game.ui.commpanel  = getBlankElementA(game.ui,anchorLB);
game.ui.commpanel1 = getBlankElement(game.ui.commpanel,anchorLT);

game.ui.commpanel1.undo  = getImageButtonEX(game.ui.commpanel1,anchorLB,XYWH(20,0,31,17),'','','OW_SEL_UNDOREDO(true)',SKINTYPE_TEXTURE,{SKINTEXTURE='SelectionUndo.png',hint=loc(TID_ui_comm_bt_hint_SelectionUndo)});
game.ui.commpanel1.redo  = getImageButtonEX(game.ui.commpanel1,anchorLB,XYWH(20,0,31,17),'','','OW_SEL_UNDOREDO(false)',SKINTYPE_TEXTURE,{SKINTEXTURE='SelectionRedo.png',hint=loc(TID_ui_comm_bt_hint_SelectionRedo)});
game.ui.commpanel1.speed = AddSkinnedElement(addSliderElement(game.ui.commpanel1, anchorNone, XYWH(0,0,90+10+16+16,16), 0, 6, 0, '', 'OW_set(SETTING_SPEED,game.ui.commpanel1.speed.POS+1)'),SKINTYPE_SLIDERINT);

setHint(game.ui.commpanel1.speed.bar,loc(TID_Other_SpeedBar));

game.ui.commpanel2 = getBlankElement(game.ui.commpanel,anchorLT);
game.ui.commpanel2.chassis  = makeCombobox_UI(game.ui.commpanel2,XYWH(0,0,120,16),'OW_COMMCOMBOS_INDEXCHANGE(0);');
game.ui.commpanel2.engine = makeCombobox_UI(game.ui.commpanel2,XYWH(0,0,120,16),'OW_COMMCOMBOS_INDEXCHANGE(1);');
game.ui.commpanel2.control = makeCombobox_UI(game.ui.commpanel2,XYWH(0,0,120,16),'OW_COMMCOMBOS_INDEXCHANGE(2);');
game.ui.commpanel2.weapon  = makeCombobox_UI(game.ui.commpanel2,XYWH(0,0,120,16),'OW_COMMCOMBOS_INDEXCHANGE(3);');
game.ui.commpanel3 = getBlankElement(game.ui.commpanel,anchorLT);
game.ui.commpanel3.weapon  = makeCombobox_UI(game.ui.commpanel3,XYWH(0,0,120,16),'OW_COMMCOMBOS_INDEXCHANGE(4);');

OW_COMMCOMBOS_SETUP(game.ui.commpanel2.chassis.list.ID,game.ui.commpanel2.engine.list.ID,game.ui.commpanel2.control.list.ID,game.ui.commpanel2.weapon.list.ID,game.ui.commpanel3.weapon.list.ID);

setHint(game.ui.commpanel2.chassis.label,loc(TID_Factory_Chassis_Select));
setHint(game.ui.commpanel2.engine.label,loc(TID_Factory_Engine_Select));
setHint(game.ui.commpanel2.control.label,loc(TID_Factory_Control_Select));
setHint(game.ui.commpanel2.weapon.label,loc(TID_Factory_Weapon_Select));
setHint(game.ui.commpanel3.weapon.label,loc(TID_Factory_Weapon_Select));

function makeCommButton(CID)
	return AddElement({
		type=TYPE_SPRITEMAPBUTTONS,
		parent=game.ui.commpanel,
		anchor=anchorLT,
		x=uisettings.commBtns[1]+math.mod(CID,3)*(uisettings.commBtns[3]),
		y=uisettings.commBtns[2]+math.floor(CID/3)*(uisettings.commBtns[4]),
		width=uisettings.commBtns[3],
		height=uisettings.commBtns[4],
		text='',
		--callback_mouseclick='OW_COMMBUTTON('..CID..');',
		visible=false,
	});
end;

game.ui.commpanel.buttons = {};

for c = 1, 9 do
	game.ui.commpanel.buttons[c] = makeCommButton(c-1);
	OW_COMMBUTTON_SETUP(c-1,game.ui.commpanel.buttons[c].ID);
end;

game.ui.facepanel  = getBlankElementA(game.ui,anchorLB);

game.ui.facepanelL = getBlankElementNoMouse(game.ui.facepanel,anchorLT);
game.ui.facepanelM = getBlankElementNoMouse(game.ui.facepanel,anchorLT);
game.ui.facepanelR = getBlankElementNoMouse(game.ui.facepanel,anchorLT);
game.ui.facepanelA = getBlankElementA(game.ui.facepanel,anchorLB);

game.ui.facepanelA.people = AddElement({
			type=TYPE_UNITLIST,
			parent=game.ui.facepanelA,
			anchor=anchorLTRB,
			colour1=BLACKA(0),
			texture2='SGUI/FaceIcons.png',
			font_name=Tahoma_10B, --Numbers only so safe for Japanese
                        callback_mouseleave='OW_CLEAR_LASTFACEMOUSEOVER()',
		});

OW_UNITLIST_SETUP(0,game.ui.facepanelA.people.ID);

game.ui.facepanelA.vehicle = AddElement({
			type=TYPE_UNITLIST,
			parent=game.ui.facepanelA,
			anchor=anchorTRB,
			colour1=BLACKA(0),
			texture2='SGUI/FaceIcons.png',
			font_name=Tahoma_10B, --Numbers only so safe for Japanese
                        callback_mouseleave='OW_CLEAR_LASTFACEMOUSEOVER()',
		});

OW_UNITLIST_SETUP(1,game.ui.facepanelA.vehicle.ID);

game.ui.facepanelA.building = AddElement({
			type=TYPE_UNITLIST,
			parent=game.ui.facepanelA,
			anchor=anchorTRB,
			colour1=BLACKA(0),
			texture2='SGUI/FaceIcons.png',
			font_name=Tahoma_10B, --Numbers only so safe for Japanese
                        callback_mouseleave='OW_CLEAR_LASTFACEMOUSEOVER()',
		});

OW_UNITLIST_SETUP(2,game.ui.facepanelA.building.ID);

game.ui.facepanelA.spliter = {};

game.ui.facepanelA.spliter[1] = AddElement({
	type=TYPE_ELEMENT,
	parent=game.ui.facepanelA,
	anchor=anchorLTB,
	y=0,
	width=14,
	height=0,
	subtexture=true,
	callback_mousedown='SpliterMouseDown(%x,1)',
	callback_mouseover='if (SpliterMouse.Down == 0) then setSpliterCoords(1,14); end;',
	callback_mouseleave='SpliterMouseLeave(1)',
});

game.ui.facepanelA.spliter[2] = AddElement({
	type=TYPE_ELEMENT,
	parent=game.ui.facepanelA,
	anchor=anchorLTB,
	y=0,
	width=14,
	height=0,
	subtexture=true,
	callback_mousedown='SpliterMouseDown(%x,2)',
	callback_mouseover='if (SpliterMouse.Down == 0) then setSpliterCoords(2,14); end;',
	callback_mouseleave='SpliterMouseLeave(2)',
});

SpliterTimerID = 0;

function SpliterMouseLeave(ID)
	if (SpliterMouse.Down == 0) then
		setSpliterCoords(ID,0);
	else
		SpliterTimerID = AddRepeatableTimer(0.25,'SpliterMouseLeave('..ID..')',SpliterTimerID);
	end;
end;

function setSpliterCoords(ID,X)
	if ID == 1 then
		set_SubCoords(game.ui.facepanelA.spliter[ID].ID,PROP_SUBCOORDS,SUBCOORD(X,0,14,196));
	else
		set_SubCoords(game.ui.facepanelA.spliter[ID].ID,PROP_SUBCOORDS,SUBCOORD(28+X,0,14,196));
	end;
end;

SpliterMouse = {X=0,AW=0,LastX=0,Down=0};

function ApplySpliter(X,A,B,Spliter,W)
	local NW = math.max(140,math.min(X,W-140));    -- number - limitation of width

	setWidth(A,NW);
	setX(Spliter,getX(A)+NW);
	setX(B,getX(Spliter)+14);
	setWidth(B,W-NW);

	if Spliter.ID == game.ui.facepanelA.spliter[1].ID then
		setX(game.ui.facepanelA.sort.vehicle,getX(Spliter)+14);
	else
		setX(game.ui.facepanelA.sort.building,getX(Spliter)+14);
	end;
end;

FacePanelMoveTimer = -1;

function FacePanelMove(X)
    FacePanelMoveTimer = AddRepeatableTimer(0.2,'SaveFacePanelMove('..X..');',FacePanelMoveTimer);

        SpliterMouse.LastX = X;

    if (SpliterMouse.Down == 1) then
        ApplySpliter(SpliterMouse.AW+X-SpliterMouse.X,game.ui.facepanelA.people,game.ui.facepanelA.vehicle,game.ui.facepanelA.spliter[1],getX(game.ui.facepanelA.spliter[2])-14);
    else
        ApplySpliter(SpliterMouse.AW+X-SpliterMouse.X,game.ui.facepanelA.vehicle,game.ui.facepanelA.building,game.ui.facepanelA.spliter[2],getWidth(game.ui.facepanelA)-getX(game.ui.facepanelA.vehicle)-14);
    end;
end;

function SaveFacePanelMove(X)
    if (SpliterMouse.Down == 1) then
        OW_SETTING_WRITE('GAME','FACE_SPLITER1',(100/getWidth(game.ui.facepanelA))*getX(game.ui.facepanelA.spliter[1]));
    else
        OW_SETTING_WRITE('GAME','FACE_SPLITER2',(100/getWidth(game.ui.facepanelA))*(getX(game.ui.facepanelA.spliter[2])-14));
    end;
end;

function setFacePanelMMA(VALUE)
	set_Callback(game.ui.facepanelA.ID,CALLBACK_MOUSEMOVEANY,VALUE);
end;

function setFacePanelMUA(VALUE)
	set_Callback(game.ui.facepanelA.ID,CALLBACK_MOUSEUPANY,VALUE);
end;

function SpliterMouseDown(X,ID)
	setFacePanelMMA('if (SpliterMouse.Down > 0) then FacePanelMove(%x); end;');
	setFacePanelMUA('if (SpliterMouse.Down > 0) then FacePanelMove(SpliterMouse.LastX,0); SpliterMouse.Down = 0; setFacePanelMMA(""); setFacePanelMUA(""); end;');

	SpliterMouse.X  = X+getX(game.ui.facepanelA.spliter[ID]);
	if (ID == 1) then
		SpliterMouse.AW = getWidth(game.ui.facepanelA.people);
	else
		SpliterMouse.AW = getWidth(game.ui.facepanelA.vehicle);
	end;

	SpliterMouse.Down = ID;
	FacePanelMove(SpliterMouse.X);
end;

function setFacePanel()
	local fs1 = OW_SETTING_READ_NUMBER('GAME', 'FACE_SPLITER1', 40);
	local fs2 = OW_SETTING_READ_NUMBER('GAME', 'FACE_SPLITER2', 70)-fs1;
	ApplySpliter((getWidth(game.ui.facepanelA)/100)*fs1,game.ui.facepanelA.people,game.ui.facepanelA.vehicle,game.ui.facepanelA.spliter[1],getX(game.ui.facepanelA.spliter[2])-14);
	ApplySpliter((getWidth(game.ui.facepanelA)/100)*fs2,game.ui.facepanelA.vehicle,game.ui.facepanelA.building,game.ui.facepanelA.spliter[2],getWidth(game.ui.facepanelA)-getX(game.ui.facepanelA.vehicle)-14);
end;

game.ui.logpanel = getBlankElementA(game.ui.facepanel,anchorLB);

game.ui.logpanel.log = AddElement({
	type=TYPE_TEXTBOX,
	parent=game.ui.logpanel,
	anchor=anchorLTR,
	x=0,
	y=0,
	width=game.ui.facepanel.width-13,
	height=110,
	colour1=RGB(16,31,24),
	font_name=Tahoma_13,
	wordwrap=true,
	bevel_colour1=RGB(76,148,128),
	bevel_colour2=RGB(76,148,128),
	text='',
	--edges=true,
	callback_mousedblclick='OW_LOG_DBLCLICK(%y);',
});

game.ui.logpanel.ok = AddDialogButton(DBT_NORMAL,{
	type=TYPE_IMAGEBUTTON,
	parent=game.ui.logpanel,
	anchor=anchorRB,
	x=0,
	y=game.ui.logpanel.log.height+5,
	width=150,
	height=24,
	text=loc(TID_Main_Menu_Options_OK),
	font_colour_disabled=GRAY(127),
	callback_mouseclick='setVisible(game.ui.logpanel,false);setVisible(game.ui.facepanelA,true);',
});

game.ui.logpanel.logscroll = AddElement({
	type=TYPE_SCROLLBAR,
	parent=game.ui.logpanel,
	anchor=anchorTRB,
	x=0,
	y=0,
	width=16,
	height=0,
	colour1=WHITE(),
	colour2=WHITE(),
	texture2="scrollbar.png",
	tile=true,
});

sgui_set(game.ui.logpanel.log.ID,PROP_SCROLLBAR,game.ui.logpanel.logscroll.ID);

game.ui.logpanel.hidedialogcheck = getCheckBoxEX_UI(game.ui.logpanel,anchorLT,XYWH(0,game.ui.logpanel.log.height+5,17,17),loc(TID_InGame_Msg_Hide_Dialog),{},'OW_LOGCHECK(0,getChecked(game.ui.logpanel.hidedialogcheck))',{checked=false,});
game.ui.logpanel.hideothercheck  = getCheckBoxEX_UI(game.ui.logpanel,anchorLT,XYWH(0,game.ui.logpanel.hidedialogcheck.y+17+5,17,17),loc(TID_InGame_Msg_Hide_Other),{},'OW_LOGCHECK(1,getChecked(game.ui.logpanel.hideothercheck))',{checked=false,});
game.ui.logpanel.hidehintcheck   = getCheckBoxEX_UI(game.ui.logpanel,anchorLT,XYWH(0,game.ui.logpanel.hideothercheck.y+17+5,17,17),loc(TID_InGame_Msg_Hide_Hint),{},'OW_LOGCHECK(2,getChecked(game.ui.logpanel.hidehintcheck))',{checked=false,});
--[[
game.ui.logpanel.hidedialogcheck=makeCheckBox2({
	type=TYPE_CHECKBOX,
	parent=game.ui.logpanel,
	x=0,
	y=game.ui.logpanel.log.height+5,
	width=17,
	height=17,
	callback_checked='OW_LOGCHECK(0,getChecked(game.ui.logpanel.hidedialogcheck))',
	checked=false,
	bevel=false,
	colour2=WHITE(),
},loc(TID_InGame_Msg_Hide_Dialog));

game.ui.logpanel.hideothercheck=makeCheckBox2({
	type=TYPE_CHECKBOX,
	parent=game.ui.logpanel,
	x=0,
	y=game.ui.logpanel.hidedialogcheck.y+17+5,
	width=17,
	height=17,
	callback_checked='OW_LOGCHECK(1,getChecked(game.ui.logpanel.hideothercheck))',
	checked=false,
	bevel=false,
	colour2=WHITE(),
},loc(TID_InGame_Msg_Hide_Other));

game.ui.logpanel.hidehintcheck=makeCheckBox2({
	type=TYPE_CHECKBOX,
	parent=game.ui.logpanel,
	x=0,
	y=game.ui.logpanel.hideothercheck.y+17+5,
	width=17,
	height=17,
	callback_checked='OW_LOGCHECK(2,getChecked(game.ui.logpanel.hidehintcheck))',
	checked=false,
	bevel=false,
	colour2=WHITE(),
},loc(TID_InGame_Msg_Hide_Hint));
--]]
OW_INGAMELOG_SET(game.ui.logpanel.log.ID);

game.ui.hintbar  = getBlankElementA(game.ui,anchorLB);
setNoMouseEventThis(game.ui.hintbar,true);
game.ui.hintbarL = getBlankElement(game.ui.hintbar,anchorLT);
game.ui.hintbarM = getBlankElement(game.ui.hintbar,anchorLT);
game.ui.hintbarR = getBlankElement(game.ui.hintbar,anchorLT);

game.ui.hintbarA  = getBlankElementA(game.ui.hintbar,anchorLB);
setNoMouseEventThis(game.ui.hintbarA,true);

game.ui.hintbar.log = AddElement({
		type=TYPE_IMAGEBUTTON,
		parent=game.ui.hintbar,
		anchor=anchorLT,
		x=10,
		y=0,
		width=19,
		height=19,
		text='',
		texture='SGUI/'..interface.current.side..'/'..'LogButton.png',
		callback_mouseclick='setVisible(game.ui.logpanel,getVisible(game.ui.facepanelA));setVisible(game.ui.facepanelA,not getVisible(game.ui.facepanelA));',
		hint=loc(TID_InGame_Msg_Log_Button),
	});

function MakeHint(Filename)
	local ele = AddElement({
		type=TYPE_ELEMENT,
		parent=game.ui.hintbarA,
		anchor=anchorL,
		x=-1,
		y=0,
		width=19,
		height=19,
		visible=false,
		texture='SGUI/'..interface.current.side..'/'..Filename,
		overdraw=true,
	});

	sgui_bringtofront(ele.ID);

	return ele.ID;
end;

OW_HINTBAR_SET(game.ui.hintbarA.ID);

game.filmtop = AddElement({
	type=TYPE_ELEMENT,
	parent=game,
	anchor=anchorLTR,--{top=true,bottom=false,left=true,right=true},
	x=0,
	y=0,
	width=LayoutWidth,
	height=54,
	visible=false,
	colour1=BLACK(),
});

game.filmbottom = AddElement({
	type=TYPE_ELEMENT,
	parent=game,
	anchor=anchorLRB,--{top=false,bottom=true,left=true,right=true},
	x=0,
	y=0,
	width=LayoutWidth,
	height=54,
	visible=false,
	colour1=BLACK(),
});

OW_GAMEWINDOW_SET(gamewindow.ID);
OW_XICHT_SET(game.xicht.ID,game.xicht.say.ID);
OW_FILM_SET(game.filmtop.ID,game.filmbottom.ID);
OW_MINIMAP_SET(game.ui.minimap.map.ID,game.ui.minimap.map.img.ID,game.ui.minimap.map.img.corners[1].ID,game.ui.minimap.map.img.corners[2].ID,game.ui.minimap.map.img.corners[3].ID,game.ui.minimap.map.img.corners[4].ID);

function FROMOW_SHOWFILMS(VIS) -- OW CALLS THIS
	setVisible(game.filmtop,VIS);
	setVisible(game.filmbottom,VIS);

	setVisible(game.ui,not VIS);

	MMLeft=false;
	SpliterMouse.Down=0;
end;

function FROMOW_SETGAMEWINDOW(W,H,T)
        --setTag(gamewindow,T);    --set_Property(gamewindow.ID,PROP_Y,T);
	set_Property(gamewindow.ID,PROP_W,W);
	set_Property(gamewindow.ID,PROP_H,H-190);
end;

function setAHint(Element,HintID)
	set_Property(Element.ID,PROP_HINT,loc(HintID));
end;

function setToolbarHints()
	setAHint(game.ui.toolbtns[1],791);
	setAHint(game.ui.toolbtns[2],792);
	if (IsMultiplayer) then
		setAHint(game.ui.toolbtns[3],794);
	else
		setAHint(game.ui.toolbtns[3],793);
	end;
	setAHint(game.ui.toolbtns[4],795);
	setAHint(game.ui.toolbtns[5],796);
	setAHint(game.ui.toolbtns[6],TID_ACHIEVEMENTS);
end;


game.HintLabel       = getLabel(game,anchorLRB,209,514,500,0,Tahoma_13B,'');
set_Property(game.HintLabel.ID,PROP_SHADOWTEXT,true);
setFontColour(game.HintLabel,RGB(250,250,250));
game.HintLabel_Timer = 0;


function FROMOW_INGAME_HINT(DATA)
--[[ DATA BREAKDOWN
        HINT String
        TIME Integer
--]]

        setText(game.HintLabel,DATA.HINT);

        local valid = (DATA.TIME > 0) and (DATA.HINT ~= '');

        setVisible(game.HintLabel,valid);

        if valid then
                game.HintLabel_Timer = AddRepeatableTimer((DATA.TIME/1000)*1.5,'setVisible(game.HintLabel,false);',game.HintLabel_Timer);
        end;
end;

game.Display_Strings = {};

for i = 1,15 do
        game.Display_Strings[i] = getLabel(game,anchorTR,ScrWidth-100,i*15+50,100,0,Tahoma_13B,'');
        setTextHAlign(game.Display_Strings[i],ALIGN_RIGHT);
        set_Property(game.Display_Strings[i].ID,PROP_SHADOWTEXT,true);
        setFontColour(game.Display_Strings[i],RGB(250,250,250));
        set_Colour(game.Display_Strings[i].ID,PROP_FONT_COL_BACK,BLACKA(127));
        set_Property(game.Display_Strings[i].ID,PROP_NOMOUSEEVT,true);
end;

function FROMOW_DISPLAY_STRINGS(DATA)
        for i = 1,15 do
                setText(game.Display_Strings[i],DATA[i]);
        end;
end;

function FROMOW_DISPLAY_STRINGS_ADJUST_TOP(DATA)
	if specBarVisible > 0 then
		setY(game.Display_Strings[DATA.ID],((specBarVisible*25)*interface.scale)+15+(DATA.ID*20));
	else
		setY(game.Display_Strings[DATA.ID],DATA.TOP+15+(DATA.ID*10));
	end;
	setX(game.Display_Strings[DATA.ID],ScrWidth-getWidth(game.Display_Strings[DATA.ID]));
end;


game.chat = getElementEX(game,anchorLB,XYWH(10,ScrHeight-300-200,500,300),true,{});
setColour1(game.chat,BLACKA(127));
setAlpha(game.chat,180);
set_Property(game.chat.ID,PROP_NOMOUSEEVTTHIS,true);

game.chat.labels = {};

for i=1,5 do
        game.chat.labels[i] = getLabel(game.chat,anchorLT,0,game.chat.height-i*15,0,15,Tahoma_13B,'');
        set_Property(game.chat.labels[i].ID,PROP_OUTLINE,true);
        set_Property(game.chat.labels[i].ID,PROP_SHADOWTEXT,true);
        set_Outline2Settings(game.chat.labels[i].ID,{colour=RGB(0,0,0),min=0.0,max=0.2});
		sgui_set(game.chat.labels[i].ID,PROP_OUTLINE2,true);
        setVisible(game.chat.labels[i],false);
        game.chat.labels[i].time = 0;
end;

game.chat.listbox = AddElement({
	type=TYPE_TEXTBOX,
	parent=game.chat,
	anchor={top=true,bottom=true,left=true,right=true},
	x=0+20,
	y=0,
	width=game.chat.width-12-1-20,
	height=game.chat.height-20-4,
	colour1=ListBox_Colour1,
	text="",
--        shadowtext=true,
        font_style_outline=true,
        nomouseeventthis=true,
        font_name=Tahoma_13B,
        bottomup=true,
		wordwrap=true,
});

game.chat.scroll = AddElement({
	type=TYPE_SCROLLBAR,
	parent=game.chat,
	anchor={top=true,bottom=true,left=false,right=true},
	x=game.chat.listbox.x+game.chat.listbox.width+1,
	y=game.chat.listbox.y,
	width=12,
	height=game.chat.listbox.height,
	colour1=Scrollbar_Colour1,
	colour2=Scrollbar_Colour2,
	texture2="scrollbar.png",
});

sgui_set(game.chat.listbox.ID,PROP_SCROLLBAR,game.chat.scroll.ID);

game.chat.edit = AddElement({
	type=TYPE_EDIT,
	parent=game.chat,
	anchor=anchorLRB,
	text='',
	colour1=IRCBackCol,
	autosize=false,
	bevel=true,
	bevel_colour1=GRAYA(14,200),
	bevel_colour2=GRAYA(14,200),
	gradient=true,
	gradient_colour1=GRAY(44),
	gradient_colour2=GRAY(20),
--	font_name=data,
	x=0,
	y=game.chat.listbox.height+4,
	width=getWidth(game.chat),
	height=20,
	callback_keypress='game.chat.edit.onkeypress(%k);',
});
game.chat.CheckersArea = getElementEX(game.chat,anchorLB,XYWH(0,0,20,game.chat.listbox.height),true,{colour1=RGBA(0,0,0,200), nomouseevent=false});

game.chat.CheckerAlly = getElementEX(game.chat.CheckersArea,anchorLB,XYWH(2,game.chat.CheckersArea.height-18*1,16,16),true,{--colour1=RGB(255,255,255),
	texture = "SGUI/Amer/chat_allycheck.png",subtexture=true, subcoords=SUBCOORD(0,16,16,16),  callback_mouseclick = "setChatPool(1);", hint = loc(TID_InGame_Diplomacy_Send_Allies)});
game.chat.CheckerFriends = getElementEX(game.chat.CheckersArea,anchorLB,XYWH(2,game.chat.CheckersArea.height-18*2,16,16),true,{--colour1=RGB(255,255,255),
	texture = "SGUI/Amer/chat_friendcheck.png",subtexture=true, subcoords=SUBCOORD(0,16,16,16),  callback_mouseclick = "setChatPool(2);" , hint = loc(TID_InGame_Diplomacy_Send_Friends2)});
game.chat.CheckerAll = getElementEX(game.chat.CheckersArea,anchorLB,XYWH(2,game.chat.CheckersArea.height-18*3,16,16),true,{--colour1=RGB(255,255,255),
	texture = "SGUI/Amer/chat_allcheck.png" ,subtexture=true, subcoords=SUBCOORD(0,16,16,16),  callback_mouseclick = "setChatPool(3);", hint = loc(TID_InGame_Diplomacy_Send_All)});

game.chat.CustomBorder = getElementEX(game.chat.CheckersArea,anchorLB,XYWH(0,game.chat.CheckersArea.height-18*13-4,20,18*10+2),true,{colour1=RGBA(0,0,0,0) });
game.chat.CheckerCustom = getElementEX(game.chat.CheckersArea,anchorLB,XYWH(2,game.chat.CheckersArea.height-18*4-2,16,16),true,{--colour1=RGB(255,255,255),
	texture = "SGUI/Amer/chat_customcheck.png" ,subtexture=true, subcoords=SUBCOORD(0,16,16,16),  callback_mouseclick = "setChatPool(4);", hint = loc(TID_InGame_Diplomacy_Send_Choice)});

setBorder(game.chat.CustomBorder,BORDER_TYPE_INNER,1,RGB(200,150,50) );

game.chat.Checker = {};

for i=1, 10 do
	game.chat.Checker[i] = getElementEX(game.chat.CheckersArea,anchorLB,XYWH(2,game.chat.CheckersArea.height-18*(5+i)-2,16,16),false,{colour1=SIDE_COLOURS[i],texture= "SGUI/Amer/deb_debriefbox.png",subtexture=true, subcoords=SUBCOORD(0,0,16,16), callback_mouseclick = "setCustomGroup(" .. i .. "); setChatPool(4);"});
	game.chat.Checker[i].checked = false;
end;

 --  1 = ally , 2= friends, 3 = all, 4 custom
game.chat.currentpool = 3;
game.chat.ally = {};
game.chat.friends = {};
game.chat.all = {};
game.chat.you = 0;
game.chat.custom = {};


function setChatGroups()
	OW_MULTI_GET_ATTITUDES();
	game.chat.ally = {};
	game.chat.friends = {};
	game.chat.all = {};

	for i=1, 9 do
		if usedSides[i] then
			if MULTI_ATTITUDESINFO_CURRENT[mySide][i] == 1 then --friend
				game.chat.ally[table.getn(game.chat.ally)+1] = i;
				game.chat.friends[table.getn(game.chat.friends)+1] = i;
				game.chat.all[table.getn(game.chat.all)+1] = i;
			elseif MULTI_ATTITUDESINFO_CURRENT[mySide][i] == 0 then -- neutral
				game.chat.friends[table.getn(game.chat.friends)+1] = i;
				game.chat.all[table.getn(game.chat.all)+1] = i;
			elseif MULTI_ATTITUDESINFO_CURRENT[mySide][i] == 2 then -- enemy
				game.chat.all[table.getn(game.chat.all)+1] = i;
			end;
		end;
	end;


end;

function setCustomGroup(index)
	if game.chat.Checker[index].checked == true then
		game.chat.Checker[index].checked = false;
		setSubCoords(game.chat.Checker[index],SUBCOORD(0,0,16,16));
	else
		game.chat.Checker[index].checked = true;
		setSubCoords(game.chat.Checker[index],SUBCOORD(0,16,16,16));
	end;
		game.chat.custom = {mySide};

	for i=1, 9 do
		if game.chat.Checker[i].checked == true then
			game.chat.custom[table.getn(game.chat.custom)+1] = i;
		end;
	end;

end;

function setChatPool(index)
	if iSpec then
		index = 3;
	else
		if not (index > 0 and index < 5) then
			index = game.chat.currentpool+1;
			if index >= 5 then
				index = 1;
			end;
		end;
	end;
	game.chat.currentpool = index;


	setSubCoords(game.chat.CheckerAlly,SUBCOORD(0,0,16,16));
	setSubCoords(game.chat.CheckerFriends,SUBCOORD(0,0,16,16));
	setSubCoords(game.chat.CheckerAll,SUBCOORD(0,0,16,16));
	setSubCoords(game.chat.CheckerCustom,SUBCOORD(0,0,16,16));

	switch(index) : caseof {
		[1] = function (x) setSubCoords(game.chat.CheckerAlly,SUBCOORD(0,16,16,16)); end;
		[2] = function (x) setSubCoords(game.chat.CheckerFriends,SUBCOORD(0,16,16,16)); end;
		[3] = function (x) setSubCoords(game.chat.CheckerAll,SUBCOORD(0,16,16,16)); end;
		[4] = function (x) setSubCoords(game.chat.CheckerCustom,SUBCOORD(0,16,16,16)); end;
	};


end;

function getChatRecipients(type)
	if type >= 1 and type <= 3 then
		setChatGroups();
	end;

	local HV = {};
	switch (type) : caseof {
		[1] = function (x) HV = game.chat.ally; end;
		[2] = function (x) HV = game.chat.friends; end;
		[3] = function (x) HV = game.chat.all; end;
		[4] = function (x) HV = game.chat.custom;  end;
	};

	return HV;
end;

function TOOW_CHAT_SET_RECIPIENTS(type)

	local HV = getChatRecipients(type);

	switch( table.getn(HV) ) : caseof {
		[0] = function (x) return; end;
		[1] = function (x) OW_MULTI_INGAME_SETCHAT_RECIPIENTS(HV[1]-1); end;
		[2] = function (x) OW_MULTI_INGAME_SETCHAT_RECIPIENTS(HV[1]-1,HV[2]-1); end;
		[3] = function (x) OW_MULTI_INGAME_SETCHAT_RECIPIENTS(HV[1]-1,HV[2]-1,HV[3]-1); end;
		[4] = function (x) OW_MULTI_INGAME_SETCHAT_RECIPIENTS(HV[1]-1,HV[2]-1,HV[3]-1,HV[4]-1); end;
		[5] = function (x) OW_MULTI_INGAME_SETCHAT_RECIPIENTS(HV[1]-1,HV[2]-1,HV[3]-1,HV[4]-1,HV[5]-1); end;
		[6] = function (x) OW_MULTI_INGAME_SETCHAT_RECIPIENTS(HV[1]-1,HV[2]-1,HV[3]-1,HV[4]-1,HV[5]-1,HV[6]-1); end;
		[7] = function (x) OW_MULTI_INGAME_SETCHAT_RECIPIENTS(HV[1]-1,HV[2]-1,HV[3]-1,HV[4]-1,HV[5]-1,HV[6]-1,HV[7]-1); end;
		[8] = function (x) OW_MULTI_INGAME_SETCHAT_RECIPIENTS(HV[1]-1,HV[2]-1,HV[3]-1,HV[4]-1,HV[5]-1,HV[6]-1,HV[7]-1,HV[8]-1); end;
		[9] = function (x) OW_MULTI_INGAME_SETCHAT_RECIPIENTS(HV[1]-1,HV[2]-1,HV[3]-1,HV[4]-1,HV[5]-1,HV[6]-1,HV[7]-1,HV[8]-1,HV[9]-1); end;
		default = function (x) OW_MULTI_INGAME_SETCHAT_RECIPIENTS(HV[1]-1,HV[2]-1,HV[3]-1,HV[4]-1,HV[5]-1,HV[6]-1,HV[7],HV[8]-1,HV[9]-1,HV[10]-1); end;
	};
end;


function game.chat.edit.onkeypress(key)
	if (key == 9) then
		setChatPool(0);
		return
	elseif (key == 13) then
                game.chat.close();
				TOOW_CHAT_SET_RECIPIENTS(game.chat.currentpool);
                OW_MULTI_INGAME_SENDCHATMSG(getText(game.chat.edit));
                setText(game.chat.edit,'');
                return;
	end;
        if (key == 27) then
                game.chat.close();
                return;
        end;
end;

function getChatColour(TYPE)
        --return '#C'..SIDE_COLOURS_HEX[TYPE-20+1];
		return getHexColour(SIDE_COLOURS[TYPE-20+1]);
end;

function game.chat.labels.doAddChat(i,TEXT)
        setAlpha(game.chat.labels[i],255);
        setVisible(game.chat.labels[i],not getVisible(game.chat.listbox));
        setText(game.chat.labels[i],TEXT);
        game.chat.labels[i].time = 10;
end;

function game.chat.labels.addChat(TEXT)
        game.chat.labels[5].time = 0;

        local chatcanvis = not getVisible(game.chat.listbox);
        local j = 0;
        for j = 1,4 do
                i = 4-j+2;
                setText(game.chat.labels[i],getText(game.chat.labels[i-1]));
                local t                    = game.chat.labels[i].time;
                game.chat.labels[i].time   = game.chat.labels[i-1].time;
                game.chat.labels[i-1].time = t;
                setAlpha(game.chat.labels[i],255);
                setVisible(game.chat.labels[i],(game.chat.labels[i].time > 0) and chatcanvis);
        end;

        game.chat.labels.doAddChat(1,TEXT);

        InGameChatTick(0); -- Fix the alpha
end;

function FROMOW_ADDCHAT(DATA)
        local text = getText(game.chat.listbox);
        local chattext = getChatColour(DATA.TYPE)..DATA.TEXT;
        if text == '' then
                setText(game.chat.listbox,chattext);
        else
                setText(game.chat.listbox,text..CHAR13..chattext);
        end;

        game.chat.labels.addChat(chattext);
end;

game.chat.timer = 0;

function game.chat.openclose(VALUE)
        set_Property(game.chat.listbox.ID,PROP_BEVEL,VALUE);
        setVisible(game.chat.edit,VALUE);
        setVisible(game.chat.scroll,VALUE);
        setVisible(game.chat.listbox,VALUE);
		setVisible(game.chat.CheckersArea, VALUE);
        OW_SET_OW_IGNORE_KEYBOARD(VALUE);

        if VALUE then
                setFocus(game.chat.edit);
                setColour1(game.chat,BLACKA(127));
                for i=1,5 do
                        setVisible(game.chat.labels[i],false);
                end;
        else
                clearFocus();
                setColour1(game.chat,BLACKA(0));
                for i=1,5 do
                        if (getText(game.chat.labels[i]) ~= '') then
                                setVisible(game.chat.labels[i],true);
                        end;
                end;
        end;
end;

function game.chat.show()
        game.chat.openclose(true);
end;

function game.chat.close()
        game.chat.openclose(false);
end;

function game.chat.setup(MULTIPLAYER)
        setY(game.chat,ScrHeight-300-250);
        game.chat.close();
        setText(game.chat.listbox,'');
        setText(game.chat.edit,'');
        for i=1,5 do
                setText(game.chat.labels[i],'');
                setVisible(game.chat.labels[i],false);
                setAlpha(game.chat.labels[i],255);
                game.chat.labels[i].time = 0;
        end;
        setVisible(game.chat,MULTIPLAYER);
end;

function FROMOW_SHOWCHAT()
        game.chat.timer = AddRepeatableTimer(0.1,'game.chat.show();',game.chat.timer);
end;

function debugIngameChat(Text)
	OW_MULTI_INGAME_SETCHAT_RECIPIENTS(mySide-1);
	OW_MULTI_INGAME_SENDCHATMSG(Text);
end;

function InGameChatTick(FrameTime)
        for i=1,5 do
                if game.chat.labels[i].time > 0 then
                        game.chat.labels[i].time = game.chat.labels[i].time - FrameTime;
                        if game.chat.labels[i].time <= 0 then
                                setVisible(game.chat.labels[i],false);
                                setText(game.chat.labels[i],'');
                                setAlpha(game.chat.labels[i],255);
                        else
                                if game.chat.labels[i].time < 1 then
                                        setAlpha(game.chat.labels[i],255*game.chat.labels[i].time);
                                end;
                        end;
                end;
        end;
end;

function FROMOW_SETSPEED(MAX,POSITION)
        if game.ui.commpanel1.speed.MAX ~= MAX-1 then
        	game.ui.commpanel1.speed:setMINMAX(0,MAX-1);--  SetSliderElementMINMAX(game.ui.commpanel1.speed.SliderIndex,0,MAX-1);
        end;
        game.ui.commpanel1.speed.POS = POSITION-1;
		game.ui.commpanel1.speed.LASTPOS = game.ui.commpanel1.speed.POS;
        game.ui.commpanel1.speed:setElementPos();-- SetSliderElementPos(game.ui.commpanel1.speed.SliderIndex);
		-- not calling setPos(POSITION-1) as it would result in an infinite loop
end;

function DoInterfaceChange_Game()
	uisettings = interface.current.game.ui;
	UpdateToolBtns(game.ui.toolbtns,uisettings.toolBtns);
	setInterfaceTexture(game.ui.toolbar,'toolbar2.png');
        setInterfaceTextureMask(game.ui.toolbar,'toolbar2.png');
	setWHV(game.ui.toolbar,uisettings.toolBar.X,uisettings.toolBar.Y);

	setInterfaceTexture(game.ui.toolbar.pause,'ToolBar_button_pause.png');

	setXYWH(game.ui.toolbar.pause,uisettings.pause);

	setInterfaceTexture(game.ui.minimap,'MiniMap.png');
        setInterfaceTextureMask(game.ui.minimap,'MiniMap.png');
	setXYWHV(game.ui.minimap,ScrWidth-uisettings.minimap.BACK.X,ScrHeight-uisettings.minimap.BACK.Y,uisettings.minimap.BACK.X,uisettings.minimap.BACK.Y);

	setXYWH(game.ui.minimap.map,uisettings.minimap.MAP);

	set_Colour(game.ui.minimap.map.img.ID,PROP_BORDER_COLOUR,uisettings.minimap.COLOUR);

	setInterfaceTexture(game.ui.infopanel,'InfoPanel.png');
        setInterfaceTextureMask(game.ui.infopanel,'InfoPanel.png');
	set_Property(game.ui.infopanel.ID,PROP_Y,ScrHeight-uisettings.infopanel.Y);
	setWHV(game.ui.infopanel,uisettings.infopanel.X,uisettings.infopanel.Y);

	set_Property(game.filmtop.ID,PROP_H,uisettings.toolBar.Y);
	set_Property(game.filmbottom.ID,PROP_H,uisettings.minimap.BACK.Y);
	set_Property(game.filmbottom.ID,PROP_Y,ScrHeight-uisettings.minimap.BACK.Y);

	setXYWHV(game.ui.commpanel,getElementRight(game.ui.infopanel),ScrHeight-uisettings.commpanel[5],uisettings.commpanel[4],uisettings.commpanel[5]);
	setWHV(game.ui.commpanel1,uisettings.commpanel[4],uisettings.commpanel[5]);
	setWHV(game.ui.commpanel2,uisettings.commpanel[4],uisettings.commpanel[5]);
	setWHV(game.ui.commpanel3,uisettings.commpanel[4],uisettings.commpanel[5]);

	setInterfaceTexture(game.ui.commpanel1,uisettings.commpanel[1]);
	setInterfaceTexture(game.ui.commpanel2,uisettings.commpanel[2]);
	setInterfaceTexture(game.ui.commpanel3,uisettings.commpanel[3]);

        setXY(game.ui.commpanel1.undo,uisettings.undobutton.X,getHeight(game.ui.commpanel1)-uisettings.undobutton.Y-getHeight(game.ui.commpanel1.undo));
        setXY(game.ui.commpanel1.redo,getWidth(game.ui.commpanel1)-uisettings.redobutton.X-getWidth(game.ui.commpanel1.redo),getHeight(game.ui.commpanel1)-uisettings.redobutton.Y-getHeight(game.ui.commpanel1.redo));

        setXY(game.ui.commpanel1.speed,22-16-5,getHeight(game.ui.commpanel1)-uisettings.speed.Y-16);
        setWH(game.ui.commpanel1.speed.slider,uisettings.speed.X,16);

	setVisible(game.ui.commpanel1,true);
	setVisible(game.ui.commpanel2,false);
	setVisible(game.ui.commpanel3,false);

        local cp2h = getHeight(game.ui.commpanel2);

        setXY(game.ui.commpanel2.weapon,12+uisettings.combooff,cp2h-6-(20*4));
        setXY(game.ui.commpanel2.chassis,12+uisettings.combooff,cp2h-6-(20*3));
        setXY(game.ui.commpanel2.control,12+uisettings.combooff,cp2h-6-(20*2));
        setXY(game.ui.commpanel2.engine,12+uisettings.combooff,cp2h-6-(20*1));

        setXY(game.ui.commpanel3.weapon,12+uisettings.combooff,cp2h-36);

	for c = 1, 9 do
		setVisible(game.ui.commpanel.buttons[c],false);
		set_Property(game.ui.commpanel.buttons[c].ID,PROP_TEXTURE,uisettings.buttons);

		setXYWHV(game.ui.commpanel.buttons[c],uisettings.commBtns[1]+math.mod((c-1),3)*(uisettings.commBtns[3]+1),uisettings.commBtns[2]+math.floor((c-1)/3)*(uisettings.commBtns[4]+1),uisettings.commBtns[3],uisettings.commBtns[4]);
	end;

	setXYWHV(game.ui.facepanel,getElementRight(game.ui.commpanel),ScrHeight-uisettings.facepanel[3],getX(game.ui.minimap)-getElementRight(game.ui.commpanel),uisettings.facepanel[3]);

	setWHV(game.ui.facepanelL,uisettings.facepanel[1],uisettings.facepanel[3]);
	setXYWHV(game.ui.facepanelM,uisettings.facepanel[1],0,getWidth(game.ui.facepanel)-uisettings.facepanel[1]-uisettings.facepanel[2],uisettings.facepanel[3]);
	setXYWHV(game.ui.facepanelR,getWidth(game.ui.facepanel)-uisettings.facepanel[2],0,uisettings.facepanel[2],uisettings.facepanel[3]);

	set_Property(game.ui.facepanelM.ID,PROP_TILE,true);

	setInterfaceTexture(game.ui.facepanelL,'FacePanelL.png');
	setInterfaceTexture(game.ui.facepanelM,'FacePanel.png');
	setInterfaceTexture(game.ui.facepanelR,'FacePanelR.png');

	setXYWHV(game.ui.hintbar,getX(game.ui.commpanel),getY(game.ui.facepanel)-uisettings.hintbar[3],getX(game.ui.minimap)-getX(game.ui.commpanel),uisettings.hintbar[3]);
	setWHV(game.ui.hintbarL,uisettings.hintbar[1],uisettings.hintbar[3]);
	setXYWHV(game.ui.hintbarM,uisettings.hintbar[1],0,getWidth(game.ui.hintbar)-uisettings.hintbar[1]-uisettings.hintbar[2],uisettings.hintbar[3]);
	setXYWHV(game.ui.hintbarR,getWidth(game.ui.hintbar)-uisettings.hintbar[2],0,uisettings.hintbar[2],uisettings.hintbar[3]);

	setXYWHV(game.ui.hintbarA,uisettings.hintbar[4].X+20,uisettings.hintbar[4].Y,getWidth(game.ui.hintbar)-uisettings.hintbar[4].X-20,19);

	set_Property(game.ui.hintbarM.ID,PROP_TILE,true);

	setInterfaceTexture(game.ui.hintbarL,'hintbarL.png');
	setInterfaceTexture(game.ui.hintbarM,'hintbarM.png');
	setInterfaceTexture(game.ui.hintbarR,'hintbarR.png');

        setInterfaceTextureMask(game.ui.hintbarL,'hintbarL.png');
        setInterfaceTextureMask(game.ui.hintbarM,'hintbarM.png');
        setInterfaceTextureMask(game.ui.hintbarR,'hintbarR.png');

	setXYWHV(game.ui.facepanelA,uisettings.facearea.X,uisettings.facearea.Y,getWidth(game.ui.facepanel)-(uisettings.facearea.X*2),getHeight(game.ui.facepanel)-(uisettings.facearea.Y*2));

	setXYWHV(game.ui.logpanel,getX(game.ui.facepanelA)+5,getY(game.ui.facepanelA)+3,getWidth(game.ui.facepanelA)-10,getHeight(game.ui.facepanelA));

	setWidth(game.ui.logpanel.log,getWidth(game.ui.logpanel)-uisettings.scrollsize-1);

        setX(game.ui.logpanel.ok,getWidth(game.ui.logpanel)-150-10);

	setXYWHV(game.ui.logpanel.logscroll,getElementRight(game.ui.logpanel.log)+1,0,uisettings.scrollsize,getHeight(game.ui.logpanel.log));


	setInterfaceTexture(game.ui.facepanelA.spliter[1],'sliders.png');
	setInterfaceTexture(game.ui.facepanelA.spliter[2],'sliders.png');

	setSpliterCoords(1,0);
	setSpliterCoords(2,0);

	local FPW = getWidth(game.ui.facepanelA);
	local FPH = getHeight(game.ui.facepanelA);

	setXYWHV(game.ui.facepanelA.spliter[1],FPW-400,0,14,FPH);
	setXYWHV(game.ui.facepanelA.spliter[2],FPW-200,0,14,FPH);

	setXYWHV(game.ui.facepanelA.people,0,22,FPW-400,FPH-22);
	setXYWHV(game.ui.facepanelA.vehicle,FPW-400+14,22,200-14,FPH-22);
	setXYWHV(game.ui.facepanelA.building,FPW-200+14,22,200-14,FPH-22);
	setX(game.ui.facepanelA.sort.vehicle,FPW-400+14);
	setX(game.ui.facepanelA.sort.building,FPW-200+14);
	setFacePanel();

	setXYV(game.ui.hintbar.log,getX(game.ui.hintbarA)-20,uisettings.hintbar[4].Y);
	setInterfaceTexture(game.ui.hintbar.log,'LogButton.png');

    setInterfaceTexture1n2(game.ui.logpanel.logscroll,'scrollbar_back_v.png','scrollbar.png');

	setInterfaceTexture1n2(game.ui.logpanel.hidedialogcheck,'checkbox_unchecked.png','checkbox_checked.png');
	setInterfaceTexture1n2(game.ui.logpanel.hideothercheck,'checkbox_unchecked.png','checkbox_checked.png');
	setInterfaceTexture1n2(game.ui.logpanel.hidehintcheck,'checkbox_unchecked.png','checkbox_checked.png');

	setBevelCol(game.ui.logpanel.log,uisettings.boxcols.border,uisettings.boxcols.border);
	setColour1(game.ui.logpanel.log,uisettings.boxcols.background);
	setBorderColour(floating_hint,uisettings.boxcols.border);

	DoInterfaceChange_Game_ResourceBar();
	local Idip = uisettings.dip;
	for _, v in pairs(DipSides.SideCards ) do
		setTexture(v, Idip.frame);
	end;
	setTexture (game.ui.dip_request.left, Idip.left_req);
	setTexture (game.ui.dip_request.right, Idip.right_req);
	setTexture (game.ui.dip_request.middle, Idip.back_req);

	setWHV(game.ui.altFac,getWidth(game.ui.facepanel)-14,getHeight(game.ui.facepanel));
	setWHV(game.ui.altFac.componentsArea,getWidth(game.ui.altFac)-95,getHeight(game.ui.altFac));
	setXYWHV(game.ui.altFac.unitsArea,getWidth(game.ui.altFac.componentsArea),0,95,getHeight(game.ui.altFac));
	setTexture(game.ui.altFac.componentsArea.chassisArea_ScrollH,'/SGUI/'..interface.current.side..'/scrollbar.png');
	setTexture(game.ui.altFac.componentsArea.weaponsArea_ScrollH,'/SGUI/'..interface.current.side..'/scrollbar.png');
	setTexture(game.ui.altFac.componentsArea.controlsAndEnginesArea_ScrollH,'/SGUI/'..interface.current.side..'/scrollbar.png');

	--chat
	setTexture ( game.chat.CheckerAll, uisettings.chat.allcheckbox );
	setTexture ( game.chat.CheckerFriends , uisettings.chat.friendcheckbox );
	setTexture ( game.chat.CheckerAlly, uisettings.chat.allycheckbox );
	setTexture ( game.chat.CheckerCustom , uisettings.chat.customcheckbox );

	for i=1, 9 do
		setTexture ( game.chat.Checker[i], uisettings.chat.sidecheckbox );
	end;

	sgui_forcetextures(game.ui.ID);

	setTexture(game.ui.infopanel.inner.img.flag,"SGUI/"..interface.current.side.."/flag.png");

	updateFaceSortIcons();

	DoInterfaceChange_Game_SpecBar();

	TeamSkillsSetUI();
	TeamSelectSetUI();

end;




----------------------------------  FaceSort -------------------------------------------
function getSortButton(parent,anchor,xywh,id,element)
	local e = getElementEX(parent,anchor,xywh,true,element);
	e.butID = id;
	e.enabled = false;
	set_Callback(e.ID,CALLBACK_MOUSEUP,'setFaceSort('..id..');');
	set_Callback(e.ID,CALLBACK_MOUSEOVER,'lightFaceSort('..id..',1);');
--	set_Callback = (e,CALLBACK_MOUSEDOWN,lightFaceSort(ID,2));
	set_Callback(e.ID,CALLBACK_MOUSELEAVE,'lightFaceSort('..id..',0);');

	return e;
end;

function setFaceSort(id)
	local table = {};
	if id <11 then
		table = game.ui.facepanelA.sort.people;
	elseif id>10 and id<21 then
		table = game.ui.facepanelA.sort.vehicle;
	else
		table = game.ui.facepanelA.sort.building;
	end;

	for k, v in pairs(table) do
		if (type(v) == "table") and v.butID == id then
			table = v;
			break;
		end;
	end;

	if id < 3 or id > 6 then
		if table.enabled == false then
			table.enabled = true;
			setSubCoords(table,SUBCOORD(0,40,20,20));
			setSortState(id,true);
		else
			table.enabled = false;
			setSubCoords(table,SUBCOORD(0,0,20,20));
			setSortState(id,false);
		end;
	else
		game.ui.facepanelA.sort.people.sol.enabled = false;
		setSubCoords(game.ui.facepanelA.sort.people.sol,SUBCOORD(0,0,20,20));
		game.ui.facepanelA.sort.people.eng.enabled = false;
		setSubCoords(game.ui.facepanelA.sort.people.eng,SUBCOORD(0,0,20,20));
		game.ui.facepanelA.sort.people.mech.enabled = false;
		setSubCoords(game.ui.facepanelA.sort.people.mech,SUBCOORD(0,0,20,20));
		game.ui.facepanelA.sort.people.sci.enabled = false;
		setSubCoords(game.ui.facepanelA.sort.people.sci,SUBCOORD(0,0,20,20));
		if facesort.human.skill == id -2 then
			setSortState(3,0);
		else
			table.enabled = true;
			setSubCoords(table,SUBCOORD(0,40,20,20));
			setSortState(3,id-2);
		end;
	end;
end;

function lightFaceSort(id,typ)
	local table = {};
	if id <11 then
		table = game.ui.facepanelA.sort.people;
	elseif id>10 and id<21 then
		table = game.ui.facepanelA.sort.vehicle;
	else
		table = game.ui.facepanelA.sort.building;
	end;

	for k, v in pairs(table) do
		if (type(v) == "table") and v.butID == id then
			table = v;
			break;
		end;
	end;

	if typ == 1 then
		setSubCoords(table,SUBCOORD(0,20,20,20));
	elseif typ == 0 then
		if table.enabled then
			setSubCoords(table,SUBCOORD(0,40,20,20));
		else
			setSubCoords(table,SUBCOORD(0,0,20,20));
		end;
	end;
end;

function setSortState(id,state)
	if id == 3 then
		facesort.number = setSubBits(facesort.number,state,3,3);
	else
		facesort.number = setBit(facesort.number,BoolToInt(state),id);
	end;
	OW_SETTING_WRITE('GAME', 'faceSort', facesort.number);


		switch(id) : caseof {
			[1]    = function (x) facesort.human.nation = state end,
			[2]    = function (x) facesort.human.class = state end,
			[3]    = function (x) facesort.human.skill = state end,
			[11]   = function (x) facesort.vehicle.nation = state end,
			[12]   = function (x) facesort.vehicle.chassis = state end,
			[13]   = function (x) facesort.vehicle.weapon = state end,
			[14]   = function (x) facesort.vehicle.control = state end,
			[15]   = function (x) facesort.vehicle.engine = state end,
			[21]   = function (x) facesort.building.nation = state end;
			[22]   = function (x) facesort.building.kind = state end;
			[23]   = function (x) facesort.building.weapon = state end;
		};

	OW_FACESORT('FaceSort');
end;

function test()
end;

function updateFaceSortIcons()
	setInterfaceTexture(game.ui.facepanelA.sort.people.nation, 'face/sort_nat.png');
        setInterfaceTexture(game.ui.facepanelA.sort.people.class, 'face/sort_class.png');
        setInterfaceTexture(game.ui.facepanelA.sort.people.spiltter1, 'sliders.png');
        setInterfaceTexture(game.ui.facepanelA.sort.people.sol, 'face/sort_sol.png');
        setInterfaceTexture(game.ui.facepanelA.sort.people.eng, 'face/sort_eng.png');
        setInterfaceTexture(game.ui.facepanelA.sort.people.mech, 'face/sort_mech.png');
        setInterfaceTexture(game.ui.facepanelA.sort.people.sci, 'face/sort_sci.png');
        setInterfaceTexture(game.ui.facepanelA.sort.vehicle.nation, 'face/sort_nat.png');
        setInterfaceTexture(game.ui.facepanelA.sort.vehicle.chassis, 'face/sort_chas.png');
        setInterfaceTexture(game.ui.facepanelA.sort.vehicle.weapon, 'face/sort_weapon.png');
        setInterfaceTexture(game.ui.facepanelA.sort.vehicle.control, 'face/sort_control.png');
        setInterfaceTexture(game.ui.facepanelA.sort.vehicle.engine, 'face/sort_motor.png');
        setInterfaceTexture(game.ui.facepanelA.sort.building.nation, 'face/sort_nat.png');
        setInterfaceTexture(game.ui.facepanelA.sort.building.kind, 'face/sort_bkind.png');
        setInterfaceTexture(game.ui.facepanelA.sort.building.weapon, 'face/sort_weapon.png');
end;

game.ui.facepanelA.sort = {};
game.ui.facepanelA.sort.people = getElementEX(game.ui.facepanelA,anchorLT,XYWH(0,1,7*20,20),true,{colour1=BLACKA(40)});
game.ui.facepanelA.sort.people.nation = getSortButton(game.ui.facepanelA.sort.people,
	anchorLT, XYWH(0,0,20,20),1,
	{texture='sgui/amer/face/sort_nat.png',hint=loc(TID_Sort_ByNation),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);
game.ui.facepanelA.sort.people.class = getSortButton(game.ui.facepanelA.sort.people,
	anchorLT, XYWH(20+1,0,20,20),2,
	{texture='sgui/amer/face/sort_class.png',hint=loc(TID_Sort_ByClass),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);

game.ui.facepanelA.sort.people.spiltter1 = getElementEX(game.ui.facepanelA.sort.people,
	anchorLT, XYWH(40+1,0,14,20),true,
	{subtexture=true, subcoords=SUBCOORD(X,0,14,196), nomouseevent = true,texture='sgui/amer/sliders.png'}
);
--setInterfaceTexture(game.ui.facepanelA.sort.people.spiltter1,'sliders.png');

game.ui.facepanelA.sort.people.sol = getSortButton(game.ui.facepanelA.sort.people,
	anchorLT, XYWH(40+1+14,0,20,20),3,
	{texture='sgui/amer/face/sort_sol.png',hint=loc(TID_Sort_BySol),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);

game.ui.facepanelA.sort.people.eng = getSortButton(game.ui.facepanelA.sort.people,
	anchorLT, XYWH(60+2+14,0,20,20),4,
	{texture='sgui/amer/face/sort_eng.png',hint=loc(TID_Sort_ByEng),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);


game.ui.facepanelA.sort.people.mech = getSortButton(game.ui.facepanelA.sort.people,
	anchorLT, XYWH(80+3+14,0,20,20),5,
	{texture='sgui/amer/face/sort_mech.png',hint=loc(TID_Sort_ByMech),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);


game.ui.facepanelA.sort.people.sci = getSortButton(game.ui.facepanelA.sort.people,
	anchorLT, XYWH(100+4+14,0,20,20),6,
	{texture='sgui/amer/face/sort_sci.png',hint=loc(TID_Sort_BySci),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);


game.ui.facepanelA.sort.vehicle = getElementEX(game.ui.facepanelA,anchorLT,XYWH(getWidth(game.ui.facepanelA)*0.40,1,5*20,20),true,{colour1=BLACKA(40)});
game.ui.facepanelA.sort.vehicle.nation = getSortButton(game.ui.facepanelA.sort.vehicle,
	anchorLT, XYWH(0,0,20,20),11,
	{texture='sgui/amer/face/sort_nat.png',hint=loc(TID_Sort_ByNation),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);
game.ui.facepanelA.sort.vehicle.chassis = getSortButton(game.ui.facepanelA.sort.vehicle,
	anchorLT, XYWH(20+1,0,20,20),12,
	{texture='sgui/amer/face/sort_chas.png',hint=loc(TID_Sort_ByChassis),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);

game.ui.facepanelA.sort.vehicle.weapon = getSortButton(game.ui.facepanelA.sort.vehicle,
	anchorLT, XYWH(40+2,0,20,20),13,
	{texture='sgui/amer/face/sort_weapon.png',hint=loc(TID_Sort_ByWeapon),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);

game.ui.facepanelA.sort.vehicle.control = getSortButton(game.ui.facepanelA.sort.vehicle,
	anchorLT, XYWH(60+3,0,20,20),14,
	{texture='sgui/amer/face/sort_control.png',hint=loc(TID_Sort_ByControl),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);


game.ui.facepanelA.sort.vehicle.engine = getSortButton(game.ui.facepanelA.sort.vehicle,
	anchorLT, XYWH(80+4,0,20,20),15,
	{texture='sgui/amer/face/sort_motor.png',hint=loc(TID_Sort_ByEngine),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);


game.ui.facepanelA.sort.building = getElementEX(game.ui.facepanelA,anchorLT,XYWH(getWidth(game.ui.facepanelA)*0.70,1,5*20,20),true,{colour1=BLACKA(40)});
game.ui.facepanelA.sort.building.nation = getSortButton(game.ui.facepanelA.sort.building,
	anchorLT, XYWH(0,0,20,20),21,
	{texture='sgui/amer/face/sort_nat.png',hint=loc(TID_Sort_ByNation),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);
game.ui.facepanelA.sort.building.kind = getSortButton(game.ui.facepanelA.sort.building,
	anchorLT, XYWH(20+1,0,20,20),22,
	{texture='sgui/amer/face/sort_bkind.png',hint=loc(TID_Sort_ByBKind),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);

game.ui.facepanelA.sort.building.weapon = getSortButton(game.ui.facepanelA.sort.building,
	anchorLT, XYWH(40+2,0,20,20),23,
	{texture='sgui/amer/face/sort_weapon.png',hint=loc(TID_Sort_ByWeapon),subtexture=true, subcoords=SUBCOORD(0,0,20,20)}
);



facesort= {number = 0, human = {}, vehicle= {}, building= {}};


function LoadFaceSortSet()
	local fsn = 0;
	fsn = setBit(fsn,1,1);
--	fsn = setBit(fsn,1,2);
--	fsn = setBit(fsn,0,2);
--	fsn = setSubBits(fsn,4,3,3);
--	fsn = setSubBits(fsn,2,3,3);
	fsn = setBit(fsn,1,11);
--	fsn = setBit(fsn,1,12);
	fsn = setBit(fsn,1,21);
--	fsn = setBit(fsn,1,22);
	facesort.number = OW_SETTING_READ_NUMBER('GAME', 'faceSort', fsn);

	facesort.human.nation = getBit(facesort.number,1);
	game.ui.facepanelA.sort.people.nation.enabled = facesort.human.nation;
	facesort.human.class = getBit(facesort.number,2);
	game.ui.facepanelA.sort.people.class.enabled = facesort.human.class;
	facesort.human.skill = getSubBits(facesort.number,3,3);
	switch(facesort.human.skill) : caseof {
		[1]    = function (x) game.ui.facepanelA.sort.people.sol.enabled = true; end,
		[2]    = function (x) game.ui.facepanelA.sort.people.eng.enabled = true; end,
		[3]    = function (x) game.ui.facepanelA.sort.people.mech.enabled = true; end,
		[11]   = function (x) game.ui.facepanelA.sort.people.sci.enabled = true; end,
	};

	facesort.vehicle.nation = getBit(facesort.number,11);
	game.ui.facepanelA.sort.vehicle.nation.enabled = facesort.vehicle.nation;
	facesort.vehicle.chassis = getBit(facesort.number,12);
	game.ui.facepanelA.sort.vehicle.chassis.enabled = facesort.vehicle.chassis;
	facesort.vehicle.weapon = getBit(facesort.number,13);
	game.ui.facepanelA.sort.vehicle.weapon.enabled = facesort.vehicle.weapon;
	facesort.vehicle.control = getBit(facesort.number,14);
	game.ui.facepanelA.sort.vehicle.control.enabled = facesort.vehicle.control;
	facesort.vehicle.engine = getBit(facesort.number,15);
	game.ui.facepanelA.sort.vehicle.engine.enabled = facesort.vehicle.engine;

	facesort.building.nation = getBit(facesort.number,21);
	game.ui.facepanelA.sort.building.nation.enabled = facesort.building.nation;
	facesort.building.kind = getBit(facesort.number,22);
	game.ui.facepanelA.sort.building.kind.enabled = facesort.building.kind;
	facesort.building.weapon = getBit(facesort.number,23);
	game.ui.facepanelA.sort.building.weapon.enabled = facesort.building.weapon;

	lightFaceSort(1,0);
	lightFaceSort(2,0);
	lightFaceSort(3,0);
	lightFaceSort(4,0);
	lightFaceSort(5,0);
	lightFaceSort(6,0);

	lightFaceSort(11,0);
	lightFaceSort(12,0);
	lightFaceSort(13,0);
	lightFaceSort(14,0);
	lightFaceSort(15,0);

	lightFaceSort(21,0);
	lightFaceSort(22,0);
	lightFaceSort(23,0);
end;

LoadFaceSortSet();

--[[ FaceSort(ITEM1, ITEM2) BREAKDOWN
ID
TEXTURE
TYP
HEALTH
MAXHEALTH
SIDE
NATION
ACTIVITY
MORALDR
SORTNUMBER
DEADUNIT
TRVANINAPADU
IMPORTANCE
INFO
VALUES
VALUESTEXT
CANATTACK

[HUMAN]
	CLASS
	CLASSTYPE
	SKILLICONS
	SKILLS
	SKILLSTEXT

	INSIDEUNIT -- ONLY EXISTS IF UNIT IS INSIDE BUILDING/VEHICLE. INSIDEUNIT will be that units information (As in all of whats contained here).

[VEHICLE]

	CHASSIS
	CHASSIS_WEIGHT
	CHASSIS_MOVEMENT_TYPE
	CONTROLLER
	WEAPON
	WEAPON_PAYLOAD
	WEAPON_PAYLOADOVERRIDE
	ENGINE

	ID2 -- DRIVER ID
	HEALTH2 -- DRIVER HEALTH
	MAXHEALTH2 -- DRIVER MAXHEALTH
	TEXTURE2 -- DRIVER TEXTURE

[BUILDING]

	BUILDINGID
	KIND
	KIND1
	KIND2
	KINDNAME
	KIND1NAME
	KIND2NAME
	BUDINFO
	BUDISUPGRADE
	PHASE
	WEAPON
	WEAPON_PAYLOAD
	WEAPON_PAYLOADOVERRIDE
	RESEARCH
	RESEARCHNAME
	QUEUE
	QUEUECOUNT
	FACTORYCURRENTBUILD
	PATROL
	EXTENSIONS
	EXTENSIONSCOUNT


--]]

function FaceSort_Human(ITEM1,ITEM2,NATION1,NATION2)
	if not ITEM1.DEADUNIT and not ITEM2.DEADUNIT then
		if facesort.human.nation then
			if NATION1 > NATION2 then
				return false;
			elseif NATION1 < NATION2 then
				return true;
			end;
		end;

		if facesort.human.class then
			if ITEM1.CLASSTYPE > ITEM2.CLASSTYPE then
				return false;
			elseif ITEM1.CLASSTYPE < ITEM2.CLASSTYPE then
				return true;
			end;
		end;

		if facesort.human.skill > 0 then
			if ITEM1.SKILLS[facesort.human.skill] < ITEM2.SKILLS[facesort.human.skill] then
				return false;
			elseif ITEM1.SKILLS[facesort.human.skill] > ITEM2.SKILLS[facesort.human.skill] then
				return true;
			end;
		elseif facesort.human.class and facesort.human.skill == 0 then

			local classtype1 = ITEM1.CLASSTYPE;
			local classtype2 = ITEM2.CLASSTYPE;

			if classtype1 < 0 or classtype1 > 4 then
				classtype1 = 1;
			end;
			if classtype2 < 0 or classtype2 > 4 then
				classtype2 = 1;
			end;
			if ITEM1.SKILLS[classtype1] < ITEM2.SKILLS[classtype2] then
				return false;
			elseif ITEM1.SKILLS[classtype1] > ITEM2.SKILLS[classtype2] then
				return true;
			end;
		end;

		if ITEM1.IMPORTANCE < ITEM2.IMPORTANCE then
			return false;
		elseif ITEM1.IMPORTANCE > ITEM2.IMPORTANCE then
			return true;
		end;

		if ITEM1.ID > ITEM2.ID then
			return false;
		elseif ITEM1.ID < ITEM2.ID then
			return true;
		end;
	else
		if ITEM1.DEADUNIT and not ITEM2.DEADUNIT then
			return false;
		elseif not  ITEM1.DEADUNIT and ITEM2.DEADUNIT then
			return true;
		end;
	end;

	return false;
end;

function FaceSort_Vehicle(ITEM1,ITEM2,NATION1,NATION2)
	if facesort.vehicle.nation then
		if NATION1 > NATION2 then
			return false;
		elseif NATION1 < NATION2 then
			return true;
		end;
	end;

	if facesort.vehicle.chassis then

		local CHASSISTYPE1 = 100*ITEM1.CHASSIS_WEIGHT + ITEM1.CHASSIS_MOVEMENT_TYPE;
		local CHASSISTYPE2 = 100*ITEM2.CHASSIS_WEIGHT + ITEM2.CHASSIS_MOVEMENT_TYPE;

		if CHASSISTYPE1 > CHASSISTYPE2 then
			return false;
		elseif CHASSISTYPE1 < CHASSISTYPE2 then
			return true;
		end;

		if ITEM1.CHASSIS > ITEM2.CHASSIS then
			return false;
		elseif ITEM1.CHASSIS < ITEM2.CHASSIS then
			return true;
		end;
	end;

	if facesort.vehicle.weapon then
		if ITEM1.WEAPON == 0 and ITEM2.WEAPON > 0 then
			return false;
		elseif ITEM1.WEAPON > 0 and ITEM2.WEAPON == 0 then
			return true;
		end;

		if ITEM1.WEAPON > 0 and ITEM2.WEAPON > 0 then

			local PAYLOAD1 = ITEM1.WEAPON_PAYLOAD;
			local PAYLOAD2 = ITEM2.WEAPON_PAYLOAD;

			if ITEM1.WEAPON_PAYLOADOVERRIDE > 0 then
				PAYLOAD1 = ITEM1.WEAPON_PAYLOADOVERRIDE;
			end;

			if ITEM2.WEAPON_PAYLOADOVERRIDE > 0 then
				PAYLOAD2 = ITEM2.WEAPON_PAYLOADOVERRIDE;
			end;

			if PAYLOAD1 > PAYLOAD2 then
				return false;
			elseif PAYLOAD1 < PAYLOAD2 then
				return true;
			end;
		end;
	end;

	if facesort.vehicle.control then
		if ITEM1.CONTROLLER > ITEM2.CONTROLLER then
			return false;
		elseif ITEM1.CONTROLLER < ITEM2.CONTROLLER then
			return true;
		end;
	end;

	if facesort.vehicle.engine then
		if ITEM1.ENGINE > ITEM2.ENGINE then
			return false;
		elseif ITEM1.ENGINE < ITEM2.ENGINE then
			return true;
		end;
	end;

	if ITEM1.ID > ITEM2.ID then
		return false;
	elseif ITEM1.ID < ITEM2.ID then
		return true;
	end;

	return false;
end;

function FaceSort_Building(ITEM1,ITEM2,NATION1,NATION2)
	if facesort.building.nation then
		if NATION1 > NATION2 then
			return false;
		elseif NATION1 < NATION2 then
			return true;
		end;
	end;

	if facesort.building.kind then
		if ITEM1.KIND > ITEM2.KIND then
			return false;
		elseif ITEM1.KIND < ITEM2.KIND then
			return true;
		end;
	end;

	if facesort.building.weapon then
		if ITEM1.WEAPON == 0 and ITEM2.WEAPON > 0 then
			return false;
		elseif ITEM1.WEAPON > 0 and ITEM2.WEAPON == 0 then
			return true;
		end;

		if ITEM1.WEAPON > 0 and ITEM2.WEAPON > 0 then

			local PAYLOAD1 = ITEM1.WEAPON_PAYLOAD;
			local PAYLOAD2 = ITEM2.WEAPON_PAYLOAD;

			if ITEM1.WEAPON_PAYLOADOVERRIDE > 0 then
				PAYLOAD1 = ITEM1.WEAPON_PAYLOADOVERRIDE;
			end;

			if ITEM2.WEAPON_PAYLOADOVERRIDE > 0 then
				PAYLOAD2 = ITEM2.WEAPON_PAYLOADOVERRIDE;
			end;

			if PAYLOAD1 > PAYLOAD2 then
				return false;
			elseif PAYLOAD1 < PAYLOAD2 then
				return true;
			end;
		end;
	end;

	if ITEM1.ID > ITEM2.ID then
		return false;
	elseif ITEM1.ID < ITEM2.ID then
		return true;
	end;

	return false;
end;


function FaceSort(ITEM1,ITEM2)
	local NATION1 = ITEM1.NATION;
	local NATION2 = ITEM2.NATION;

	if NATION1 == 0 then
		NATION1 = 100;
	end;
	if NATION2 == 0 then
		NATION2 = 100;
	end;

	if ITEM1.TYP == 1 then
		return FaceSort_Human(ITEM1,ITEM2,NATION1,NATION2);
	elseif ITEM1.TYP == 2 then
		return FaceSort_Vehicle(ITEM1,ITEM2,NATION1,NATION2);
	elseif ITEM1.TYP == 3 then
		return FaceSort_Building(ITEM1,ITEM2,NATION1,NATION2);
	end;

	return false;
end;

OW_FACESORT('FaceSort');


function FROMSGUI_KEYDOWN(KEY)
	if (KEY == VK_ESC) and (getVisible(game)) then
		if not OW_FORM_CLOSE_TOP((KEY == VK_ESC)) then
			if getVisible(dialog.options) then --In-Game Options doesn't use the forms to pause the game. So we need to handle it.
				dialog.options.Hide();
			elseif getVisible(dialog.achievs) then
				HideDialog(dialog.achievs);
			else
				OW_TOOLBARBUTTON(1);
			end;
		end;
	end;
end;
