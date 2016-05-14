模块功能：

在上一模块——GetManifest分析的基础上，对manifest.xml进一步分析，获取Activity,Provider,Receiver,Service
等项目的异常部分，保存在如下全局变量中：
/*使用到了上一模块中获取到的mainact变量值，为了方便起见，直接将值作为参数传递*/

+ extern Manifest_Anal	RET[128];
+ extern std::string	EXPORTED[128];
+ extern Exported_Count	exp_count;

**********************

文件结构：

----------------------

manifestanalysis.h        C++头文件/* 定义了全局变量和各种方法 */
manifestanalysis.cpp      C++源文件

----------------------

xmlanalysis.h             C++头文件/* 封装了xml分析的方法 */
xmlanalysis.cpp           C++源文件

----------------------
tinyxml.h            +
tinystr.h            +
tinystr.cpp          +------>TinyXml库，用来解析xml文件
tinyxml.cpp          +
tinyxmlerror.cpp     +
tinyxmlparser.cpp    +
----------------------

test.cpp              C++源文件

----------------------

manifest.xml          GetManifest模块解析好的xml文件

----------------------

test                  可执行文件

**********************

编译环境：

Ubuntu 16.04LTS
g++ 5.3.1

**********************

编译方法：

终端下输入g++ test.cpp tinyxml.cpp tinystr.cpp tinyxmlparser.cpp tinyxmlerror.cpp xmlanalysis.cpp manifestanalysis.cpp -o test

**********************

运行：

终端下输入：./test
最终结果：将基本数据保存到全局变量中
测试输出：
----------Manifest Analysis EXPORTED_COUNT------------
Activity_Count: 22
Provider_Count: 0
Receiver_Count: 0
Service_Count: 3

-------------Manifest Analysis EXPORTED---------------
EXPORTED[0]: .activity.ShortcutGuideActivity
EXPORTED[1]: .activity.JumpActivity
EXPORTED[2]: .activity.ContactSyncJumpActivity
EXPORTED[3]: .activity.qfileJumpActivity
EXPORTED[4]: com.tencent.open.agent.AgentActivity
EXPORTED[5]: com.tencent.open.agent.EncryTokenActivity
EXPORTED[6]: com.tencent.qqconnect.wtlogin.AuthDevUgActivity2
EXPORTED[7]: .activity.VerifyCodeActivity2
EXPORTED[8]: cooperation.qlink.QlinkShareJumpActivity
EXPORTED[9]: cooperation.qqfav.widget.QfavJumpActivity
EXPORTED[10]: com.tencent.mobileqq.wxapi.WXEntryActivity
EXPORTED[11]: cooperation.qwallet.open.AppPayActivity
EXPORTED[12]: com.tencent.mobileqq.wxapi.WXPayEntryActivity

---------------Manifest Analysis RET------------------
ManifestAnal[0]
Issue: Service (com.tencent.mobileqq.msf.service.MsfService) is not Protected. [android:exported=true]
Severity: high
Description: A service was found to be shared with other apps on the device without an intent filter or a permission requirement therefore leaving it accessible to any other application on the device.

ManifestAnal[1]
Issue: Service (com.tencent.mobileqq.contactsync.authenticator.AuthenticationService) is not Protected. [android:exported=true]
Severity: high
Description: A service was found to be shared with other apps on the device without an intent filter or a permission requirement therefore leaving it accessible to any other application on the device.

ManifestAnal[2]
Issue: Service (com.tencent.mobileqq.contactsync.syncadapter.SyncService) is not Protected. [android:exported=true]
Severity: high
Description: A service was found to be shared with other apps on the device without an intent filter or a permission requirement therefore leaving it accessible to any other application on the device.

ManifestAnal[3]
Issue: com.tencent.mobileqq.msf.service.MsfService( service )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The com.tencent.mobileqq.msf.service.MsfService was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the com.tencent.mobileqq.msf.service.MsfService is explicitly exported.

ManifestAnal[4]
Issue: com.tencent.mobileqq.msf.core.NetConnInfoCenter( receiver )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The com.tencent.mobileqq.msf.core.NetConnInfoCenter was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the com.tencent.mobileqq.msf.core.NetConnInfoCenter is explicitly exported.

ManifestAnal[5]
Issue: mqq.app.QQBroadcastReceiver( receiver )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The mqq.app.QQBroadcastReceiver was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the mqq.app.QQBroadcastReceiver is explicitly exported.

