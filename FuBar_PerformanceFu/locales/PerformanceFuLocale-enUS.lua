local L = AceLibrary("AceLocale-2.2"):new("FuBar_PerformanceFu")

L:RegisterTranslations("enUS", function() return {
	scriptProfiling = "You are running with CPU profiling enabled.\n\nNote that when you run with libraries embedded in your addons, their CPU and memory usage will be reported as belonging to that addon, which is not entirely true if you use other addons that make use of the same libraries.",
	["Never show this message again."] = true,

	["Force garbage collection"] = true,
	["Force a garbage collection to happen right now, clearing up unused memory."] = true,

	["Enable CPU profiling"] = true,
	["Toggles CPU profiling. Note that this will reload your user interface."] = true,

	-- Text options
	["Text"] = true,

	["Show framerate"] = true,
	["Toggle whether to show the current frames per second."] = true,

	["Show latency"] = true,
	["Toggle whether to show latency (lag)."] = true,

	["Show memory usage"] = true,
	["Toggle whether to show memory usage."] = true,

	["Show increasing rate"] = true,
	["Toggle whether to show increasing rate of memory usage."] = true,

	-- Tooltip options
	["Tooltip"] = true,

	["Number of addons"] = true,
	["Set the number of addons to list in the tooltip."] = true,

	["Show addon usage"] = true,
	["Show addon memory and CPU usage in the tooltip."] = true,

	["Show network usage"] = true,
	["Show latency and bandwidth in the tooltip."] = true,

	["Sort addons by"] = true,
	["Set what to sort the addon list by."] = true,
	["Total CPU"] = true,
	["Memory"] = true,
	["CPU per second"] = true,
	["Memory since garbage collection"] = true,

	["Show totals for multipart addons"] = true,
	["Show memory usage of multipart addons as the total of all the individual parts."] = true,

	-- Tooltip strings
	["Framerate"] = true,
	["Network status"] = true,
	["Latency"] = true,
	["Bandwidth in"] = true,
	["Bandwidth out"] = true,
	["Memory usage"] = true,
	["Current memory"] = true,
	["Initial memory"] = true,
	["Increasing rate"] = true,
	["Average increasing rate"] = true,
	["Addon memory usage"] = true,
	["Total addon memory"] = true,
	["Addon memory/CPU usage"] = true,
	["Total addon CPU usage"] = true,
	["Last garbage collect"] = true,

	["Hint"] = "Click to force a garbage collection.",
} end)

