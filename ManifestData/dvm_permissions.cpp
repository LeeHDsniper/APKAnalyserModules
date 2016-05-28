#include "dvm_permissions.h"

Permission::Permission()
{
}


Permission::Permission( std::string name, std::string level, std::string info, std::string description )
{
	Permission_Name		= name;
	Permission_Level	= level;
	Permission_Info		= info;
	Permission_Description	= description;
}


Manifest_Permissions::Manifest_Permissions()
{
	permissions[0]		= Permission( "WRITE_SETTINGS", "dangerous", "修改全局系统设置", "允许应用程序修改系统的设置数据。恶意应用程序可以破坏系统的配置。" );
	permissions[1]		= Permission( "ADD_VOICEMAIL", "dangerous", "在系统中添加语音邮件", "允许一个应用程序向系统添加语音邮件。");
	permissions[2]		= Permission( "USE_SIP", "dangerous", "拨打/接收网络电话", "允许应用程序使用SIP服务拨打/接收网络电话。" );
	permissions[3]		= Permission( "BIND_WALLPAPER", "signatureOrSystem", "绑定壁纸", "允许持有者绑定在顶层界面绑定壁纸。不是应用必须的常见权限。" );
	permissions[4]		= Permission( "DUMP", "signatureOrSystem", "检索系统内部状态", "允许应用程序检索系统的内部状态。恶意应用程序经常会检索各种各样的不必要的隐私的或者与安全相关的信息。" );
	permissions[5]		= Permission( "WRITE_SOCIAL_STREAM", "dangerous", "记录用户的社交数据流","允许应用程序记录（并不是读取）用户的社交数据流。" );
	permissions[6]		= Permission( "USE_CREDENTIALS", "dangerous", "使用用户的身份验证凭据","允许应用程序请求验证令牌。" );
	permissions[7]		= Permission( "HARDWARE_TEST", "signature", "测试硬件", "允许应用程序控制各种外设达到硬件测试的目的。" );
	permissions[8]		= Permission( "GET_ACCOUNTS", "normal", "查找已知帐户", "允许应用程序访问已知的电话帐户列表。" );
	permissions[9]		= Permission( "SEND_SMS", "dangerous", "发送短信", "允许应用程序发送短信。恶意应用程序可能在没有确认发送的情况下消耗电话资费。" );
	permissions[10]		= Permission( "SET_ACTIVITY_WATCHER", "signature", "监控和控制所有应用程序的启动", "允许应用程序监视和控制系统如何启动活动。恶意应用程序可能会损害系统完全。此权限仅用于开发，从不适用于普通电话的使用环境。" );
	permissions[11]		= Permission( "MASTER_CLEAR", "signatureOrSystem", "重置系统到出厂默认值", "允许应用程序将系统完全重置为其出厂设置，清除所有数据，配置和已安装应用程序。" );
	permissions[12]		= Permission( "ACCESS_COARSE_LOCATION", "dangerous", "（基于网络的）粗略定位", "访问定位源，如移动网络数据库，确定手机大概的位置。恶意应用程序可以使用这个确定您大致的地理位置。" );
	permissions[13]		= Permission( "BIND_DEVICE_ADMIN", "signature", "设备管理互动", "允许持有人向设备管理员发送指令。这并不是应用程序常见的必要权限。" );
	permissions[14]		= Permission( "CHANGE_WIFI_MULTICAST_STATE", "dangerous", "允许Wi-Fi多播接收", "允许应用程序接收不是直接发送到该设备的数据包。这可以用于搜索附近提供的服务，但它使用的功率比非多播模式高。" );
	permissions[15]		= Permission( "WRITE_SECURE_SETTINGS", "signatureOrSystem", "修改安全系统设置", "允许应用程序修改系统的安全设置数据。不用于常见的应用程序。" );
	permissions[16]		= Permission( "READ_PROFILE", "dangerous", "读取用户个人资料", "允许应用程序读取您的个人资料。" );
	permissions[17]		= Permission( "BROADCAST_WAP_PUSH", "signature", "发送WAP-PUSH-received广播", "允许应用程序广播通知：WAP-PUSH消息已收到。恶意的应用程序可以使用这个伪造MMS消息的接收凭证或悄悄利用恶意变种替换任何网页的内容。" );
	permissions[18]		= Permission( "FACTORY_TEST", "signature", "工厂测试模式运行", "以低级别的制造商测试模式运行，允许完全访问电话硬件。只有在制造商测试模式下才可以运行。" );
	permissions[19]		= Permission( "DEVICE_POWER", "signature", "开关机控制", "允许应用程序开关手机" );
	permissions[20]		= Permission( "SET_ALWAYS_FINISH", "dangerous", "使所有的后台应用程序关闭", "允许应用程序来控制活动在退到后台时是否结束。这并不是应用程序常见的必要权限。" );
	permissions[21]		= Permission( "READ_CALENDAR", "dangerous", "读取日历事件", "允许应用程序读取存储在手机上的所有日历事件。恶意应用程序可以将您的日历事件发送给其他人。" );
	permissions[22]		= Permission( "ACCESS_SURFACE_FLINGER", "signature", "访问SurfaceFlinger", "允许应用程序使用surfaceflinger低级功能。" );
	permissions[23]		= Permission( "CHANGE_CONFIGURATION", "dangerous", "更改UI设置", "允许应用程序更改当前的配置，如时区设置或整体字体大小。" );
	permissions[24]		= Permission( "SYSTEM_ALERT_WINDOW", "dangerous", "显示系统级警报", "允许应用程序显示系统警报窗口。恶意应用程序可以接管整个手机屏幕。" );
	permissions[25]		= Permission( "WRITE_USER_DICTIONARY", "normal", "写入用户定义字典", "允许应用程序将新单词写进用户字典。" );
	permissions[26]		= Permission( "ASEC_RENAME", "signature", "内存重命名", "允许应用程序重命名内部存储。" );
	permissions[27]		= Permission( "READ_LOGS", "dangerous", "读取敏感日志数据", "允许应用程序读取系统的各种日志文件。这使得它可以获取到一般的信息，比如你正在手机上进行的操作，甚至可能包括个人的或私密信息." );
	permissions[28]		= Permission( "GET_PACKAGE_SIZE", "normal", "测量应用存储空间", "允许应用程序检索它的代码、数据和缓存大小。" );
	permissions[29]		= Permission( "ACCESS_LOCATION_EXTRA_COMMANDS", "normal", "访问额外的位置提供命令", "访问额外的位置提供命令。恶意应用程序可以使用此来干扰全球定位系统或其他位置源." );
	permissions[30]		= Permission( "PERFORM_CDMA_PROVISIONING", "signatureOrSystem", "直接启动CDMA手机设置", "允许应用程序启动CDMA配置。恶意应用程序可能会启动不必要的CDMA配置" );
	permissions[31]		= Permission( "WRITE_APN_SETTINGS", "dangerous", "写入访问点名称设置", "允许应用程序修改APN设置，如代理和任何APN端口。" );
	permissions[32]		= Permission( "CONTROL_LOCATION_UPDATES", "signatureOrSystem", "控制位置更新提示", "允许从无线模块中启用/禁用位置更新提示。这并不是应用程序常见的必要权限。" );
	permissions[33]		= Permission( "RECEIVE_BOOT_COMPLETED", "normal", "开机自启动", "允许应用程序在系统启动时自动启动。这可以延长手机的启动时间，并通过应用程序的运行降低手机总体运行速度。" );
	permissions[34]		= Permission( "SET_ALARM", "normal", "设置闹钟报警", "允许应用程序在已安装了闹钟应用程序的设备中设置一个闹钟。一些闹钟应用程序可能无法实现此功能。" );
	permissions[35]		= Permission( "WRITE_CONTACTS", "dangerous", "写入联系资料", "允许应用程序修改存储在您手机上的联系人（地址）数据。恶意应用程序可以用此来删除或修改您的联系人数据." );
	permissions[36]		= Permission( "CLEAR_APP_CACHE", "dangerous", "删除所有应用程序缓存数据", "允许应用程序通过删除应用程序缓存目录中的文件来释放手机存储。访问通常受限于系统进程." );
	permissions[37]		= Permission( "PROCESS_OUTGOING_CALLS", "dangerous", "拦截电话", "允许应用程序拨打电话或者在拨号时更改号码。恶意应用程序可以监视，重定向或阻止呼叫." );
	permissions[38]		= Permission( "EXPAND_STATUS_BAR", "normal", "展开/折叠状态栏", "允许应用程序展开或折叠状态栏。" );
	permissions[39]		= Permission( "ACCESS_CACHE_FILESYSTEM", "signatureOrSystem", "访问缓存文件系统", "允许应用程序读取和写入缓存文件系统。" );
	permissions[40]		= Permission( "MODIFY_PHONE_STATE", "signatureOrSystem", "修改手机状态", "允许应用程序控制设备的功能。拥有该权限的应用程序可以在没有通知您的情况下切换网络，打开或关闭手机上的收音机等。" );
	permissions[41]		= Permission( "WRITE_GSERVICES", "signatureOrSystem", "修改谷歌服务地图", "允许应用程序修改谷歌服务地图。这并不是应用程序常见的必要权限。" );
	permissions[42]		= Permission( "SIGNAL_PERSISTENT_PROCESSES", "dangerous", "发送Linux信号到应用程序", "允许应用程序请求发送信号到所有显示的进程中." );
	permissions[43]		= Permission( "RECEIVE_MMS", "dangerous", "接受MMS", "允许应用程序接收和处理MMS消息。恶意的应用程序可以监视你的消息或在你看到消息之前删除它们." );
	permissions[44]		= Permission( "MOUNT_FORMAT_FILESYSTEMS", "dangerous", "格式化外部存储介质", "允许应用程序格式化可移动存储介质。"  );
	permissions[45]		= Permission( "READ_INPUT_STATE", "signature", "记录你所使用的类型和行为", "允许应用程序在手机与另一个应用程序进行交互时（如输入密码）查看你键入的值。这并不是应用程序常见的必要权限。" );
	permissions[46]		= Permission( "BATTERY_STATS", "normal", "修改电池统计数据", "允许修改电池的统计数据。这并不是应用程序常见的必要权限。" );
	permissions[47]		= Permission( "READ_SYNC_STATS", "normal", "读取同步统计数据", "允许应用程序读取同步统计数据，如：曾经出现过同步的事件信息." );
	permissions[48]		= Permission( "SET_WALLPAPER_HINTS", "normal", "设置壁纸大小提示", "允许应用程序设置系统壁纸大小提示。" );
	permissions[49]		= Permission( "COPY_PROTECTED_DATA", "signature", "允许调用默认的容器服务来复制内容。并不用于常见的应用程序。", "允许调用默认的容器服务来复制内容。并不用于常见的应用程序。" );
	permissions[50]		= Permission( "SET_TIME", "signatureOrSystem", "设置时间", "允许应用程序改变手机的时钟时间。" );
	permissions[51]		= Permission( "AUTHENTICATE_ACCOUNTS", "dangerous", "扮演帐户认证者", "允许应用程序以账户管理者的角色使用账户认证功能，包括创建帐户以及获取和设置他们的密码." );
	permissions[52]		= Permission( "RECEIVE_WAP_PUSH", "dangerous", "接收WAP", "允许应用程序接收和处理WAP消息。恶意的应用程序可以在你不知情的情况下监视你的消息或删除它们." );
	permissions[53]		= Permission( "CHANGE_BACKGROUND_DATA_SETTING", "signature", "改变背景数据的使用设置", "允许应用程序更改背景数据使用设置。" );
	permissions[54]		= Permission( "RESTART_PACKAGES", "normal", "杀死后台进程", "允许应用程序在内存充足的情况下杀死后台的其他应用程序。" );
	permissions[55]		= Permission( "MOUNT_UNMOUNT_FILESYSTEMS", "dangerous", "安装和卸载文件系统", "允许应用程序安装和卸载可移动存储的文件系统." );
	permissions[56]		= Permission( "GLOBAL_SEARCH_CONTROL", "signature", "", "" );
	permissions[57]		= Permission( "SUBSCRIBED_FEEDS_WRITE", "dangerous", "写入订阅内容", "允许应用程序写入您当前同步的订阅内容。这可能允许恶意应用程序更改您的订阅内容。" );
	permissions[58]		= Permission( "STATUS_BAR", "signatureOrSystem", "禁用或修改状态栏", "允许应用程序禁用状态栏或添加和删除系统图标。" );
	permissions[59]		= Permission( "MOVE_PACKAGE", "signatureOrSystem", "移动应用程序资源", "允许应用程序将应用程序资源从内部移动到外部介质，反之亦然。" );
	permissions[60]		= Permission( "MANAGE_APP_TOKENS", "signature", "管理应用程序令牌", "允许应用程序绕过他们共同的Z-ordering创建和管理自己的令牌。这并不是应用程序常见的必要权限。" );
	permissions[61]		= Permission( "ACCESS_WIFI_STATE", "normal", "查看Wi-Fi状态", "允许应用程序查看Wi-Fi状态的信息。" );
	permissions[62]		= Permission( "SET_WALLPAPER_COMPONENT", "signatureOrSystem", "", "" );
	permissions[63]		= Permission( "INTERNET", "dangerous", "充分访问互联网", "允许应用程序创建网络套接字。" );
	permissions[64]		= Permission( "DELETE_PACKAGES", "signatureOrSystem", "删除应用程序", "允许应用程序删除安卓安装包。恶意应用程序可以使用这个来删除重要的应用程序。" );
	permissions[65]		= Permission( "READ_HISTORY_BOOKMARKS", "dangerous", "阅读浏览器的历史和书签", "允许应用程序读取浏览器访问过的所有网址和浏览器里保存的所有书签。" );
	permissions[66]		= Permission( "CHANGE_COMPONENT_ENABLED_STATE", "signatureOrSystem", "启用或禁用应用程序组件", "允许应用程序更改是否启用另一个应用程序的组件。恶意应用程序可以使用这个功能来禁用重要的手机功能。需要格外注意其使用权限，因为它可能使应用程序组件处于无用的、不一致的或不稳定的状态。" );
	permissions[67]		= Permission( "ASEC_DESTROY", "signature", "破坏内部存储", "允许应用程序破坏内部存储。" );
	permissions[68]		= Permission( "ASEC_ACCESS", "signature", "获取内部存储信息", "允许应用程序获取内部存储信息。" );
	permissions[69]		= Permission( "SUBSCRIBED_FEEDS_READ", "normal", "访问订阅内容", "允许应用程序访问当前同步的订阅信息数据库。" );
	permissions[70]		= Permission( "ACCESS_NETWORK_STATE", "normal", "查看网络状态", "允许应用程序查看所有网络的状态。" );
	permissions[71]		= Permission( "RECORD_AUDIO", "dangerous", "音频记录", "允许应用程序访问音频记录路径。" );
	permissions[72]		= Permission( "READ_EXTERNAL_STORAGE", "dangerous", "读取SD卡内容", "允许应用程序读取SD卡。" );
	permissions[73]		= Permission( "ACCESS_MOCK_LOCATION", "dangerous", "测试的模拟位置源", "为测试创建模拟位置源。恶意应用程序可以使用此来覆盖由全球定位系统或网络供应商所提供的实际位置源的位置和状态。" );
	permissions[74]		= Permission( "GLOBAL_SEARCH", "signatureOrSystem", "", "" );
	permissions[75]		= Permission( "WRITE_PROFILE", "dangerous", "写入用户个人资料", "允许应用程序写入（并不是读取）用户的个人资料." );
	permissions[76]		= Permission( "READ_SOCIAL_STREAM", "dangerous", "读取用户的社交数据流", "允许应用程序读取用户的社交数据流。" );
	permissions[77]		= Permission( "VIBRATE", "normal", "控制振动器", "允许应用程序控制振动器。" );
	permissions[78]		= Permission( "DIAGNOSTIC", "signature", "读/写所有的诊断资源", "允许应用程序读取和写入诊断库中的任何资源；例如，files in/dev，这可能会影响系统的稳定性和安全性。这只能用于制造商和运营商对硬件特定的诊断操作。" );
	permissions[79]		= Permission( "ASEC_CREATE", "signature", "创建内部存储", "允许应用程序创建内部存储。" );
	permissions[80]		= Permission( "READ_SYNC_SETTINGS", "normal", "读取同步设置", "允许应用程序读取同步设置，例如是否启用同步联系人." );
	permissions[81]		= Permission( "SEND_SMS_NO_CONFIRMATION", "dangerous", "发送SMS消息", "通过短信应用程序在没有用户输入或确认的情况下发送短信。" );
	permissions[82]		= Permission( "ACCESS_CHECKIN_PROPERTIES", "signatureOrSystem", "访问登录属性", "允许对登记服务上传的属性进行读/写访问。不用于普通的应用程序。");
	permissions[83]		= Permission( "SHUTDOWN", "signature", "部分关闭", "使活动管理器进入关机状态。不执行一个完整的关闭过程." );
	permissions[84]		= Permission( "ACCESS_USB", "signatureOrSystem", "访问USB设备", "允许应用程序访问USB设备." );
	permissions[85]		= Permission( "UPDATE_DEVICE_STATS", "signatureOrSystem", "修改电池统计数据", "允许修改电池的统计数据。不用于常见的应用程序。" );
	permissions[86]		= Permission( "INSTALL_PACKAGES", "signatureOrSystem", "直接安装应用程序", "允许应用程序安装新的或更新的安卓软件包。恶意应用程序可以使用此来添加任意具有强大权限的新应用。" );
	permissions[87]		= Permission( "SET_ORIENTATION", "signature", "更改屏幕方向", "允许应用程序在任何时间旋转屏幕。不用于常见的应用程序。" );
	permissions[88]		= Permission( "STATUS_BAR_SERVICE", "signature", "状态栏", "允许应用程序充当状态栏。" );
	permissions[89]		= Permission( "BIND_INPUT_METHOD", "signature", "绑定输入法", "允许持有者绑定输入方法的顶层接口。不用于常见的应用程序。" );
	permissions[90]		= Permission( "FLASHLIGHT", "normal", "控制闪光灯", "允许应用程序控制手电筒。" );
	permissions[91]		= Permission( "STOP_APP_SWITCHES", "signature", "阻止程序切换", "防止用户切换到另一个应用程序。" );
	permissions[92]		= Permission( "CHANGE_WIFI_STATE", "dangerous", "改变Wi-Fi状态", "允许应用程序从Wi-Fi接入点连接和断开，并更改Wi-Fi网络的配置。" );
	permissions[93]		= Permission( "BROADCAST_STICKY", "normal", "发送滞留广播", "允许应用程序在广播结束后继续发送广播消息。恶意应用程序可以使手机缓慢或不稳定，使其使用过多的内存。" );
	permissions[94]		= Permission( "WRITE_SMS", "dangerous", "编辑SMS或MMS", "允许应用程序记录在您手机或SIM卡上存储的短信。恶意应用程序可以删除您的消息。" );
	permissions[95]		= Permission( "FORCE_STOP_PACKAGES", "signature", "强制终止其他应用程序", "允许应用程序强制停止其他应用程序。" );
	permissions[96]		= Permission( "KILL_BACKGROUND_PROCESSES", "normal", "杀死后台进程", "允许应用程序在内存充足的情况下杀死后台的其他应用程序。" );
	permissions[97]		= Permission( "SET_PROCESS_LIMIT", "dangerous", "限制运行进程的数量", "允许应用程序来控制运行的最大进程数，不用于常见的应用程序。" );
	permissions[98]		= Permission( "SET_TIME_ZONE", "dangerous", "设置时区", "允许应用程序改变电话的时区。" );
	permissions[99]		= Permission( "BLUETOOTH_ADMIN", "dangerous", "蓝牙管理", "允许应用程序配置本地蓝牙电话，并发现和配对远程设备。" );
	permissions[100]	= Permission( "INJECT_EVENTS", "signature", "按键和控制按钮", "允许应用程序将自身的输入事件（按键等）传递给其他应用程序。恶意应用程序可以借此接管手机。" );
	permissions[101]	= Permission( "PERSISTENT_ACTIVITY", "dangerous", "使应用程序保持运行态", "允许应用程序使其某部分持续运行，因此系统不能将它用于其他应用程序." );
	permissions[102]	= Permission( "CAMERA", "dangerous", "拍照片和视频", "允许应用程序与相机拍照和视频。这允许应用程序收集相机任何时间拍摄的图像。" );
	permissions[103]	= Permission( "READ_FRAME_BUFFER", "signature", "读取帧缓冲区", "允许应用程序读取帧缓冲区的内容。" );
	permissions[104]	= Permission( "SET_WALLPAPER", "normal", "设置壁纸", "允许应用程序设置系统壁纸。" );
	permissions[105]	= Permission( "WAKE_LOCK", "dangerous", "阻止手机进入休眠态", "允许应用程序阻止手机进入休眠态。" );
	permissions[106]	= Permission( "MANAGE_ACCOUNTS", "dangerous", "管理账户列表", "允许应用程序执行操作，如添加和删除帐户，并删除它们的密码." );
	permissions[107]	= Permission( "WRITE_CALENDAR", "dangerous", "添加或修改日历事件或给客户发送电子邮件", "允许应用程序添加或更改您日历上的事件，同时它可以发送电子邮件给客人。恶意应用程序可以使用此来删除或修改您的日历事件或发送电子邮件给客人。" );
	permissions[108]	= Permission( "WRITE_HISTORY_BOOKMARKS", "dangerous", "写入浏览器的历史和书签", "允许应用程序修改浏览器访问过的所有网址和浏览器里保存的所有书签。恶意应用程序可以使用此来清除或修改您的浏览器的数据。" );
	permissions[109]	= Permission( "INTERNAL_SYSTEM_WINDOW", "signature", "显示未授权的windows", "允许创建用于内部系统用户界面的窗口。不用于常见的应用程序。" );
	permissions[110]	= Permission( "FORCE_BACK", "signature", "迫使应用程序关闭", "允许应用程序强制结束任何前台的活动并返回。不是应用程序必要的基本权限." );
	permissions[111]	= Permission( "ASEC_MOUNT_UNMOUNT", "signature", "安装/卸载的内部存储", "允许应用程序安装/卸载的内部存储。" );
	permissions[112]	= Permission( "SET_PREFERRED_APPLICATIONS", "signature", "设置默认应用", "允许应用程序来修改您的默认应用程序。这可以使恶意应用默默地改变正在运行的应用程序，欺骗你的现有应用程序来收集您的私人数据。" );
	permissions[113]	= Permission( "NFC", "dangerous", "NFC控制", "允许应用程序与NFC标签，卡和读卡器通信." );
	permissions[114]	= Permission( "CHANGE_NETWORK_STATE", "dangerous", "改变网络连接", "允许应用程序改变网络连接状态。" );
	permissions[115]	= Permission( "CALL_PHONE", "dangerous", "直接拨打电话号码", "允许应用程序直接拨打电话号码。恶意应用程序可能会在你的电话帐单出现意想不到的通话信息。请注意，这不允许应用程序调用紧急号码。" );
	permissions[116]	= Permission( "WRITE_SYNC_SETTINGS", "dangerous", "写入同步设置", "允许一个应用程序来修改同步设置，例如是否启用了联系人." );
	permissions[117]	= Permission( "ACCOUNT_MANAGER", "signature", "账户管理服务", "允许应用程序调用账户认证" );
	permissions[118]	= Permission( "SET_ANIMATION_SCALE", "dangerous", "修改全局动画速度", "允许应用程序在任何时间更改全局动画速度（更快或更慢的动画）。" );
	permissions[119]	= Permission( "ACCESS_FINE_LOCATION", "dangerous", "精良 (GPS) 定位", "在可用的环境中访问精细定位源，如手机上的全球定位系统。恶意应用程序可以使用这个来确定你在哪里，同时可能会消耗更多的电池电量。" );
	permissions[120]	= Permission( "BRICK", "signature", "永久禁用手机", "允许应用程序永久地禁用整个手机，这是很危险的." );
	permissions[121]	= Permission( "CALL_PRIVILEGED", "signatureOrSystem", "直接拨打任何电话号码", "允许应用程序在无人介入的情况下拨打任何电话号码，包括紧急号码。恶意应用程序可能会造成不必要的和非法的紧急呼叫服务。" );
	permissions[122]	= Permission( "READ_SMS", "dangerous", "读取SMS 或MMS", "允许应用程序读取存储在您的手机或SIM卡上的短信。恶意应用程序可以读取您的机密信息。" );
	permissions[123]	= Permission( "PACKAGE_USAGE_STATS", "signature", "更新组件使用统计数据", "允许修改所收集的组件使用数据。不用于普通应用程序。" );
	permissions[124]	= Permission( "RECEIVE_SMS", "dangerous", "接收SMS", "允许应用程序接收和处理短信。恶意的应用程序可以监视或删除你的信息，而不显示给你。" );
	permissions[125]	= Permission( "CLEAR_APP_USER_DATA", "signature", "删除其他应用程序的数据", "允许应用程序清除用户数据。" );
	permissions[126]	= Permission( "GET_TASKS", "dangerous", "检索正在运行的应用程序", "允许应用程序检索当前和最近运行的任务信息。可能允许恶意应用程序发现其他应用程序的私人信息。" );
	permissions[127]	= Permission( "DELETE_CACHE_FILES", "signatureOrSystem", "删除其他应用程序的缓存", "允许应用程序删除缓存文件。" );
	permissions[128]	= Permission( "WRITE_EXTERNAL_STORAGE", "dangerous", "读/修改/删除SD卡内容", "允许应用程序向SD卡进行写入操作。" );
	permissions[129]	= Permission( "DISABLE_KEYGUARD", "dangerous", "禁用键盘锁", "允许应用程序禁用键盘锁和任何与之相关的密码安全。" );
	permissions[130]	= Permission( "BROADCAST_PACKAGE_REMOVED", "signature", "发送已删除数据包的广播", "允许应用程序广播通知一个应用程序包已被删除。恶意应用程序可以凭此权限杀死其他正在运行的应用程序。" );
	permissions[131]	= Permission( "REBOOT", "signatureOrSystem", "强制手机重启", "允许应用程序强制使手机重新启动。" );
	permissions[132]	= Permission( "BLUETOOTH", "dangerous", "建立蓝牙连接", "允许应用程序查看本地蓝牙电话的配置，并与配对设备进行连接或接受其他配对设备的连接请求。" );
	permissions[133]	= Permission( "SET_DEBUG_APP", "dangerous", "启用应用程序调试", "允许应用程序打开另一个应用程序的调试程序。恶意应用程序可以凭此权限杀死其他应用程序。" );
	permissions[134]	= Permission( "INSTALL_LOCATION_PROVIDER", "signatureOrSystem", "安装位置提供程序的权限", "创建模拟位置源作测试。恶意应用程序可以凭此权限来覆盖由真实位置源（如GPS和网络供应商）返回的位置和状态，或监控您的位置并将之报告到外部源。" );
	permissions[135]	= Permission( "C2D_MESSAGE", "signature", "允许云推送设备信息", "允许应用程序接收云推送通知" );
	permissions[136]	= Permission( "REORDER_TASKS", "dangerous", "为正在运行的应用程序重新排序", "允许应用程序将任务移动到前台和后台。恶意应用程序可以强行在你的控制之外将自己移到前台。" );
	permissions[137]	= Permission( "READ_CONTACTS", "dangerous", "读取联系人数据", "允许应用程序读取存储在您手机上的所有联系人（地址）数据。恶意应用程序可凭此权限将数据发送给其他人。" );
	permissions[138]	= Permission( "MODIFY_AUDIO_SETTINGS", "dangerous", "更改您的音频设置", "允许应用程序修改全局音频设置，如音量和路由。" );
	permissions[139]	= Permission( "READ_PHONE_STATE", "dangerous", "读取电话状态和身份", "允许应用程序访问该设备的电话功能。具有该权限的应用程序可以确定设备的电话号码和序列号、呼叫是否在通话状态、呼叫连接的电话号码等。" );
	permissions[140]	= Permission( "BACKUP", "signatureOrSystem", "控制系统的备份和恢复", "允许应用程序控制系统的备份和恢复机制。不用于一般应用程序。" );
	permissions[141]	= Permission( "READ_USER_DICTIONARY", "dangerous", "读取用户定义的字典", "允许应用程序读取存储在用户字典中的任何私有单词、名称和短语。" );
	permissions[142]	= Permission( "BROADCAST_SMS", "signature", "发送已收到短信的广播", "允许应用程序广播通知已收到某条短信。恶意应用程序可以凭此权限伪造传入的短信。" );
	permissions[143]	= Permission( "BIND_APPWIDGET", "signatureOrSystem", "选择widgets窗口小部件", "允许应用程序告知系统哪个应用程序可以使用哪个窗口小部件。用这个权限，应用程序可以提供访问个人数据到其他应用程序的权限。不用于一般应用程序" );
}


