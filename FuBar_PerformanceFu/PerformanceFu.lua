local L = AceLibrary("AceLocale-2.2"):new("FuBar_PerformanceFu")
local Tablet = AceLibrary("Tablet-2.0")
local Crayon = LibStub("LibCrayon-3.0")

PerformanceFu = AceLibrary("AceAddon-2.0"):new("FuBarPlugin-2.0", "AceEvent-2.0", "AceDB-2.0")
local PerformanceFu = PerformanceFu

PerformanceFu.hasIcon = true

local scriptProfile = GetCVar("scriptProfile") == "1"
local updateTime = scriptProfile and 1 or 10

local string_format = string.format
local table_concat = table.concat
local table_insert = table.insert

local initialMemory, currentMemory = 0, 0
local mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10 = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
local timeSinceLastUpdate
local justEntered
local gcTime

local topAddons = {}
local totalAddonMemory = 0
local totalAddonCPU = 0
local new, del
do
	local list = setmetatable({},{__mode='k'})
	function new()
		local t = next(list)
		if t then
			list[t] = nil
			return t
		else
			return {}
		end
	end
	function del(t)
		for k in pairs(t) do
			t[k] = nil
		end
		list[t] = true
		return nil
	end
end

function PerformanceFu:OnInitialize()
	self.version = "2.0" .. string.sub("$Revision: 145 $", 12, -3)
	self.date = string.sub("$Date: 2008-11-19 12:24:40 +0000 (Wed, 19 Nov 2008) $", 8, 17)

	self:RegisterDB("PerformanceFuDB")
	self:RegisterDefaults("profile", {
		framerate = true,
		latency = false,
		memory = true,
		rate = false,
		numAddons = 3,
		ttFPS = true,
		ttAddon = true,
		ttMem = true,
		ttNetwork = true,
		sortBy = "1",
		showProfilingAlert = true,
		ttGrouping = false,
	})
end

function PerformanceFu:OnEnable()
	initialMemory = collectgarbage('count')
	currentMemory = initialMemory
	mem1 = currentMemory
	mem2 = currentMemory
	mem3 = currentMemory
	mem4 = currentMemory
	mem5 = currentMemory
	mem6 = currentMemory
	mem7 = currentMemory
	mem8 = currentMemory
	mem9 = currentMemory
	mem10 = currentMemory
	timeSinceLastUpdate = 0
	justEntered = true
	gcTime = time()
	self:ScheduleRepeatingEvent(self.OnUpdate, 1, self)

	if self.db.profile.showProfilingAlert then
		local profiling = tonumber(GetCVar("scriptProfile"))
		if not StaticPopupDialogs["AceProfilingAlert"] and type(profiling) == "number" and profiling == 1 then
			StaticPopupDialogs["AceProfilingAlert"] = {
				text = L["scriptProfiling"],
				button1 = L["Never show this message again."],
				button2 = TEXT(CLOSE) or "Close",
				showAlert = 1,
				timeout = 0,
				hideOnEscape = 1,
				whileDead = 1,
				OnAccept = function()
					self.db.profile.showProfilingAlert = false
				end,
			}
			StaticPopup_Show("AceProfilingAlert")
		end
	end
end

