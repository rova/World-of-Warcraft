local L = AceLibrary("AceLocale-2.2"):new("FuBar_PerformanceFu")

L:RegisterTranslations("frFR", function() return {
	["Force garbage collection"] = "Forcer une récupération de mémoire",
	["Force a garbage collection to happen right now, clearing up unused memory."] = "Forcer l'exécution du ramasse-miettes, qui récupère la mémoire inutilisée.",

	["Enable CPU profiling"] = "Activer le profilage CPU",
	["Toggles CPU profiling. Note that this will reload your user interface."] = "Permuter le profilage du CPU. Note : ceci rechargera votre interface.",

	-- Text options
	["Text"] = "Texte",

	["Show framerate"] = "Afficher les images par secondes",
	["Toggle whether to show the current frames per second."] = "Afficher le compteur d'images par seconde",
	
	["Show latency"] = "Afficher la latence",
	["Toggle whether to show latency (lag)."] = "Afficher le compteur de latence (lag)",

	["Show memory usage"] = "Afficher l'utilisation mémoire",
	["Toggle whether to show memory usage."] = "Afficher le compteur d'utilisation mémoire",

	["Show increasing rate"] = "Afficher le taux d'augmentation de la mémoire",
	["Toggle whether to show increasing rate of memory usage."] = "Afficher le compteur du taux d'augmentation de la mémoire",

	-- Tooltip options
	["Tooltip"] = "Infobulle",

	["Number of addons"] = "Nombre d'Addons",
	["Set the number of addons to list in the tooltip."] = "Définir le nombre d'Addons à lister dans l'infobulle.",

	["Show addon usage"] = "Afficher l'utilisation des Addons",
	["Show addon memory and CPU usage in the tooltip."] = "Afficher l'utilisation mémoire et CPU des Addons dans l'infobulle.",

	["Show network usage"] = "Afficher l'utilisation réseau",
	["Show latency and bandwidth in the tooltip."] = "Afficher la latence et l'occupation réseau dans l'infobulle.",

	["Sort addons by"] = "Trier les Addons par",
	["Set what to sort the addon list by."] = "Définir comment trier la liste des Addons.",
	["Total CPU"] = "Total CPU",
	["Memory"] = "Mémoire",
	["CPU per second"] = "CPU par seconde",

	-- Tooltip strings
	["Framerate"] = "Images par seconde:",
	["Network status"] = "Etat du réseau",
	["Latency"] = "Latence",
	["Bandwidth in"] = "Bande passante entrante",
	["Bandwidth out"] = "Bande passante sortante",
	["Memory usage"] = "Utilisation mémoire",
	["Current memory"] = "Mémoire utilisée courante",
	["Initial memory"] = "Mémoire utilisée initiale",
	["Increasing rate"] = "Taux d'augmentation",
	["Average increasing rate"] = "Taux d'augmentation moyen",
	["Addon memory usage"] = "Utilisation mémoire des Addons",
	["Total addon memory"] = "Total mémoire des Addon",
	["Addon memory/CPU usage"] = "Utilisation CPU/mémoire des Addons",
	["Total addon CPU usage"] = "Total utilisation du CPU des Addons",
	["Last garbage collect"] = "Dernière récupération de mémoire",
	
	["Hint"] = "Cliquer pour forcer une récupération de la mémoire",
} end)
