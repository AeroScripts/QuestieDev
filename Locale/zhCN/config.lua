-- Last update: 2020/10/01 （祈福@枫聖-重新整理）
QuestieLocale.locale['zhCN'] = {
    -- General tab
    ['GENERAL_TAB'] = "选项",
    ['GENERAL_OPTIONS_HEADER'] = "Questie选项",
    ['ENABLE_ICONS'] = "启用Questie",
    ['ENABLE_ICONS_DESC'] = "启用或禁用Questie.",
    ['ENABLE_MINIMAP_BUTTON'] = "启用Questie的小地图按钮",
    ['ENABLE_MINIMAP_BUTTON_DESC'] = "启用小地图按钮；禁用后以 /questie 打开配置",
    ['ENABLE_INSTANT'] = "立即显示任务文本",
    ['ENABLE_INSTANT_DESC'] = "使任务直接显示完整文本，这其实是一个暴雪原生自带的功能",
    ['LEVEL_HEADER'] = "任务等级选项",
    ['ENABLE_LOWLEVEL'] = "显示所有低等级任务",
    ['ENABLE_LOWLEVEL_DESC'] = "启用后，在地图上显示低等级任务。",
    ['ENABLE_MANUAL_OFFSET'] = "启用手动最小等级补偿",
    ['ENABLE_MANUAL_OFFSET_DESC'] = "启用手动最小等级补偿，而不是自动获取绿色任务等级的功能.",
    ['LOWLEVEL_BELOW'] = "< 低于等级",
    ['LOWLEVEL_BELOW_DESC'] = "显示比你低了多少级的任务（默认：%s）",
    ['LOWLEVEL_ABOVE'] = "高于等级 >",
    ['LOWLEVEL_ABOVE_DESC'] = "显示比你高了多少级的任务（默认：%s）",
    ['ENABLE_MANUAL_OFFSET_ABSOLUTE'] = "绝对任务等级范围",
    ['ENABLE_MANUAL_OFFSET_ABSOLUTE_DESC'] = "变更任务等级平均值成绝对任务等级范围值。",
    ['LEVEL_FROM'] = "等级从",
    ['LEVEL_FROM_DESC'] = "显示最低任务等级。",
    ['LEVEL_TO'] = "到等级",
    ['LEVEL_TO_DESC'] = "显示最高任务等级",
    ['CLUSTER'] = "任务目标密度",
    ['CLUSTER_DESC'] = "目标图标代表多少怪",
    ['ENABLE_OBJECTIVES'] = "启用互动目标图标",
    ['ENABLE_OBJECTIVES_DESC'] = "若启用，在地图上显示任务互动目标",
    ['ENABLE_TURNINS'] = "启用提交任务标记",
    ['ENABLE_TURNINS_DESC'] = "若启用，在地图上标记提交任务的地点",
    ['ENABLE_AVAILABLE'] = "启用取得任务标记",
    ['ENABLE_AVAILABLE_DESC'] = "若启用，在地图上标记可取得任务的地点",
    ['ICON_TYPE_HEADER'] = "图标类别",
    ['ENABLE_MAP_ICONS'] = "启用大地图标记",
    ['ENABLE_MAP_ICONS_DESC'] = "启用或停用大地图上的所有图标",
    ['ENABLE_MAP_ICONS_MINIMALISTIC'] = "启用极简地图图标",
    ['ENABLE_MAP_ICONS_DESC_MINIMALISTIC'] = "普通图标的极简版本",
    ['ENABLE_MINIMAP_ICONS'] = "启用小地图标记",
    ['ENABLE_MINIMAP_ICONS_DESC'] = "启用或停用小地图上的所有图标",
    ['HIDE_UNEXPLORED_ICONS'] = "隐藏未探测区域图标",
    ['HIDE_UNEXPLORED_ICONS_DESC'] = "隐藏未探测区域中的图标",
    ['ENABLE_ICON_LIMIT'] = "启用图标限制",
    ['ENABLE_ICON_LIMIT_DESC'] = "启用对每种类型图标的限制",
    ['ICON_LIMIT'] = "图标限制",
    ['ICON_LIMIT_DESC'] = "限制每种类型图标数量 ( 默认: %s )",
    ['ENABLE_REPEATABLE_QUEST_ICONS'] = "启用重复的任务图标",
    ['ENABLE_REPEATABLE_QUEST_ICONS_DESC'] = "启用此功能后，重复任务的位置将显示在 世界地图/小地图上。",
    ['ENABLE_EVENT_QUEST_ICONS'] = "启用事件任务图标",
    ['ENABLE_EVENT_QUEST_ICONS_DESC'] = "启用此功能后，事件任务的位置将显示在 世界地图/小地图上。",
    ['ENABLE_DUNGEON_QUEST_ICONS'] = "启用副本任务图标",
    ['ENABLE_DUNGEON_QUEST_ICONS_DESC'] = "启用此功能后，副本任务的位置将显示在 世界地图/小地图上。",
    ['ENABLE_DUNGEON_RAID_ICONS'] = "启用团队任务图标",
    ['ENABLE_DUNGEON_RAID_ICONS_DESC'] = "启用此功能后，团队任务的位置将显示在 世界地图/小地图上。",
    ['ENABLE_PVP_QUEST_ICONS'] = "启用PVP任务图标",
    ['ENABLE_PVP_QUEST_ICONS_DESC'] = "启用此功能后，PVP任务的位置将显示在 世界地图/小地图上。",
    ['ENABLE_AQ_QUEST_ICONS'] = "启用安其拉战备任务图标",
    ['ENABLE_AQ_QUEST_ICONS_DESC'] = "启用此功能后，安其拉战备任务的位置将显示在 世界地图/小地图上。",
    ['ENABLE_AUTO_ACCEPT_QUESTS'] = "自动接受任务",
    ['ENABLE_AUTO_ACCEPT_QUESTS_DESC'] = "启用后和NPC对话，Questie自动接受任务。",
    ['ENABLE_AUTO_COMPLETE'] = "自动完成",
    ['ENABLE_AUTO_COMPLETE_DESC'] = "启用后和NPC交谈 Questie 自动完成。",
    ['ENABLE_ACCEPT_TRIVIAL'] = "自动接受低级任务",
    ['ENABLE_ACCEPT_TRIVIAL_DESC'] = "启用此功能后，低级（灰色）的任务也会被自动接受。",
    ['AUTO_MODIFIER'] = "自动调整",
    ['AUTO_MODIFIER_DESC'] = "当与NPC互动时，即便您已启用自动接受/自动完成，启用额外按键以触发对应功能.",
    ['ENABLE_YELL'] = "与身边玩家分享任务进度",
    ['ENABLE_YELL_DESC'] = "你的任务进度將定期的发送给身边玩家",
    ['QUEST_ANNOUNCE'] = "任务进度通报",
    ['QUEST_ANNOUNCE_DESC'] = "向队员通报任务进度完成情况",
    ['QUEST_ANNOUNCE_ENABLED'] = "已启用",
    ['QUEST_ANNOUNCE_OBJECTIVE'] = "{rt1} Questie : %s 任务： %s!",
    ['QUEST_ANNOUNCE_QUESTITEM'] = "{rt1} Questie : 拾取 %s 自动接受任务： %s!",
    
    -- Minimap tab
    ['MINIMAP_TAB'] = "小地图",
    ['MINIMAP_OPTIONS_HEADER'] = "小地图选项",
    ['MINIMAP_NOTES_HEADER'] = "小地图图标选项",
    ['MINIMAP_GLOBAL_SCALE'] = "小地图标记的全局大小",
    ['MINIMAP_GLOBAL_SCALE_DESC'] = "调整小度图标记图标的缩放比例（预设：%s）",
    ['MINIMAP_FADING'] = "远离目标的淡出隐距离",
    ['MINIMAP_FADING_DESC'] = "目标物件离你多远以后，将其标记淡出（预设：%s）",
    ['MINIMAP_FADE_PLAYER'] = "淡出与玩家重叠的标记",
    ['MINIMAP_FADE_PLAYER_DESC'] = "当你靠近一个目标或与之重叠时，使标记淡出，避免遮住小地图上的玩家自身标记。",
    ['MINIMAP_FADE_PLAYER_DIST'] = "靠近目标的淡出距离",
    ['MINIMAP_FADE_PLAYER_DIST_DESC'] = "目标距离你多近时，开始将其标记淡出（预设：%s）",
    ['MINIMAP_FADE_PLAYER_LEVEL'] = "淡出透明度",
    ['MINIMAP_FADE_PLAYER_LEVEL_DESC'] = "靠近或与玩家重叠的标记，其淡出的透明度数值（预设：%s）",
    ['MINMAP_COORDS_HEADER'] = "小地图座标",
    ['ENABLE_COORDS'] = "启用小地图座标",
    ['ENABLE_COORDS_DESC'] = "在小地图标题上显示玩家座标。",
    ['MINIMAP_ALWAYS_GLOW_TOGGLE'] = "总是使小地图标记高亮",
    ['MINIMAP_ALWAYS_GLOW_TOGGLE_DESC'] = "替小地图标记显示一圈光晕，且不同任务有不同的颜色",

    -- Map tab
    ['MAP_TAB'] = "大地图",
    ['MAP_OPTIONS_HEADER'] = "大地图选项",
    ['ENABLE_MAP_BUTTON'] = "大地图显示Questie按钮",
    ['ENABLE_MAP_BUTTON_DESC'] = "启用或停用大地图上的Questie切换按钮（可以解决某些地图插件的冲突）",
    ['MAP_NOTES'] = "大地图标记",
    ['MAP_ALWAYS_GLOW_TOGGLE'] = "总是使大地图标记高亮",
    ['MAP_ALWAYS_GLOW_TOGGLE_DESC'] = "替大地图标记显示一圈光晕，且不同任务有不同的颜色",
    ['MAP_QUEST_COLORS'] = "为每个任务的大地图标记使用不同颜色",
    ['MAP_QUEST_COLORS_DESC'] = "基于任务ID，为每个任务的大地图标记随机生成不同颜色的图标。",

    ['MAP_GLOBAL_SCALE'] = "1. 大地图标记的全局大小",
    ['MAP_GLOBAL_SCALE_DESC'] = "调整大地图标记图标的缩放比例（默认：%s）",
    ['AVAILABLE_ICON_SCALE'] = "2. 可取得与可完成的图标大小",
    ['AVAILABLE_ICON_SCALE_DESC'] = "调整可取得与可完成的缩放比例（默认：%s）",
    ['LOOT_ICON_SCALE'] = "3. 拾取图标大小",
    ['LOOT_ICON_SCALE_DESC'] = "调整拾取图标的缩放比例（默认：%s）",
    ['MONSTER_ICON_SCALE'] = "6. 击杀目标的图标大小",
    ['MONSTER_ICON_SCALE_DESC'] = "调整击杀目标图标的缩放比例（默认：%s）",
    ['OBJECT_ICON_SCALE'] = "5. 互动目标的图标大小",
    ['OBJECT_ICON_SCALE_DESC'] = "调整互动目标图标的缩放比例（默认：%s）",
    ['EVENT_ICON_SCALE'] = "4. 事件图标大小",
    ['EVENT_ICON_SCALE_DESC'] = "调整事件图标的缩放比例（默认：%s）",

    ['MAP_COORDS'] = "大地图座标",
    ['ENABLE_MAP_COORDS'] = "显示玩家与鼠标的座标",
    ['ENABLE_MAP_COORDS_DESC'] = "在大地图标题上显示玩家与鼠标指向位置的座标",
    ['MAP_COORDS_PRECISION'] = "座标数值精确度",
    ['MAP_COORDS_PRECISION_DESC'] = "大地图的座标要显示到小数点后几位（默认：%s）",

    -- DBM HUD tab
    ['DBM_HUD_TAB'] = "DBM HUD",
    ['ENABLE_DBM_HUD'] = "启用 DBM HUD",
    ['ENABLE_DBM_HUD_DESC'] = "启用/禁用叠加在地图插件上的 DBM HUD。",
    ['DBM_HUD_ICON_ALERT'] = "启用近距离视野的 HUD 图标",
    ['DBM_HUD_ICON_ALERT_DESC'] = "靠近HUD图标时，将其颜色更改为红色。",
    ['DBM_HUD_REFRESH'] = "HUD的刷新率（需要关闭/打开HUD）",
    ['DBM_HUD_REFRESH_DESC'] = "调整HUD图标的刷新率，这会影响UI更新其位置的频率。（默认：%s）",
    ['DBM_HUD_SCALE_OPTIONS'] = "打开大小 & 比例 选项",
    ['DBM_HUD_ZOOM'] = "HUD图标的全局缩放等级",
    ['DBM_HUD_ZOOM_DESC'] = "调整HUD图标的缩放级别，这会影响您看到它们的接近程度或远近程度。（默认：%s）",
    ['DBM_HUD_RADIUS'] = "HUD图标的全局半径/大小",
    ['DBM_HUD_RADIUS_DESC'] = "调整HUD上显示的图标的大小。（默认：%s）",
    ['DBM_HUD_FILTER_OPTIONS'] = "过滤器选项",
    ['DBM_HUD_FILTER_QUEST'] = "显示起始任务图标",
    ['DBM_HUD_FILTER_QUEST_DESC'] = "切换是否在HUD上显示可用/完成任务图标。（默认：%s）",
    ['DBM_HUD_FILTER_KILL'] = "显示任务需要击杀图标",
    ['DBM_HUD_FILTER_KILL_DESC'] = "切换是否在HUD上显示击杀目标的图标。 （默认：%s）",
    ['DBM_HUD_FILTER_LOOT'] = "显示任务物品图标",
    ['DBM_HUD_FILTER_LOOT_DESC'] = "切换是否在HUD上显示物品图标。 （默认：%s）",
    ['DBM_HUD_FILTER_INTERACT'] = "显示任务目标图标",
    ['DBM_HUD_FILTER_INTERACT_DESC'] = "切换是否在HUD上显示目标图标 （默认：%s）",

    -- Nameplate tab
    ['NAMEPLATE_TAB'] = "姓名板",
    ['NAMEPLATE_OPTIONS_HEADER'] = "姓名板图标选项",
    ['ENABLE_NAMEPLATES'] = "启用姓名板标记",
    ['ENABLE_NAMEPLATES_DESC'] = "启用或停用姓名板上的任务目标图标",
    ['NAMEPLATE_X'] ="图标X座标",
    ['NAMEPLATE_X_DESC'] = "图标锚点于姓名板的X座标（默认：%s）",
    ['NAMEPLATE_Y'] = "图标Y座标",
    ['NAMEPLATE_Y_DESC'] = "图标锚点于姓名板的Y座标（默认：%s）",
    ['NAMEPLATE_SCALE'] = "图标大小",
    ['NAMEPLATE_SCALE_DESC'] = "调整姓名板图标的缩放（默认：%s）",
    ['NAMEPLATE_RESET_BTN'] = "重设",
    ['NAMEPLATE_RESET_BTN_DESC'] = "重设姓名板图标的位置和大小",
    ['TARGET_HEAD'] = "目标图标选项",
    ['TARGET_TOGGLE'] = "启用目标标记",
    ['TARGET_TOGGLE_DESC'] = "启用或停用目标头像上的任务目标图标",
    ['TARGET_X'] ="图标X座标",
    ['TARGET_X_DESC'] = "图标锚点于目标头像的X座标（默认：%s）",
    ['TARGET_Y'] = "图标Y座标",
    ['TARGET_Y_DESC'] = "图标锚点于目标头像的Y座标（默认：%s）",
    ['TARGET_SCALE'] = "图标大小",
    ['TARGET_SCALE_DESC'] = "调整目标头像图标的缩放比例（默认：%s）",
    ['TARGET_RESET_BTN'] = "重设",
    ['TARGET_RESET_BTN_DESC'] = "重设目标图标的位置和大小",

    -- Tooltip tab
    ['TOOLTIP_TAB'] = "工具提示",
    ['TOOLTIP_OPTIONS_HEADER'] = "工具提示选项",
    ['ENABLE_TOOLTIPS'] = "启用鼠标提示",
    ['ENABLE_TOOLTIPS_DESC'] = "启用后，目标或物品在鼠标提示中显示任务信息",
    ['ENABLE_TOOLTIPS_QUEST_LEVEL'] = "鼠标提示中显示任务等级",
    ['ENABLE_TOOLTIPS_QUEST_LEVEL_DESC'] = "勾选后，任务等级将显示在鼠标提示中",
    ['SHARED_TOOLTIP_PARTY_ONLY'] = "仅限队伍",
    ['SHARED_TOOLTIP_PARTY_ONLY_DESC'] = "启用后，仅当共享任务信息来自队伍其他成员时才会显示。",
    ['SHOW_QUESTS_IN_NPC_TOOLTIPS'] = '显示任务NPC',
    ['SHOW_QUESTS_IN_NPC_TOOLTIPS_DESC'] = '启用后，在鼠标提示中显示NPC（可用/完成）任务。',

    -- Advanced tab
    ['ADVANCED_TAB'] = "进阶",
    ['ADVANCED_OPTIONS_HEADER'] = "进阶选项",
    ['DEVELOPER_OPTIONS_HEADER'] = "开发选项",
    ['ENABLE_DEBUG'] = "启用除错",
    ['ENABLE_DEBUG_DESC'] = "启用或停用除错功能",
    ['DEBUG_LEVEL'] = "除错等级",
    ['DEBUG_LEVEL_DESC'] = "输出除错报告的等级：%s",
    ['ENABLE_TOOLTIPS_QUEST_IDS'] = "显示任务ID",
    ['ENABLE_TOOLTIPS_QUEST_LEVEL_IDS'] = "勾选此选项后，任务ID将显示在鼠标提示和跟踪器中",
    ['LOCALE_HEADER'] = "本地化设置",
    ['LOCALE_DROP'] = "选择UI的本地化语言",
    ['LOCALE_DROP_AUTOMATIC'] = "自动", -- TODO
    ['RESET_QUESTIE_HEADER'] = "重置Questie",
    ['RESET_QUESTIE_DESC'] = "点击这个按钮将会使Questie除了本地化以外的所有设置重置为默认值。",
    ['RESET_QUESTIE_BTN'] = "重置",
    ['RESET_QUESTIE_BTN_DESC'] = "将所有设置重置为默认值。",
    ['RECOMPILE_DATABASE_BTN'] = "启用查找器",
    ['RECOMPILE_DATABASE_BTN_DESC'] = "启用查找器，这对于追踪延迟/帧数峰值的来源很有用",
    ['SHOW_PROFILER_BTN'] = "打开查找器",
    ['SHOW_PROFILER_BTN_DESC'] = "打开 Questie 查找器, 这对于追踪延迟/帧数峰值的来源很有用",
    ['QUESTIE_DEV_MESSAGE'] = "Questie是一款为魔兽世界经典旧世制作的任务插件，目前仍在开发中，请到Github查看最新版本、提交问题或提供建议，或是加入我们的 discord 频道。(( https://github.com/AeroScripts/QuestieDev/ ))",

    -- UI Elements
    ['QUESTIE_MAP_BUTTON_SHOW'] = "显示Questie",
    ['QUESTIE_MAP_BUTTON_HIDE'] = "隐藏Questie",
    ['ICON_LEFT_CLICK'] = "左键",
    ['ICON_LEFT_CLICK_HOLD'] = "左键单击并按住",
    ['ICON_DRAG_LOCKED'] = "锁定时拖动",
    ['ICON_TOGGLE'] = "打开设置",
    ['ICON_SHIFTLEFT_CLICK'] = "Ctrl + Shift + 左键",
    ['ICON_TOGGLE_QUESTIE'] = "打开Questie",
    ['ICON_CTRLRIGHT_CLICK'] = "Ctrl + 右键",
    ['ICON_CTRLLEFT_CLICK'] = "Ctrl + 右键",
    ['ICON_CTRLLEFT_CLICK_HOLD'] = "Ctrl +左键+保持",
    ['ICON_DRAG_UNLOCKED'] = "解锁时拖动",
    ['ICON_HIDE'] = "隐藏小地图图标",
    ['ICON_RIGHT_CLICK'] = "右键",
    ['ICON_JOURNEY'] = "打开我的日志",
    ['ICON_RELOAD'] = "重载Questie",
    ['ICON_SHIFT_HOLD'] = "按住Shift查看更多";
    ['CONFIRM_HIDE_QUEST'] = "你确定要隐藏任务： %s吗？",
    ['CONFIRM_HIDE_YES'] = "是",
    ['CONFIRM_HIDE_NO'] = "否",
    ['TOOLTIP_QUEST_COMPLETE'] = "（完成）",
    ['TOOLTIP_QUEST_AVAILABLE'] = "（可接）",
    ['TOOLTIP_QUEST_ACTIVE'] = "（已有）",
    ['TOOLTIP_QUEST_REPEATABLE'] = "(可重复)",
    ['TOOLTIP_QUEST_EVENT'] = "(事件)",
    ['XP'] = "经验";
    ['COMPLETE'] = "完成";
    ['FAILED'] = "失败";

    -- Slash Commands
    ['SLASH_INVALID'] = "无效命令，要查看指令列表请输入：",
    ['SLASH_HEAD'] = "Questie配置命令",
    ['SLASH_CONFIG'] = "/questie -- 打开设置窗口",
    ['SLASH_TOGGLE_QUESTIE'] = "/questie toggle -- 在地图上显示Questie提示",
    ['SLASH_JOURNEY'] = "/questie journey -- 打开日志窗口",
    ['SLASH_TRACKER'] = "/questie tracker [show/hide/reset] -- 切换任务追踪窗口，输入  \"show\", \"hide\", \"reset\" 选项以显示、隐藏、重设追踪窗口",
    ['SLASH_TO_MAP'] = "/questie tomap [<npcId>/<npcName>/reset] -- 对特定NPC ID或名字于地图上加上自定义备注。若名字不精准，则备注可能会被加到多个目标上。 \"reset\"  指令可以移除所有的备注",
    ['SLASH_MINIMAP'] = "/questie minimap -- 切换显示或隐藏Questie小地图图标",

    -- Tracker
    ['TRACKER_TAB'] = "追踪",
    ['TRACKER_OPTIONSHEADER'] = "任务追踪选项",
    ['TRACKER_ENABLE_AUTOTRACK'] = "自动追踪任务",
    ['TRACKER_ENABLE_AUTOTRACK_DESC'] = "这与界面选项中的“启用自动任务跟踪”相同。 启用后，Questie 追踪将自动追踪日志中的所有任务。 这样可以防止按住Shift键单击手动追踪。",
    ['TRACKER_SHOW_COMPLETE'] = "显示完整的任务",
    ['TRACKER_SHOW_COMPLETE_DESC'] = "选中后，完成的任务将显示在Questie 追踪中。",
    ['TRACKER_COLLAPSE_COMPLETED'] = "最少完成任务",
    ['TRACKER_COLLAPSE_COMPLETED_DESC'] = "选中后，完成的任务将自动最小化。",
    ['TRACKER_SHOW_QUEST_LEVEL'] = "显示任务等级",
    ['TRACKER_SHOW_QUEST_LEVEL_DESC'] = "选中后，任务标题的任务等级标签将显示在Questie 追踪中。",
    ['TRACKER_SHOW_BLIZZARD_QUEST_TIMER'] = "显示暴风雪计时器",
    ['TRACKER_SHOW_BLIZZARD_QUEST_TIMER_DESC'] = "选中该选项时，将显示任务的默认暴雪计时器帧，而不是嵌入到追踪器中。",
    ['TRACKER_ENABLE_HOOKS'] = "启用追踪器挂钩",
    ['TRACKER_ENABLE_HOOKS_DESC'] = "启用挂钩暴雪任务追踪器。这对于Questie追踪器的某些功能是必需的，并且与其他插件集成。如果您在任务追踪方面遇到问题，则可能需要禁用此功能（需要/ reload ）。",
    ['TRACKER_HEADER_ENABLED'] = "启用标题",
    ['TRACKER_HEADER_ENABLED_DESC'] = "选中后，“ Questie 追踪标题”将变为可见，并且将显示您在日志中拥有的任务总数。",
    ['TRACKER_AUTO_MOVE_HEADER_ENABLED'] = "自动移动标题",
    ['TRACKER_AUTO_MOVE_HEADER_ENABLED_DESC'] = "当选中此选项时，当追踪放置在屏幕底部时，Questie 追踪标题将自动移至Questie 追踪的底部。否则，它将始终保持在顶部。\n\n注意：此设置仅在 \"Tracker SetPoint\" 使用默认的 \"Auto\" 模式时有效。",
    ['TRACKER_STICKY_DURABILITY_FRAME'] = "粘性道具于框架",
    ['TRACKER_STICKY_DURABILITY_FRAME_DESC'] = "选中此选项时，道具框架将根据追踪器在屏幕上的放置位置放置在追踪器的左侧或右侧。",
    ['TRACKER_HIDE_IN_COMBAT'] = "在战斗中最小化",
    ['TRACKER_HIDE_IN_COMBAT_DESC'] = "选中后，在进入战斗状态时，追踪器将自动最小化。",
    ['TRACKER_FADE_MINMAX_BUTTONS'] = "渐隐隐藏按钮",
    ['TRACKER_FADE_MINMAX_BUTTONS_DESC'] = "选中时，“最小化”和“最大化”按钮将在不使用时淡出并变为透明。",
    ['TRACKER_FADE_QUEST_ITEM_BUTTONS'] = "渐隐任务使用道具",
    ['TRACKER_FADE_QUEST_ITEM_BUTTONS_DESC'] = "选中此项时，任务项按钮将在不使用时褪色并变为透明。",
    ['TRACKER_ENABLE_BACKGROUND'] = "启用背景",
    ['TRACKER_ENABLE_BACKGROUND_DESC'] = "选中后，将显示 Questie 追踪背景。",
    ['TRACKER_ENABLE_BORDER'] = "启用边框",
    ['TRACKER_ENABLE_BORDER_DESC'] = "选中后，将显示 Questie 追踪边框。",
    ['TRACKER_FADE_BACKDROP'] = "淡入淡出背景",
    ['TRACKER_FADE_BACKDROP_DESC'] = "选中后，Questie 追踪的背景和边框（如果启用）将褪色并在不使用时变为透明。",
    ['TRACKER_SHOW_BACKGROUND_ALPHA'] = "追踪器背景",
    ['TRACKER_SHOW_BACKGROUND_ALPHA_DESC'] = "跟踪器背景的级别",
    ['TRACKER_ENABLED'] = "启用跟踪器",
    ['TRACKER_ENABLED_DESC'] = "启用跟踪器会将默认的暴雪自带任务追踪器替换为Questie追踪器。",
    ['TRACKER_DISABLED'] = "禁用追踪器",
    ['TRACKER_DISABLED_DESC'] = "禁用跟踪器会将Questie追踪器替换为默认的暴雪任务追踪器。",
    ['TRACKER_RESET_LOCATION'] = "重置追踪器位置",
    ['TRACKER_RESET_LOCATION_DESC'] = "如果Questie追踪器卡在屏幕外或丢失，您可以使用此按钮将其位置重置到屏幕中央（可能需要/重新加载）。",
    ['TRACKER_ENABLE_CHAR_TRACKERLOCATION'] = "按字符保存跟踪器",
    ['TRACKER_ENABLE_CHAR_TRACKERLOCATION_DESC'] = "您当前正在保存Questie 追踪的位置和每个字符的大小。这可让您自定义每个角色的跟踪器位置。\n\n注意：启用“每个字符”后，跟踪器将重置为您的中心。屏幕。将追踪移至所需位置并设置尺寸。准备好后，键入\"/reload\"完成设置。",
    ['TRACKER_ENABLE_GLOBAL_TRACKERLOCATION'] = "全局保存跟踪器",
    ['TRACKER_ENABLE_GLOBAL_TRACKERLOCATION_DESC'] = "您当前正在全局保存Questie 追踪的位置和大小。这使您可以对所有字符进行一次设置。\n\n注意：启用“全局”后，追踪将会重置为屏幕中心。将追踪移至所需位置并设置尺寸。准备好后，键入\"/reload\"完成设置。",
    ['TRACKER_COLOR_OBJECTIVES'] = "目标着色",
    ['TRACKER_COLOR_OBJECTIVES_DESC'] = "按照任务目标的进度，对踪框的任务目标文字染色。",
    ['TRACKER_COLOR_WHITE'] = "白色",
    ['TRACKER_COLOR_WHITE_TO_GREEN'] = "由白至绿",
    ['TRACKER_COLOR_WHITE_AND_GREEN'] = "白和绿",
    ['TRACKER_COLOR_RED_TO_GREEN'] = "由红至绿",
    ['TRACKER_FONT_HEADER'] = "当前任务的字体",
    ['TRACKER_FONT_HEADER_DESC'] = "当前任务使用的字体。",
    ['TRACKER_FONT_ZONE'] = "区域名称字体",
    ['TRACKER_FONT_ZONE_DESC'] = "区域名称使用的字体。",
    ['TRACKER_FONT_QUESTS'] = "任务标题字体",
    ['TRACKER_FONT_QUESTS_DESC'] = "任务图标使用的字体。",
    ['TRACKER_FONT_OBJECTIVE'] = "目标字体",
    ['TRACKER_FONT_OBJECTIVE_DESC'] = "用于目标的字体。",
    ['TRACKER_FONT_SIZE_HEADER'] = "当前任务字体大小",
    ['TRACKER_FONT_SIZE_HEADER_DESC'] = "当前任务使用的字体大小。",
    ['TRACKER_FONT_SIZE_ZONE'] = "区域名称字体大小",
    ['TRACKER_FONT_SIZE_ZONE_DESC'] = "区域名称使用的字体大小。",
    ['TRACKER_FONT_SIZE_QUESTS'] = "任务标题字体大小",
    ['TRACKER_FONT_SIZE_QUESTS_DESC'] = "任务标题使用的字体大小。",
    ['TRACKER_FONT_SIZE_OBJECTIVE'] = "目标字体大小",
    ['TRACKER_FONT_SIZE_OBJECTIVE_DESC'] = "用于目标使用的字体大小。",
    ['TRACKER_QUEST_PADDING'] = "任务间距",
    ['TRACKER_QUEST_PADDING_DESC'] = "追踪列表中，每个任务的间距",
    ['TRACKER_INVALID_LOCATION'] = "错误：Questie任务追踪的框架跑到奇怪的地方去了，重置一下......",
    ['TRACKER_SORT_OBJECTIVES'] = "目标排序",
    ['TRACKER_SORT_OBJECTIVES_DESC'] = "追踪列表中的任务要如何排序",
    ['TRACKER_SORT_BY_COMPLETE'] = "根据进度百分比",
    ['TRACKER_SORT_BY_LEVEL'] = "根据等级正序排列",
    ['TRACKER_SORT_BY_LEVEL_REVERSED'] = "根据等级反序排列",
    ['TRACKER_SORT_BY_ZONE'] = "按区域",
    ['TRACKER_SORT_BY_PROXIMITY'] = "按邻近度",
    ['TRACKER_DONT_SORT'] = "不排序",
    ['TRACKER_SETPOINT'] = "追踪器设定点",
    ['TRACKER_SETPOINT_DESC'] = "这决定了跟踪器的生长方向。默认设置将根据您自动拖动跟踪器的位置进行调整，也可以覆盖并强制将其填充为所需的样式。\n\n例如，如果您选择 \"Bottom Left\" 则跟踪器将从左向右增长，并且任务将从跟踪器的底部填充到顶部。当您希望将跟踪器放置在\"Bottom\"时，此设置是理想的用户界面等的左侧“区域",
    ['TRACKER_SETPOINT_AUTO'] = "自动",
    ['TRACKER_SETPOINT_TOPLEFT'] = "左上",
    ['TRACKER_SETPOINT_TOPRIGHT'] = "右上",
    ['TRACKER_SETPOINT_BOTTOMLEFT'] = "左下",
    ['TRACKER_SETPOINT_BOTTOMRIGHT'] = "右下",
    ['LEFT_CLICK'] = "左键点击",
    ['RIGHT_CLICK'] = "快捷点击",
    ['SHIFT_MODIFIER'] = "Shift",
    ['CTRL_MODIFIER'] = "Ctrl",
    ['ALT_MODIFIER'] = "Alt",
    ['DISABLED'] = "停用",
    ['SHORTCUT'] = " 快捷键",
    ['TRACKER_SET_TOMTOM_DESC'] = "在任务追踪上开启TomTom的快捷键",
    ['TRACKER_SHOW_QUESTLOG_DESC'] = "在任务追踪上开启任务日志的快捷键",
    ['TRACKER_UNTRACK_LINK'] = "停止任务/连接任务",
    ['TRACKER_UNTRACK_LINK_DESC'] = "当聊天框文字输入未被开启时，将所选任务从任务追踪框体内移除；当聊天框文字输入被开启时，贴上任务连接到聊天框内。",
    ['TRACKER_ACTIVE_QUESTS'] = "当前任务: ",

    -- Tracker right click menu
    ['TRACKER_UNFOCUS'] = "停止关注", -- focus makes only that quest/objective show on map
    ['TRACKER_FOCUS_OBJECTIVE'] = "关注目标",
    ['TRACKER_FOCUS_QUEST'] = "关注任务",
    ['TRACKER_CANCEL'] = "取消",
    ['TRACKER_UNTRACK'] = "停止追踪",
    ['TRACKER_SHOW_QUESTLOG'] = "开启任务日志",
    ['TRACKER_SET_TOMTOM'] = "显示|cFF54e33bTomTom|r箭头",
    ['TRACKER_SHOW_ICONS'] = "显示标记",
    ['TRACKER_HIDE_ICONS'] = "隐藏标记",
    ['TRACKER_LINK_TO_CHAT'] = "将任务连接到聊天框",
    ['TRACKER_OBJECTIVES'] = "目标",
    ['TRACKER_SHOW_ON_MAP'] = "显示于地图",
    ['TRACKER_UNLOCK'] = "解锁框体",
    ['TRACKER_LOCK'] = "锁定框体",

    -- Tooltips
    ['TOOLTIPS_AUTO_QUEST'] = '这个任务是自动完成的任务，并且没有任务标记。',
    ['TOOLTIPS_ON_QUEST'] = '你正在进行这项任务',
    ['TOOLTIPS_DONE_QUEST'] = '你已完成这项任务',
    ['TOOLTIPS_NOTDONE_QUEST'] = '你并完成这项任务',
    ['TOOLTIPS_CANTDO_QUEST'] = '你无法进行这项任务',
    ['TOOLTIPS_START_QUEST'] = '任务开始于',
    ['TOOLTIPS_END_QUEST'] = '任务结束于',
    ['TOOLTIPS_FOUND_QUEST'] = '任务可被发现',
    ['TOOLTIPS_REQUIRE_QUEST'] = '需求',
    ['TOOLTIPS_PROGRESS_QUEST'] = '你的进度',
    ['TOOLTIPS_FIN_QUEST'] = '(完成)',
    ['TOOLTIPS_REPEAT_QUEST'] = '这个任务可以重复完成',

    -- Journey Window
    ['JOURNEY_TITLE'] = "%s的任务历程",
    ['JOUNREY_TAB'] = "我的任务历程",
    ['JOURNEY_ZONE_TAB'] = "按地区查寻",
    ['JOURNEY_SEARCH_TAB'] = "进阶搜询",
    ['JOURNEY_AVAILABLE_TITLE'] = "可接受",
    ['JOURNEY_PREQUEST_TITLE'] = "需要前置任务",
    ['JOURNEY_COMPLETE_TITLE'] = "已完成",
    ['JOURNEY_REPEATABLE_TITLE'] = "可重复的任务",
    ['JOURNEY_UNOBTAINABLE_TITLE'] = "未完成的任务",
    ['JOURNEY_SELECT_HEAD'] = "选择大陆与区域",
    ['JOURNEY_SELECT_CONT'] = "选择大陆",
    ['JOURNEY_SELECT_ZONE'] = "选择区域",
    ['JOURNEY_SELECT_PROFESSION'] = "选择你的职业",
    ['JOURNEY_NO_QUESTS_FOUND'] = "找不到任务",
    ['JOURNEY_QUESTS'] = "区域任务",
    ['JOURNEY_QUESTINFO'] = "任务信息",
    ['JOURNEY_START_NPC'] = "任务起始NPC信息",
    ['JOURNEY_START_OBJ'] = "任务起始物品信息",
    ['JOURNEY_END_NPC'] = "任务提交NPC信息",
    ['JOURNEY_ALSO_STARTS'] = "这个NPC同时是下列任务的起始者：",
    ['JOURNEY_ALSO_ENDS'] = "这个NPC同时是下列任务的提交者：",
    ['JOURNEY_ALSO_STARTS_GO'] = "这个物品同时是下列任务的起始者：",
    ['JOURNEY_ALSO_ENDS_GO'] = "这个物品同时是下列任务的提交者：",
    ['JOURNEY_NO_QUEST'] = "无任务可列出",
    ['JOURNEY_NEXT_QUEST'] = "任务串",
    ['JOURNEY_QUEST_LEVEL'] = "建议等级：",
    ['JOURNEY_QUEST_MINLEVEL'] = "最低等级：",
    ['JOURNEY_QUEST_ID'] = "任务ID： ",
    ['JOURNEY_DIFFICULTY'] = "难度级距：%s",
    ['JOURNEY_PREQUEST'] = "前置任务",
    ['JOURNEY_AUTO_QUEST'] = "这个任务自动完成，所以没有目标。",
    ['JOURNEY_RECENT_EVENTS'] = "近期纪录",
    ['JOURNEY_LEVELUP'] = "恭喜你达到了%s！",
    ['JOURNEY_LEVELNUM'] = "等级%s",
    ['JOURNEY_LEVELREACH'] = "你达到了等级 %s",
    ['JOURNEY_QUEST_ACCEPT'] = "你接受了任务：%s",
    ['JOURNEY_QUEST_ABANDON'] = "你放弃了任务：%s",
    ['JOURNEY_QUEST_COMPLETE'] = "你完成了任务：%s",
    ['JOURNEY_NOTE_BTN'] = "添加冒险笔记",
    ['JOURNEY_NOTE_DESC'] = "替你的魔兽升级之旅创建一个条目，纪录特别的时刻。只要输入标题和内容，Questie就会替你保存下来！",
    ['JOURNEY_NOTE_TITLE'] = "新笔记：%s",
    ['JOURNEY_NOTE_ENTRY_TITLE'] = "输入标题",
    ['JOURNEY_NOTE_ENTRY_BODY'] = "输入游记",
    ['JOURNEY_NOTE_SUBMIT_BTN'] = "添加条目",
    ['JOURNEY_ERR_NOTITLE'] = "标题不可为空",
    ['JOURNEY_ERR_NONOTE'] = "内容不可为空",
    ['JOURNEY_TABLE_YEAR'] = "%s年",
    ['JOURNEY_TABLE_NOTE'] = "笔记：%s",
    ['JOURNEY_TABLE_QUEST'] = "任务%s：%s",
    ['JOURNEY_ACCEPT'] = "接受",
    ['JOURNEY_ABADON'] = "放弃",
    ['JOUNREY_COMPLETE'] = "完成",
    ['JOURNEY_NOTE_CREATED'] = "创建：%s",
    ['JOURNEY_PARTY_TITLE'] = "与你同行的队友",
    ['JOURNEY_BEGIN'] = "是时候踏上旅程了！",
    ['JOURNEY_SEARCH_HEAD'] = "输入搜索",
    ['JOURNEY_SEARCH_CRITERIA'] = "搜索条件",
    ['JOURNEY_SEARCH_BY_NAME'] = "根据任务名称搜索",
    ['JOURNEY_SEARCH_BY_ID'] = "根据任务ID搜索",
    ['JOURNEY_SEARCH_EXE'] = "搜索",
    ['JOURNEY_SEARCH_RESULTS'] = "搜索规则",
    ['JOURNEY_SEARCH_NOMATCH'] = "没有符合的结果：%s",
    ['JOURNEY_SEARCH_QUESTS'] = "任务",
    ['JOURNEY_SEARCH_NPCS'] = "NPC",
    ['JOURNEY_SEARCH_OBJECTS'] = "目标",
    ['JOURNEY_SEARCH_ITEMS'] = "物品",

    -- Debug Messages
    ['DEBUG_LOWLEVEL'] = "灰色任务已切换到:",
    ['DEBUG_MINLEVEL'] = "最低等级过滤设置为 %s",
    ['DEBUG_MAXLEVEL'] = "最大等级过滤设置为 %s",
    ['DEBUG_CLUSTER'] = "设置群集值，clusterLevelHotzone设置为 %s : Redrawing!",
    ['DEBUG_ICON_LIMIT'] = "图标限制值设置为 %s : Redrawing!",
    ['DEBUG_ADD_QUEST'] = "添加任务 %s %s",
    ['DEBUG_REMOVE_QUEST'] = "删除任务 %s %s",
    ['DEBUG_ACCEPT_QUEST'] = "接受任务：%s",
    ['DEBUG_COMPLETE_QUEST'] = "完成任务：%s",
    ['DEBUG_ABANDON_QUEST'] = "放弃任务：%s",
    ['DEBUG_GET_QUEST'] = "取得所有任务",
    ['DEBUG_GET_QUEST_COMP'] = "取得所有已完成的任务",
    ['DEBUG_POP_ERROR'] = "填充 %s %s %s %s",
    ['DEBUG_UNHANDLE_FINISH'] = "未处理的完整者类型: %s %s %s 的目标时出错",
    ['DEBUG_NO_FINISH'] = "任务无完成者: %s %s",
    ['DEBUG_POPULATE_ERR'] = "填充 %s %s %s %s 的目标时出错",
    ['DEBUG_POPTABLE'] = "新建目标表中",
    ['DEBUG_OBJ_TABLE'] = "错误：目标表在获得目标时不存在，这不应该发生!",
    ['DEBUG_ENTRY_ID'] = "查找目标的条目ID时出错 %s %s",
    ['DEBUG_DRAW'] = "%s 已绘制可用任务. 玩家等级 = %s",
    ['DEBUG_UNLOAD_QFRAMES'] = "卸载任务框架: %s",
    ['DEBUG_UNLOAD_ALL'] = "卸载所有框架，计数: %s",
    ['QUESTIE_ACCEPT_NIL'] = "|cFFFF0000Questie错误：|r你尝试接受任务时返回空值，请输入 /questie reload 重新载入Quesite。",
    ['QUESTIE_UPDATED_RESTART'] = "|cFFFF0000警告！|r你没有重开游戏就更新了Questie，这可能会使Questie出现某些错误。请完全关闭魔兽世界再重新启动游戏，确保Questie能正常运作。",
    ['QUESTIE_DATABASE_ERROR'] = "初始化Questie的数据库时出现问题。 通常可以通过重新编辑数据库来解决此问题。",
    ['DONT_SHOW_AGAIN'] = "不在显示",

    -- Townsfolk related strings
    ["Repair"] = "修理", 
    ["Auctioneer"] = "拍卖师",
    ["Banker"] = "银行职员",
    ["Battlemaster"] = "战场军官",
    ["Flight Master"] = "飞行管理员",
    ["Innkeeper"] = "旅馆老板",
    ["Weapon Master"] = "武器大师",
    ["Reagents"] = "施法材料",
    ["Class Trainer"] = "职业训练师",
    ["Stable Master"] = "兽栏管理员",
    ["Mailbox"] = "邮箱",
    ["Spirit Healer"] = "灵魂医者",
    ["Available Quest"] = "可用任务",
    ["Trivial Quest"] = "其他任务",
    ["Objective"] = "目标",
    ["Vendor"] = "商人",
    ["Profession Trainer"] = "专业训练师",
    ["Questie Options"] = "打开 Questie",
    ["Ammo"] = "弹药",
    ["Pet Food"] = "喂养宠物",
    ["Portal Trainer"] = "传送门训练师",
    ["Bags"] = "背包",
    ["Trade Goods"] = "商品",
    ["Food"] = "食品",
    ["Drink"] = "食品",
    -- professions use their ID as the key for a much cleaner implementation. Translations for these are alerady in QuestieProfessions.lua
    ["129"] = "急救",
    ["164"] = "锻造",
    ["165"] = "制皮",
    ["171"] = "炼金术",
    ["182"] = "草药学",
    ["185"] = "烹饪",
    ["186"] = "采矿",
    ["197"] = "裁缝",
    ["202"] = "工程学",
    ["333"] = "附魔",
    ["356"] = "钓鱼",
    ["393"] = "剥皮",

    -- TODO finally switch all keys to this style for code readability:
    ['Show on Map'] = "地图上显示",
    ['Remove from Map'] = "地图上移除",
    ['Starts the following quests:'] = "开始以下任务:",
    ['Ends the following quests:'] = "结束以下任务:",
    ['No quests to list.'] = "没有任务可以显示。",
    ['No spawn data available.'] = "没有可用的生成数据。",
    ['The database needs to be updated to change language. Press reload to apply the new language'] = "需要更新数据库及更改语言。 需重新加载以应用新语言",
    ['Reload UI'] = "重载UI",
    ["\124cFFAAEEFFQuestie DB has updated!\124r\124cFFFF6F22 Data is being processed, this may take a few moments and cause some lag..."] = "\124cFFAAEEFFQuestieDB 读出数据!\124r\124cFFFF6F22 数据正在处理中，这可能需要一些时间，并会导致一些延迟...",
    ["\124cFF4DDBFF [1/4] Updating NPCs..."] = "\124cFF4DDBFF [1/4] 正在读出 NPC信息...",
    ["\124cFF4DDBFF [2/4] Updating objects..."] = "\124cFF4DDBFF [2/4] 正在读出 目标信息...",
    ["\124cFF4DDBFF [3/4] Updating quests..."] = "\124cFF4DDBFF [3/4] 正在读出 任务信息...",
    ["\124cFF4DDBFF [4/4] Updating items..."] = "\124cFF4DDBFF [4/4] 正在读出 物品信息...",
    ["\124cFFAAEEFFQuestie DB update complete!"] = "\124cFFAAEEFFQuestieDB 读出完成!",
    ["Nearby"] = "附近",
};
