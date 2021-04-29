---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

local trackerUILocales = {
    ["Questie Tracker: "] = {
        ["ptBR"] = "Missões ativas: ",
        ["ruRU"] = "Активные задания: ",
        ["deDE"] = "Aktive Quests: ",
        ["koKR"] = "활성 퀘스트: ",
        ["esMX"] = "Misiones Activas: ",
        ["enUS"] = true,
        ["zhCN"] = "当前任务: ",
        ["zhTW"] = "目前的任務: ",
        ["esES"] = "Misiones Activas: ",
        ["frFR"] = "Quêtes actives : ",
    },
    ["Show Icons"] = {
        ["ptBR"] = "Mostrar ícones",
        ["ruRU"] = "Показать значки",
        ["deDE"] = "Icons anzeigen",
        ["koKR"] = "아이콘 표시",
        ["esMX"] = "Mostrar íconos",
        ["enUS"] = true,
        ["zhCN"] = "显示标记",
        ["zhTW"] = "顯示標記",
        ["esES"] = "Mostrar iconos",
        ["frFR"] = "Afficher les icônes",
    },
    ["Quest completed!"] = {
        ["ptBR"] = "Missão concluída!",
        ["ruRU"] = "Задание выполнено!",
        ["deDE"] = "Quest abgeschlossen!",
        ["koKR"] = "퀘스트 완료!",
        ["esMX"] = "¡Misión completada!",
        ["enUS"] = true,
        ["zhCN"] = "任务完成!",
        ["zhTW"] = "任務完成!",
        ["esES"] = "Misión completada!",
        ["frFR"] = "Quête terminée!",
    },
    ["Quest completion failed!"] = {
        ["ptBR"] = "A missão falhou!",
        ["ruRU"] = "Выполнить задание не удалось!",
        ["deDE"] = "Quest fehlgeschlagen",
        ["koKR"] = "퀘스트 실패!",
        ["esMX"] = "¡La misión ha fallado!",
        ["enUS"] = true,
        ["zhCN"] = "任务失败!",
        ["zhTW"] = "任務失敗!",
        ["esES"] = "No se ha completado la misión!",
        ["frFR"] = "Échec de la quête!",
    },
    ["Untrack Quest"] = {
        ["ptBR"] = "Não rastrear a missão",
        ["ruRU"] = "Не отслеживать задание",
        ["deDE"] = "Questfokussieren entfernen",
        ["koKR"] = "퀘스트 추적해제",
        ["esMX"] = "No rastrear misión",
        ["enUS"] = true,
        ["zhCN"] = "停止追踪",
        ["zhTW"] = "停止追蹤",
        ["esES"] = "No rastrear misión",
        ["frFR"] = "Annuler le suivi",
    },
    ["Focus Quest"] = {
        ["ptBR"] = "Focar missão",
        ["ruRU"] = "Фокусировка на задании",
        ["deDE"] = "Quest fokussieren",
        ["koKR"] = "관심 퀘스트",
        ["esMX"] = "Enfocar Misión",
        ["enUS"] = true,
        ["zhCN"] = "关注任务",
        ["zhTW"] = "關注任務",
        ["esES"] = "Misión de enfoque",
        ["frFR"] = "Prioriser cette quête",
    },
    ["Unfocus"] = {
        ["ptBR"] = "Desfocar",
        ["ruRU"] = "Сбросить фокусировку",
        ["deDE"] = "Fokus entfernen",
        ["koKR"] = "관심 퀘스트 해제",
        ["esMX"] = "Desenfocar",
        ["enUS"] = true,
        ["zhCN"] = "停止关注",
        ["zhTW"] = "停止關注",
        ["esES"] = "Desenfocar",
        ["frFR"] = "Ne plus prioriser cette quête",
    },
    ["Focus Objective"] = {
        ["ptBR"] = "Focar objetivo",
        ["ruRU"] = "Фокусировка на цели",
        ["deDE"] = "Questziel fokussieren",
        ["koKR"] = "관심 목표",
        ["esMX"] = "Enfocar Objetivo",
        ["enUS"] = true,
        ["zhCN"] = "关注目标",
        ["zhTW"] = "關注目標",
        ["esES"] = "Objetivo de enfoque",
        ["frFR"] = "Objectif prioritaire",
    },
    ["Unlock Tracker"] = {
        ["ptBR"] = "Desbloquear rastreador",
        ["ruRU"] = "Разблокировать трекер",
        ["deDE"] = "Tracker entsperren",
        ["koKR"] = "추적기 잠금해제",
        ["esMX"] = "Desbloquear Rastreador",
        ["enUS"] = true,
        ["zhCN"] = "解锁框体",
        ["zhTW"] = "解鎖框架",
        ["esES"] = "Desbloquear rastreador",
        ["frFR"] = "Déverrouiller la fenêtre du suivi",
    },
    ["Show on Map"] = {
        ["ptBR"] = "Mostrar no mapa",
        ["ruRU"] = "Показать на карте",
        ["deDE"] = "Auf der Karte zeigen",
        ["koKR"] = "지도에 표시",
        ["esMX"] = "Mostrar en Mapa",
        ["enUS"] = true,
        ["zhCN"] = "地图上显示",
        ["zhTW"] = "在地圖上顯示",
        ["esES"] = "Mostrar en mapa",
        ["frFR"] = "Afficher sur la carte",
    },
    ["Toggle Options"] = {
        ["ptBR"] = "Mostrar / Ocultar opções",
        ["ruRU"] = "Открыть/закрыть настройки",
        ["deDE"] = "Einstellungen anzeigen/verstecken",
        ["koKR"] = "설정 열기",
        ["esMX"] = "Mostrar Opciones",
        ["enUS"] = true,
        ["zhCN"] = "打开设置",
        ["zhTW"] = "設定",
        ["esES"] = "Mostrar opciones",
        ["frFR"] = "Panneau de configuration",
    },
    ["Link Quest to chat"] = {
        ["ptBR"] = "Enviar missão para o chat",
        ["ruRU"] = "Ссылка на задание в чат",
        ["deDE"] = "Quest in Chat verlinken",
        ["koKR"] = "채팅창에 퀘스트 링크",
        ["esMX"] = "Vincular misión al chat",
        ["enUS"] = true,
        ["zhCN"] = "将任务连接到聊天框",
        ["zhTW"] = "將任務連結貼到對話",
        ["esES"] = "Vincular misión al chat",
        ["frFR"] = "Linker la quêter dans la chat",
    },
    ["Show in Quest Log"] = {
        ["ptBR"] = "Mostrar no registro de missões",
        ["ruRU"] = "Показать в журнале",
        ["deDE"] = "In Questlog anzeigen",
        ["koKR"] = "퀘스트 목록에서 열기",
        ["esMX"] = "Mostrar en registro de misiones",
        ["enUS"] = true,
        ["zhCN"] = "开启任务日志",
        ["zhTW"] = "開啟任務日誌",
        ["esES"] = "Mostrar en registro de misiones",
        ["frFR"] = "Afficher dans le journal de quête",
    },
}

for k, v in pairs(trackerUILocales) do
    l10n.translations[k] = v
end
