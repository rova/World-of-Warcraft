RecountFu = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceDB-2.0", "FuBarPlugin-2.0", "AceEvent-2.0")
local L = AceLibrary("AceLocale-2.2"):new("RecountFu")
local Tablet = AceLibrary("Tablet-2.0")
local Crayon = AceLibrary("Crayon-2.0")

L:RegisterTranslations("enUS", function() return {
	["tabletHint1"] = "Left-Click to toggle window visibility.",
	["tabletHint2"] = "Double-Left-Click to reset window position.",
	["tabletHint3"] = "Alt-Click to reset data.",
	["labelName"] = "Recount",
	["Session"] = true,
	["Last Fight"] = true,
	["Total"] = true,
	["Per Second"] = true,
	["Damage Done"] = true,
	["Healing Done"] = true,
	["Damage Taken"] = true,
	["Healing Taken"] = true,
	["No Damage Change"] = true,
	["Heal Summary"] = true,
	["Damage Summary"] = true,
} end)

L:RegisterTranslations("deDE", function() return {
	["tabletHint1"] = "Linksklick um das Recount-Fenster ein-/auszublenden.",
	["tabletHint2"] = "Doppel-Linksklick um die Fensterposition zurückzusetzen.",
	["tabletHint3"] = "Alt-Klick um Daten zurückzusetzen.",
	["labelName"] = "Recount",
	["Session"] = "Session",
	["Last Fight"] = "Letzter Kampf",
	["Total"] = "Gesamt",
	["Per Second"] = "Pro Sekunde",
	["Damage Done"] = "Schaden gemacht",
	["Healing Done"] = "Geheilt für",
	["Damage Taken"] = "Schaden genommen",
	["Healing Taken"] = "Heilung bekommen",
	["No Damage Change"] = "Keine Schadensänderung",
	["Heal Summary"] = "Zusammenfassung Heilung",
	["Damage Summary"] = "Zusammenfassung Schaden",
} end)

L:RegisterTranslations("zhTW", function() return {
	["tabletHint1"] = "點擊左鍵切換視窗顯示",
	["tabletHint2"] = "雙擊左鍵重置視窗位置",
	["tabletHint3"] = "Alt-點擊重置資料",
	["labelName"] = "Recount",
	["Session"] = "本次",
	["Last Fight"] = "最後一次戰鬥",
	["Total"] = "總計",
	["Per Second"] = "每秒",
	["Damage Done"] = "輸出傷害",
	["Healing Done"] = "輸出治療",
	["Damage Taken"] = "承受傷害",
	["Healing Taken"] = "接受治療",
	["No Damage Change"] = "輸出傷害與受到治療持平",
	["Heal Summary"] = "受到治療多出承受傷害",
	["Damage Summary"] = "承受傷害多出受到治療",
} end)

L:RegisterTranslations("zhCN", function() return {
	["tabletHint1"] = "左键点击 - 显示/隐藏 Recount.",
	["tabletHint2"] = "双击 - 重置 Recount 位置.",
	["tabletHint3"] = "Alt 点击 - 重置数据.",
	["labelName"] = "Recount",
	["Session"] = "本次连接",
	["Last Fight"] = "最后一次战斗",
	["Total"] = "总计",
	["Per Second"] = "每秒",
	["Damage Done"] = "输出伤害",
	["Healing Done"] = "输出治疗",
	["Damage Taken"] = "承受伤害",
	["Healing Taken"] = "接受治疗",
	["No Damage Change"] = "输出伤害与受到治疗持平",
	["Heal Summary"] = "受到治疗多出承受伤害",
	["Damage Summary"] = "承受伤害多出受到治疗",
} end)

L:RegisterTranslations("koKR", function() return {
	["tabletHint1"] = "좌-클릭 : Recount 창 표시/숨김.",
	["tabletHint2"] = "더블-좌-클릭 : 창 위치 초기화.",
	["tabletHint3"] = "Alt-클릭 : 데이터 초기화.",
	["labelName"] = "Recount",
	["Session"] = "세션",
	["Last Fight"] = "마지막 전투",
	["Total"] = "전체",
	["Per Second"] = "초당",
	["Damage Done"] = "데미지",
	["Healing Done"] = "치유량",
	["Damage Taken"] = "받은 데미지",
	["Healing Taken"] = "받은 치유량",
	["No Damage Change"] = "데미지 변화 없음",
	["Heal Summary"] = "치유량 요약",
["Damage Summary"] = "데미지 요약",
} end)

