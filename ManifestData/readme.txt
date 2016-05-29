模块功能：

将GetManifest模块解析好的manifest.xml进行分析，获取apk的基本信息，保存在如下全局变量中：
+ extern string minsdk;
+ extern string maxsdk;
+ extern string targetsdk;
+ extern string package;
+ extern string androidversioncode;
+ extern string androidversionname;
+ extern string activity_list[1024];
+ extern string mainact;
+ extern string service_list[1024];
+ extern string provider_list[1024];
+ extern string receiver_list[1024];
+ extern string library_list[1024];
+ extern Permission dvm_permission_list[MANI_PERMISSIONS_SUM];

**********************

文件结构：

dvm_permissions.h     C++头文件/* 定义了保存dvm权限的结构体 */
dvm_permissions.cpp   C++源文件/* 保存了114个MANI_PERMISSION，11个MANI_GROUP_PERMISSION */

----------------------

manifestdata.h        C++头文件/* 定义了全局变量和各种方法 */
manifestdata.cpp      C++源文件

----------------------

test.cpp              C++源文件
test                  可执行文件

**********************

编译环境：

Ubuntu 16.04LTS
g++ 5.3.1

**********************

编译方法：

终端下输入g++ test.cpp ../utils/tinyxml/tinyxml.cpp ../utils/tinyxml/tinystr.cpp ../utils/tinyxml/tinyxmlparser.cpp ../utils/tinyxml/tinyxmlerror.cpp ../utils/tinyxml/xmlanalysis.cpp dvm_permissions.cpp manifestdata.cpp -o test

**********************

运行：

终端下输入：./test
最终结果：将基本数据保存到全局变量中
测试输出：
minsdk=14
maxsdk=
targetsdk=22
package=com.dumplingsandwich.pencilsketch
androidversioncode=40
androidversionname=5.0
mainact=com.dumplingsandwich.pencilsketch.activities.SplashScreenActivity
activity_list[0]=com.dumplingsandwich.pencilsketch.activities.SplashScreenActivity
activity_list[1]=com.dumplingsandwich.pencilsketch.activities.ImagePreprocessActivity
activity_list[2]=com.dumplingsandwich.pencilsketch.activities.MainActivity
activity_list[3]=com.dumplingsandwich.pencilsketch.activities.ImageEditingActivity
activity_list[4]=com.dumplingsandwich.pencilsketch.activities.InfoActivity
activity_list[5]=com.dumplingsandwich.pencilsketch.activities.AppRecommendationActivity
activity_list[6]=com.dumplingsandwich.pencilsketch.activities.PhotoFrameActivity
activity_list[7]=com.dumplingsandwich.pencilsketch.activities.DumplingSandwichAppsActivity
activity_list[8]=com.dumplingsandwich.pencilsketch.activities.CanvasActivity
activity_list[9]=com.google.android.gms.ads.AdActivity
activity_list[10]=com.facebook.ads.InterstitialAdActivity
activity_list[11]=com.google.android.gms.ads.purchase.InAppPurchaseActivity
activity_list[12]=com.adobe.creativesdk.aviary.AdobeImageEditorActivity
activity_list[13]=com.adobe.creativesdk.foundation.internal.auth.AdobeAuthSignInActivity
activity_list[14]=com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetOneUpViewerActivity
activity_list[15]=com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXPhotoAssetOneUpViewerActivity
activity_list[16]=com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUxAssetBrowserV2Activity
activity_list[17]=com.adobe.cc.PushNotification.AdobeNotificationHandlerActivity
activity_list[18]=com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetVideoActivity
activity_list[19]=com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXLibraryItemCollectionOneUpViewerActivity
activity_list[20]=com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXMobilePackageItemOneUpViewerActivity
activity_list[21]=com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXCompositionOneUpViewerActivity
activity_list[22]=com.adobe.creativesdk.foundation.internal.storage.controllers.edit.AdobeAssetEditActivity
activity_list[23]=com.adobe.creativesdk.foundation.internal.storage.controllers.comments.AdobeAssetViewCommentsActivity
activity_list[24]=com.adobe.creativesdk.foundation.internal.storage.utils.CopyToClipboardActivity
activity_list[25]=com.behance.sdk.ui.activities.BehanceSDKPublishProjectActivity
activity_list[26]=com.behance.sdk.ui.activities.BehanceSDKCreateProjectWFActivity
activity_list[27]=com.behance.sdk.ui.activities.BehanceSDKCreateWIPWorkflowActivity
activity_list[28]=com.behance.sdk.ui.activities.BehanceSDKPublishWIPActivity
activity_list[29]=com.behance.sdk.ui.activities.BehanceSDKPublishResultsActivity
activity_list[30]=com.behance.sdk.ui.activities.BehanceSDKEditProfileActivity
activity_list[31]=com.facebook.LoginActivity
activity_list[32]=com.behance.sdk.ui.activities.BehanceSDKLoginToTwitterActivity
activity_list[33]=com.behance.sdk.ui.activities.BehanceSDKUnlinkSocialAccountActivity
activity_list[34]=com.behance.sdk.ui.activities.BehanceSDKAdobeCloudSelectionActivity
activity_list[35]=com.behance.sdk.ui.activities.BehanceSDKCCLauncherActivity
service_list[0]=com.adobe.creativesdk.aviary.internal.cds.CdsService
service_list[1]=com.adobe.creativesdk.aviary.internal.cds.CdsAssetsDownloaderService
service_list[2]=com.adobe.creativesdk.aviary.AdobeImageBillingService
service_list[3]=com.behance.sdk.services.BehanceSDKPublishProjectService
service_list[4]=com.behance.sdk.services.BehanceSDKPublishWIPService
provider_list[0]=com.adobe.creativesdk.aviary.internal.cds.CdsProvider
receiver_list[0]=com.adobe.creativesdk.aviary.internal.cds.CdsReceiver
permission_list[0]=INTERNET
Description:允许应用程序创建网络套接字。
-----------------------------------
permission_list[1]=WRITE_EXTERNAL_STORAGE
Description:允许应用程序向SD卡进行写入操作。
-----------------------------------
permission_list[2]=ACCESS_NETWORK_STATE
Description:允许应用程序查看所有网络的状态。
-----------------------------------
permission_list[3]=VIBRATE
Description:允许应用程序控制振动器。
-----------------------------------
permission_list[4]=READ_EXTERNAL_STORAGE
Description:允许应用程序读取SD卡。
-----------------------------------
permission_list[5]=BILLING
Description:Unknown permission from android reference
-----------------------------------
permission_list[6]=BROADCAST_STICKY
Description:允许应用程序在广播结束后继续发送广播消息。恶意应用程序可以使手机缓慢或不稳定，使其使用过多的内存。
-----------------------------------
permission_list[7]=SEND_DOWNLOAD_COMPLETED_INTENTS
Description:Unknown permission from android reference
-----------------------------------
permission_list[8]=ACCESS_WIFI_STATE
Description:允许应用程序查看Wi-Fi状态的信息。
-----------------------------------

