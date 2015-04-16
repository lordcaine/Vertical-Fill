--
-- Project: Vertical Fill
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2015 Arthur Roberts. All Rights Reserved.
-- 
local centerx, centery = display.contentWidth/2 , display.contentHeight/2local beerbottle = nillocal  fillAmount = 10local BBgroup = nillocal bb_fillFactor = 0local hold_bb_fillFactor = 0local bbOriginMasky = 0local bbOriginy = 0local BBgroup = display.newGroup()display.setDefault( "background", 1, 1, 1 )--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  fill the beer bottle indicator
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local fill_bottle = function(event)	

beerblock.maskY = beerblock.maskY + bb_fillFactor
beerblock.y = beerblock.y - bb_fillFactor
hold_bb_fillFactor = hold_bb_fillFactor + fillAmount 

if  hold_bb_fillFactor >=  88 then 

	hold_bb_fillFactor = 0
	beerblock.x = beerbottle.x
	beerblock.y = beerbottle.y
	beerblock.maskY = bbOriginMasky - beerbottle.height - 7
	beerblock.y = beerblock.y + beerbottle.height  + 7	

elseif  hold_bb_fillFactor <= 0 and scoreTextFlag == false then
	hold_bb_fillFactor = 0
	beerblock.x = beerbottle.x
	beerblock.y = beerbottle.y
	beerblock.maskY = bbOriginMasky - beerbottle.height - 7
	beerblock.y = beerblock.y + beerbottle.height  + 7	
else
end

end-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
--  empty the beer bottle indicator
-------------------------------------------------------------------------------------------------------------------------------------------
local  empty_bottle = function(event)	

hold_bb_fillFactor = hold_bb_fillFactor - fillAmount

if  hold_bb_fillFactor  > 0 then 
	beerblock.maskY = beerblock.maskY - bb_fillFactor
	beerblock.y = beerblock.y + bb_fillFactor
else
	hold_bb_fillFactor = 0
	beerblock.x = beerbottle.x
	beerblock.y = beerbottle.y
	beerblock.maskY = bbOriginMasky - beerbottle.height - 7
	beerblock.y = beerblock.y + beerbottle.height  + 7	
end

end--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------beerbottle = display.newImage( "beerbottle.png") ; 
beerbottle.alpha = 1
beerbottle.x = centerx
beerbottle.y = centerybeerbottle:addEventListener( "tap", fill_bottle )
mtbottle = display.newImage( "beerbottle.png") ; 
mtbottle.alpha = 1mtbottle:scale(.3,.3)mtbottle.rotation = 135
mtbottle.x = centerx + beerbottle.width + 50
mtbottle.y = centerymtbottle:addEventListener( "tap", empty_bottle )
bb_fillFactor = (math.round((beerbottle.height) / 100))  * fillAmount
local mask = graphics.newMask( "beerbottle-mask.png" )
beerblock = display.newRect( beerbottle.x-(beerbottle.width / 2 + 25), beerbottle.y-(beerbottle.height/2 + 25), beerbottle.width+50, beerbottle.height+50 )
beerblock:setFillColor(171, 0, 1)
beerblock:setMask( mask )
beerblock.alpha = .75

BBgroup:insert( beerblock )
BBgroup:insert( beerbottle )

bbOriginMasky = beerblock.maskY
bbOriginy = beerblock.y

beerblock.x = beerbottle.x
beerblock.y = beerbottle.y
beerblock.maskY = beerblock.maskY - beerbottle.height - 7
beerblock.y = beerblock.y + beerbottle.height  + 7