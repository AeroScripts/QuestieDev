---@type l10n
local l10n = QuestieLoader:ImportModule("l10n")

local dbmHudOptionsLocales = {
    ["DBM HUD"] = {
        ["ptBR"] = nil,
        ["ruRU"] = nil,
        ["deDE"] = "DBM Interface",
        ["koKR"] = "DBM HUD",
        ["esMX"] = nil,
        ["enUS"] = true,
        ["zhCN"] = nil,
        ["zhTW"] = "DBM 抬頭顯示",
        ["esES"] = nil,
        ["frFR"] = "Affichage tête haute (HUD) de DBM",
    },
    ["Show DBM HUD"] = {
        ["ptBR"] = "Mostrar DBM HUD",
        ["ruRU"] = "Включить DBM HUD",
        ["deDE"] = "Zeige DBM HUD",
        ["koKR"] = "DBM HUD 표시",
        ["esMX"] = "Mostrar HUD de DBM",
        ["enUS"] = true,
        ["zhCN"] = "启用 DBM HUD",
        ["zhTW"] = "顯示 DBM 抬頭顯示",
        ["esES"] = "Mostrar HUD de DBM",
        ["frFR"] = "Afficher DBM HUD",
    },
    ["Enable or disable the DBM Heads Up Display (HUD) overlay for showing map objects."] = {
        ["ptBR"] = "Ativa ou desativa a sobreposição HUD (DBM Heads Up Display) para mostrar objetos de mapa.",
        ["ruRU"] = "Включить/отключить DBM HUD",
        ["deDE"] = "Aktiviert/Deaktiviert das DBM-HUD zur Anzeige von Kartenobjekten.",
        ["koKR"] = "DBM 애드온의 HUD 오버레이 기능을 사용해서 지도상의 오브젝트를 화면에 표시합니다.",
        ["esMX"] = "Habilita o deshabilita la superposición del Heads Up Display (HUD) de DBM para objetos del mapa.",
        ["enUS"] = true,
        ["zhCN"] = "启用/禁用叠加在地图插件上的 DBM HUD。",
        ["zhTW"] = "啟用/停用疊加於地圖物件上的 DBM 抬頭顯示",
        ["esES"] = "Habilita o deshabilita la superposición del Heads Up Display (HUD) de DBM para objetos del mapa.",
        ["frFR"] = "Activez ou désactivez la superposition DBM Heads Up Display (HUD) pour afficher les objets cartographiques.",
    },
    ["Filter Options"] = {
        ["ptBR"] = "Opções de filtro",
        ["ruRU"] = "Фильтр значков",
        ["deDE"] = "Filteroptionen",
        ["koKR"] = "필터 설정",
        ["esMX"] = "Opciones de Filtro",
        ["enUS"] = true,
        ["zhCN"] = "过滤器选项",
        ["zhTW"] = nil,
        ["esES"] = "Opciones de Filtro",
        ["frFR"] = "Options de filtre",
    },
    ["Show quest giver icons"] = {
        ["ptBR"] = "Mostrar ícones de atribuidores de missões",
        ["ruRU"] = "Значки заданий",
        ["deDE"] = "Questgeber-Icons anzeigen",
        ["koKR"] = "수행가능/완료 퀘스트 아이콘 표시",
        ["esMX"] = "Mostrar iconos de proveedores de misiones",
        ["enUS"] = true,
        ["zhCN"] = "显示起始任务图标",
        ["zhTW"] = nil,
        ["esES"] = "Mostrar iconos de proveedores de misiones",
        ["frFR"] = "Afficher les icônes des donneurs de quête",
    },
    ["Toggles whether or not available/complete quest icons appear on HUD. ( Default: %s )"] = {
        ["ptBR"] = "Alterna se os ícones de missão disponíveis/completos não aparecem ou não no HUD. ( Por defeito: %s )",
        ["ruRU"] = "Показать/скрыть значки выполненных или завершенных заданий на HUD (по умолчанию: %s)",
        ["deDE"] = "Schaltet ein, ob Icons für verfügbare/abgeschlossene Quests im HUD angezeigt werden oder nicht. ( Standard: %s )",
        ["koKR"] = "수행가능/완료 퀘스트 아이콘을 HUD에 표시합니다. ( 기본값: %s )",
        ["esMX"] = "Alterna si los iconos de misiones disponibles / completas aparecen o no en HUD. ( Por Defecto: %s )",
        ["enUS"] = true,
        ["zhCN"] = "切换是否在HUD上显示可用/完成任务图标。（默认：%s）",
        ["zhTW"] = nil,
        ["esES"] = "Alterna si los iconos de misiones disponibles / completas aparecen o no en HUD. ( Por Defecto: %s )",
        ["frFR"] = "Indique si les icônes de quête disponibles/complètes apparaissent ou non sur le HUD. (Par défaut : %s)",
    },
    ["Show quest objective icons"] = {
        ["ptBR"] = "Mostrar ícones de objetivos da missão",
        ["ruRU"] = "Значки целей",
        ["deDE"] = "Questziel-Icons anzeigen",
        ["koKR"] = "퀘스트 목표 아이콘 표시",
        ["esMX"] = "Mostrar icono de objetivos de misiones",
        ["enUS"] = true,
        ["zhCN"] = "显示任务目标图标",
        ["zhTW"] = nil,
        ["esES"] = "Mostrar icono de objetivos de misiones",
        ["frFR"] = "Afficher les icônes d'objectifs de quête",
    },
    ["Refresh rate for HUD (Requires turning HUD off/on)"] = {
        ["ptBR"] = "Taxa de atualização para HUD (requer que o HUD seja ativado/desativado)",
        ["ruRU"] = "Частота обновления",
        ["deDE"] = "Aktualisierungsrate für das HUD (erfordert das Ausschalten/Einschalten des HUD)",
        ["koKR"] = "HUD 새로고침 주기 (HUD 재시작 필요)",
        ["esMX"] = "Frecuencia de actualización para HUD (requiere activar / desactivar HUD)",
        ["enUS"] = true,
        ["zhCN"] = "HUD的刷新率（需要关闭/打开HUD）",
        ["zhTW"] = nil,
        ["esES"] = "Frecuencia de actualización para HUD (requiere activar / desactivar HUD)",
        ["frFR"] = "Taux de rafraîchissement pour le HUD (nécessite d'activer/désactiver le HUD)",
    },
    ["Adjusts the fresh rate for HUD Icons which affects how often UI refreshes their position. ( Default: %s )"] = {
        ["ptBR"] = "Ajusta a taxa de atualização dos ícones HUD, que afeta a frequência com que a interface do usuário atualiza sua posição. ( Por defeito: %s )",
        ["ruRU"] = "Регулирует частоту обновления значков HUD, которая влияет на то, как часто пользовательский интерфейс обновляет их позиции (по умолчанию: %s).\n\nТребуется выключить/включить HUD",
        ["deDE"] = "Passt die Aktualisierungsrate für HUD-Icons an, die sich darauf auswirkt, wie oft die Benutzeroberfläche ihre Position aktualisiert. (Standard: %s)",
        ["koKR"] = "HUD 아이콘의 위치를 새로 표시하는 주기를 설정합니다. ( 기본값: %s )",
        ["esMX"] = "Ajusta la frecuencia de actualización de los iconos de HUD que afecta la frecuencia con la que la interfaz de usuario actualiza su posición. ( Por Defecto: %s )",
        ["enUS"] = true,
        ["zhCN"] = "调整HUD图标的刷新率，这会影响UI更新其位置的频率。（默认：%s）",
        ["zhTW"] = nil,
        ["esES"] = "Ajusta la frecuencia de actualización de los iconos de HUD que afecta la frecuencia con la que la interfaz de usuario actualiza su posición. ( Por Defecto: %s )",
        ["frFR"] = "Ajuste le taux de rafraîchissement des icônes HUD qui affecte la fréquence à laquelle l'interface utilisateur actualise leur position. (Par défaut : %s)",
    },
    ["Enable proximity visual for HUD icons"] = {
        ["ptBR"] = "Ativar visual de proximidade para ícones do HUD",
        ["ruRU"] = "Визуальное отображение близости",
        ["deDE"] = "Näherungsvisualisierung für HUD-Icons einschalten",
        ["koKR"] = "근접한 HUD 아이콘 표시 활성화",
        ["esMX"] = "Habilita la proximidad visual para los iconos de HUD",
        ["enUS"] = true,
        ["zhCN"] = "启用近距离视野的 HUD 图标",
        ["zhTW"] = nil,
        ["esES"] = "Habilita la proximidad visual para los iconos de HUD",
        ["frFR"] = "Activer le visuel de proximité pour les icônes HUD",
    },
    ["Adjusts the size of the icons that appear on the HUD. ( Default: %s )"] = {
        ["ptBR"] = "Ajusta o tamanho dos ícones que aparecem no HUD. ( Por defeito: %s )",
        ["ruRU"] = "Регулирует размер значков, отображаемых на HUD (по умолчанию: %s)",
        ["deDE"] = "Passt die Größe der Icons an, die auf dem HUD erscheinen. ( Standard: %s )",
        ["koKR"] = "HUD에 표시될 아이콘의 크기를 설정합니다. ( 기본값: %s )",
        ["esMX"] = "Ajusta el tamaño de los iconos que aparecen en el HUD. ( Por Defecto: %s )",
        ["enUS"] = true,
        ["zhCN"] = "调整HUD上显示的图标的大小。（默认：%s）",
        ["zhTW"] = nil,
        ["esES"] = "Ajusta el tamaño de los iconos que aparecen en el HUD. ( Por Defecto: %s )",
        ["frFR"] = "Ajuste la taille des icônes qui apparaissent sur le HUD. (Par défaut : %s)",
    },
    ["Toggles whether or not objective icons appear on HUD ( Default: %s )"] = {
        ["ptBR"] = "Alterna se os ícones objetivos aparecem ou não no HUD ( Por defeito: %s )",
        ["ruRU"] = "Показать/скрыть значки целей на HUD (по умолчанию: %s)",
        ["deDE"] = "Aktiviert/Deaktivert die Anzeige von Questziel-Icons im HUD ( Standard: %s )",
        ["koKR"] = "목표 아이콘을 HUD에 표시합니다. ( 기본값: %s )",
        ["esMX"] = "Alterna si iconos de objetivos de misiones aparecen en HUD ( Por Defecto: %s )",
        ["enUS"] = true,
        ["zhCN"] = "切换是否在HUD上显示目标图标 （默认：%s）",
        ["zhTW"] = nil,
        ["esES"] = "Alterna si iconos de objetivos de misiones aparecen en HUD ( Por Defecto: %s )",
        ["frFR"] = "Indique si les icônes d'objectifs de quête apparaissent ou non sur le HUD. (Par défaut : %s)",
    },
    ["Size & Scale Options"] = {
        ["ptBR"] = "Opções de tamanho e escala",
        ["ruRU"] = "Параметры масштабирования и размера значков",
        ["deDE"] = "Optionen für Größe und Skalierung",
        ["koKR"] = "크기 & 비율 설정",
        ["esMX"] = "Opciones de Tamaño y Escala",
        ["enUS"] = true,
        ["zhCN"] = "打开大小 & 比例 选项",
        ["zhTW"] = nil,
        ["esES"] = "Opciones de Tamaño y Escala",
        ["frFR"] = "Options de taille et d'échelle",
    },
    ["Show quest loot icons"] = {
        ["ptBR"] = "Mostrar ícones de saque de missão",
        ["ruRU"] = "Значки добычи",
        ["deDE"] = "Beute-Icons für Quests anzeigen",
        ["koKR"] = "수집 아이콘 표시",
        ["esMX"] = "Mostrar icono de botín de misiones",
        ["enUS"] = true,
        ["zhCN"] = "显示任务物品图标",
        ["zhTW"] = nil,
        ["esES"] = "Mostrar icono de botín de misiones",
        ["frFR"] = "Afficher les icônes de butin de quête",
    },
    ["Toggles whether or not loot icons appear on HUD. ( Default: %s )"] = {
        ["ptBR"] = "Alterna se os ícones de saque aparecem ou não no HUD. ( Por defeito: %s )",
        ["ruRU"] = "Показать/скрыть значки добычи на HUD (по умолчанию: %s)",
        ["deDE"] = "Schaltet um, ob Beutesymbole auf dem HUD erscheinen oder nicht. ( Standard: %s )",
        ["koKR"] = "수집 아이콘을 HUD에 표시합니다. ( 기본값: %s )",
        ["esMX"] = "Alterna si los iconos de botín aparecen en HUD. ( Por Defecto: %s )",
        ["enUS"] = true,
        ["zhCN"] = "切换是否在HUD上显示物品图标。 （默认：%s）",
        ["zhTW"] = nil,
        ["esES"] = "Alterna si los iconos de botín aparecen en HUD. ( Por Defecto: %s )",
        ["frFR"] = "Indique si les icônes de butin apparaissent ou non sur le HUD. (Par défaut : %s)",
    },
    ["Global zoom level for HUD Icons"] = {
        ["ptBR"] = "Nível de zoom global para ícones HUD",
        ["ruRU"] = "Масштабирование",
        ["deDE"] = "Globale Zoomstufe für HUD-Symbole",
        ["koKR"] = "HUD 아이콘 확대 비율 전역 설정",
        ["esMX"] = "Nivel de zoom global para iconos de HUD",
        ["enUS"] = true,
        ["zhCN"] = "HUD图标的全局缩放等级",
        ["zhTW"] = nil,
        ["esES"] = "Nivel de zoom global para iconos de HUD",
        ["frFR"] = "Niveau de zoom global pour les icônes HUD",
    },
    ["Changes the color of a HUD icon to red when you are near it."] = {
        ["ptBR"] = "Muda a cor de um ícone HUD para vermelho quando você está perto dele.",
        ["ruRU"] = "Изменяет цвет значка HUD на красный, когда игрок находится рядом с ним",
        ["deDE"] = "Ändert die Farbe eines HUD-Symbols auf rot, wenn Sie sich in dessen Nähe befinden.",
        ["koKR"] = "근처에 다가가면 HUD 아이콘을 빨간색으로 표시합니다.",
        ["esMX"] = "Cambia el color de un icono de HUD a rojo cuando estás cerca de él.",
        ["enUS"] = true,
        ["zhCN"] = "靠近HUD图标时，将其颜色更改为红色。",
        ["zhTW"] = nil,
        ["esES"] = "Cambia el color de un icono de HUD a rojo cuando estás cerca de él.",
        ["frFR"] = "Change la couleur d'une icône HUD en rouge lorsque vous vous en approchez.",
    },
    ["Show quest slay icons"] = {
        ["ptBR"] = "Mostrar ícones de matança de missões",
        ["ruRU"] = "Значки убийств",
        ["deDE"] = "Tötungs-Icons anzeigen",
        ["koKR"] = "처치 아이콘 표시",
        ["esMX"] = "Mostrar icono de matar de misiones",
        ["enUS"] = true,
        ["zhCN"] = "显示任务需要击杀图标",
        ["zhTW"] = nil,
        ["esES"] = "Mostrar icono de matar de misiones",
        ["frFR"] = "Afficher les icônes de meurtre de quête",
    },
    ["Toggles whether or not slay icons appear on HUD. ( Default: %s )"] = {
        ["ptBR"] = "Alterna se os ícones slay aparecem ou não no HUD. ( Por defeito: %s )",
        ["ruRU"] = "Показать/скрыть значки убийств на HUD (по умолчанию: %s)",
        ["deDE"] = "Aktiviert/Deaktiviert die Anzeige von Tötungs-Icons im HUD. ( Standard: %s )",
        ["koKR"] = "처치 아이콘을 HUD에 표시합니다. ( 기본값: %s )",
        ["esMX"] = "Alterna si los iconos de matar aparecen en HUD. ( Por Defecto: %s )",
        ["enUS"] = true,
        ["zhCN"] = "切换是否在HUD上显示击杀目标的图标。 （默认：%s）",
        ["zhTW"] = nil,
        ["esES"] = "Alterna si los iconos de matar aparecen en HUD. ( Por Defecto: %s )",
        ["frFR"] = "Indique si les icônes de massacre apparaissent ou non sur le HUD. (Par défaut : %s )",
    },
    ["Global radius/size for HUD Icons"] = {
        ["ptBR"] = "Raio/tamanho global para ícones de HUD",
        ["ruRU"] = "Размер",
        ["deDE"] = "Globaler Radius/Größe für HUD-Icons",
        ["koKR"] = "HUD 아이콘 크기 전역 설정",
        ["esMX"] = "Radio / tamaño global para iconos de HUD",
        ["enUS"] = true,
        ["zhCN"] = "HUD图标的全局半径/大小",
        ["zhTW"] = nil,
        ["esES"] = "Radio / tamaño global para iconos de HUD",
        ["frFR"] = "Rayon/taille global pour les icônes HUD",
    },
    ["Adjusts the zoom level for HUD Icons which affects how close in or how far out you see them. ( Default: %s )"] = {
        ["ptBR"] = "Ajusta o nível de zoom dos ícones HUD, o que afeta a proximidade ou a distância que você os vê. ( Por defeito: %s )",
        ["ruRU"] = "Регулирует уровень масштабирования для значков HUD, который влияет на то, как близко или как далеко вы видите их (по умолчанию: %s)",
        ["deDE"] = "Stellt die Zoomstufe für HUD-Icons ein, die beeinflusst, wie nah oder wie weit entfernt sie zu sehen sind. (Standard: %s)",
        ["koKR"] = "가까운 거리면 커지고 먼 거리면 작아지는 HUD 아이콘의 확대 비율을 설정합니다. ( 기본값: %s )",
        ["esMX"] = "Ajusta el nivel de zoom para los iconos de HUD, lo que afecta la proximidad o la distancia a la que los ve. ( Por Defecto: %s )",
        ["enUS"] = true,
        ["zhCN"] = "调整HUD图标的缩放级别，这会影响您看到它们的接近程度或远近程度。（默认：%s）",
        ["zhTW"] = nil,
        ["esES"] = "Ajusta el nivel de zoom para los iconos de HUD, lo que afecta la proximidad o la distancia a la que los ve. ( Por Defecto: %s )",
        ["frFR"] = "Ajuste le niveau de zoom des icônes HUD qui affecte la distance à laquelle vous les voyez. (Par défaut : %s)",
    },
}

for k, v in pairs(dbmHudOptionsLocales) do
    l10n.translations[k] = v
end
