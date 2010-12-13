--ruRU by Swix
--Report bugs to http://forums.playhard.ru/index.php?showforum=49
local L = AceLibrary("AceLocale-2.2"):new("FuBar_PerformanceFu")

L:RegisterTranslations("ruRU", function() return {
	scriptProfiling = "Вы активировали отображение статистики по загрузке процессора.\n\nЗаметьте, что загрузка процессора и памяти аддонами, содержащими вложенные библиотеки, будет подсчитываться вместе с этими библиотеками. Таким образом, конечный результат будет не совсем верен, если несколько аддонов используют одинаковые библиотеки.",
	["Never show this message again."] = "Больше не напоминать",

	["Force garbage collection"] = "Очистить память от мусора",
	["Force a garbage collection to happen right now, clearing up unused memory."] = "Очистить неиспользуемую память от мусора",

	["Enable CPU profiling"] = "Включить статистику CPU",
	["Toggles CPU profiling. Note that this will reload your user interface."] = "Переключить отображение статистики по загрузке процессора. Изменение параметра приведёт к перезагрузке интерфейса.",

	-- Text options
	["Text"] = "Текст на панели FuBar",

	["Show framerate"] = "Показывать фпс",
	["Toggle whether to show the current frames per second."] = "Показывать частоту смены кадров в секунду.",

	["Show latency"] = "Показывать пинг",
	["Toggle whether to show latency (lag)."] = "Показывать пинг до сервера (лаг).",

	["Show memory usage"] = "Показывать загрузку памяти",
	["Toggle whether to show memory usage."] = "Показывать общее количество памяти, занимаемой аддонами.",

	["Show increasing rate"] = "Показывать изменение загрузки",
	["Toggle whether to show increasing rate of memory usage."] = "Показывать количество Кб, на которое изменяется загрузка памяти",

	-- Tooltip options
        ["Tooltip"] =  "Всплывающее окошко",

	["Number of addons"] =  "Количество аддонов",
	["Set the number of addons to list in the tooltip."] =  "Установить количество аддонов, отображаемых в списке",

	["Show addon usage"] =  "Показывать загрузку аддонов",
	["Show addon memory and CPU usage in the tooltip."] = "Показывать загрузку процессора и количество памяти, занимаемой аддонами.",

	["Show network usage"] = "Показывать сетевую статистику",
	["Show latency and bandwidth in the tooltip."] = "Показывать пинг и скорость соединения в всплывающем окошке.",

	["Sort addons by"] = "Сортировать аддоны",
	["Set what to sort the addon list by."] = "Выбрать критерий сортировки аддонов в списке.",
	["Total CPU"] = "Всего CPU",
	["Memory"] = "Память",
	["CPU per second"] = "CPU в секунду",
	["Memory since garbage collection"] = "Память с последней очистки",

	["Show totals for multipart addons"] = "Объединять мультиаддоны",
	["Show memory usage of multipart addons as the total of all the individual parts."] = "Объединять множество схожих аддонов в один.",

	-- Tooltip strings
	["Framerate"] = "Частота смены кадров",
	["Network status"] = "Сетевая статистика",
	["Latency"] = "Пинг",
	["Bandwidth in"] = "Скорость линии (входящая)",
	["Bandwidth out"] = "Скорость линии (исходящая)",
	["Memory usage"] = "Использование памяти",
	["Current memory"] = "Текущая загрузка памяти",
	["Initial memory"] = "Изначальная загрузка памяти",
	["Increasing rate"] = "Изменение",
	["Average increasing rate"] = "Изменение в среднем",
	["Addon memory usage"] = "Использование памяти",
	["Total addon memory"] = "Общая память аддонов",
	["Addon memory/CPU usage"] = "Загрузка памяти/CPU",
	["Total addon CPU usage"] = "Общая загрузка CPU",
	["Last garbage collect"] = "Последняя очистка",

	["Hint"] = "Щёлкните, чтобы очистить память от мусора.",
} end)