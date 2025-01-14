--[[ Bleed custom debuffType status for Grid2 addon by MiCHaEL --]]
local Grid2 = Grid2

-- update supported bleed dispel depending of player talents
if Grid2.playerClass=='EVOKER' then
	Grid2:PreHookFunc( Grid2, 'UpdatePlayerDispelTypes', function(self)
		self.debuffPlayerDispelTypes.Bleed = IsPlayerSpell(374251)
	end )
end

-- register status setup function
Grid2.setupFunc["debuffType-Bleed"] = function(baseKey, dbx)
	local debuffs = LibStub("LibDispel-1.0", true):GetBleedList()
	return Grid2.setupFunc.debuffType(baseKey, dbx, debuffs)
end

Grid2:DbSetStatusDefaultValue( "debuff-Bleed",  { type = "debuffType", subType = "Bleed", setupFunc = 'debuffType-Bleed', color1 = {r=1, g=.2, b=.6,a=1 } } )
