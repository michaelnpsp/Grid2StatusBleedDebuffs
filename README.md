# Grid2StatusBleedDebuffs

This is a plugin for the World of Wacraft addon: Grid2 that adds a new debuff type status to track bleed debuffs.


## Features:

- This plugin creates a new debuff type called Bleed to track physical damage over time debuffs.

- After enabling this plugin Bleed debuffs will be shown as dispellable for Evoker classes with the Cauterizing Flame talent.

- Typeless debuff status will not display bleed debuffs after enabling this plugin.

- It's only compatible with World of Warcraft retail version.

Since Bleed isn't a category supported by the game like Curse, Poison, Magic and Disease, this plugin includes a database storing most of the bleed debuffs, this database is provided by the LibDispel libray. If some bleed debuff is not detected because is missing in the LibDispel library database, this plugin includes a configuration section where you can add any missing debuff.
