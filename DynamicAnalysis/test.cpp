#include <iostream>
#include <string>
#include <fstream>
#include <pthread.h>
#include <unistd.h>
#include "dynamicanalysis.h"
using namespace std;

/*为了方便起见，不和前面ManifestData模块和ManifestAnalysis模块的联动，
暂时使用数组代替这两个静态分析模块的分析结果*/
string activity_list[36];
string EXPORTED[3];
void prepare_activity()/*填充数据*/
{
	activity_list[0]="com.dumplingsandwich.pencilsketch.activities.SplashScreenActivity";
	activity_list[1]="com.dumplingsandwich.pencilsketch.activities.ImagePreprocessActivity";
	activity_list[2]="com.dumplingsandwich.pencilsketch.activities.MainActivity";
	activity_list[3]="com.dumplingsandwich.pencilsketch.activities.ImageEditingActivity";
	activity_list[4]="com.dumplingsandwich.pencilsketch.activities.InfoActivity";
	activity_list[5]="com.dumplingsandwich.pencilsketch.activities.AppRecommendationActivity";
	activity_list[6]="com.dumplingsandwich.pencilsketch.activities.PhotoFrameActivity";
	activity_list[7]="com.dumplingsandwich.pencilsketch.activities.DumplingSandwichAppsActivity";
	activity_list[8]="com.dumplingsandwich.pencilsketch.activities.CanvasActivity";
	activity_list[9]="com.google.android.gms.ads.AdActivity";
	activity_list[10]="com.facebook.ads.InterstitialAdActivity";
	activity_list[11]="com.google.android.gms.ads.purchase.InAppPurchaseActivity";
	activity_list[12]="com.adobe.creativesdk.aviary.AdobeImageEditorActivity";
	activity_list[13]="com.adobe.creativesdk.foundation.internal.auth.AdobeAuthSignInActivity";
	activity_list[14]="com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetOneUpViewerActivity";
	activity_list[15]="com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXPhotoAssetOneUpViewerActivity";
	activity_list[16]="com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUxAssetBrowserV2Activity";
	activity_list[17]="com.adobe.cc.PushNotification.AdobeNotificationHandlerActivity";
	activity_list[18]="com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetVideoActivity";
	activity_list[19]="com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXLibraryItemCollectionOneUpViewerActivity";
	activity_list[20]="com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXMobilePackageItemOneUpViewerActivity";
	activity_list[21]="com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXCompositionOneUpViewerActivity";
	activity_list[22]="com.adobe.creativesdk.foundation.internal.storage.controllers.edit.AdobeAssetEditActivity";
	activity_list[23]="com.adobe.creativesdk.foundation.internal.storage.controllers.comments.AdobeAssetViewCommentsActivity";
	activity_list[24]="com.adobe.creativesdk.foundation.internal.storage.utils.CopyToClipboardActivity";
	activity_list[25]="com.behance.sdk.ui.activities.BehanceSDKPublishProjectActivity";
	activity_list[26]="com.behance.sdk.ui.activities.BehanceSDKCreateProjectWFActivity";
	activity_list[27]="com.behance.sdk.ui.activities.BehanceSDKCreateWIPWorkflowActivity";
	activity_list[28]="com.behance.sdk.ui.activities.BehanceSDKPublishWIPActivity";
	activity_list[29]="com.behance.sdk.ui.activities.BehanceSDKPublishResultsActivity";
	activity_list[30]="com.behance.sdk.ui.activities.BehanceSDKEditProfileActivity";
	activity_list[31]="com.facebook.LoginActivity";
	activity_list[32]="com.behance.sdk.ui.activities.BehanceSDKLoginToTwitterActivity";
	activity_list[33]="com.behance.sdk.ui.activities.BehanceSDKUnlinkSocialAccountActivity";
	activity_list[34]="com.behance.sdk.ui.activities.BehanceSDKAdobeCloudSelectionActivity";
	activity_list[35]="com.behance.sdk.ui.activities.BehanceSDKCCLauncherActivity";
	EXPORTED[0]="com.dumplingsandwich.pencilsketch.activities.SplashScreenActivity";
	EXPORTED[1]="com.adobe.creativesdk.aviary.AdobeImageEditorActivity";
	EXPORTED[2]="com.adobe.creativesdk.foundation.internal.storage.utils.CopyToClipboardActivity";
}
int main()
{
	cout<<"[INFO] 正在刷新虚拟机"<<endl;
	RefreshVM("/usr/bin/VBoxManage","5f927f22-975e-43e3-a2e0-244b1c899b58","26526ab5-d2e4-42a1-ae8b-454814fa83da");
	cout<<"[INFO] 正在启动网络代理"<<endl;
	WebProxy("192.168.56.1","1337",true);
	cout<<"[INFO] 正在安装apk"<<endl;
	Install_Run("192.168.56.101","5555","./test.apk","com.dumplingsandwich.pencilsketch","com.dumplingsandwich.pencilsketch.activities.SplashScreenActivity");
	//ScreenShot("192.168.56.101","5555","./");
	//Touch("192.168.56.101","5555","400","1100");
	//ExecuteADB("192.168.56.101","5555","shell screencap -p /data/local/screen.png");
	cout<<"[INFO] 正在准备数据"<<endl;
	prepare_activity();
	cout<<"[INFO] 开始测试外部调用活动"<<endl;
	ExportedActivityTest("192.168.56.101","5555",EXPORTED,"com.dumplingsandwich.pencilsketch","./exported_screenshots/");
	cout<<"[INFO] 开始测试所有活动"<<endl;
	ActivityTest("192.168.56.101","5555",activity_list,"com.dumplingsandwich.pencilsketch","./activity_screenshots/");
	cout<<"[INFO] 正在停止测试"<<endl;
	StopTest("192.168.56.101","5555","./","./","./","com.dumplingsandwich.pencilsketch");
	cout<<"[INFO ]正在关闭网络代理"<<endl;
	WebProxy("192.168.56.1","1337",false);
	cout<<"[INFO] 正在收集数据"<<endl;	
	DumpData("192.168.56.101","5555","./","com.dumplingsandwich.pencilsketch",10);
	cout<<"[INFO] 正在分析API调用"<<endl;
	APIAnalysis("./","com.dumplingsandwich.pencilsketch");
	cout<<"[INFO] 正在分析日志文件"<<endl;
	RunAnalysis("./","com.dumplingsandwich.pencilsketch");
	cout<<"[INFO] 正在解压设备数据"<<endl;
	ExtractTar("./DeviceData","com.dumplingsandwich.pencilsketch");
	cout<<"[INFO] 正在分析设备文件"<<endl;
	CheckDeviceFile("./DeviceData/");
	cout<<"[INFO] 分析完成"<<endl;
	cout<<"************************Base64加密************************"<<endl;
	int i=0;
	while(API_BASE64.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_BASE64.dict[i].Method<<endl;
		cout<<"Args: "<<API_BASE64.dict[i].Args<<endl;
		cout<<"Return: "<<API_BASE64.dict[i].Return<<endl;
		cout<<"Info: "<<API_BASE64.dict[i].Info<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"*************************文件读写*************************"<<endl;
	i=0;
	while(API_FILEIO.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_FILEIO.dict[i].Method<<endl;
		cout<<"Args: "<<API_FILEIO.dict[i].Args<<endl;
		cout<<"Return: "<<API_FILEIO.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"*************************java反射*************************"<<endl;
	i=0;
	while(API_REFLECT.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_REFLECT.dict[i].Method<<endl;
		cout<<"Args: "<<API_REFLECT.dict[i].Args<<endl;
		cout<<"Return: "<<API_REFLECT.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"***********************系统组件调用************************"<<endl;
	i=0;
	while(API_SYSPROP.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_SYSPROP.dict[i].Method<<endl;
		cout<<"Args: "<<API_SYSPROP.dict[i].Args<<endl;
		cout<<"Return: "<<API_SYSPROP.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"*************************后台进程*************************"<<endl;
	i=0;
	while(API_BINDER.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_BINDER.dict[i].Method<<endl;
		cout<<"Args: "<<API_BINDER.dict[i].Args<<endl;
		cout<<"Return: "<<API_BINDER.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"*************************加密接口*************************"<<endl;
	i=0;
	while(API_CRYPTO.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_CRYPTO.dict[i].Method<<endl;
		cout<<"Args: "<<API_CRYPTO.dict[i].Args<<endl;
		cout<<"Return: "<<API_CRYPTO.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"**********************账户、应用管理***********************"<<endl;
	i=0;
	while(API_ACNTMNGER.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_ACNTMNGER.dict[i].Method<<endl;
		cout<<"Args: "<<API_ACNTMNGER.dict[i].Args<<endl;
		cout<<"Return: "<<API_ACNTMNGER.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"**********************通话、wifi接口***********************"<<endl;
	i=0;
	while(API_DEVICEINFO.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_DEVICEINFO.dict[i].Method<<endl;
		cout<<"Args: "<<API_DEVICEINFO.dict[i].Args<<endl;
		cout<<"Return: "<<API_DEVICEINFO.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"**********************dalvik组件调用***********************"<<endl;
	i=0;
	while(API_DEXLOADER.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_DEXLOADER.dict[i].Method<<endl;
		cout<<"Args: "<<API_DEXLOADER.dict[i].Args<<endl;
		cout<<"Return: "<<API_DEXLOADER.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"*************************创建进程*************************"<<endl;
	i=0;
	while(API_CMD.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_CMD.dict[i].Method<<endl;
		cout<<"Args: "<<API_CMD.dict[i].Args<<endl;
		cout<<"Return: "<<API_CMD.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"************************数据库读写************************"<<endl;
	i=0;
	while(API_CNTVAL.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_CNTVAL.dict[i].Method<<endl;
		cout<<"Args: "<<API_CNTVAL.dict[i].Args<<endl;
		cout<<"Return: "<<API_CNTVAL.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"*************************短信接口*************************"<<endl;
	i=0;
	while(API_SMS.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_SMS.dict[i].Method<<endl;
		cout<<"Args: "<<API_SMS.dict[i].Args<<endl;
		cout<<"Return: "<<API_SMS.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"*************************网络接入*************************"<<endl;
	i=0;
	while(API_NET.dict[i].Method!=""&&i<10)
	{
		cout<<"Method: "<<API_NET.dict[i].Method<<endl;
		cout<<"Args: "<<API_NET.dict[i].Args<<endl;
		cout<<"Return: "<<API_NET.dict[i].Return<<endl;
		cout<<"-----------------------------------------------------------------------------"<<endl;
		i++;
	}
	cout<<"***************************URL****************************"<<endl;
	i=0;
	while(URLs[i]!="")
	{
		cout<<"URL ("<<i<<"): "+URLs[i]<<endl;
		i++;
	}
	cout<<"*************************E-mail***************************"<<endl;
	i=0;
	while(EMAILs[i]!="")
	{
		cout<<"Email ("<<i<<"): "+EMAILs[i]<<endl;
		i++;
	}
	cout<<"**********************创建的xml文件************************"<<endl;
	i=0;
	while(XmlFiles[i]!="")
	{
		cout<<"XmlFilePath ("<<i<<"): "+XmlFiles[i]<<endl;
		i++;
	}
	cout<<"*********************创建的sqlite文件**********************"<<endl;
	i=0;
	while(SQLiteDB[i]!="")
	{
		cout<<"SQLiteDBFilePath ("<<i<<"): "+SQLiteDB[i]<<endl;
		i++;
	}
	cout<<"*************************其他文件*************************"<<endl;
	i=0;
	while(OtherFiles[i]!="")
	{
		cout<<"OtherFilePath ("<<i<<"): "+OtherFiles[i]<<endl;
		i++;
	}
	return 0;
}