local options = {
	type = "group",
	pass = true,
	get = function(key)
		if key == "scriptProfile" then
			return GetCVar("scriptProfile") == "1"
		end
		return PerformanceFu.db.profile[key]
	end,
	set = function(key, value)
		if key == "scriptProfile" then
			SetCVar("scriptProfile", value and "1" or "0")
			ReloadUI()
		end
		PerformanceFu.db.profile[key] = value
		PerformanceFu:Update()
	end,
	func = "OnClick",
	args = {
		forcegc = {
			type = 'execute',
			name = L["Force garbage collection"],
			desc = L["Force a garbage collection to happen right now, clearing up unused memory."],
			order = 2,
		},
		scriptProfile = {
			type = 'toggle',
			name = L["Enable CPU profiling"],
			desc = L["Toggles CPU profiling. Note that this will reload your user interface."],
			order = 1,
		},
		spacer = {
			type = "header",
			name = " ",
			order = 50,
		},
		fubarHeader = {
			type = "header",
			name = L["Text"],
			order = 99,
		},
		framerate = {
			type = 'toggle',
			name = L["Show framerate"],
			desc = L["Toggle whether to show the current frames per second."],
			order = 100,
		},
		latency = {
			type = 'toggle',
			name = L["Show latency"],
			desc = L["Toggle whether to show latency (lag)."],
			order = 100,
		},
		memory = {
			type = 'toggle',
			name = L["Show memory usage"],
			desc = L["Toggle whether to show memory usage."],
			order = 100,
		},
		rate = {
			type = 'toggle',
			name = L["Show increasing rate"],
			desc = L["Toggle whether to show increasing rate of memory usage."],
			order = 100,
		},
		spacer2 = {
			type = "header",
			name = " ",
			order = 198,
		},
		tooltipHeader = {
			type = "header",
			name = L["Tooltip"],
			order = 199,
		},
		ttFPS = {
			type = 'toggle',
			name = L["Show framerate"],
			desc = L["Toggle whether to show the current frames per second."],
			order = 200,
		},
		ttAddon = {
			type = "toggle",
			name = L["Show addon usage"],
			desc = L["Show addon memory and CPU usage in the tooltip."],
			order = 200,
		},
		ttGrouping = {
			type = 'toggle',
			name = L["Show totals for multipart addons"],
			desc = L["Show memory usage of multipart addons as the total of all the individual parts."],
			order = 200,
		},
		ttMem = {
			type = "toggle",
			name = L["Show memory usage"],
			desc = L["Toggle whether to show memory usage."],
			order = 200,
		},
		ttNetwork = {
			type = "toggle",
			name = L["Show network usage"],
			desc = L["Show latency and bandwidth in the tooltip."],
			order = 200,
		},
		numAddons = {
			type = 'range',
			name = L["Number of addons"],
			desc = L["Set the number of addons to list in the tooltip."],
			min = 1,
			max = GetNumAddOns(),
			step = 1,
			order = 200,
		},
		sortBy = {
			type = "text",
			name = L["Sort addons by"],
			desc = L["Set what to sort the addon list by."],
			validate = {["1"] = scriptProfile and L["Total CPU"] or nil, ["2"] = L["Memory"], ["3"] = scriptProfile and L["CPU per second"] or nil, ["4"] = L["Memory since garbage collection"]},
			order = 200,
		},
	}
}
PerformanceFu.OnMenuRequest = options

local memUsageSinceGC = {}

local sorters = {
	["1"] = function(alpha, bravo) -- Total CPU usage
		if not alpha then
			return false
		elseif not bravo then
			return true
		end
		if not scriptProfile or alpha.cpu == bravo.cpu then
			return alpha.mem > bravo.mem
		else
			return alpha.cpu > bravo.cpu
		end
	end,
	["2"] = function(alpha, bravo) -- Memory
		if not alpha then
			return false
		elseif not bravo then
			return true
		end
		if scriptProfile and alpha.mem == bravo.mem then
			return alpha.cpu > bravo.cpu
		else
			return alpha.mem > bravo.mem
		end
	end,
	["3"] = function(alpha, bravo) -- CPU per second
		if not alpha then
			return false
		elseif not bravo then
			return true
		end
		if not scriptProfile or alpha.cpuDiff == bravo.cpuDiff then
			return alpha.mem > bravo.mem
		else
			return alpha.cpuDiff > bravo.cpuDiff
		end
	end,
	["4"] = function(alpha, bravo) -- Memory since GC
		if not alpha then
			return false
		elseif not bravo then
			return true
		end
		local alpha_memgc = memUsageSinceGC[alpha.name] or 0
		local bravo_memgc = memUsageSinceGC[bravo.name] or 0
		return alpha.mem-alpha_memgc > bravo.mem-bravo_memgc
	end
}