ManifestAnal[6]
Issue: Launch Mode of Activity (com.tencent.mobileqq.debug.DebugActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[7]
Issue: Launch Mode of Activity (com.tencent.mobileqq.debug.PstnCardTestActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[8]
Issue: Launch Mode of Activity (com.tencent.mobileqq.debug.RedTestActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[9]
Issue: Launch Mode of Activity (com.tencent.mobileqq.debug.MsgSearchSwitchActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[10]
Issue: Launch Mode of Activity (com.tencent.mobileqq.debug.ProcessStatsDebugActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[11]
Issue: Launch Mode of Activity (com.tencent.mobileqq.debug.RedTestInfoActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[12]
Issue: Launch Mode of Activity (.activity.QuickLoginActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[13]
Issue: Launch Mode of Activity (com.tencent.mobileqq.redtouch.NumRedMsgTestActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[14]
Issue: Launch Mode of Activity (.activity.UserguideActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[15]
Issue: Launch Mode of Activity (.activity.ShortcutGuideActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[16]
Issue: activity (.activity.ShortcutGuideActivity) is not Protected. [android:exported=true]
Severity: high
Description: The .activity.ShortcutGuideActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.

ManifestAnal[17]
Issue: Launch Mode of Activity (.activity.JoinDiscussionActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[18]
Issue: Launch Mode of Activity (.activity.VerifyCodeActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[19]
Issue: provider (com.tencent.mobileqq.openapi.OpenApiProvider) is not Protected. [android:exported=true]
Severity: high
Description: The com.tencent.mobileqq.openapi.OpenApiProvider was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.

ManifestAnal[20]
Issue: Launch Mode of Activity (.activity.DevlockQuickLoginActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[21]
Issue: Launch Mode of Activity (.activity.PCActiveNoticeActiviy) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[22]
Issue: Launch Mode of Activity (.activity.OverloadTipsActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[23]
Issue: Launch Mode of Activity (.activity.NotificationActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[24]
Issue: Launch Mode of Activity (.activity.NotifyPCActiveActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[25]
Issue: Launch Mode of Activity (com.tencent.av.ui.GVideoQQBrowserActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[26]
Issue: .activity.JumpActivity( activity )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The .activity.JumpActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the .activity.JumpActivity is explicitly exported.

ManifestAnal[27]
Issue: Launch Mode of Activity (.activity.ContactSyncJumpActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[28]
Issue: activity (.activity.ContactSyncJumpActivity) is not Protected. [android:exported=true]
Severity: high
Description: The .activity.ContactSyncJumpActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.

ManifestAnal[29]
Issue: com.tencent.mobileqq.contactsync.authenticator.AuthenticationService( service )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The com.tencent.mobileqq.contactsync.authenticator.AuthenticationService was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the com.tencent.mobileqq.contactsync.authenticator.AuthenticationService is explicitly exported.

ManifestAnal[30]
Issue: com.tencent.mobileqq.contactsync.syncadapter.SyncService( service )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The com.tencent.mobileqq.contactsync.syncadapter.SyncService was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the com.tencent.mobileqq.contactsync.syncadapter.SyncService is explicitly exported.

ManifestAnal[31]
Issue: activity (.activity.qfileJumpActivity) is not Protected. [android:exported=true]
Severity: high
Description: The .activity.qfileJumpActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.

ManifestAnal[32]
Issue: Launch Mode of Activity (com.tencent.av.ui.VideoInviteFull) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[33]
Issue: Launch Mode of Activity (com.tencent.av.ui.VideoInviteLock) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[34]
Issue: Launch Mode of Activity (com.tencent.av.ui.MultiVideoMembersListviewAvtivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[35]
Issue: Launch Mode of Activity (com.tencent.av.ui.MultiVideoEnterPageActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[36]
Issue: Launch Mode of Activity (com.tencent.av.gaudio.DoubleVideoGuideActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[37]
Issue: Launch Mode of Activity (com.tencent.av.ui.AVActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[38]
Issue: Launch Mode of Activity (cooperation.c2b.C2BUploadImageActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[39]
Issue: Launch Mode of Activity (cooperation.c2b.C2BTakePhotoActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[40]
Issue: Launch Mode of Activity (cooperation.c2b.C2BVideoPreviewActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[41]
Issue: Launch Mode of Activity (com.tencent.av.random.ui.RandomMultiActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[42]
Issue: Launch Mode of Activity (com.tencent.av.random.ui.RandomDoubleActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[43]
Issue: Launch Mode of Activity (com.tencent.av.utils.PopupDialog) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[44]
Issue: Launch Mode of Activity (com.tencent.av.utils.PopupDialogQQSide) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[45]
Issue: Launch Mode of Activity (com.tencent.av.guild.GuildMultiActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[46]
Issue: TaskAffinity is set for Activity (com.tencent.av.ui.VChatActivity)
Severity: high
Description: If taskAffinity is set, then other application could read the Intents sent to Activities belonging to another task. Always use the default setting keeping the affinity as the package name in order to prevent sensitive information inside sent or received Intents from being read by another application.

ManifestAnal[47]
Issue: Launch Mode of Activity (com.tencent.av.gaudio.GaInviteDialogActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[48]
Issue: Launch Mode of Activity (com.tencent.av.gaudio.GaInviteLockActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[49]
Issue: Launch Mode of Activity (com.tencent.av.gaudio.GaActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[50]
Issue: Launch Mode of Activity (com.tencent.av.ui.MultiPstnCallbackFinishDialogActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[51]
Issue: Launch Mode of Activity (com.tencent.mobileqq.troop.activity.NearbyTroopsActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[52]
Issue: Launch Mode of Activity (com.tencent.mobileqq.troop.activity.NearbyTroopsLocationActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[53]
Issue: TaskAffinity is set for Activity (com.tencent.securemodule.ui.TransparentActivity)
Severity: high
Description: If taskAffinity is set, then other application could read the Intents sent to Activities belonging to another task. Always use the default setting keeping the affinity as the package name in order to prevent sensitive information inside sent or received Intents from being read by another application.

ManifestAnal[54]
Issue: Launch Mode of Activity (cooperation.qzone.QzoneFeedsPluginProxyActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[55]
Issue: com.tencent.mobileqq.service.contactsync.ContactSyncPluginProxyService( service )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The com.tencent.mobileqq.service.contactsync.ContactSyncPluginProxyService was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the com.tencent.mobileqq.service.contactsync.ContactSyncPluginProxyService is explicitly exported.

ManifestAnal[56]
Issue: Launch Mode of Activity (cooperation.qzone.CrashNotificationActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[57]
Issue: activity (com.tencent.open.agent.AgentActivity) is not Protected. [android:exported=true]
Severity: high
Description: The com.tencent.open.agent.AgentActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.

ManifestAnal[58]
Issue: activity (com.tencent.open.agent.EncryTokenActivity) is not Protected. [android:exported=true]
Severity: high
Description: The com.tencent.open.agent.EncryTokenActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.

ManifestAnal[59]
Issue: TaskAffinity is set for Activity (com.tencent.qqconnect.wtlogin.AuthDevUgActivity2)
Severity: high
Description: If taskAffinity is set, then other application could read the Intents sent to Activities belonging to another task. Always use the default setting keeping the affinity as the package name in order to prevent sensitive information inside sent or received Intents from being read by another application.

ManifestAnal[60]
Issue: com.tencent.qqconnect.wtlogin.AuthDevUgActivity2( activity )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The com.tencent.qqconnect.wtlogin.AuthDevUgActivity2 was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the com.tencent.qqconnect.wtlogin.AuthDevUgActivity2 is explicitly exported.

ManifestAnal[61]
Issue: TaskAffinity is set for Activity (.activity.VerifyCodeActivity2)
Severity: high
Description: If taskAffinity is set, then other application could read the Intents sent to Activities belonging to another task. Always use the default setting keeping the affinity as the package name in order to prevent sensitive information inside sent or received Intents from being read by another application.

ManifestAnal[62]
Issue: .activity.VerifyCodeActivity2( activity )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The .activity.VerifyCodeActivity2 was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the .activity.VerifyCodeActivity2 is explicitly exported.

ManifestAnal[63]
Issue: Launch Mode of Activity (com.tencent.biz.huangye.QQYPQRCodePreviewActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[64]
Issue: Launch Mode of Activity (com.dataline.activities.LiteActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[65]
Issue: Launch Mode of Activity (com.dataline.activities.PrinterActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[66]
Issue: Launch Mode of Activity (com.dataline.activities.DLRouterActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[67]
Issue: Launch Mode of Activity (com.tencent.smtt.sdk.VideoActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[68]
Issue: cooperation.qlink.QlinkShareJumpActivity( activity )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The cooperation.qlink.QlinkShareJumpActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the cooperation.qlink.QlinkShareJumpActivity is explicitly exported.

ManifestAnal[69]
Issue: Launch Mode of Activity (cooperation.qlink.QlinkDialogActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[70]
Issue: activity (cooperation.qqfav.widget.QfavJumpActivity) is not Protected. [android:exported=true]
Severity: high
Description: The cooperation.qqfav.widget.QfavJumpActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.

ManifestAnal[71]
Issue: cooperation.qqreader.QRAioCmdReceiver( receiver )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The cooperation.qqreader.QRAioCmdReceiver was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the cooperation.qqreader.QRAioCmdReceiver is explicitly exported.

ManifestAnal[72]
Issue: TaskAffinity is set for Activity (com.tencent.biz.webviewbase.WebViewJumpAction)
Severity: high
Description: If taskAffinity is set, then other application could read the Intents sent to Activities belonging to another task. Always use the default setting keeping the affinity as the package name in order to prevent sensitive information inside sent or received Intents from being read by another application.

ManifestAnal[73]
Issue: activity (com.tencent.mobileqq.wxapi.WXEntryActivity) is not Protected. [android:exported=true]
Severity: high
Description: The com.tencent.mobileqq.wxapi.WXEntryActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.

ManifestAnal[74]
Issue: Launch Mode of Activity (com.dataline.activities.LiteWifiphotoActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[75]
Issue: Launch Mode of Activity (cooperation.qwallet.plugin.proxy.BuscardLoadNFCProxyActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[76]
Issue: activity (cooperation.qwallet.open.AppPayActivity) is not Protected. [android:exported=true]
Severity: high
Description: The cooperation.qwallet.open.AppPayActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.

ManifestAnal[77]
Issue: Launch Mode of Activity (cooperation.qwallet.virtual.QChongLotteryBrowser) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[78]
Issue: activity (com.tencent.mobileqq.wxapi.WXPayEntryActivity) is not Protected. [android:exported=true]
Severity: high
Description: The com.tencent.mobileqq.wxapi.WXPayEntryActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.

ManifestAnal[79]
Issue: Launch Mode of Activity (cooperation.buscard.BuscardPluginInstallActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[80]
Issue: Launch Mode of Activity (cooperation.pluginbridge.BridgePluginInstallActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[81]
Issue: cooperation.qqwifi.QQWiFiAutoJumpService( service )is not Protected.<br>An intent-filter exists.
Severity: high
Description: The cooperation.qqwifi.QQWiFiAutoJumpService was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the cooperation.qqwifi.QQWiFiAutoJumpService is explicitly exported.

ManifestAnal[82]
Issue: Launch Mode of Activity (cooperation.qqwifi.QQWiFiConnectProxyActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[83]
Issue: Launch Mode of Activity (cooperation.qqwifi.QQWiFiPluginInstallActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[84]
Issue: Launch Mode of Activity (.vas.AvatarPendantMarketActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[85]
Issue: Launch Mode of Activity (com.tencent.mobileqq.dating.DatingFeedActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[86]
Issue: Launch Mode of Activity (com.tencent.device.msg.activities.DeviceMsgSettingActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[87]
Issue: Launch Mode of Activity (com.tencent.device.msg.activities.DeviceTipActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[88]
Issue: Launch Mode of Activity (cooperation.readinjoy.ReadInJoyPluginInstallActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[89]
Issue: Launch Mode of Activity (com.sixgod.pluginsdk.LauncherActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[90]
Issue: Launch Mode of Activity (com.tencent.av.ui.CallbackWaitingActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[91]
Issue: Launch Mode of Activity (com.tencent.av.ui.CallbackWaitingActivityExt) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[92]
Issue: Launch Mode of Activity (com.tencent.av.ui.PSTNC2CActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[93]
Issue: Launch Mode of Activity (cooperation.groupvideo.GVideoProxyActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[94]
Issue: Launch Mode of Activity (cooperation.groupvideo.GVideoMemberProxyActivity) is not standard.
Severity: high
Description: An Activity should not be having the launch mode attribute set to "singleTask/singleInstance" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the "standard" launch mode attribute when sensitive information is included in an Intent.

ManifestAnal[95]
Issue: High Intent Priority (2147483647) [android:priority]
Severity: medium
Description: By setting an intent priority higher than another intent, the app effectively overrides other requests.