Permission* Manifest_Permissions::search( std::string name )
{
	Permission * search_p = NULL;
	for ( int i = 0; i < MANI_PERMISSIONS_SUM; i++ )
	{
		if ( permissions[i].Permission_Name == name )
		{
			;
			search_p = &permissions[i];
			return(search_p);
		}
	}
	return(search_p);
}


Manifest_Permission_Group::Manifest_Permission_Group()
{
	permissions[0]	= Permission( "NETWORK", "", "", "用于提供访问网络服务的权限" );
	permissions[1]	= Permission( "DEVELOPMENT_TOOLS", "", "", "与开发功能相关的权限组" );
	permissions[2]	= Permission( "STORAGE", "", "", "与SD卡访问相关的权限组" );
	permissions[3]	= Permission( "PERSONAL_INFO", "", "", "用于提供访问用户的私人数据的权限，如联系人、日历事件、电子邮件等" );
	permissions[4]	= Permission( "ACCOUNTS", "", "", "对由帐户管理器管理的帐户的直接访问权限" );
	permissions[5]	= Permission( "SYSTEM_TOOLS", "", "", "与系统API相关的权限组" );
	permissions[6]	= Permission( "COST_MONEY", "", "", "用于能使用户花钱而不直接参与的权限" );
	permissions[7]	= Permission( "PHONE_CALLS", "", "", "用于与访问和修改电话状态有关的权限，如拦截呼出、读取和修改手机状态" );
	permissions[8]	= Permission( "MESSAGES", "", "", "用于允许一个应用程序以用户身份发送消息或拦截用户即将收到的消息的权限" );
	permissions[9]	= Permission( "LOCATION", "", "", "用于允许访问用户当前位置的权限" );
	permissions[10] = Permission( "HARDWARE_CONTROLS", "", "", "用于提供对设备上硬件的直接访问权限" );
}


Permission* Manifest_Permission_Group::search( std::string name )
{
	Permission * search_p = NULL;
	for ( int i = 0; i < MANI_GROUP_PERMISSIONS_SUM; i++ )
	{
		if ( permissions[i].Permission_Name == name )
		{
			search_p = &permissions[i];
			return(search_p);
		}
	}
	return(search_p);
}