function PerformanceFu:OnUpdate()
	if not timeSinceLastUpdate then
		timeSinceLastUpdate = 0
	end
	timeSinceLastUpdate = timeSinceLastUpdate + 1

	if timeSinceLastUpdate >= updateTime and self.db.profile.ttAddon then
		local num = GetNumAddOns()

		local oldCPU
		if scriptProfile then
			oldCPU = new()
			for i = 1, num do
				oldCPU[GetAddOnInfo(i)] = GetAddOnCPUUsage(i)
			end
		end

		for i, v in ipairs(topAddons) do
			topAddons[i] = del(v)
		end

		UpdateAddOnMemoryUsage()
		if scriptProfile then
			UpdateAddOnCPUUsage()
		end

		totalAddonMemory = 0
		totalAddonCPU = 0

		local v
		for i = 1, num do
			v = new()
			topAddons[i] = v

			v.name = GetAddOnInfo(i)
			v.mem = GetAddOnMemoryUsage(i)

			totalAddonMemory = totalAddonMemory + v.mem

			if scriptProfile then
				local cpu = GetAddOnCPUUsage(i)
				v.cpu = cpu
				totalAddonCPU = totalAddonCPU + cpu
				v.cpuDiff = cpu - oldCPU[v.name]
			end
		end

		local extras = 0

		-- If grouping addons by name, find the core addon
        -- and add this addon's memory usage to the core's total
		if self.db.profile.ttGrouping then 
			for i = 1, num do
				local v = topAddons[i]
				local mem = v.mem
	
				local addon, module = strsplit("_-", v.name)
	
				-- Don't match LibWhatever-1.0, but do match Babble-Whatever-2.2
				if module and not module:match("%d.%d") then
					local vbase, vv
	
					for _, vv in ipairs(topAddons) do
						if vv.name == addon then 
							vbase = vv
						end
					end
	
					if not vbase then
					    extras = extras + 1
						vbase = new()
						topAddons[num+extras] = vbase
						vbase.name = addon
					end
					vbase.modulecount = (vbase.modulecount or 0) + 1
					vbase.mem = (vbase.mem or 0) + mem
					if scriptProfile then
						vbase.cpu = (vbase.cpu or 0) + v.cpu
						vbase.cpuDiff = (vbase.cpuDiff or 0) + v.cpuDiff
					end
				end
			end
		end			



		table.sort(topAddons, sorters[self.db.profile.sortBy])

		for i = self.db.profile.numAddons+1, num + extras do
			topAddons[i] = del(topAddons[i])
		end

		if scriptProfile then
			oldCPU = del(oldCPU)
		end
	end

	if justEntered then
		if timeSinceLastUpdate >= 10 then
			initialMemory = collectgarbage('count')
			currentMemory = initialMemory
			mem1 = currentMemory
			mem2 = currentMemory
			mem3 = currentMemory
			mem4 = currentMemory
			mem5 = currentMemory
			mem6 = currentMemory
			mem7 = currentMemory
			mem8 = currentMemory
			mem9 = currentMemory
			mem10 = currentMemory
			justEntered = false
		end
	else
		mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10 =
			currentMemory, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9
		currentMemory = collectgarbage('count')
		self:Update()
	end

	if timeSinceLastUpdate >= 10 then
		timeSinceLastUpdate = nil
	end
end

local t = {}
function PerformanceFu:OnTextUpdate()
	if not mem10 then
		mem10 = currentMemory
	end
	local currentRate = (currentMemory - mem10) / 10

	if self.db.profile.framerate then
		local framerate = floor(GetFramerate() + 0.5)
		table_insert(t, format("|cff%s%d|r fps", Crayon:GetThresholdHexColor(framerate / 60), framerate))
	end
	if self.db.profile.latency then
		local latency = select(3, GetNetStats())
		table_insert(t, format("|cff%s%d|r ms", Crayon:GetThresholdHexColor(latency, 1000, 500, 250, 100, 0), latency))
	end
	if self.db.profile.memory then
		table_insert(t, format("|cff%s%.1f|r MiB", Crayon:GetThresholdHexColor(currentMemory, 51200, 40960, 30520, 20480, 10240), currentMemory / 1024))
	end
	if self.db.profile.rate then
		table_insert(t, format("|cff%s%.1f|r KiB/s", Crayon:GetThresholdHexColor(currentRate, 30, 10, 3, 1, 0), currentRate))
	end

	self:SetText(table_concat(t, " "))

	for i = 1, #t do
		t[i] = nil
	end
