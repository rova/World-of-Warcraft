local L = AceLibrary("AceLocale-2.2"):new("FuBar_PerformanceFu")

L:RegisterTranslations("zhCN", function() return {
	scriptProfiling = "你正运行在调试模式。\n\n当加载的插件的内嵌模块被其他插件所共用时，所报告的 CPU 和内存使用将不会很准确反映该插件的资源使用情况。",
	["Never show this message again."] = "不再显示本信息。",

	["Force garbage collection"] = "强制垃圾回收",
	["Force a garbage collection to happen right now, clearing up unused memory."] = "立即强制垃圾回收，清理未使用内存。",

	["Enable CPU profiling"] = "开启调试模式",
	["Toggles CPU profiling. Note that this will reload your user interface."] = "开启调试模式，需要重载插件。",

	-- Text options
	["Text"] = "文字",

	["Show framerate"] = "显示 FPS",
	["Toggle whether to show the current frames per second."] = "开关显示当前 FPS",

	["Show latency"] = "显示延迟",
	["Toggle whether to show latency (lag)."] = "开关显示延迟 (lag)。",

	["Show memory usage"] = "显示内存使用",
	["Toggle whether to show memory usage."] = "开关显示内存使用。",

	["Show increasing rate"] = "显示增长率",
	["Toggle whether to show increasing rate of memory usage."] = "开关显示内存使用增长率。",

	-- Tooltip options
	["Tooltip"] = "提示信息",

	["Number of addons"] = "插件数量",
	["Set the number of addons to list in the tooltip."] = "在提示信息上显示插件的数量。",

	["Show addon usage"] = "显示插件使用",
	["Show addon memory and CPU usage in the tooltip."] = "在提示信息上显示内存和 CPU 使用情况。",

	["Show network usage"] = "显示网络使用",
	["Show latency and bandwidth in the tooltip."] = "在提示信息上显示网络延迟和带宽使用。",

	["Sort addons by"] = "插件排序方式",
	["Set what to sort the addon list by."] = "设置插件显示的排序方式。",
	["Total CPU"] = "总 CPU",
	["Memory"] = "内存",
	["CPU per second"] = "每秒 CPU",
	["Memory since garbage collection"] = "回收后内存使用",

	["Show totals for multipart addons"] = "整合带有多部分的插件",
	["Show memory usage of multipart addons as the total of all the individual parts."] = "把带有多部分的插件的每一个插件的内存使用量整合显示。",

	-- Tooltip strings
	["Framerate"] = "FPS",
	["Network status"] = "网络状态",
	["Latency"] = "延迟",
	["Bandwidth in"] = "接收带宽",
	["Bandwidth out"] = "发送带宽",
	["Memory usage"] = "内存使用",
	["Current memory"] = "当前内存",
	["Initial memory"] = "初始内存",
	["Increasing rate"] = "增长率",
	["Average increasing rate"] = "平均增长率",
	["Addon memory usage"] = "插件内存使用",
	["Total addon memory"] = "总插件内存",
	["Addon memory/CPU usage"] = "插件内存/CPU 使用",
	["Total addon CPU usage"] = "总插件 CPU 使用",
	["Last garbage collect"] = "上次垃圾回收",

	["Hint"] = "点击强制垃圾回收。",
} end)

