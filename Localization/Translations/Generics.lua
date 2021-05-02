---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

local genericsLocales = {
    ["Objects"] = {
        ["ptBR"] = "Objetos",
        ["ruRU"] = "объектов",
        ["deDE"] = "Objekte",
        ["koKR"] = "목표",
        ["esMX"] = "Objetos",
        ["enUS"] = true,
        ["zhCN"] = "目标",
        ["zhTW"] = nil,
        ["esES"] = "Objetos",
        ["frFR"] = "Objets",
    },
    ["Objective"] = {
        ["ptBR"] = "Objetivo",
        ["ruRU"] = "Цели",
        ["deDE"] = "Questziele",
        ["koKR"] = "목표",
        ["esMX"] = "Objetivo",
        ["enUS"] = true,
        ["zhCN"] = "目标",
        ["zhTW"] = "目標",
        ["esES"] = "Objetivo",
        ["frFR"] = "Objectif",
    },
    ["Objectives"] = {
        ["ptBR"] = "Objetivos",
        ["ruRU"] = "Цели задания",
        ["deDE"] = "Questziele",
        ["koKR"] = "목표",
        ["esMX"] = "Objetivos",
        ["enUS"] = true,
        ["zhCN"] = "目标",
        ["zhTW"] = "目標",
        ["esES"] = "Objetivos",
        ["frFR"] = "Objectifs",
    },
    ["Quests"] = {
        ["ptBR"] = "Missões",
        ["ruRU"] = "заданий",
        ["deDE"] = nil,
        ["koKR"] = "퀘스트",
        ["esMX"] = "Misiones",
        ["enUS"] = true,
        ["zhCN"] = "任务",
        ["zhTW"] = nil,
        ["esES"] = "Misiones",
        ["frFR"] = "Quêtes",
    },
    ["Show Questie"] = {
        ["ptBR"] = "Mostrar Questie",
        ["ruRU"] = "Показать Questie",
        ["deDE"] = "Zeige Questie",
        ["koKR"] = "Questie 표시",
        ["esMX"] = "Mostrar Questie",
        ["enUS"] = true,
        ["zhCN"] = "显示Questie",
        ["zhTW"] = "顯示Questie",
        ["esES"] = "Mostrar Questie",
        ["frFR"] = "Afficher Questie",
    },
    ["Hide Questie"] = {
        ["ptBR"] = "Ocultar Questie",
        ["ruRU"] = "Скрыть Questie",
        ["deDE"] = "Verstecke Questie",
        ["koKR"] = "Questie 숨기기",
        ["esMX"] = "Ocultar Questie",
        ["enUS"] = true,
        ["zhCN"] = "隐藏Questie",
        ["zhTW"] = "隱藏Questie",
        ["esES"] = "Ocultar Questie",
        ["frFR"] = "Masquer Questie",
    },
    ["Reload UI"] = {
        ["ptBR"] = "Recarregar interface",
        ["ruRU"] = nil,
        ["deDE"] = "Interface neu laden",
        ["koKR"] = "Reload UI",
        ["esMX"] = "Recargar IU",
        ["enUS"] = true,
        ["zhCN"] = "重载UI",
        ["zhTW"] = nil,
        ["esES"] = "Recargar IU",
        ["frFR"] = "Recharger l'interface",
    },
    ["Yes"] = {
        ["ptBR"] = "Sim",
        ["ruRU"] = "Да",
        ["deDE"] = "Ja",
        ["koKR"] = "예",
        ["esMX"] = "Sí",
        ["enUS"] = true,
        ["zhCN"] = "是",
        ["zhTW"] = "是",
        ["esES"] = "Sí",
        ["frFR"] = "Oui",
    },
    ["No"] = {
        ["ptBR"] = "Não",
        ["ruRU"] = "Нет",
        ["deDE"] = "Nein",
        ["koKR"] = "아니오",
        ["esMX"] = "No",
        ["enUS"] = true,
        ["zhCN"] = "否",
        ["zhTW"] = "否",
        ["esES"] = "No",
        ["frFR"] = "Non",
    },
    ["Cancel"] = {
        ["ptBR"] = "Cancelar",
        ["ruRU"] = "Закрыть это окно",
        ["deDE"] = "Abbrechen",
        ["koKR"] = "취소",
        ["esMX"] = "Cancelar",
        ["enUS"] = true,
        ["zhCN"] = "取消",
        ["zhTW"] = "取消",
        ["esES"] = "Cancelar",
        ["frFR"] = "Annuler",
    },
    ["Don't show again"] = {
        ["ptBR"] = "Não mostrar novamente",
        ["ruRU"] = "Не отображать снова",
        ["deDE"] = "Nicht erneut zeigen",
        ["koKR"] = "다시 보이지 않기",
        ["zhCN"] = "不在显示",
        ["enUS"] = true,
        ["zhTW"] = nil,
        ["frFR"] = "Ne plus afficher",
        ["esES"] = "No volver a mostrar",
        ["esMX"] = "No volver a mostrar",
    },
    ["Auto"] = {
        ["ptBR"] = "Automático",
        ["ruRU"] = "Авто",
        ["deDE"] = "Automatisch",
        ["koKR"] = "자동",
        ["esMX"] = "Automático",
        ["enUS"] = true,
        ["zhCN"] = "自动",
        ["zhTW"] = "自動",
        ["esES"] = "Automático",
        ["frFR"] = "Automatique",
    },
    ["Enabled"] = {
        ["ptBR"] = "Ativado",
        ["ruRU"] = "Включено",
        ["frFR"] = "Activé",
        ["koKR"] = "활성화",
        ["zhCN"] = "已启用",
        ["enUS"] = true,
        ["zhTW"] = nil,
        ["deDE"] = "Aktiviert",
        ["esES"] = "Habilitado",
        ["esMX"] = "Habilitado",
    },
    ["Disabled"] = {
        ["ptBR"] = "Desativado",
        ["ruRU"] = "Отключено",
        ["deDE"] = "Deaktiviert",
        ["koKR"] = "비활성화",
        ["esMX"] = "Deshabilitado",
        ["enUS"] = true,
        ["zhCN"] = "停用",
        ["zhTW"] = "停用",
        ["esES"] = "Deshabilitado",
        ["frFR"] = "Désactivé",
    },
    ["WARNING!"] = {
        ["ptBR"] = "ATENÇÃO!",
        ["ruRU"] = nil,
        ["deDE"] = "WARNUNG!",
        ["koKR"] = "경고!",
        ["esMX"] = "¡ADVERTENCIA!",
        ["enUS"] = true,
        ["zhCN"] = "警告！",
        ["zhTW"] = "警告！",
        ["esES"] = "¡ADVERTENCIA!",
        ["frFR"] = "ATTENTION !",
    },
    ["xp"] = {
        ["ptBR"] = "xp",
        ["ruRU"] = " ед. опыта",
        ["deDE"] = nil,
        ["koKR"] = "경험치",
        ["esMX"] = "exp",
        ["enUS"] = true,
        ["zhCN"] = "经验",
        ["zhTW"] = "經驗值",
        ["esES"] = "exp",
        ["frFR"] = "exp",
    },
    ["Alliance"] = {
        ["ptBR"] = "Aliança",
        ["ruRU"] = nil,
        ["deDE"] = "Allianz",
        ["koKR"] = "얼라이언스",
        ["esMX"] = "Alianza",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Alianza",
        ["frFR"] = "Alliance",
    },
    ["Horde"] = {
        ["ptBR"] = "Horda",
        ["ruRU"] = nil,
        ["deDE"] = nil,
        ["koKR"] = "호드",
        ["esMX"] = "Horda",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Horda",
        ["frFR"] = "Horde",
    },
    ["Quest ID"] = {
        ["ptBR"] = "ID da missão",
        ["ruRU"] = nil,
        ["deDE"] = nil,
        ["koKR"] = "퀘스트 ID",
        ["esMX"] = "ID de Misión",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "ID de Misión",
        ["frFR"] = "ID de la quête",
    },
    ["Quest Level"] = {
        ["ptBR"] = "Nível da missão",
        ["ruRU"] = nil,
        ["deDE"] = nil,
        ["koKR"] = "퀘스트 레벨",
        ["esMX"] = "Nivel de Misión",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Nivel de Misión",
        ["frFR"] = "Niveau de la Quête",
    },
    ["Quest Details"] = {
        ["ptBR"] = "Detalhes da missão",
        ["ruRU"] = nil,
        ["deDE"] = "Quest-Details",
        ["koKR"] = "퀘스트 Detail",
        ["esMX"] = "Detalles de Misión",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Detalles de Misión",
        ["frFR"] = "Détails de la Quête",
    },
    ["NPC Details"] = {
        ["ptBR"] = "Detalhes do NPC",
        ["ruRU"] = nil,
        ["deDE"] = "NPC-Details",
        ["koKR"] = "NPC Detail",
        ["esMX"] = "Detalles del PNJ",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Detalles del PNJ",
        ["frFR"] = "Détails du PNJ",
    },
    ["Object Details"] = {
        ["ptBR"] = "Detalhes do objeto",
        ["ruRU"] = nil,
        ["deDE"] = "Objektdetails",
        ["koKR"] = "목표 Detail",
        ["esMX"] = "Detalles del objeto",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Detalles del objeto",
        ["frFR"] = "Détails de l'objet",
    },
    ["Required Level"] = {
        ["ptBR"] = "Nível necessário",
        ["ruRU"] = nil,
        ["deDE"] = "Benötigtes Level",
        ["koKR"] = "필요 레벨",
        ["esMX"] = "Nivel Requerido",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Nivel Requerido",
        ["frFR"] = "Niveau requis",
    },
    ["Required Race"] = {
        ["ptBR"] = "Raça necessária",
        ["ruRU"] = nil,
        ["deDE"] = "Benötigtes Volk",
        ["koKR"] = "필요 종족",
        ["esMX"] = "Raza Requerida",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Raza Requerida",
        ["frFR"] = "Race requise",
    },
    ["Human"] = {
        ["ptBR"] = "Humano",
        ["ruRU"] = nil,
        ["deDE"] = "Mensch",
        ["koKR"] = "인간",
        ["esMX"] = "Humano",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Humano",
        ["frFR"] = "Humain",
    },
    ["Orc"] = {
        ["ptBR"] = "Orc",
        ["ruRU"] = nil,
        ["deDE"] = "Ork",
        ["koKR"] = "오크",
        ["esMX"] = "Orco",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Orco",
        ["frFR"] = "Orc",
    },
    ["Dwarf"] = {
        ["ptBR"] = "Anão",
        ["ruRU"] = nil,
        ["deDE"] = "Zwerg",
        ["koKR"] = "드워프",
        ["esMX"] = "Enano",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Enano",
        ["frFR"] = "Nain",
    },
    ["Nightelf"] = {
        ["ptBR"] = "Elfo Noturno",
        ["ruRU"] = nil,
        ["deDE"] = "Nachtelf",
        ["koKR"] = "나이트 엘프",
        ["esMX"] = "Elfo de la Noche",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Elfo de la Noche",
        ["frFR"] = "Elfe de la nuit",
    },
    ["Undead"] = {
        ["ptBR"] = "Morto-vivo",
        ["ruRU"] = nil,
        ["deDE"] = "Untoter",
        ["koKR"] = "언데드",
        ["esMX"] = "No-Muerto",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "No-Muerto",
        ["frFR"] = "Mort-viant",
    },
    ["Tauren"] = {
        ["ptBR"] = "Tauren",
        ["ruRU"] = nil,
        ["deDE"] = nil,
        ["koKR"] = "타우렌",
        ["esMX"] = "Tauren",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Tauren",
        ["frFR"] = "Tauren",
    },
    ["Gnome"] = {
        ["ptBR"] = "Gnomo",
        ["ruRU"] = nil,
        ["deDE"] = "Gnom",
        ["koKR"] = "노움",
        ["esMX"] = "Gnomo",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Gnomo",
        ["frFR"] = "Gnome",
    },
    ["Troll"] = {
        ["ptBR"] = "Troll",
        ["ruRU"] = nil,
        ["deDE"] = nil,
        ["koKR"] = "트롤",
        ["esMX"] = "Trol",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Trol",
        ["frFR"] = "Troll",
    },
    ["Goblin"] = {
        ["ptBR"] = "Goblin",
        ["ruRU"] = nil,
        ["deDE"] = nil,
        ["koKR"] = "고블린",
        ["esMX"] = "Goblin",
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = nil,
        ["esES"] = "Goblin",
        ["frFR"] = "Gobelin",
    },
    ["Draenei"] = {
        ["ptBR"] = "Draenei",
        ["ruRU"] = "Дренеи",
        ["deDE"] = nil,
        ["koKR"] = "드레나이",
        ["esMX"] = "Draenei",
        ["enUS"] = true,
        ["zhCN"] = "德莱尼",
        ["zhTW"] = nil,
        ["esES"] = "Draenei",
        ["frFR"] = "Draeneï",
    },
    ["Blood Elf"] = {
        ["ptBR"] = "Elfo Sangrento",
        ["ruRU"] = "Эльфийка крови",
        ["deDE"] = "Blutelf",
        ["koKR"] = "블러드 엘프",
        ["esMX"] = nil,
        ["enUS"] = "Elfo de Sangre",
        ["zhCN"] = "血精灵",
        ["zhTW"] = nil,
        ["esES"] = "Elfo de sangre",
        ["frFR"] = "Elfe de sang",
    }
}

for k, v in pairs(genericsLocales) do
    l10n.translations[k] = v
end
