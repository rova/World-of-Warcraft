local L = AceLibrary("AceLocale-2.2"):new("FuBar_PerformanceFu")

L:RegisterTranslations("zhTW", function() return {
	scriptProfiling = "你正在使用CPU用量分析。\n\n如果插件有用內含的函式庫，這個分析可能不是十分正確，因為別的插件可能會共用函式庫，但是CPU用量卻算在原本插件上。",
	["Never show this message again."] = "不要再顯示這個訊息。",

	["Force garbage collection"] = "強制回收記憶體",
	["Force a garbage collection to happen right now, clearing up unused memory."] = "強制現在回收未使用的記憶體。",

	["Enable CPU profiling"] = "啟用CPU用量分析",
	["Toggles CPU profiling. Note that this will reload your user interface."] = "啟用CPU用量分析，需要重載介面。",

	-- Text options
	["Text"] = "文字",

	["Show framerate"] = "顯示畫面幀數",
	["Toggle whether to show the current frames per second."] = "切換顯示畫面每秒幀數。",

	["Show latency"] = "顯示延遲",
	["Toggle whether to show latency (lag)."] = "切換顯示延遲。",

	["Show memory usage"] = "顯示記憶體用量",
	["Toggle whether to show memory usage."] = "切換顯示記憶體用量。",

	["Show increasing rate"] = "顯示記憶體用量增長率",
	["Toggle whether to show increasing rate of memory usage."] = "切換顯示記憶體用量增長率。",

	-- Tooltip options
	["Tooltip"] = "提示訊息",

	["Number of addons"] = "插件數目",
	["Set the number of addons to list in the tooltip."] = "設定在提示訊息顯示的插件數目。",

	["Show addon usage"] = "顯示插件用量",
	["Show addon memory and CPU usage in the tooltip."] = "在提示訊息顯示插件的記憶體和CPU用量。",

	["Show network usage"] = "顯示網路用量",
	["Show latency and bandwidth in the tooltip."] = "在提示訊息顯示插件的延遲和頻寬用量。",

	["Sort addons by"] = "插件排序",
	["Set what to sort the addon list by."] = "設定插件排序條件。",
	["Total CPU"] = "總CPU用量",
	["Memory"] = "記憶體",
	["CPU per second"] = "每秒CPU用量",
	["Memory since garbage collection"] = "回收後的記憶體",
	
	["Show totals for multipart addons"] = "顯示帶有多部分的插件",
	["Show memory usage of multipart addons as the total of all the individual parts."] = "顯示帶有多部份插件每一個部份的記憶體用量",

	-- Tooltip strings
	["Framerate"] = "畫面幀數",
	["Network status"] = "網路狀態",
	["Latency"] = "延遲",
	["Bandwidth in"] =  "接收",
	["Bandwidth out"] = "發送",
	["Memory usage"] = "記憶體用量",
	["Current memory"] = "現在記憶體用量",
	["Initial memory"] = "初始記憶體用量",
	["Increasing rate"] = "增長率",
	["Average increasing rate"] = "平均增長率",
	["Addon memory usage"] = "插件記憶體用量",
	["Total addon memory"] = "插件總記憶體用量",
	["Addon memory/CPU usage"] = "插件記憶體/CPU用量",
	["Total addon CPU usage"] = "插件總CPU用量",
	["Last garbage collect"] = "上次記憶體回收",

	["Hint"] = "\n|cffeda55f左擊: |r強制回收記憶體。",
} end)