end

function PerformanceFu:OnTooltipUpdate()
	local db = self.db.profile
	local cat

	if db.ttFPS then
		cat = Tablet:AddCategory(
			'columns', 2,
			'child_textR', 1,
			'child_textG', 1,
			'child_textB', 0
		)
		local framerate = GetFramerate()
		local r, g, b = Crayon:GetThresholdColor(framerate / 60)
		cat:AddLine(
			'text', L["Framerate"],
			'text2', string_format("%.1f fps", framerate),
			'text2R', r,
			'text2G', g,
			'text2B', b
		)
	end

	if db.ttNetwork then
		cat = Tablet:AddCategory(
			'text', L["Network status"],
			'columns', 2,
			'child_textR', 1,
			'child_textG', 1,
			'child_textB', 0,
			'child_text2R', 1,
			'child_text2G', 1,
			'child_text2B', 1
		)
		local bandwidthIn, bandwidthOut, latency = GetNetStats()
		bandwidthIn, bandwidthOut = bandwidthIn * 1024, bandwidthOut * 1024
		local r, g, b = Crayon:GetThresholdColor(latency, 3000, 1000, 250, 100, 0)
		cat:AddLine(
			'text', L["Latency"],
			'text2', string_format("%d ms", latency),
			'text2R', r,
			'text2G', g,
			'text2B', b
		)
		cat:AddLine(
			'text', L["Bandwidth in"],
			'text2', string_format("%d B/s", bandwidthIn)
		)
		cat:AddLine(
			'text', L["Bandwidth out"],
			'text2', string_format("%d B/s", bandwidthOut)
		)
	end

	if db.ttAddon then
		cat = Tablet:AddCategory(
			'text', scriptProfile and L["Addon memory/CPU usage"] or L["Addon memory usage"],
			'columns', scriptProfile and 5 or 3,
			'child_justify', "LEFT",
			'child_justify2', "RIGHT",
			'child_justify3', "RIGHT",
			'child_justify4', "RIGHT",
			'child_textR', 1,
			'child_textG', 1,
			'child_textB', 0,
			'child_text2R', 1,
			'child_text2G', 1,
			'child_text2B', 0.6,
			'child_text3R', 1,
			'child_text3G', 1,
			'child_text3B', 0.6,
			'child_text4R', 1,
			'child_text4G', 1,
			'child_text4B', 0.6,
			'child_text5R', 1,
			'child_text5G', 1,
			'child_text5B', 0.6
		)

		for i, v in ipairs(topAddons) do
			if v.mem == 0 then break end
			local mem = v.mem

			local text1 

			if v.modulecount and v.modulecount > 0 then
				text1 = string_format("%s (%d)", v.name, v.modulecount)
			else
				text1 = v.name
			end
			local text2
			if mem > 1024 then
				text2 = string_format("%.2f MiB", mem / 1024)
			else
				text2 = string_format("%.0f KiB", mem)
			end
			local memdiff = mem - (memUsageSinceGC[v.name] or 0)
			if memdiff > 1024 then
				text3 = string_format("%+.2f MiB", memdiff / 1024)
			else
				text3 = string_format("%+.0f KiB", memdiff)
			end
			local cpu = v.cpu
			local text4
			if cpu then
				if cpu > 1000 then
					text4 = string_format("%.2f s", cpu/1000)
				else
					text4 = string_format("%.0f ms", cpu)
				end
			end
			local cpuDiff = v.cpuDiff
			local text5
			if cpuDiff then
				text5 = string_format("%.2f%%", cpuDiff/10)
    		end
			if i % 2 == 1 then
				cat:AddLine(
					'text', text1,
					'text2', text2,
					'text3', text3,
					'text4', text4,
					'text5', text5
				)
			else
				cat:AddLine(
					'text', text1,
					'text2', text2,
					'text3', text3,
					'text4', text4,
					'text5', text5,
					'textR', 0.6,
					'textG', 1.0,
					'textB', 0.2,
					'text2R', 0.8,
					'text2G', 1.0,
					'text2B', 0.8,
					'text3R', 0.8,
					'text3G', 1.0,
					'text3B', 0.8,
					'text4R', 0.8,
					'text4G', 1.0,
					'text4B', 0.8,
					'text5R', 0.8,
					'text5G', 1.0,
					'text5B', 0.8
				)
			end
		end
	end

	if db.ttMem then
		local averageRate = (currentMemory - initialMemory) / (time() - gcTime)
		cat = Tablet:AddCategory(
			'text', L["Memory usage"],
			'columns', 2,
			'child_textR', 1,
			'child_textG', 1,
			'child_textB', 0,
			'child_text2R', 1,
			'child_text2G', 1,
			'child_text2B', 1
		)
		local currentRate = (currentMemory - mem10) / 10

		local r, g, b = Crayon:GetThresholdColor(currentMemory, 51200, 40960, 30520, 20480, 10240)
		cat:AddLine(
			'text', L["Current memory"],
			'text2', string_format("%.1f MiB", currentMemory / 1024),
			'text2R', r,
			'text2G', g,
			'text2B', b
		)

		r, g, b = Crayon:GetThresholdColor(initialMemory, 51200, 40960, 30520, 20480, 10240)
		cat:AddLine(
			'text', L["Initial memory"],
			'text2', string_format("%.1f MiB", initialMemory / 1024),
			'text2R', r,
			'text2G', g,
			'text2B', b
		)

		if totalAddonMemory > 0 then
			r, g, b = Crayon:GetThresholdColor(totalAddonMemory, 51200, 40960, 30520, 20480, 10240)
			cat:AddLine(
				'text', L["Total addon memory"],
				'text2', string_format("%.1f MiB", totalAddonMemory / 1024),
				'text2R', r,
				'text2G', g,
				'text2B', b
			)
		end
		if totalAddonCPU > 0 then
			local text2
			if totalAddonCPU > 1000 then
				text2 = string_format("%.3f s", totalAddonCPU/1000)
			else
				text2 = string_format("%.3f ms", totalAddonCPU)
			end
			cat:AddLine(
				'text', L["Total addon CPU usage"],
				'text2', text2
			)
		end

		r, g, b = Crayon:GetThresholdColor(currentRate, 30, 10, 3, 1, 0)
		cat:AddLine(
			'text', L["Increasing rate"],
			'text2', string_format("%.1f KiB/s", currentRate),
			'text2R', r,
			'text2G', g,
			'text2B', b
		)

		r, g, b = Crayon:GetThresholdColor(averageRate, 30, 10, 3, 1, 0)
		cat:AddLine(
			'text', L["Average increasing rate"],
			'text2', format("%.1f KiB/s", averageRate),
			'text2R', r,
			'text2G', g,
			'text2B', b
		)

		local t = date("%H:%M:%S", gcTime)
		cat:AddLine(
			'text', L["Last garbage collect"],
			'text2', t
		)
	end

	Tablet:SetHint(L["Hint"])
end

function PerformanceFu:OnClick()
	collectgarbage('collect')
end

local old_collectgarbage = collectgarbage
function _G.collectgarbage(...)
	local result = old_collectgarbage(...)
	if (...) == 'collect' or (...) == nil or ((...) == 'step' and result) then
		gcTime = time()
		for k in pairs(memUsageSinceGC) do
			memUsageSinceGC[k] = nil
		end
		UpdateAddOnMemoryUsage()
		for i = 1, GetNumAddOns() do
			memUsageSinceGC[GetAddOnInfo(i)] = GetAddOnMemoryUsage(i)
		end
	end
	return result
end

collectgarbage('collect')