--ruRU by Swix.  Report bugs to http://forums.playhard.ru/index.php?showforum=89
L:RegisterTranslations("ruRU", function() return {
	["tabletHint1"] = "Левый клик - показать/скрыть Recount.",
	["tabletHint2"] = "Двойной левый клик - установить позицию окна Recount по-умолчанию.",
	["tabletHint3"] = "Alt+Левый клик - сбросить данные.",
	["labelName"] = "Учетчик",
	["Session"] = "Сессия",
	["Last Fight"] = "Последний бой",
	["Total"] = "Всего",
	["Per Second"] = "В секунду",
	["Damage Done"] = "Нанесено урона",
	["Healing Done"] = "Нанесено исцеления",
	["Damage Taken"] = "Получено урона",
	["Healing Taken"] = "Получено исцеления",
	["No Damage Change"] = "Нет повреждений",
	["Heal Summary"] = "Всего исцеления",
	["Damage Summary"] = "Всего урона",
} end)

RecountFu.hasIcon = true
RecountFu.defaultPosition = "RIGHT"
RecountFu:RegisterDB("RecountFuDB")

RecountFu:RegisterDefaults("profile", {
	text = {
	dps_type = "LastFight", -- Darkclaw: removed space. RecountFu_Options.lua, DPS_Type = {...}
	dps_raid = "SelfDPS", -- Darkclaw: Added new default for dps_raid. RecountFu_Options.lua, DPS_Raid = {...}
	show_dps = false,
	update_time = 0.5,
	show_combat_time = false -- Darkclaw: found no options in RecountFu_Options.lua, textOptions. not fully implemented?
	}
})

function RecountFu:OnTextUpdate()
	self:DoTextUpdate()
end

function RecountFu:OnTooltipUpdate() 
	cat = Tablet:AddCategory(
		'columns', 3,
		'text',L["Session"]
	)
	self:GetTooltipSection(cat,"OverallData")
	cat = Tablet:AddCategory(
		'columns', 3,
		'text',L["Last Fight"]
	)
	self:GetTooltipSection(cat,"LastFightData")
	Tablet:SetHint(L["tabletHint1"] .. "\n" .. L["tabletHint2"] .. "\n" .. L["tabletHint3"])
end

function RecountFu:GetTooltipSection(cat,tableToUse)
	cat:AddLine({text = "", text2=L["Total"], text3=L["Per Second"]})
	cat:AddLine(self:GetTooltipLine(L["Damage Done"],tableToUse,"Damage"))
	cat:AddLine(self:GetTooltipLine(L["Healing Done"],tableToUse,"Healing"))
	cat:AddLine(self:GetTooltipLine(L["Damage Taken"],tableToUse,"DamageTaken"))
	cat:AddLine(self:GetTooltipLine(L["Healing Taken"],tableToUse,"HealingTaken"))
	cat:AddLine(self:GetDamageHealingSummaryTooltipLine(tableToUse))
end

function RecountFu:GetTooltipLine(title,tableToUse,valueToUse)
	line = {}
	line.text = title
	line.text2 = self:getValue(tableToUse,valueToUse)
	line.text3 = self:getValuePerSecond(tableToUse,valueToUse)
	return line
end

function RecountFu:GetDamageHealingSummaryTooltipLine(tableToUse)
	local sumDmgHeal = self:getValue(tableToUse,"HealingTaken")-self:getValue(tableToUse,"DamageTaken")
	if sumDmgHeal == 0 then
		line.text = L["No Damage Change"]
		line.text2 = ""
	elseif sumDmgHeal > 0 then
		line.text = L["Heal Summary"]
		line.text2 = sumDmgHeal
	else
		line.text = L["Damage Summary"]
		line.text2 = sumDmgHeal*-1
	end
	line.text3 = ""
	return line
end

function RecountFu:OnClick()
	if IsAltKeyDown() then
		Recount:ResetData()
		return
	end
	if Recount.MainWindow:IsShown() then
		Recount.MainWindow:Hide()
	else 
		Recount.MainWindow:Show()
		Recount:RefreshMainWindow()
	end
end

function RecountFu:OnDoubleClick()
	Recount:ResetPositions()
	Recount.MainWindow:Show()
	Recount:RefreshMainWindow()
end

function RecountFu:OnEnable()
	self:UpdateTimeChanged()
	self.LastFightDPS = 0
	self.CurrentFightDPS = 0
end

function RecountFu:UpdateTimeChanged()
	if self:IsEventRegistered(self.name.."TEXT_UPDATE") then
		self:UnregisterEvent(self.name.."TEXT_UPDATE")
	end
	if RecountFu.db.profile.text.show_dps then
		self:ScheduleRepeatingEvent(self.name.."TEXT_UPDATE",RecountFu.DoTextUpdate,RecountFu.db.profile.text.update_time,self)
	end
end

