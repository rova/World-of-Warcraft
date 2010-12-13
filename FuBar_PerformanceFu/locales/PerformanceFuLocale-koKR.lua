local L = AceLibrary("AceLocale-2.2"):new("FuBar_PerformanceFu")

L:RegisterTranslations("koKR", function() return {
	scriptProfiling = "You are running with CPU profiling enabled.\n\nNote that when you run with libraries embedded in your addons, their CPU and memory usage will be reported as belonging to that addon, which is not entirely true if you use other addons that make use of the same libraries.",
	["Never show this message again."] = "이 메시지를 다시는 표시하지 않습니다.",

	["Force garbage collection"] = "강제 메모리 정리",
	["Force a garbage collection to happen right now, clearing up unused memory."] = "즉시 사용하지 않는 메모리 조각을 강제로 정리합니다.",

	["Enable CPU profiling"] = "CPU profiling 사용",
	["Toggles CPU profiling. Note that this will reload your user interface."] = "CPU profiling을 전환합니다. 사용자 인터페이스를 재시작합니다.",

	-- Text options
	["Text"] = "텍스트",

	["Show framerate"] = "FPS 표시",
	["Toggle whether to show the current frames per second."] = "현재 초당 프레임 표시를 전환합니다.",

	["Show latency"] = "지연시간 표시",
	["Toggle whether to show latency (lag)."] = "지연시간(렉) 표시를 전환합니다.",

	["Show memory usage"] = "메모리 사용량 표시",
	["Toggle whether to show memory usage."] = "메모리 사용량 표시를 전환합니다.",

	["Show increasing rate"] = "증가율 표시",
	["Toggle whether to show increasing rate of memory usage."] = "메모리 사용량의 증가율 표시를 전환합니다.",

	-- Tooltip options
	["Tooltip"] = "툴팁",

	["Number of addons"] = "애드온 수",
	["Set the number of addons to list in the tooltip."] = "툴팁에 표시할 애드온 수를 설정합니다.",

	["Show addon usage"] = "애드온 사용량 표시",
	["Show addon memory and CPU usage in the tooltip."] = "툴팁에 에드온 메모리와 CPU 사용량을 표시합니다.",

	["Show network usage"] = "네트워크 사용량 표시",
	["Show latency and bandwidth in the tooltip."] = "툴팁에 지연시간과 대역폭을 표시합니다.",

	["Sort addons by"] = "애드온 정렬",
	["Set what to sort the addon list by."] = "애드온 목록의 정렬 방법을 설정합니다.",
	["Total CPU"] = "총 CPU",
	["Memory"] = "메모리",
	["CPU per second"] = "초당 CPU",
	["Memory since garbage collection"] = "메모리 정리 이후",

	["Show totals for multipart addons"] = "멀티파트 애드온 합계 보기",
	["Show memory usage of multipart addons as the total of all the individual parts."] = "멀티파트 애드온들의 부분 메모리 사용량을 표시합니다.",

	-- Tooltip strings
	["Framerate"] = "FPS",
	["Network status"] = "네트워크 상태",
	["Latency"] = "지연시간",
	["Bandwidth in"] = "입력 대역폭",
	["Bandwidth out"] = "출력 대역폭",
	["Memory usage"] = "메모리 사용량",
	["Current memory"] = "현재 메모리",
	["Initial memory"] = "초기 메모리",
	["Increasing rate"] = "메모리 증가율",
	["Average increasing rate"] = "평균 메모리 증가율",
	["Addon memory usage"] = "애드온 메모리 사용량",
	["Total addon memory"] = "총 애드온 메모리",
	["Addon memory/CPU usage"] = "애드온 메모리/CPU 사용량",
	["Total addon CPU usage"] = "총 애드온 CPU 사용량",
	["Last garbage collect"] = "최근 메모리 정리",

	["Hint"] = "메모리를 즉시 정리하려면 |cffeda55f클릭|r하세요.",
} end)

