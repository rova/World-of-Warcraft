local L = AceLibrary("AceLocale-2.2"):new("FuBar_PerformanceFu")

L:RegisterTranslations("deDE", function() return {
	scriptProfiling = "Du spielst mit aktiviertem CPU Profiling.\n\nBeachte folgendes: Wenn du mit Addon Bibliotheken spielst, die in die einzelnen Addons (z.B. Ace2 Addons) integriert sind, wird ihre CPU- und Speicherauslastung als zu den jeweiligen Addons gehörend angezeigt; was jedoch nicht ganz korrekt ist, wenn du weitere Addons benutzt, die die gleichen Addon Bibliotheken verwenden.",
	["Never show this message again."] = "Nachricht nie wieder anzeigen.",

	["Force garbage collection"] = "Speicherbereinigung erzwingen",
	["Force a garbage collection to happen right now, clearing up unused memory."] = "Speicherbereinigung erzwingen um nicht verwendeten Speicher freizugeben.",

	["Enable CPU profiling"] = "Aktiviere CPU Profiling",
	["Toggles CPU profiling. Note that this will reload your user interface."] = "Ein/ausschalten des CPU Profiling. Hat ein Neuladen des Interfaces zur Folge.",

	-- Text options
	["Text"] = "Text",

	["Show framerate"] = "Bildwiederholrate anzeigen",
	["Toggle whether to show the current frames per second."] = "Anzeige der Bildwiederholrate ein/ausschalten.",

	["Show latency"] = "Latenz anzeigen",
	["Toggle whether to show latency (lag)."] = "Anzeige der Latenz ein/ausschalten.",

	["Show memory usage"] = "Speicherverbrauch anzeigen",
	["Toggle whether to show memory usage."] = "Anzeige des aktuellen Speicherverbrauchs ein/ausschalten.",

	["Show increasing rate"] = "Veränderung des Speicherverbrauchs anzeigen",
	["Toggle whether to show increasing rate of memory usage."] = "Anzeige der Veränderung des Speicherverbrauchs ein/ausschalten.",

	-- Tooltip options
	["Tooltip"] = "Tooltip",

	["Number of addons"] = "Anzahl der Addons",
	["Set the number of addons to list in the tooltip."] = "Die Anzahl der Addons festlegen, die angezeigt werden soll.",

	["Show addon usage"] = "Zeige Addon Nutzung",
	["Show addon memory and CPU usage in the tooltip."] = "Zeige Addon Speicherauslastung und CPU-Auslastung im Tooltip.",

	["Show network usage"] = "Zeige Netzwerkauslastung",
	["Show latency and bandwidth in the tooltip."] = "Zeige Latenz und Bandbreite im Tooltip.",

	["Sort addons by"] = "Sortiere Addons nach",
	["Set what to sort the addon list by."] = "Festlegen wonach die Addonliste sortiert werden soll.",
	["Total CPU"] = "Gesamte CPU",
	["Memory"] = "Speicher",
	["CPU per second"] = "CPU pro Sekunde",
	["Memory since garbage collection"] = "Speicher seit Speicherbereinigung.",

	["Show totals for multipart addons"] = "Zeige Summe aller mehrteiligen Addons",
	["Show memory usage of multipart addons as the total of all the individual parts."] = "Zeige Speicherauslastung von mehrteiligen Addons als Summe aller Einzeladdons.",

	-- Tooltip strings
	["Framerate"] = "Wiederholrate",
	["Network status"] = "Netzwerkstatus",
	["Latency"] = "Latenz",
	["Bandwidth in"] = "Eingehende Bandbreite",
	["Bandwidth out"] = "Ausgehende Bandbreite",
	["Memory usage"] = "Speicherauslastung",
	["Current memory"] = "Aktueller Speicher",
	["Initial memory"] = "Speicher zu Beginn",
	["Increasing rate"] = "Steigerungsrate",
	["Average increasing rate"] = "Durchschnittliche Steigerungsrate",
	["Addon memory usage"] = "Addon Speicherverbrauch",
	["Total addon memory"] = "Addonspeicher gesamt",
	["Addon memory/CPU usage"] = "Addon RAM/CPU Verbrauch",
	["Total addon CPU usage"] = "Gesamter Addon CPU Verbrauch",
	["Last garbage collect"] = "Letzte Speicherbereinigung",

	["Hint"] = "Hier klicken um die Speicherbereinigung zu erzwingen.",
} end)