function RecountFu:getValuePerSecond(tableToUse,valueToUse)
	playerName = UnitName("player")
	Epsilon = 0.000000000000000001
	if valueToUse == "Damage" then
		local _,dps = Recount:MergedPetDamageDPS(Recount.db2.combatants[playerName],tableToUse) -- Elsia: Proper merged pet handling
		return math.floor(10*dps+0.5)/10
	else
		combatData = Recount.db2.combatants[playerName] and Recount.db2.combatants[playerName].Fights and Recount.db2.combatants[playerName].Fights[tableToUse]
		local cvalue = combatData and combatData[valueToUse] or 0
		local activetime = combatData and combatData.ActiveTime or 0
		return math.floor(10*cvalue/(activetime+Epsilon)+0.5)/10
	end
end

function RecountFu:getRaidValuePerSecond(tableToUse)
	Epsilon = 0.000000000000000001
	dps = 0
	for _,data in pairs(Recount.db2.combatants) do
		if data.Fights and data.Fights[tableToUse] and (data.type=="Self" or data.type=="Grouped" or data.type=="Pet") then
			local _,curdps = Recount:MergedPetDamageDPS(data,tableToUse)
			if data.type ~= "Pet" or (not Recount.db.profile.MergePets and data.Owner and (Recount.db2.combatants[data.Owner].type=="Self" or Recount.db2.combatants[data.Owner].type=="Grouped")) then -- Elsia: Only add to total if not merging pets.
				dps = dps + 10*curdps
				--dps = dps + 10*(data.Fights[tableToUse].Damage or 0)/((data.Fights[tableToUse].ActiveTime or 0)+Epsilon)
			end
		end
	end
	return math.floor(dps+0.5)/10
end


function RecountFu:getValue(tableToUse,valueToUse)
	playerName = UnitName("player")
	if valueToUse == "Damage" then
		local damage,_ = Recount:MergedPetDamageDPS(Recount.db2.combatants[playerName],tableToUse) -- Elsia: Proper merged pet handling
		return damage
	else
		combatData = Recount.db2.combatants[playerName] and Recount.db2.combatants[playerName].Fights and Recount.db2.combatants[playerName].Fights[tableToUse]
		return combatData and combatData[valueToUse] or 0
	end
end

function RecountFu:getTimeInCombat(tableToUse)
	Epsilon = 0.000000000000000001
	return math.floor(10*(self:getValue(tableToUse,"ActiveTime")+Epsilon))/10
end

function RecountFu:DoTextUpdate()
	local text = ""
	if self:IsTextShown() then
		if RecountFu.db.profile.text.show_dps then
			text = text .. self:GetFubarDPS()
		end
		if RecountFu.db.profile.text.show_combat_time then
			text = text .. self:GetFubarTimeInCombat()
		end
	else
		text = Crayon:White(L["labelName"])
	end
	self:SetText(text)
end

function RecountFu:GetFubarDPS()
	text = Crayon:Orange(" DPS:")
	if RecountFu.db.profile.text.dps_type == "LastFight" then
		if Recount.InCombat then
			if RecountFu.db.profile.text.dps_raid == "RaidDPS" then
				self.CurrentFightDPS = self:getRaidValuePerSecond("CurrentFightData")
			else
				self.CurrentFightDPS = self:getValuePerSecond("CurrentFightData","Damage")
			end
			text = text .. Crayon:Red(self.CurrentFightDPS)
		else
			if RecountFu.db.profile.text.dps_raid == "RaidDPS" then
				self.LastFightDPS = self:getRaidValuePerSecond("LastFightData")
			else
				self.CurrentFightDPS = self:getValuePerSecond("LastFightData","Damage")
			end
			if self.LastFightDPS == 0 then
				if self.CurrentFightDPS > 0 then
					text = text .. Crayon:Yellow(self.CurrentFightDPS)
				else
					text = text .. Crayon:Blue("-")
				end
			else
				text = text .. Crayon:White(self.LastFightDPS)
			end
		end
	elseif RecountFu.db.profile.text.dps_type == "Overall" then
		if RecountFu.db.profile.text.dps_raid == "RaidDPS" then
			text = text .. Crayon:Green(self:getRaidValuePerSecond("OverallData"))
		else
			text = text .. Crayon:Green(self:getValuePerSecond("OverallData","Damage"))
		end
	end
	return text
end

function RecountFu:GetFubarTimeInCombat()
	text = Crayon:Orange(" Time:")
	if Recount.InCombat then
		timeInCombat = self:getTimeInCombat("CurrentFightData")
	else
		timeInCombat = self:getTimeInCombat("LastFightData")
	end
	if timeInCombat == 0 then
		text = text .. Crayon:Blue("-")
	else
		if Recount.InCombat then
			text = text .. Crayon:Red(timeInCombat)
		else
			text = text .. Crayon:White(timeInCombat)
		end
	end
	return text
end