--[[ Bleed custom debuffType status for Grid2 addon by MiCHaEL --]]
local Grid2 = Grid2

if Grid2.RegisterDebuffTypeSpells==nil then
	print("Grid2StatusBleedDebuffs Error: This plugin requires Grid2 v2.6.80 or higher. You must update Grid2 addon to the latest version.")
	return
end

-- update supported bleed dispel depending of player talents
if Grid2.playerClass=='EVOKER' then
	Grid2:PreHookFunc( Grid2, 'UpdatePlayerDispelTypes', function(self)
		self.debuffPlayerDispelTypes.Bleed = IsPlayerSpell(374251)
	end )
end

-- register make options function
Grid2:PostHookFunc( Grid2, 'LoadOptions', function()
	Grid2Options:RegisterStatusOptions("debuffType-Bleed", "debuff", Grid2Options.MakeStatusCustomDebuffTypeOptions, {groupOrder = 11})
end )

-- register status setup function
Grid2.setupFunc["debuffType-Bleed"] = function(baseKey, dbx)
	Grid2:RegisterDebuffTypeSpells(dbx.subType, LibStub("LibDispel-1.0", true):GetBleedList(), false)
	Grid2:RegisterDebuffTypeSpells(dbx.subType, dbx.debuffsList, true)
	return Grid2.setupFunc.debuffType(baseKey, dbx)
end

Grid2:DbSetStatusDefaultValue( "debuff-Bleed",  { type = "debuffType", subType = "Bleed", setupFunc = 'debuffType-Bleed', color1 = {r=1, g=.2, b=.6,a=1 } } )
