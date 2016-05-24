模块功能：

使用Decompile模块生成的java源文件进行分析
编写一定的代码匹配规则，匹配出java代码中调用的API（40个），敏感代码（24）个，以及代码中存在的URL，Email等
将数据保存在全局变量中：
+ extern NORMALs	ul;
+ extern NORMALs	em;
+ extern APITracing	api_t;
+ extern ReviewTracing	rev_t;

+ extern bool		native;
+ extern bool		dynamic;
+ extern bool		reflect;
+ extern bool		crypto;
+ extern bool		obfus;

**********************

文件结构：

codeanalysis.h        C++头文件
codeanalysis.cpp      C++源文件
----------------------
test.cpp              C++源文件/*程序入口*/
test                  可执行文件
----------------------
javasource/	      Decompile模块生成的java源文件
----------------------
ManifestData/         ManifestData模块，需要用到该模块对manifest.xml的分析结果

**********************

编译环境：

Ubuntu 16.04LTS
g++ 5.3.1

**********************

编译方法：

终端下输入g++ test.cpp ./ManifestData/tinyxml.cpp ./ManifestData/tinystr.cpp ./ManifestData/tinyxmlparser.cpp ./ManifestData/tinyxmlerror.cpp ./ManifestData/xmlanalysis.cpp ./ManifestData/dvm_permissions.cpp ./ManifestData/manifestdata.cpp codeanalysis.cpp -o test

**********************

运行：

终端下输入：./test
部分输出：

native = true
dynamic = true
reflect = true
crypto = true
obfus = false

*****************************URL Analysis******************************

lcf.java:
- http://qun.qq.com/qunpay/gifts/index.html?troopUin=
-------------------------------------------------------------------
oicq/wlogin_sdk/request/WtloginHelper.java:
- http://imgcache.qq.com/wtlogin
-------------------------------------------------------------------
lmv.java:
- http://jubao.qq.com/cn/jubao?appname=KQQ&subapp=$SUBAPP$&jubaotype=uin&system=$SYSTEM$&eviluin=$EVILUIN$&impeachuin=$USERUIN$
-------------------------------------------------------------------
mgv.java:
- http://play.mobile.qq.com/avchat/chatplay/avchathall.html?
-------------------------------------------------------------------
koz.java:
- http://h5.qzone.qq.com/friendtalk/sendgift?
-------------------------------------------------------------------

****************************Email Analysis*****************************

fab.java:
- example@example.com
-------------------------------------------------------------------

*****************************API Analysis******************************

* API:simserial
* Description:Get SIM Serial Number 
- ltm.java
-------------------------------------------------------------------
* API:ipc
* Description:Inter Process Communication 
- rep.java
- miw.java
- lcf.java
- ndo.java
-------------------------------------------------------------------
* API:nurl
* Description:URL Connection supports file,http,https,ftp and jar 
- oicq/wlogin_sdk/request/j.java
- com/tencent/mobileqq/utils/httputils/HttpCommunicator.java
- com/tencent/mobileqq/msf/sdk/a.java
- com/tencent/mobileqq/msf/core/net/b/b.java
- com/tencent/mobileqq/msf/core/net/d.java
- com/tencent/mobileqq/msf/core/net/o.java
- com/tencent/mobileqq/msf/core/f.java
- com/tencent/image/URLDrawable.java
- com/tencent/biz/common/util/HttpUtil.java
-------------------------------------------------------------------
* API:exec
* Description:Execute System Command 
- mqq/util/NativeUtil.java
- com/tencent/mobileqq/msf/sdk/n.java
- com/tencent/mobileqq/msf/core/w.java
- com/tencent/mobileqq/msf/core/net/h.java
- com/tencent/mobileqq/msf/core/net/m.java
- com/tencent/beacon/d/c.java
-------------------------------------------------------------------
* API:bencode
* Description:Base64 Encode 
- rep.java
- mcx.java
- com/tencent/commonsdk/classload/DexClassLoaderUtil.java
- com/tencent/beacon/a/b/d.java
-------------------------------------------------------------------
* API:datagramp
* Description:UDP Datagram Packet 
- com/tencent/mobileqq/msf/core/net/c/a.java
-------------------------------------------------------------------
* API:inf_ser
* Description:Starting Service
- uly.java
- mqq/app/MobileQQ.java

***********************Sensitive Code Analysis*************************

* Key:rand
* Security:high
* Description:The App uses an insecure Random Number Generator.
- oicq/wlogin_sdk/request/k.java
- oicq/wlogin_sdk/request/j.java
- oicq/wlogin_sdk/tools/a.java
- oicq/wlogin_sdk/tools/util.java
- rfb.java
- com/tencent/mobileqq/service/MobileQQService.java
- com/tencent/mobileqq/app/message/OfflineFileMessageProcessor.java
-------------------------------------------------------------------
* Key:d_rootcheck
* Security:secure
* Description:This App may have root detection capabilities.
- com/tencent/feedback/common/h.java
- com/tencent/beacon/d/c.java
-------------------------------------------------------------------
* Key:log
* Security:info
* Description:The App logs information. Sensitive information should never be logged.
- rmm.java
- ovu.java
- rep.java
- ndu.java
-------------------------------------------------------------------
* Key:d_extstorage
* Security:high
* Description:App can read/write to External Storage. Any App can read data written to External Storage.
- oicq/wlogin_sdk/tools/util.java
- laj.java
- mav.java
- com/tencent/mobileqq/app/AppConstants.java
- com/tencent/mobileqq/transfile/BaseTransProcessor.java
- com/tencent/mobileqq/utils/DeviceInfoUtil.java
- com/tencent/mobileqq/util/SystemUtil.java


