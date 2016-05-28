模块功能：

在上一模块——GetManifest分析的基础上，对manifest.xml进一步分析，获取Activity,Provider,Receiver,Service
等项目的异常部分，主要是检测是否包含android:export=true属性

/*android:exported 是Android中的四大组件 Activity，Service，Provider，Receiver 四大组件中都会有的一个属性
保存在如下全局变量中：
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

test.cpp              C++源文件
test                  可执行文件

**********************

编译环境：

Ubuntu 16.04LTS
g++ 5.3.1

**********************

编译方法：

终端下输入g++ test.cpp ../utils/tinyxml/tinyxml.cpp ../utils/tinyxml/tinystr.cpp ../utils/tinyxml/tinyxmlparser.cpp ../utils/tinyxml/tinyxmlerror.cpp ../utils/tinyxml/xmlanalysis.cpp ../utils/utils.cpp manifestanalysis.cpp -o test

**********************

运行：

终端下输入：./test
最终结果：将基本数据保存到全局变量中
测试输出：
----------Manifest Analysis EXPORTED_COUNT------------
Activity_Count: 2
Provider_Count: 0
Receiver_Count: 1
Service_Count: 3

-------------Manifest Analysis EXPORTED---------------
EXPORTED[0]: com.adobe.creativesdk.aviary.AdobeImageEditorActivity
EXPORTED[1]: com.adobe.creativesdk.foundation.internal.storage.utils.CopyToClipboardActivity

---------------Manifest Analysis RET------------------
ManifestAnal[0]
Issue: Application Data can be Backed up [android:allowBackup] flag is missing.
Severity: medium
Description: The flag [android:allowBackup] should be set to false. By default it is set to true and allows anyone to backup your application data via adb. It allows users who have enabled USB debugging to copy application data off of the device.

ManifestAnal[1]
Issue: com.adobe.creativesdk.aviary.AdobeImageEditorActivity( activity )is not Protected.An intent-filter exists.
Severity: high
Description: The com.adobe.creativesdk.aviary.AdobeImageEditorActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the com.adobe.creativesdk.aviary.AdobeImageEditorActivity is explicitly exported.

ManifestAnal[2]
Issue: com.adobe.creativesdk.aviary.internal.cds.CdsService( service )is not Protected.An intent-filter exists.
Severity: high
Description: The com.adobe.creativesdk.aviary.internal.cds.CdsService was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the com.adobe.creativesdk.aviary.internal.cds.CdsService is explicitly exported.

ManifestAnal[3]
Issue: com.adobe.creativesdk.aviary.internal.cds.CdsAssetsDownloaderService( service )is not Protected.An intent-filter exists.
Severity: high
Description: The com.adobe.creativesdk.aviary.internal.cds.CdsAssetsDownloaderService was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the com.adobe.creativesdk.aviary.internal.cds.CdsAssetsDownloaderService is explicitly exported.

ManifestAnal[4]
Issue: receiver (com.adobe.creativesdk.aviary.internal.cds.CdsReceiver) is not Protected. (permission android.permission.SEND_DOWNLOAD_COMPLETED_INTENTS exists.)  [android:exported=true]
Severity: high
Description: The com.adobe.creativesdk.aviary.internal.cds.CdsReceiver was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.

ManifestAnal[5]
Issue: com.adobe.creativesdk.aviary.AdobeImageBillingService( service )is not Protected.An intent-filter exists.
Severity: high
Description: The com.adobe.creativesdk.aviary.AdobeImageBillingService was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the com.adobe.creativesdk.aviary.AdobeImageBillingService is explicitly exported.

ManifestAnal[6]
Issue: TaskAffinity is set for Activity (com.adobe.creativesdk.foundation.internal.auth.AdobeAuthSignInActivity)
Severity: high
Description: If taskAffinity is set, then other application could read the Intents sent to Activities belonging to another task. Always use the default setting keeping the affinity as the package name in order to prevent sensitive information inside sent or received Intents from being read by another application.

ManifestAnal[7]
Issue: com.adobe.creativesdk.foundation.internal.storage.utils.CopyToClipboardActivity( activity )is not Protected.An intent-filter exists.
Severity: high
Description: The com.adobe.creativesdk.foundation.internal.storage.utils.CopyToClipboardActivity was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the com.adobe.creativesdk.foundation.internal.storage.utils.CopyToClipboardActivity is explicitly exported.

ManifestAnal[8]
Issue: High Intent Priority (1000) [android:priority]
Severity: medium
Description: By setting an intent priority higher than another intent, the app effectively overrides other requests.

