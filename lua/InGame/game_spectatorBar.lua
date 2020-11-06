-----------------------------------------------------------------------------
---  Orig. File : /lua/InGame/game_spectatorBar.lua
---  Version    : 1
---
---  Summary    : Players bars instead Resources bars.
---
---  Created    : Petr 'Sali' Salak, Freya Group
---  Modified   : Stuart 'Stucuk' Carey, OW Support
------------------------------------------------------------------------------

SpecBar = {};
SpecBar.count = 0;
SpecBar.bars  = {};

function makeSpecBarLabel(element,ID,IX,IY,IW,IH)
	return AddElement({
	type=TYPE_LABEL,
	parent=element,
	anchor=anchorLT,
	x=IX,
	y=IY,
	width=IW,
	height=IH,
	font_name=Tahoma_10B,--ADMUI3S ,
	--text_halign=ALIGN_MIDDLE,
	callback_mouseclick='',--'OW_SPECBAR_CLICK('..(ID)..');',,
	text='',--'test1,test2,test3,test4,test5',
	scissor=true,
	scroll_text=true,
});
end;

function makeSpecBar(ID)
	local specbarui = interface.current.game.ui.specbar;

	local element = AddElement({
		type=TYPE_ELEMENT,
		parent=game.ui,
		anchor=anchorTR,
		x=game.ui.width-specbarui.width,
		y=(ID-1)*specbarui.h,
		width=specbarui.width,
		height=specbarui.h,
		callback_mouseclick='',--'OW_RESOURCEBAR_CLICK('..(ID)..');',
		subtexture=true,
		subcoords=SUBCOORD(0,0,specbarui.wt,50),
		visible=false,
	});

	setInterfaceTexture(element,'SpecBar/SpecBar.png');
	element.l = {};
	element.l[1] = makeSpecBarLabel(element,ID,specbarui.x1,specbarui.y1,specbarui.w3,specbarui.h1);
	element.l[2] = makeSpecBarLabel(element,ID,specbarui.x2,specbarui.y1,specbarui.w1,specbarui.h1);
	element.l[3] = makeSpecBarLabel(element,ID,specbarui.x2+specbarui.w2,specbarui.y1,specbarui.w1,specbarui.h1);
	element.l[4] = makeSpecBarLabel(element,ID,specbarui.x2+specbarui.w2*2,specbarui.y1,specbarui.w1,specbarui.h1);
	element.l[5] = makeSpecBarLabel(element,ID,specbarui.x2+specbarui.w2*3,specbarui.y1,specbarui.w1,specbarui.h1);

	element.logo ={};
	element.logo[1] = getElementEX(
								element,
								anchorRT,
								XYWH(
									specbarui.x1-specbarui.logoX,
									specbarui.logoY,
									specbarui.logoW,
									specbarui.logoH
								),
								true,
								{
									colour1 = SIDE_COLOURS[ID+1],
									texture = 'SGUI/Nat/back.png',
								}
				);
	element.logo[1].nat = getElementEX(
								element.logo[1],
								anchorRT,
								XYWH(
									0,
									0,
									specbarui.logoW,
									specbarui.logoH
								),
								true,
								{
									colour1 = GRAY(SIDE_COLOURS[ID+1].c),
									texture = 'SGUI/Nat/am.png',
								}
				);

	for i=1,4 do
		element.logo[i+1] = getElementEX(
								element,
								anchorRT,
								XYWH(
									specbarui.x2+specbarui.w2*(i-1)-specbarui.logoX,
									specbarui.logoY,
									specbarui.logoW,
									specbarui.logoH
								),
								true,
								{
									colour1 = WHITEA(255),
									texture = 'empty.png',
								}
				);
		element.logo[i+1].iconName = "";
	end;
	return element;
end;

for i=1,9 do
 SpecBar.bars[i] = makeSpecBar(i);
end;

function setSpecBarCoords(ID,ISACTIVE)
	local specpos = 0;
	if ISACTIVE then
		specpos = 50;
	end;
	set_SubCoords(SpecBar.bars[ID].ID,PROP_SUBCOORDS,SUBCOORD(0,specpos,interface.current.game.ui.specbar.wt,50));
end;

function setSpecLogo(ID,ICON)					-- ICON - NAME OF PNG FILE inside SpecBar folder in nation directory.. like "crate"
	if ID > 1 and ID < 6 then
		for i=1,8 do
			if ICON and not ICON == "" then
				setInterfaceTexture(SpecBar.bars[i].logo[ID], 'SpecBar/'.. ICON ..'.png');
				SpecBar.bars[i].logo[ID].iconName = ICON;
			else
				setTexture(SpecBar.bars[i].logo[ID], 'empty.png');
				SpecBar.bars[i].logo[ID].iconName = "";
			end
		end;
	end;
end;

--[[
1: crate
2: oil
3: sib
4: human
--]]
function setSpecLogoNumber(ID,ICONNUMBER)					-- ICONNUMBER - Number of the icon
	if (ICONNUMBER <= 0 or ICONNUMBER > 4) then
       return;
 	end;
 	
 	local ICON = '';

	if ICONNUMBER == 1 then
		ICON = 'crate';
	end;

	if ICONNUMBER == 2 then
		ICON = 'oil';
	end;

	if ICONNUMBER == 3 then
		ICON = 'sib';
	end;

	if ICONNUMBER == 4 then
		ICON = 'human';
	end;

    setSpecLogo(ID, ICON);
end;

function setSpecText(SIDE,ID,TEXT)
	if (ID > 1 and ID < 6) and (SIDE > 0 and SIDE < 9) then
		setText(SpecBar.bars[SIDE].l[ID],TEXT);
	end;
end;


function DoInterfaceChange_Game_SpecBar()
	local specbarui = interface.current.game.ui.specbar;

	for i=1,9 do
		setInterfaceTexture(SpecBar.bars[i],'SpecBar/SpecBar.png');
		setXYWH(SpecBar.bars[i].l[1],XYWH(specbarui.x1,specbarui.y1,specbarui.w3,specbarui.h1));
		setXYWH(SpecBar.bars[i].l[2],XYWH(specbarui.x2,specbarui.y1,specbarui.w1,specbarui.h1));
		setXYWH(SpecBar.bars[i].l[3],XYWH(specbarui.x2+specbarui.w2,specbarui.y1,specbarui.w1,specbarui.h1));
		setXYWH(SpecBar.bars[i].l[4],XYWH(specbarui.x2+specbarui.w2*2,specbarui.y1,specbarui.w1,specbarui.h1));
		setXYWH(SpecBar.bars[i].l[5],XYWH(specbarui.x2+specbarui.w2*3,specbarui.y1,specbarui.w1,specbarui.h1));
		setSpecBarCoords(i,false);																					-- TO DO: If is already Active

		for j=2,5 do
			if not SpecBar.bars[i].logo[j].iconName == "" then
				setInterfaceTexture(SpecBar.bars[i].logo[j],'SpecBar/'.. SpecBar.bars[i].logo[j].iconName ..'.png');
			end;
		end;
	end;
end;

specBarVisible = 0;
function showSpecBar(bool)
	specBarVisible = 0;
	for i=1,9 do
		if bool == false or SpecBar.bars[i].isInGame == true then
			setVisible(SpecBar.bars[i],bool);
			if bool == true then
				specBarVisible = specBarVisible +1;
			end;
		end;
	end;


end;
