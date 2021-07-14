---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

local easternKingdomsLocales = {
    ["The Hinterlands"] = {
        ["ptBR"] = "Terras Agrestes",
        ["ruRU"] = "Внутренние земли",
        ["deDE"] = "Hinterland",
        ["koKR"] = "동부 내륙지",
        ["esMX"] = "Tierras del Interior",
        ["enUS"] = true,
        ["frFR"] = "Les Hinterlands",
        ["esES"] = "Tierras del Interior",
        ["zhTW"] = "辛特蘭",
        ["zhCN"] = "辛特兰",
    },
    ["Stranglethorn Vale"] = {
        ["ptBR"] = "Selva do Espinhaço",
        ["ruRU"] = "Тернистая долина",
        ["deDE"] = "Schlingendorntal",
        ["koKR"] = "가시덤불 골짜기",
        ["esMX"] = "Vega de Tuercespina",
        ["enUS"] = true,
        ["frFR"] = "Vallée de Strangleronce",
        ["esES"] = "Vega de Tuercespina",
        ["zhTW"] = "荊棘谷",
        ["zhCN"] = "荆棘谷",
    },
    ["Eastern Plaguelands"] = {
        ["ptBR"] = "Terras Pestilentas Orientais",
        ["ruRU"] = "Восточные Чумные земли",
        ["deDE"] = "Östliche Pestländer",
        ["koKR"] = "동부 역병지대",
        ["esMX"] = "Tierras de la Peste del Este",
        ["enUS"] = true,
        ["frFR"] = "Maleterres de l'est",
        ["esES"] = "Tierras de la Peste del Este",
        ["zhTW"] = "東瘟疫之地",
        ["zhCN"] = "东瘟疫之地",
    },
    ["Duskwood"] = {
        ["ptBR"] = "Floresta do Crepúsculo",
        ["ruRU"] = "Сумеречный лес",
        ["deDE"] = "Dämmerwald",
        ["koKR"] = "그늘숲",
        ["esMX"] = "Bosque del Ocaso",
        ["enUS"] = true,
        ["frFR"] = "Bois de la Pénombre",
        ["esES"] = "Bosque del Ocaso",
        ["zhTW"] = "暮色森林",
        ["zhCN"] = "暮色森林",
    },
    ["Blasted Lands"] = {
        ["ptBR"] = "Barreira do Inferno",
        ["ruRU"] = "Выжженные земли",
        ["deDE"] = "Verwüstete Lande",
        ["koKR"] = "저주받은 땅",
        ["esMX"] = "Las Tierras Devastadas",
        ["enUS"] = true,
        ["frFR"] = "Terres foudroyées",
        ["esES"] = "Las Tierras Devastadas",
        ["zhTW"] = "詛咒之地",
        ["zhCN"] = "诅咒之地",
    },
    ["Blackrock Mountain"] = {
        ["ptBR"] = "Montanha Rocha Negra",
        ["ruRU"] = "Черная гора",
        ["deDE"] = "Der Schwarzfels",
        ["koKR"] = "검은바위 산",
        ["esMX"] = "Montaña Roca Negra",
        ["enUS"] = true,
        ["frFR"] = "Mont Rochenoire",
        ["esES"] = "Montaña Roca Negra",
        ["zhTW"] = "黑石山",
        ["zhCN"] = "黑石山",
    },
    ["Redridge Mountains"] = {
        ["ptBR"] = "Montanhas Cristarrubra",
        ["ruRU"] = "Красногорье",
        ["deDE"] = "Rotkammgebirge",
        ["koKR"] = "붉은마루 산맥",
        ["esMX"] = "Montañas Crestagrana",
        ["enUS"] = true,
        ["frFR"] = "Les Carmines",
        ["esES"] = "Montañas Crestagrana",
        ["zhTW"] = "赤脊山",
        ["zhCN"] = "赤脊山",
    },
    ["Arathi Highlands"] = {
        ["ptBR"] = "Planalto Arathi",
        ["ruRU"] = "Нагорье Арати",
        ["deDE"] = "Arathihochland",
        ["koKR"] = "아라시 고원",
        ["esMX"] = "Tierras Altas de Arathi",
        ["enUS"] = true,
        ["frFR"] = "Hautes-terres d'Arathi",
        ["esES"] = "Tierras Altas de Arathi",
        ["zhTW"] = "阿拉希高地",
        ["zhCN"] = "阿拉希高地",
    },
    ["Westfall"] = {
        ["ptBR"] = "Cerro Oeste",
        ["ruRU"] = "Западный край",
        ["deDE"] = "Westfall",
        ["koKR"] = "서부 몰락지대",
        ["esMX"] = "Páramos de Poniente",
        ["enUS"] = true,
        ["frFR"] = "Marche de l'Ouest",
        ["esES"] = "Páramos de Poniente",
        ["zhTW"] = "西部荒野",
        ["zhCN"] = "西部荒野",
    },
    ["Badlands"] = {
        ["ptBR"] = "Ermos",
        ["ruRU"] = "Бесплодные земли",
        ["deDE"] = "Ödland",
        ["koKR"] = "황야의 땅",
        ["esMX"] = "Tierras Inhóspitas",
        ["enUS"] = true,
        ["frFR"] = "Terres ingrates",
        ["esES"] = "Tierras Inhóspitas",
        ["zhTW"] = "荒蕪之地",
        ["zhCN"] = "荒芜之地",
    },
    ["Searing Gorge"] = {
        ["ptBR"] = "Garganta Abrasadora",
        ["ruRU"] = "Тлеющее ущелье",
        ["deDE"] = "Sengende Schlucht",
        ["koKR"] = "이글거리는 협곡",
        ["esMX"] = "La Garganta de Fuego",
        ["enUS"] = true,
        ["frFR"] = "Gorge des Vents brûlants",
        ["esES"] = "La Garganta de Fuego",
        ["zhTW"] = "灼熱峽谷",
        ["zhCN"] = "灼热峡谷",
    },
    ["Loch Modan"] = {
        ["ptBR"] = "Loch Modan",
        ["ruRU"] = "Лок Модан",
        ["deDE"] = "Loch Modan",
        ["koKR"] = "모단 호수",
        ["esMX"] = "Loch Modan",
        ["enUS"] = true,
        ["frFR"] = "Loch Modan",
        ["esES"] = "Loch Modan",
        ["zhTW"] = "洛克莫丹",
        ["zhCN"] = "洛克莫丹",
    },
    ["Burning Steppes"] = {
        ["ptBR"] = "Estepes Ardentes",
        ["ruRU"] = "Пылающие степи",
        ["deDE"] = "Brennende Steppe",
        ["koKR"] = "불타는 평원",
        ["esMX"] = "Las Estepas Ardientes",
        ["enUS"] = true,
        ["frFR"] = "Steppes ardentes",
        ["esES"] = "Las Estepas Ardientes",
        ["zhTW"] = "燃燒平原",
        ["zhCN"] = "燃烧平原",
    },
    ["Tirisfal Glade"] = {
        ["ptBR"] = "Clareiras de Tirisfal",
        ["ruRU"] = "Тирисфальские леса",
        ["deDE"] = "Tirisfal",
        ["koKR"] = "티리스팔 숲",
        ["esMX"] = "Claros de Tirisfal",
        ["enUS"] = true,
        ["frFR"] = "Clairières de Tirisfal",
        ["esES"] = "Claros de Tirisfal",
        ["zhTW"] = "提里斯法林地",
        ["zhCN"] = "提瑞斯法林地",
    },
    ["Elwynn Forest"] = {
        ["ptBR"] = "Floresta de Elwynn",
        ["ruRU"] = "Элвиннский лес",
        ["deDE"] = "Wald von Elwynn",
        ["koKR"] = "엘윈 숲",
        ["esMX"] = "Bosque de Elwynn",
        ["enUS"] = true,
        ["frFR"] = "Forêt d'Elwynn",
        ["esES"] = "Bosque de Elwynn",
        ["zhTW"] = "艾爾文森林",
        ["zhCN"] = "艾尔文森林",
    },
    ["Wetlands"] = {
        ["ptBR"] = "Pantanal",
        ["ruRU"] = "Болотина",
        ["deDE"] = "Sumpfland",
        ["koKR"] = "저습지",
        ["esMX"] = "Los Humedales",
        ["enUS"] = true,
        ["frFR"] = "Les Paluns",
        ["esES"] = "Los Humedales",
        ["zhTW"] = "濕地",
        ["zhCN"] = "湿地",
    },
    ["Western Plaguelands"] = {
        ["ptBR"] = "Terras Pestilentas Ocidentais",
        ["ruRU"] = "Западные Чумные земли",
        ["deDE"] = "Westliche Pestländer",
        ["koKR"] = "서부 역병지대",
        ["esMX"] = "Tierras de la Peste del Oeste",
        ["enUS"] = true,
        ["frFR"] = "Maleterres de l'ouest",
        ["esES"] = "Tierras de la Peste del Oeste",
        ["zhTW"] = "西瘟疫之地",
        ["zhCN"] = "西瘟疫之地",
    },
    ["Stormwind City"] = {
        ["ptBR"] = "Ventobravo",
        ["ruRU"] = "Штормград",
        ["deDE"] = "Stormwind Stadt",
        ["koKR"] = "스톰윈드",
        ["esMX"] = "Ciudad de Ventormenta",
        ["enUS"] = true,
        ["frFR"] = "Cité de Stormwind",
        ["esES"] = "Ciudad de Ventormenta",
        ["zhTW"] = "暴風城",
        ["zhCN"] = "暴风城",
    },
    ["Silverpine Forest"] = {
        ["ptBR"] = "Floresta de Pinhaprata",
        ["ruRU"] = "Серебряный бор",
        ["deDE"] = "Silberwald",
        ["koKR"] = "은빛소나무 숲",
        ["esMX"] = "Bosque de Argénteos",
        ["enUS"] = true,
        ["frFR"] = "Forêt des Pins argentés",
        ["esES"] = "Bosque de Argénteos",
        ["zhTW"] = "銀松森林",
        ["zhCN"] = "银松森林",
    },
    ["Ironforge"] = {
        ["ptBR"] = "Altaforja",
        ["ruRU"] = "Стальгорн",
        ["deDE"] = "Ironforge",
        ["koKR"] = "아이언포지",
        ["esMX"] = "Forjaz",
        ["enUS"] = true,
        ["frFR"] = "Ironforge",
        ["esES"] = "Forjaz",
        ["zhTW"] = "鐵爐堡",
        ["zhCN"] = "铁炉堡",
    },
    ["Undercity"] = {
        ["ptBR"] = "Cidade Baixa",
        ["ruRU"] = "Подгород",
        ["deDE"] = "Undercity",
        ["koKR"] = "언더시티",
        ["esMX"] = "Entrañas",
        ["enUS"] = true,
        ["frFR"] = "Undercity",
        ["esES"] = "Entrañas",
        ["zhTW"] = "幽暗城",
        ["zhCN"] = "幽暗城",
    },
    ["Deeprun Tram"] = {
        ["ptBR"] = "Metrô Correfundo",
        ["ruRU"] = "Подземный поезд",
        ["deDE"] = "Tiefenbahn",
        ["koKR"] = "깊은굴 지하철",
        ["esMX"] = "Tranvía Subterráneo",
        ["enUS"] = true,
        ["frFR"] = "Tram des profondeurs",
        ["esES"] = "Tren Subterráneo",
        ["zhTW"] = "礦道地鐵",
        ["zhCN"] = "矿道地铁",
    },
    ["Hillsbrad Foothills"] = {
        ["ptBR"] = "Contraforte de Eira dos Montes",
        ["ruRU"] = "Предгорья Хилсбрада",
        ["deDE"] = "Vorgebirge von Hillsbrad",
        ["koKR"] = "힐스브래드 구릉지",
        ["esMX"] = "Laderas de Trabalomas",
        ["enUS"] = true,
        ["frFR"] = "Contreforts d'Hillsbrad",
        ["esES"] = "Laderas de Trabalomas",
        ["zhTW"] = "希爾斯布萊德丘陵",
        ["zhCN"] = "希尔斯布莱德丘陵",
    },
    ["Deadwind Pass"] = {
        ["ptBR"] = "Trilha do Vento Morto",
        ["ruRU"] = "Перевал Мертвого Ветра",
        ["deDE"] = "Gebirgspass der Totenwinde",
        ["koKR"] = "죽음의 고개",
        ["esMX"] = "Paso de la Muerte",
        ["enUS"] = true,
        ["frFR"] = "Défilé de Deuillevent",
        ["esES"] = "Paso de la Muerte",
        ["zhTW"] = "逆風小徑",
        ["zhCN"] = "逆风小径",
    },
    ["Swamp of Sorrows"] = {
        ["ptBR"] = "Pântano das Mágoas",
        ["ruRU"] = "Болото печали",
        ["deDE"] = "Sümpfe des Elends",
        ["koKR"] = "슬픔의 늪",
        ["esMX"] = "Pantano de las Penas",
        ["enUS"] = true,
        ["frFR"] = "Marais des Chagrins",
        ["esES"] = "Pantano de las Penas",
        ["zhTW"] = "悲傷沼澤",
        ["zhCN"] = "悲伤沼泽",
    },
    ["Dun Morogh"] = {
        ["ptBR"] = "Dun Morogh",
        ["ruRU"] = "Дун Морог",
        ["deDE"] = "Dun Morogh",
        ["koKR"] = "던 모로",
        ["esMX"] = "Dun Morogh",
        ["enUS"] = true,
        ["frFR"] = "Dun Morogh",
        ["esES"] = "Dun Morogh",
        ["zhTW"] = "丹莫洛",
        ["zhCN"] = "丹莫罗",
    },
    ["Alterac Mountains"] = {
        ["ptBR"] = "Montanhas de Alterac",
        ["ruRU"] = "Альтеракские горы",
        ["deDE"] = "Alteracgebirge",
        ["koKR"] = "알터랙 산맥",
        ["esMX"] = "Montañas de Alterac",
        ["enUS"] = true,
        ["frFR"] = "Montagnes d'Alterac",
        ["esES"] = "Montañas de Alterac",
        ["zhTW"] = "奧特蘭克山脈",
        ["zhCN"] = "奥特兰克山脉",
    },
}

for k, v in pairs(easternKingdomsLocales) do
    l10n.translations[k] = v
end
