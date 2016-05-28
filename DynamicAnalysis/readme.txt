模块功能：

使用虚拟机和网络代理对apk进行动态分析
对apk的所有Activity和所有可外部调用的activity进行逐一测试
检测其中的API调用（例如：base64加密、文件读写、网络请求、账户管理、系统调用等）、URL请求、Email信息、创建的xml文件、sqlite数据库使用等

**********************

文件结构：

--WebProxy 			       /*Tornado（可扩展的非阻塞式 web 服务器）代理web服务器*/
   |--proxydata			       /*apk运行时web请求数据存储文件夹*/
       |--requestdb                    /*所有的apk请求文件*/
       |--urls			       /*所有web请求中的url*/
       |--WebTraffic.txt	       /*所有web代理的数据流*/
   |--pyWebProxy  		       /*web代理服务器运行脚本*/
   |--startproxy.py  		       /*代理服务器启动脚本*/#运行指令：python startproxy.py -i [ip address] -p [port]

--webproxy.log			       /*web代理服务器运行日志*/

--dynamicanalysis.h                    /*动态分析头文件*/
--dynamicanalysis.cpp                  /*动态分析源文件*/

--test.cpp			       /*C++源文件/*程序入口*/
--test				       /*可执行文件*/

**********************

编译环境：
Ubuntu 16.10
g++ 5.3.1
python 2.7.11
python第三方包 tornado 4.1			（获取：pip install tornado)
Oracle Virtual Box 5.0.18			（获取：https://www.virtualbox.org/wiki/Download_Old_Builds_5_0）
MobSF_VM_0.2.ova 安卓虚拟机			（获取：https://drive.google.com/file/d/0B_Ci-1YbMqshUnhHOU1LTDllRUE/view）
adb工具(Android Debug Bridge version 1.0.31)	（获取：sudo apt-get install android-tools-adb)

**********************

编译方法：

终端下输入g++ ./test.cpp dynamicanalysis.cpp ../utils/json/gci-json.cc ../utils/base64/base64.cpp ../utils/utils.cpp -o test


**********************

运行：

终端下输入：./test
部分输出：
[INFO] 正在刷新虚拟机
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
0%...10%...20%...30%...40%...50%...60%...70%...80%...90%...100%
[INFO] 正在启动网络代理
[INFO] 正在安装apk
[INFO] 启动网络代理在192.168.56.1:1337

10676 KB/s (33064246 bytes in 3.024s)
WARNING: linker: libdvm.so has text relocations. This is wasting memory and is a security risk. Please fix.

WARNING: linker: app_process has text relocations. This is wasting memory and is a security risk. Please fix.

	pkg: /data/local/tmp/test.apk

Success

[INFO] 正在准备数据
[INFO] 开始测试外部调用活动
919 KB/s (74980 bytes in 0.079s)
1200 KB/s (178605 bytes in 0.145s)
1947 KB/s (181647 bytes in 0.091s)
762 KB/s (81242 bytes in 0.104s)
1813 KB/s (177156 bytes in 0.095s)
1699 KB/s (158410 bytes in 0.091s)
1792 KB/s (175268 bytes in 0.095s)
980 KB/s (120972 bytes in 0.120s)
1871 KB/s (175286 bytes in 0.091s)
1794 KB/s (175343 bytes in 0.095s)
1795 KB/s (175343 bytes in 0.095s)
1004 KB/s (166480 bytes in 0.161s)
1872 KB/s (175343 bytes in 0.091s)
[INFO] 开始测试所有活动
1793 KB/s (175278 bytes in 0.095s)
1789 KB/s (175107 bytes in 0.095s)
1866 KB/s (174913 bytes in 0.091s)
1788 KB/s (174783 bytes in 0.095s)
992 KB/s (174316 bytes in 0.171s)
1862 KB/s (174512 bytes in 0.091s)
943 KB/s (125747 bytes in 0.130s)
930 KB/s (75742 bytes in 0.079s)
811 KB/s (71159 bytes in 0.085s)
783 KB/s (175387 bytes in 0.218s)
1134 KB/s (152244 bytes in 0.131s)
1121 KB/s (169629 bytes in 0.147s)
1013 KB/s (176040 bytes in 0.169s)
1428 KB/s (177787 bytes in 0.121s)
498 KB/s (42062 bytes in 0.082s)
1317 KB/s (175348 bytes in 0.130s)
1714 KB/s (149348 bytes in 0.085s)
1789 KB/s (174687 bytes in 0.095s)
969 KB/s (174687 bytes in 0.176s)
1020 KB/s (175636 bytes in 0.168s)
554 KB/s (46863 bytes in 0.082s)
205 KB/s (17248 bytes in 0.082s)
1697 KB/s (149649 bytes in 0.086s)
1013 KB/s (121521 bytes in 0.117s)
1032 KB/s (174748 bytes in 0.165s)
1062 KB/s (174968 bytes in 0.160s)
938 KB/s (125670 bytes in 0.130s)
973 KB/s (174523 bytes in 0.175s)
1396 KB/s (123664 bytes in 0.086s)
860 KB/s (174482 bytes in 0.198s)
892 KB/s (152133 bytes in 0.166s)
210 KB/s (17596 bytes in 0.081s)
987 KB/s (174482 bytes in 0.172s)
796 KB/s (175723 bytes in 0.215s)
1803 KB/s (175947 bytes in 0.095s)
1788 KB/s (174651 bytes in 0.095s)
229 KB/s (20412 bytes in 0.086s)
1079 KB/s (174785 bytes in 0.158s)
1090 KB/s (176329 bytes in 0.157s)
828 KB/s (150689 bytes in 0.177s)
[INFO] 正在停止测试
1432 KB/s (2879383 bytes in 1.963s)
[INFO ]正在关闭网络代理

[INFO] 正在保存捕获到的网络信息

[INFO] 正在保存URL

[INFO] 正在保存网络交换信息

[INFO] 正在保存http请求

[INFO] 成功关闭代理，数据保存完成
[INFO] 正在收集数据
9019 KB/s (40740352 bytes in 4.411s)
[INFO] 正在分析API调用
[INFO] 正在分析日志文件
[INFO] 正在解压设备数据
[INFO] 正在分析设备文件
[INFO] 分析完成
************************Base64加密(called times:752)************************
Method: encode
Args: [ "\n0x00000000 39 C6 AE C9 04 39 6B FA 88 98 A1 97 9B 81 91 3E 9....9k........>", "0", "16", "2" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encode
Args: [ "\n0x00000000 39 C6 AE C9 04 39 6B FA 88 98 A1 97 9B 81 91 3E 9....9k........>", "2" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encodeToString
Args: [ "\n0x00000000 39 C6 AE C9 04 39 6B FA 88 98 A1 97 9B 81 91 3E 9....9k........>", "2" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encode
Args: [ "\n0x00000000 F1 A3 C0 DE 45 AF F3 55 95 92 80 27 41 2E 4E C5 ....E..U...'A.N.\n0x00000010 D7 57 78 B8 FD 98 37 1E 0C 92 24 E1 07 13 FC 37 .Wx...7...$....7\n0x00000020 B8 D6 69 CE D9 07 56 17 B9 CF 1D 06 87 42 B3 FA ..i...V......B..", "0", "48", "2" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encode
Args: [ "\n0x00000000 F1 A3 C0 DE 45 AF F3 55 95 92 80 27 41 2E 4E C5 ....E..U...'A.N.\n0x00000010 D7 57 78 B8 FD 98 37 1E 0C 92 24 E1 07 13 FC 37 .Wx...7...$....7\n0x00000020 B8 D6 69 CE D9 07 56 17 B9 CF 1D 06 87 42 B3 FA ..i...V......B..", "2" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encode
Args: [ "\n0x00000000 AA 34 FB A7 93 63 27 C8 06 8A 2B 91 CA 8D DF 7F .4...c'...+.....\n0x00000010 4A 7B 4E F4 E2 62 5F AB 43 9B B2 A2 73 16 63 01 J{N..b_.C...s.c.\n0x00000020 F5 98 00 F0 49 A5 88 00 5F 2D 8F 27 2F 9B 91 E0 ....I..._-.'\/...", "0", "48", "2" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encode
Args: [ "\n0x00000000 AA 34 FB A7 93 63 27 C8 06 8A 2B 91 CA 8D DF 7F .4...c'...+.....\n0x00000010 4A 7B 4E F4 E2 62 5F AB 43 9B B2 A2 73 16 63 01 J{N..b_.C...s.c.\n0x00000020 F5 98 00 F0 49 A5 88 00 5F 2D 8F 27 2F 9B 91 E0 ....I..._-.'\/...", "2" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: decode
Args: [ "QpmJ8ul06jlIzFufLfsNAWUj2KYEV5t\/\/bwTAlu38Ok=", "0", "44", "2" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: decode
Args: [ "QpmJ8ul06jlIzFufLfsNAWUj2KYEV5t\/\/bwTAlu38Ok=", "2" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: decode
Args: [ "QpmJ8ul06jlIzFufLfsNAWUj2KYEV5t\/\/bwTAlu38Ok=", "2" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
*************************文件读写*************************
Method: open
Args: [ "\/data\/app\/com.dumplingsandwich.pencilsketch-1.apk", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/app\/com.dumplingsandwich.pencilsketch-1.apk", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.dumplingsandwich.pencilsketch\/shared_prefs\/multidex.version.xml", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.dumplingsandwich.pencilsketch\/shared_prefs\/Foundation.xml", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.dumplingsandwich.pencilsketch\/shared_prefs\/Foundation.xml", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.dumplingsandwich.pencilsketch\/shared_prefs\/adb_foundation_auth_aes_preference.xml", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.dumplingsandwich.pencilsketch\/shared_prefs\/adb_foundation_auth_aes_preference.xml", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.dumplingsandwich.pencilsketch\/shared_prefs\/Foundation.xml", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.dumplingsandwich.pencilsketch\/shared_prefs\/Foundation.xml", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.dumplingsandwich.pencilsketch\/shared_prefs\/Foundation.xml", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
*************************java反射*************************
Method: invoke
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "com.android.org.chromium.content.common.TraceEvent$1@52bebc84" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "debug.atrace.tags.enableflags", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ { "mObject": -1.19971e+09, "mOrgue": -1.19971e+09, "mSelf": { "referent": {  } } } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "3", "com.dumplingsandwich.pencilsketch", "inapp" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "com.dumplingsandwich.pencilsketch.activities.SplashScreenActivity@52820470" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "com.dumplingsandwich.pencilsketch.activities.SplashScreenActivity@52820470" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
***********************系统组件调用************************
Method: get
Args: [ "debug.second-display.pkg" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: get
Args: [ "gsm.operator.numeric" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: query
Args: [ { "authority": { "decoded": "com.facebook.katana.provider.AttributionIdProvider", "encoded": "com.facebook.katana.provider.AttributionIdProvider" }, "cachedFsi": -2, "cachedSsi": 7, "host": "NOT CACHED", "port": -2, "scheme": "content", "uriString": "content:\/\/com.facebook.katana.provider.AttributionIdProvider" }, [ "aid", "androidid", "limit_tracking" ] ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: query
Args: [ { "authority": { "decoded": "com.facebook.katana.provider.AttributionIdProvider", "encoded": "com.facebook.katana.provider.AttributionIdProvider" }, "cachedFsi": -2, "cachedSsi": 7, "host": "NOT CACHED", "port": -2, "scheme": "content", "uriString": "content:\/\/com.facebook.katana.provider.AttributionIdProvider" }, [ "aid", "androidid", "limit_tracking" ] ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: get
Args: [ "gsm.operator.alpha" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: get
Args: [ "persist.sys.timezone" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: query
Args: [ { "authority": { "decoded": "com.facebook.katana.provider.AttributionIdProvider", "encoded": "com.facebook.katana.provider.AttributionIdProvider" }, "cachedFsi": -2, "cachedSsi": 7, "host": "NOT CACHED", "port": -2, "scheme": "content", "uriString": "content:\/\/com.facebook.katana.provider.AttributionIdProvider" }, [ "aid", "androidid", "limit_tracking" ] ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: query
Args: [ { "authority": { "decoded": "com.facebook.katana.provider.AttributionIdProvider", "encoded": "com.facebook.katana.provider.AttributionIdProvider" }, "cachedFsi": -2, "cachedSsi": 7, "host": "NOT CACHED", "port": -2, "scheme": "content", "uriString": "content:\/\/com.facebook.katana.provider.AttributionIdProvider" }, [ "aid", "androidid", "limit_tracking" ] ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: get
Args: [ "debug.second-display.pkg" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: get
Args: [ "debug.second-display.pkg" ]
Return: No Return Data
-----------------------------------------------------------------------------
*************************后台进程*************************
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.USER_PRESENT", "android.intent.action.SCREEN_OFF" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.USER_PRESENT", "android.intent.action.SCREEN_OFF" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.PROXY_CHANGE" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.PROXY_CHANGE" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mActions": [ "android.intent.action.BATTERY_CHANGED" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mActions": [ "android.intent.action.BATTERY_CHANGED" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: startActivity
Args: [ { "cmp": "com.dumplingsandwich.pencilsketch\/com.dumplingsandwich.pencilsketch.activities.MainActivity" } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: startActivity
Args: [ { "cmp": "com.dumplingsandwich.pencilsketch\/com.dumplingsandwich.pencilsketch.activities.MainActivity" } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mActions": [ "android.intent.action.BATTERY_CHANGED" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mActions": [ "android.intent.action.BATTERY_CHANGED" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
*************************加密接口*************************
Method: javax.crypto.spec.SecretKeySpec
Args: [ "\n0x00000000 39 C6 AE C9 04 39 6B FA 88 98 A1 97 9B 81 91 3E 9....9k........>", "AES" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: javax.crypto.spec.SecretKeySpec
Args: [ "\n0x00000000 39 C6 AE C9 04 39 6B FA 88 98 A1 97 9B 81 91 3E 9....9k........>", "AES" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: doFinal
Args: [ "5bdd636e3694470fa58e0ea0f195e0d3" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: doFinal
Args: [ "89baf2ee-6c90-4c15-ad1c-f7c2b6719753" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: javax.crypto.spec.SecretKeySpec
Args: [ "\n0x00000000 AD 30 AE 7D 0C 88 1F DB 69 BF 49 45 21 67 9C E2 .0.}....i.IE!g..", "AES" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: doFinal
Args: [ "\n0x00000000 CF 2A E7 9C CD 2D AF 0B 4B 09 A4 E4 FB 6B 29 0C .*...-..K....k).\n0x00000010 53 39 6E 00 3C BA E0 3E 3F D7 8A 54 0F 44 0B 2A S9n.<..>?..T.D.*\n0x00000020 EA 08 72 85 76 38 48 9E E2 09 1B 6E 29 95 AF C9 ..r.v8H....n)...\n0x00000030 EA 09 C0 7C D5 18 3E 73 83 49 EF DC 1B 37 B5 90 ...|..>s.I...7..\n0x00000040 57 74 FC 4D 56 E0 16 B1 90 BE 49 05 EE A6 1E DF Wt.MV.....I.....\n0x00000050 BB 5B 13 27 EE 45 55 B5 4D 55 AE 29 58 32 1D 6F .[.'.EU.MU.)X2.o\n0x00000060 EA E9 11 9C 35 F5 FA EE 71 B5 46 64 04 62 E1 CD ....5...q.Fd.b..\n0x00000070 09 DC 7F 5A 2F D7 D9 CE F4 49 98 A0 05 7D 26 D6 ...Z\/....I...}&.\n0x00000080 95 B0 69 C4 B4 91 67 07 68 24 11 B3 88 27 B9 D6 ..i...g.h$...'..\n0x00000090 F2 E5 A7 77 DD 78 47 BD 96 20 EF D2 0B 15 2F 5F ...w.xG.......\/_\n0x000000A0 80 CB 3F 88 D0 D6 E0 09 57 A0 90 A5 D3 C2 72 00 ..?.....W.....r.\n0x000000B0 38 29 A9 05 4A 9D 2A 2F FC BE 5A B0 55 79 C1 80 8)..J.*\/..Z.Uy..\n0x000000C0 F2 28 CB 3D BE 70 89 1C 3E 24 0E 44 C8 B1 75 05 .(.=.p..>$.D..u.\n0x000000D0 D4 36 62 FE D2 19 8B D8 3E 4A 91 AD 50 1D 05 75 .6b.....>J..P..u\n0x000000E0 08 D4 61 71 58 44 7B 44 A7 CB 8B DA 59 42 3B DF ..aqXD{D....YB;.\n0x000000F0 69 B0 C2 0F 9A 78 27 02 03 77 70 86 A0 FF E7 E1 i....x'..wp.....\n0x00000100 72 9E CA 84 21 95 7E 3F 72 B2 4D 2E D7 42 65 B0 r...!..?r.M..Be.\n0x00000110 F8 74 B9 77 6E 95 B9 CB A9 B6 E9 DA 8B 50 A3 2D .t.wn........P.-\n0x00000120 45 E1 6E 2F 6F 35 AC FA 21 69 6A 51 39 9D 56 A3 E.n\/o5..!ijQ9.V.\n0x00000130 7B 38 6E A6 D4 41 E7 98 7E 0A 1F C3 33 B9 B5 7C {8n..A......3..|\n0x00000140 30 F9 CC 88 74 38 D8 9B CD 15 7A C5 A2 2A CA A4 0...t8....z..*..\n0x00000150 A4 22 3B B3 52 B5 9F 2A 82 8E 00 6A 28 DD BC F8 .\";.R..*...j(...\n0x00000160 0F D8 7C F5 52 BC 89 60 93 92 C3 32 12 1C 58 62 ..|.R..`...2..Xb\n0x00000170 F2 D0 9D E1 ED 0A 59 80 40 80 6F 28 C1 33 B1 FD ......Y.@.o(.3..\n0x00000180 C0 58 65 1D 8C AF 8B F7 C3 5E 52 98 9C 9E 68 2E .Xe......^R...h.\n0x00000190 3C CE 91 D9 37 12 A0 DA B4 77 F2 97 72 A9 9A 89 <...7....w..r...\n0x000001A0 ED 0B B1 9D 83 0B 8C 32 89 12 AA 59 61 D1 B8 AF .......2...Ya...\n0x000001B0 6C 1D 28 C7 7C 77 4D 01 43 E0 40 3A D6 C3 51 56 l.(.|wM.C.@:..QV\n0x000001C0 77 1A BE B4 CD 57 FE B6 12 67 E7 2E 25 80 51 55 w....W...g..%.QU\n0x000001D0 25 48 BC 52 F8 12 1A 3B 4C 00 B5 00 A6 FA CE 58 %H.R...;L......X\n0x000001E0 56 71 6A AA 6F 12 86 E4 1C C5 6C A0 4C 3B 21 58 Vqj.o.....l.L;!X\n0x000001F0 74 95 06 E2 B8 39 6B 3B B6 3E B8 93 0D AC 5D B5 t....9k;.>....].\n0x00000200 71 74 31 17 48 39 5C A6 41 9B CF 7F C3 79 9E DB qt1.H9\\.A....y..\n0x00000210 A8 8B 19 7E 49 72 CE 34 28 88 2E 5A 8F 4D 25 8F ....Ir.4(..Z.M%.\n0x00000220 13 02 AE EC 36 64 00 86 35 C6 DB 77 E0 7A CD 33 ....6d..5..w.z.3\n0x00000230 D8 E0 0B 22 80 5C 40 FF 46 75 25 7D FB E9 C2 FB ...\".\\@.Fu%}....\n0x00000240 5B 5A 70 5E 90 66 CB 16 A9 D9 B7 3B 43 88 41 E3 [Zp^.f.....;C.A.\n0x00000250 54 F8 F5 CF DB A3 F8 86 CE 0A FB E0 79 F6 13 EE T...........y...\n0x00000260 C4 6F 08 64 57 E7 85 43 39 64 47 2C 86 41 AD 12 .o.dW..C9dG,.A..\n0x00000270 24 6C 44 30 E9 21 88 16 DD C7 F4 84 4F 8E 33 EE $lD0.!......O.3.\n0x00000280 07 23 CE 44 8A CE 13 48 19 27 A5 A8 E5 F4 7B 36 .#.D...H.'....{6\n0x00000290 47 B0 F6 31 EB D0 63 FD 02 F2 89 CF E9 20 B5 73 G..1..c........s\n0x000002A0 0D 8C D8 A6 15 F5 F1 46 64 5E D7 CF 06 66 16 B5 .......Fd^...f..\n0x000002B0 B6 4F 4D 01 72 8B 74 D6 C3 FC 1E 3F E0 18 FC 78 .OM.r.t....?...x\n0x000002C0 C0 0C EC 98 C0 75 AB 10 0A EE 39 2C 7D C4 C2 BC .....u....9,}...\n0x000002D0 98 1D 47 9D FC FB 79 34 E2 DB D0 55 1C 6A 33 C0 ..G...y4...U.j3.\n0x000002E0 9E 69 FB AE 22 98 9C 62 CF 98 9B 8F 9B ED 64 4D .i..\"..b......dM\n0x000002F0 BC D6 E7 A7 23 5E 50 27 3C 77 6B 87 E3 8F 27 53 ....#^P'<wk...'S\n0x00000300 DA 06 17 D4 C9 01 B1 BF FF 43 03 B2 F7 D0 0D 4C .........C.....L\n0x00000310 3F 3D 04 83 39 54 9A FB 9C CB C5 99 FA 37 F4 75 ?=..9T.......7.u\n0x00000320 F6 A7 92 2F 55 25 DA F9 6C DD 22 C3 6C DB FE E5 ...\/U%..l.\".l...\n0x00000330 C4 A7 36 81 8A 69 17 1B A9 DC E4 61 B8 12 36 F8 ..6..i.....a..6.\n0x00000340 89 AD 60 48 0B 87 E9 16 D5 C3 AB DD 6E 7D 0A 2D ..`H........n}.-\n0x00000350 F7 53 CB F7 AD 84 8D 29 EC 29 2C 96 17 C1 34 C1 .S.....).),...4.\n0x00000360 8E DC 9F B6 E4 DB D1 E9 3D 6A A1 AD E6 82 7B 89 ........=j....{.\n0x00000370 34 53 ED 43 54 C3 C5 D4 A5 11 5D 09 AD 7C 1D 4E 4S.CT.....]..|.N\n0x00000380 80 33 88 AA ED 9F A6 AD 2B C2 B1 29 96 E4 A0 A9 .3......+..)....\n0x00000390 6D 31 74 3B 5F 04 7B 31 93 3A 26 4E 54 56 53 DE m1t;_.{1.:&NTVS.\n0x000003A0 44 8A F0 C4 A2 B6 9B 7A 3D 8D 15 85 79 53 F1 6A D......z=...yS.j\n0x000003B0 40 FA 24 C5 38 73 E3 96 1D E1 B7 F9 79 A3 68 F1 @.$.8s......y.h.\n0x000003C0 BC F8 52 6E 61 0F 38 E5 25 69 E3 2F 6E 2D D4 39 ..Rna.8.%i.\/n-.9\n0x000003D0 16 CC F5 7D D8 35 11 41 2B D4 E5 F9 05 71 03 FB ...}.5.A+....q..\n0x000003E0 73 44 27 C0 87 FF E3 10 23 83 1D 63 C6 1B 92 A3 sD'.....#..c....\n0x000003F0 72 DE 0F 15 CF 6C 22 8A 7B 0D 0D 23 23 D5 BB 01 r....l\".{..##...\n0x00000400 7A 3D 83 B5 53 B9 E8 99 35 5E 34 85 8D 91 09 FB z=..S...5^4.....\n0x00000410 E9 CD D3 C0 A4 E7 9A 89 9E 3C 23 97 D7 99 FD FC .........<#.....\n0x00000420 5C 8F 25 BC BE 83 AF 1B B5 39 12 D1 95 41 B9 ED \\.%......9...A..\n0x00000430 8B 32 99 6B AE 49 87 14 27 97 D7 EB 43 4E 9B D7 .2.k.I..'...CN..\n0x00000440 32 E5 74 2C 5C 42 DC 6F 13 AE A4 83 D0 F9 95 7A 2.t,\\B.o.......z\n0x00000450 3D 43 C5 DA 85 B5 B5 CA 41 BE 1C 9F E3 28 FE 4F =C......A....(.O\n0x00000460 20 40 CE CE 86 7A 76 F6 09 19 4D DF EF 62 3F EC .@...zv...M..b?.\n0x00000470 54 10 C3 C4 5B E9 A2 ED F9 4D 91 BE 4B D2 69 C5 T...[....M..K.i.\n0x00000480 A7 49 33 A6 81 71 02 F2 2F 6B 5D 2C 8F 52 20 12 .I3..q..\/k],.R..\n0x00000490 67 EF BC 14 B7 B4 6F D1 81 26 9C AA 22 14 68 38 g.....o..&..\".h8\n0x000004A0 E7 CA 47 D9 56 AA 9E 63 D5 8E B0 9F 29 75 B0 68 ..G.V..c....)u.h\n0x000004B0 94 08 6E 66 4C DF 47 B5 16 0F F3 01 02 7C 64 AD ..nfL.G......|d.\n0x000004C0 B1 7D B0 81 35 67 10 48 B9 5C 78 46 1E 4A 83 91 .}..5g.H.\\xF.J..\n0x000004D0 41 FD 94 60 33 E2 B4 74 2C 31 C0 8A 9D F6 51 72 A..`3..t,1....Qr\n0x000004E0 61 52 D7 7D 90 1E 49 BB DB 8C A7 C2 41 90 E8 C3 aR.}..I.....A...\n0x000004F0 9F 8E DC 2B 30 EE AA 69 6A 58 01 36 F0 49 D9 9C ...+0..ijX.6.I..\n0x00000500 AA 09 4B 19 4A B0 54 CE FE 93 39 8D 15 95 ED 86 ..K.J.T...9.....\n0x00000510 60 86 36 E3 49 7B 2D 15 9A 61 21 98 5B 0F 31 ED `.6.I{-..a!.[.1.\n0x00000520 A8 E0 47 F4 35 CE 9B 8A DE EE 5A F3 42 19 BD 4C ..G.5.....Z.B..L\n0x00000530 90 60 0F 52 7D 7D BA 48 92 9C C5 FF F3 0E 16 7A .`.R}}.H.......z\n0x00000540 12 88 88 11 35 44 3D 2F 9C 41 F8 75 21 6F F6 D8 ....5D=\/.A.u!o..\n0x00000550 ED 4E D5 AB A1 F0 08 90 FE 96 05 C8 B6 AC E5 24 .N.............$\n0x00000560 82 63 31 70 FE C2 38 67 ED 30 38 8D 70 F5 34 34 .c1p..8g.08.p.44\n0x00000570 7A 92 84 13 D5 C2 B3 38 D3 2A D0 8D C8 F1 4F 16 z......8.*....O.\n0x00000580 09 6B FC 9F DF A9 F0 73 1C C7 73 FD 6F 45 F6 DC .k.....s..s.oE..\n0x00000590 F7 2F 5F CF C0 28 1B 59 8C 49 CF AA 48 78 C4 19 .\/_..(.Y.I..Hx..\n0x000005A0 76 6E E5 9E F8 72 21 E3 2C 18 D7 4A B2 45 70 BC vn...r!.,..J.Ep.\n0x000005B0 87 B5 CC 56 A2 5A 4D BC B6 7B A5 81 EA 55 4C D7 ...V.ZM..{...UL.\n0x000005C0 30 8A BB 21 04 EB A0 83 CC A3 03 64 CE 9E D4 AC 0..!.......d....\n0x000005D0 20 4F 64 4C 14 96 7D C2 D4 04 65 AB C6 EC 12 32 .OdL..}...e....2\n0x000005E0 17 E9 E4 1D 83 D9 0D CF 38 FF F8 9E 10 9D BC 1A ........8.......\n0x000005F0 73 9B 6C 7F 07 22 66 6D 61 59 DF 4A F2 B4 19 AF s.l..\"fmaY.J....\n0x00000600 14 8D E7 19 07 CC EE 82 31 6A EB 9B 54 DA CE 2A ........1j..T..*\n0x00000610 E7 6C 1E AC 5D 49 53 5A CA 99 D3 AD 79 A2 1D 9B .l..]ISZ....y...\n0x00000620 EC E9 9D EA 65 6C 91 49 17 8C DB 90 12 43 93 A6 ....el.I.....C..\n0x00000630 7D E8 46 82 9E 27 F3 2C DE 79 CA B8 E4 C2 31 71 }.F..'.,.y....1q\n0x00000640 9E EA CF C0 A3 97 FE 66 53 84 E3 40 E2 59 A8 DD .......fS..@.Y..\n0x00000650 DB D4 E3 25 30 3E A5 BA 2A 84 7D 24 3C 7B 3A 2B ...%0>..*.}$<{:+\n0x00000660 8F 2F FC D2 C2 31 EC 6E 59 B6 0E D7 15 4D 14 CE .\/...1.nY....M..\n0x00000670 6E 44 BB 81 28 9A 5B 9D FB 65 91 BD 47 4A EA E7 nD..(.[..e..GJ..\n0x00000680 CB EE 4B B0 74 97 68 33 81 DA 01 25 9D 17 17 1A ..K.t.h3...%....\n0x00000690 A1 BD A2 7F BA B7 33 51 EA DA 73 5C 39 A7 80 14 ......3Q..s\\9...\n0x000006A0 8D 82 E2 AB 78 BC DE DA 89 2F EA 1F 25 FE 9E 93 ....x....\/..%...\n0x000006B0 E0 E0 37 01 7C 97 E5 A1 01 F6 0A 7D 60 3B 7C 23 ..7.|......}`;|#\n0x000006C0 62 8A 2F 82 40 D6 FE 01 30 60 55 EA DC 73 24 DD b.\/.@...0`U..s$.\n0x000006D0 0F 1A 1E 83 30 11 C7 86 E8 73 11 B9 56 0F DB 1A ....0....s..V...\n0x000006E0 F9 80 6B D2 8A BC 83 5B 83 5B AE 57 FF EF 2A 00 ..k....[.[.W..*.\n0x000006F0 87 A9 EF E6 FE 15 01 6E 64 98 31 97 3C 1D 35 23 .......nd.1.<.5#\n0x00000700 9C 7D 39 4B B9 47 B7 D9 70 BB 5C 03 F5 F1 22 0B .}9K.G..p.\\...\".\n0x00000710 C8 57 50 F2 A0 1A 1F 5C 69 14 9B 69 D1 39 CC 33 .WP....\\i..i.9.3\n0x00000720 EA 0E FF 7B 93 53 1E 76 49 2B F0 D7 52 93 5B C3 ...{.S.vI+..R.[.\n0x00000730 75 59 A5 34 3C E8 E3 9F 35 11 5C E5 7F 65 26 A3 uY.4<...5.\\..e&.\n0x00000740 4B EB 44 E0 A9 FB A3 83 5E 5C 51 A1 45 70 26 6E K.D.....^\\Q.Ep&n\n0x00000750 DD DD 57 D8 B3 D6 56 19 9D 78 25 40 93 8A 08 E3 ..W...V..x%@....\n0x00000760 4F 14 C8 F0 D5 91 53 C9 05 B6 73 58 0C CF 1B 8E O.....S...sX....\n0x00000770 99 5A 24 F3 4B CF 85 F3 44 81 BD 6A 08 25 41 63 .Z$.K...D..j.%Ac\n0x00000780 69 55 FA E4 53 ED 18 81 78 DD B7 26 DB 43 FA E2 iU..S...x..&.C..\n0x00000790 29 A9 34 C4 EE 56 3D 3F AC A5 E7 90 91 31 D2 28 ).4..V=?.....1.(\n0x000007A0 AA A5 FE 13 D0 52 9E 03 75 2A 8F B8 04 98 40 8C .....R..u*....@.\n0x000007B0 75 C4 97 B4 8B CD BB 62 FE 02 91 82 3A 9A 75 CC u......b....:.u.\n0x000007C0 3F 99 AB C5 DE 3B B4 73 ED 4A FA DB 7F 94 C1 68 ?....;.s.J.....h\n0x000007D0 9C 20 30 C3 AE D0 AF A5 B2 8A 41 13 33 23 09 86 ..0.......A.3#..\n0x000007E0 F5 D8 28 59 53 3C 98 F7 C3 84 66 E9 C4 25 3F 37 ..(YS<....f..%?7\n0x000007F0 23 98 32 B6 9E EC B1 EF A0 15 82 67 7C 77 EB 1D #.2........g|w..\n0x00000800 E0 90 A6 43 9B 73 72 5A 5B 06 77 D9 B2 D9 8B C2 ...C.srZ[.w.....\n0x00000810 7D FA 8D 2B CD 21 BD 33 A5 79 53 D2 50 BE 92 41 }..+.!.3.yS.P..A\n0x00000820 DC 24 B9 CF C0 86 80 51 49 51 A5 AB 00 A2 C7 FF .$.....QIQ......\n0x00000830 ED 1D C4 22 50 33 63 C2 03 3D 33 CF 55 0D 7E 30 ...\"P3c..=3.U..0\n0x00000840 5D 69 28 85 36 58 A0 FD 94 C1 0B 0C 5B 0F 3F AC ]i(.6X......[.?.\n0x00000850 D9 EB D9 F3 36 C6 A2 68 65 FE A7 82 B5 67 05 73 ....6..he....g.s\n0x00000860 A1 2B 70 98 D8 EE 9E 5D E2 F8 0C D3 1B 5C 58 A8 .+p....].....\\X.\n0x00000870 08 DD 9E 41 FA 4A A6 14 5C F2 B2 36 84 43 D6 D7 ...A.J..\\..6.C..\n0x00000880 3C B9 A0 4C 3D 80 3B 4B E4 30 9F 6F 01 AA F2 7E <..L=.;K.0.o....\n0x00000890 7F 21 28 7C 59 09 DD 46 1A 06 17 9F 4A FF 4F A2 .!(|Y..F....J.O.\n0x000008A0 62 59 26 DD A4 38 17 88 D5 C3 8A 4D 48 D7 AE C6 bY&..8.....MH...\n0x000008B0 14 97 C4 19 8F 38 87 6C 24 D6 9B 0A 14 9D 82 B9 .....8.l$.......\n0x000008C0 C1 0D 6C 4E 0A FA 98 BA 9A EA E0 93 9E 3E 42 2B ..lN.........>B+\n0x000008D0 87 DB 01 08 1C 6D 9F 3B 82 3C 23 F9 D8 53 8E 80 .....m.;.<#..S..\n0x000008E0 D8 3C 45 8A C3 9F 85 CB AD DD C7 0E E4 97 C3 4F .<E............O\n0x000008F0 84 55 72 91 1D E2 5E 16 B6 C6 74 1E E0 F0 F1 D8 .Ur...^...t.....\n0x00000900 DE 87 33 76 10 57 81 E7 23 C6 A0 93 04 5F 71 FF ..3v.W..#...._q.\n0x00000910 5B F2 38 78 1F 3D 3C 0F 27 1F 01 48 33 16 D5 28 [.8x.=<.'..H3..(\n0x00000920 A5 B5 1F DA 91 A8 CF 79 D6 26 12 C5 A9 FB B1 35 .......y.&.....5\n0x00000930 BB 77 38 21 96 A4 49 8D 8D D2 65 49 42 2F 3F E7 .w8!..I...eIB\/?.\n0x00000940 BA 5C 85 6C 0A 5A 94 55 7B 4F 03 06 54 33 B2 17 .\\.l.Z.U{O..T3..\n0x00000950 CC 32 30 30 AB 0E 7A BC 95 C0 30 E6 7B 48 D2 24 .200..z...0.{H.$\n0x00000960 0E 35 FE 7C 2B 5E 58 85 6D 48 2B 09 34 8B 0B 08 .5.|+^X.mH+.4...\n0x00000970 7E 76 93 D1 56 05 59 E4 88 66 06 73 78 11 CB 3B .v..V.Y..f.sx..;\n0x00000980 83 1F F8 F5 6F AA 85 3A DC 3B A7 78 89 34 8F 14 ....o..:.;.x.4..\n0x00000990 DA AA 8A 39 34 5A E6 37 9E 60 44 DA 28 EB 86 27 ...94Z.7.`D.(..'\n0x000009A0 8E B8 D7 67 C2 37 3A A9 38 7D 45 B7 A7 4F B7 1A ...g.7:.8}E..O..\n0x000009B0 8D 8B 86 D4 02 61 B9 9F 00 43 F2 1D 76 C0 8A C8 .....a...C..v...\n0x000009C0 3A B1 0F 68 FF F2 4C 8C B5 FB BF 14 1C 78 F8 69 :..h..L......x.i\n0x000009D0 5D 12 35 61 5C 59 25 B3 4F D2 04 78 2A 75 E0 36 ].5a\\Y%.O..x*u.6\n0x000009E0 D2 3E B3 C5 EC 27 08 7C 0B B8 E4 91 FA 3E 0C 51 .>...'.|.....>.Q\n0x000009F0 9B 22 30 42 6F 2D 40 68 F2 0F F1 D2 9A DE 42 91 .\"0Bo-@h......B.\n0x00000A00 33 0E BE 2E 39 C8 B9 8E 08 37 72 70 C2 E9 2B D4 3...9....7rp..+.\n0x00000A10 CA E3 8B 47 BE 74 CA 0D E0 F5 A9 05 40 D3 7C 31 ...G.t......@.|1\n0x00000A20 0A BE E3 FE 8D 98 52 8A 45 AD 6C 87 65 1B B1 39 ......R.E.l.e..9\n0x00000A30 4B 32 67 9E EA 47 93 95 26 12 44 83 61 A0 53 94 K2g..G..&.D.a.S.\n0x00000A40 4D F2 FE E5 F9 C1 2C 9C AA C4 7E 52 31 4B 64 F6 M.....,....R1Kd.\n0x00000A50 24 0D 63 E4 FD C6 07 A0 C5 56 19 9D 05 53 64 10 $.c......V...Sd.\n0x00000A60 04 E9 61 89 BE 24 92 C9 04 03 30 78 01 D9 49 31 ..a..$....0x..I1\n0x00000A70 91 8C 42 B9 48 20 83 CC D4 63 D5 2C 29 93 4F CD ..B.H....c.,).O.\n0x00000A80 65 B3 40 46 64 09 48 5B 57 0D D7 A4 81 9C 16 2D e.@Fd.H[W......-\n0x00000A90 90 A2 B7 14 25 0B 7D 09 E8 6D 04 1D 2A 52 2E F8 ....%.}..m..*R..\n0x00000AA0 89 0E 3C C2 6B 53 66 6D 0A D2 7E D4 AA DB 54 10 ..<.kSfm......T.\n0x00000AB0 C2 8E DA AB 34 00 3E F9 BB 76 B3 76 02 8B 72 9C ....4.>..v.v..r.\n0x00000AC0 14 43 7A 4F 93 2A EC 12 44 C5 64 74 75 40 36 9A .CzO.*..D.dtu@6.\n0x00000AD0 1F 65 95 0B 82 A9 FC 4D F5 EB 5C 10 70 19 9B 56 .e.....M..\\.p..V\n0x00000AE0 2B 7F 93 C9 B4 C4 5A 47 BB DC 7B A6 83 F4 4A F3 +.....ZG..{...J.\n0x00000AF0 92 40 E2 76 0C CE 24 1B AC 04 CD 83 EA 8A 24 26 .@.v..$.......$&\n0x00000B00 84 08 0D 4D CD FB A6 45 32 74 B4 1E 09 45 8F FE ...M...E2t...E..\n0x00000B10 2F 22 59 AF 52 C6 5B 56 37 71 73 B0 0C 96 C3 37 \/\"Y.R.[V7qs....7\n0x00000B20 5D 0C 82 33 F6 31 E0 A4 17 70 FE E2 74 24 D9 EA ]..3.1...p..t$..\n0x00000B30 AB 2B BC 3F 60 B7 B7 B5 6E 2D 6D CD 05 98 54 C3 .+.?`...n-m...T.\n0x00000B40 7C 78 B5 7F 7D 7D 0B 89 6D 06 A8 E4 71 8D 24 05 |x..}}..m...q.$.\n0x00000B50 F0 CE BE 37 E3 8A 54 19 AE 11 6F 72 AB 8A 90 09 ...7..T...or....\n0x00000B60 C9 96 29 7C 11 24 4A 7D 5A D4 36 3D 00 E6 57 72 ..)|.$J}Z.6=..Wr\n0x00000B70 E9 09 EE E3 2A EB EA 92 27 E4 3C 5D 72 2D B1 33 ....*...'.<]r-.3\n0x00000B80 20 00 0F 1F 9C 55 50 D1 25 BB AA 21 02 11 1C BE .....UP.%..!....\n0x00000B90 22 B9 AC BF 57 1B FF 76 FF 79 B8 56 CB B7 36 5B \"...W..v.y.V..6[\n0x00000BA0 A2 10 22 F5 CC 77 82 7E 60 01 8A E4 F2 39 0D 3C ..\"..w..`....9.<\n0x00000BB0 16 B0 EC 37 42 E4 DA C6 06 77 E3 DC 4B 4A CE B6 ...7B....w..KJ..\n0x00000BC0 F8 E9 79 0C 3A 15 7B 39 52 A9 17 62 FD 72 77 F2 ..y.:.{9R..b.rw.\n0x00000BD0 6A 4B 0E 1A E2 C6 D3 2D 9D F8 0D 17 6F 56 F9 86 jK.....-....oV..\n0x00000BE0 58 6D 43 93 4E 05 DA C6 D6 6C 65 E7 EC 48 A9 2C XmC.N....le..H.,\n0x00000BF0 03 A3 5F F2 76 AF 97 6C D8 B6 97 34 E3 26 1E 59 .._.v..l...4.&.Y\n0x00000C00 AD 3C 9B 49 34 0A 61 D1 9C D7 E1 ED 36 EF 9B FA .<.I4.a.....6...\n0x00000C10 35 B4 74 34 EB 74 40 D0 E7 8A A4 96 BB 5E 16 06 5.t4.t@......^..\n0x00000C20 2B 71 7A 73 57 04 21 9F 2A 8B 22 91 3F 2E D9 79 +qzsW.!.*.\".?..y\n0x00000C30 8C BB 98 DB 5F AD AB EA 02 48 E4 1B AB 35 5A 62 ...._....H...5Zb\n0x00000C40 48 1A B3 DC 4C 16 51 F9 B3 F8 85 08 93 64 15 BC H...L.Q......d..\n0x00000C50 B2 9B 61 B9 0B 67 F3 D4 00 19 43 8A 3A 0C D7 02 ..a..g....C.:...\n0x00000C60 7D C5 F3 EE 0E 10 A0 CE 3C 5F 7F 0B 28 0F 6F 41 }.......<_..(.oA\n0x00000C70 91 B0 45 BD 55 45 59 58 E8 9A 68 39 0B 0B 5F 41 ..E.UEYX..h9.._A\n0x00000C80 A2 82 7F 41 DD 5A F9 FB C7 47 C4 7F 58 02 1A 6C ...A.Z...G..X..l\n0x00000C90 A6 B0 C7 0F 1B 20 98 32 03 8C 85 DE 24 A4 8C 56 .......2....$..V\n0x00000CA0 BB 41 51 EE B4 74 FA BD 05 33 A9 8B 27 B5 C6 0D .AQ..t...3..'...\n0x00000CB0 DD 27 C0 E0 B7 60 BD C3 3F 4A B3 4A 5C 1E 01 BA .'...`..?J.J\\...\n0x00000CC0 FD 8A DC 44 CE 00 FC FB 4B 15 F2 60 DA 75 3B 58 ...D....K..`.u;X\n0x00000CD0 6F EB 5B 92 05 41 81 D8 E5 AB CC 5F 4B 1D 56 5D o.[..A....._K.V]\n0x00000CE0 35 B0 F0 1D C1 7E 53 16 36 80 62 7C B2 61 EF 45 5.....S.6.b|.a.E\n0x00000CF0 66 5D C8 20 D4 85 FB B4 31 7F 9E DB 04 CD ED 7A f]......1......z\n0x00000D00 83 46 AF 83 46 D6 A9 4B A4 56 6E 34 FC A3 19 C0 .F..F..K.Vn4....\n0x00000D10 9B 54 01 8A 3A 0B 4C F2 FA F7 25 55 6C 11 CF 28 .T..:.L...%Ul..(\n0x00000D20 97 22 44 A4 C9 13 B6 3B D2 89 AB 35 CE A8 5D FE .\"D....;...5..].\n0x00000D30 56 DB 8B E9 B3 D4 3D 5D AB 94 EC E8 AB 7B 72 99 V.....=].....{r.\n0x00000D40 24 E3 1F 88 F5 B3 DD 9E C5 0D 29 51 D3 D4 1D 8A $.........)Q....\n0x00000D50 DB F8 5E 0E 42 36 58 44 BF 99 6B 1B B5 DC 0D 16 ..^.B6XD..k.....\n0x00000D60 62 CF 00 EB 77 BB 3C A7 49 06 22 1F 53 97 4F 66 b...w.<.I.\".S.Of\n0x00000D70 43 7C 81 B4 D0 B3 47 71 F8 A7 87 81 35 2A AE 45 C|....Gq....5*.E\n0x00000D80 F2 45 F7 95 86 C4 6C 42 FC 3B 59 C7 3F 97 91 A3 .E....lB.;Y.?...\n0x00000D90 9C 77 22 5A A6 EB 86 61 A4 31 F7 DA B3 26 B3 64 .w\"Z...a.1...&.d\n0x00000DA0 34 64 E7 20 AE CC 89 EE D7 00 F5 EA E2 9B 12 D0 4d..............\n0x00000DB0 69 6C 50 C6 BF CA 99 36 28 47 37 09 BC 8C 93 15 ilP....6(G7.....\n0x00000DC0 2B 01 55 B2 CE 84 1C 67 5B 2D 3F FB 31 30 50 AB +.U....g[-?.10P.\n0x00000DD0 AD 5A AE 34 8E DB 6C 58 E2 42 AE 2B AA C1 DA C1 .Z.4..lX.B.+....\n0x00000DE0 DC 94 7C 67 CD A7 C4 B1 E2 F9 50 91 C9 0B D6 EB ..|g......P.....\n0x00000DF0 30 FF BD 09 54 F0 35 37 88 6C 3D A3 15 7C 66 B1 0...T.57.l=..|f.\n0x00000E00 CC DF 6C C8 89 CA 20 42 65 28 E1 38 47 50 D9 5C ..l....Be(.8GP.\\\n0x00000E10 C2 01 6B CE DC 4B 73 04 A5 1E 2F 0A FC 09 9B C3 ..k..Ks...\/.....\n0x00000E20 24 A0 50 69 7E C5 BE C2 CE 95 1A 28 0A 2A 97 09 $.Pi.......(.*..\n0x00000E30 2D 14 79 E3 85 DF B2 B4 DC 7F 1C 9D 53 19 CF DE -.y.........S...\n0x00000E40 9E FF 32 D8 75 E7 43 70 A3 59 8C DB 97 72 1F AA ..2.u.Cp.Y...r..\n0x00000E50 44 6F 0C EA 0B 73 91 DB 1F 78 65 29 8E 92 53 3E Do...s...xe)..S>\n0x00000E60 A0 DA CA D3 D0 2D 13 BC 77 59 D6 CD 0F E2 20 F2 .....-..wY......\n0x00000E70 D3 1A E6 0D 3B 4C 21 51 0C 84 D7 6F 6D 24 78 90 ....;L!Q...om$x.\n0x00000E80 0D 7D 48 41 98 33 5E 67 7B D3 91 63 F6 88 A8 E1 .}HA.3^g{..c....\n0x00000E90 1F E4 74 2A 97 8E C3 36 31 C2 AE BA 1E F0 3D 06 ..t*...61.....=.\n0x00000EA0 4F 31 23 9F 8C B5 3E 99 8B 7C 01 25 65 7A CF 6E O1#...>..|.%ez.n\n0x00000EB0 7D 0C E4 BE FE EF 9D 3C DB A3 BE 37 75 0D 11 46 }......<...7u..F\n0x00000EC0 6A 3B 9B 3C 61 0B 80 57 75 A6 A5 C3 AD 6C AE 78 j;.<a..Wu....l.x\n0x00000ED0 C1 11 83 84 5E 57 07 B9 59 34 D8 C2 89 E6 4E 92 ....^W..Y4....N.\n0x00000EE0 73 B5 58 A1 02 BF 56 8E 64 2C 83 DD 1D 2E FE 71 s.X...V.d,.....q\n0x00000EF0 17 25 C2 65 12 34 AC BB C3 9F D6 44 DD 7C AA A8 .%.e.4.....D.|..\n0x00000F00 B2 40 79 3A 2C 6C 4D FA 34 F1 AE C0 D8 E2 18 AC .@y:,lM.4.......\n0x00000F10 7B 42 37 CA 99 DC C6 C2 07 38 3B C2 F4 ED 5D B3 {B7......8;...].\n0x00000F20 39 80 DC 0D 45 0F 47 D7 A5 E8 C1 41 E1 4F C3 17 9...E.G....A.O..\n0x00000F30 B9 33 19 A6 B1 48 11 7D BB F1 BF 99 A9 CF 74 93 .3...H.}......t.\n0x00000F40 8B 1A B0 92 39 47 16 E1 82 7D 50 DC 85 B5 AF 4B ....9G...}P....K\n0x00000F50 BB 48 8F 04 9D A8 B5 38 55 D8 6B EC 66 6A CB 54 .H.....8U.k.fj.T\n0x00000F60 88 F2 34 D4 2D CB 5F 51 12 ED 11 17 7D A9 02 AE ..4.-._Q....}...\n0x00000F70 2B 71 93 EB 0B 82 8E A9 E7 39 4F 99 90 AD 37 B4 +q.......9O...7.\n0x00000F80 19 40 46 5C 7B 0E 8A E7 DF 46 18 B2 06 90 EE FA .@F\\{....F......\n0x00000F90 D1 2F 05 B3 31 E4 5F A6 C7 23 30 0B 4B 3B 78 F5 .\/..1._..#0.K;x.\n0x00000FA0 2A 52 EB FD 3D A6 8A 99 AB 4C 3E 9D 62 D3 CB 3F *R..=....L>.b..?\n0x00000FB0 77 B3 2D 66 30 E8 ED 34 0A FC 75 29 1B 9A 67 26 w.-f0..4..u)..g&\n0x00000FC0 4A AD E0 0A E3 47 1B 39 DF 8C 0E 02 3F 82 36 8B J....G.9....?.6.\n0x00000FD0 A5 F7 68 A8 9F 43 D7 6B 27 3D D6 A2 F6 90 09 40 ..h..C.k'=.....@\n0x00000FE0 8E D4 C1 73 68 47 E2 0F 5B 0C B7 BB 8A 6C E5 76 ...shG..[....l.v\n0x00000FF0 29 2F D9 A2 65 50 9C 5D 00 64 20 17 0E 76 98 23 )\/..eP.].d...v.#\n0x00001000 87 83 BD DA B4 34 30 0A F0 9D 73 D2 2D 4A F8 53 .....40...s.-J.S\n0x00001010 98 BB EF 5A 12 13 51 7C 65 74 25 2B 1B 52 0C 99 ...Z..Q|et%+.R..\n0x00001020 2F D1 74 BE B0 BD 4A 48 E2 18 A9 F5 B4 B2 7C AA \/.t...JH......|.\n0x00001030 B6 A5 3B 05 D5 C7 D3 CE DD 95 2B 0A 4C 15 90 5E ..;.......+.L..^\n0x00001040 B2 21 EE 1F 7E B4 23 71 A5 72 9B 0C 66 BA 0E 11 .!....#q.r..f...\n0x00001050 60 BC AB 5E 94 70 9C E7 1A 31 4F A0 34 FD 2A 13 `..^.p...1O.4.*.\n0x00001060 0D 64 4C 57 CE 4F 9F 2D 58 87 70 CD 2F 6A 55 FB .dLW.O.-X.p.\/jU.\n0x00001070 0B 9B EB 93 35 8A 91 C1 44 03 9C 0E DB 95 BA 84 ....5...D.......\n0x00001080 DD 40 FB F8 88 47 E4 D2 B8 EB 07 39 00 10 29 C7 .@...G.....9..).\n0x00001090 FD EC 49 93 44 EC 0B AB 1F 02 8D 64 64 B1 D4 C3 ..I.D......dd...\n0x000010A0 87 DA 51 AA 3B 2C 6B C5 E5 67 C1 C7 29 33 4C 25 ..Q.;,k..g..)3L%\n0x000010B0 EE 8E CA 07 A2 A5 11 0F 1A A0 05 DA 65 77 7E C5 ............ew..\n0x000010C0 A1 63 5A B1 C3 0B 25 E8 4F 39 9E A3 25 4E A7 81 .cZ...%.O9..%N..\n0x000010D0 10 9B BF D9 95 72 D3 E7 D5 5A 5F 10 51 D3 1E A7 .....r...Z_.Q...\n0x000010E0 5E B8 AB C6 C4 08 6C BB 2D 36 02 15 44 AE F3 50 ^.....l.-6..D..P\n0x000010F0 C6 A3 57 F8 BB 9F A8 E0 7E A0 52 39 A7 3E 47 4D ..W.......R9.>GM\n0x00001100 2E 89 8A BA FF 8A AB 57 2F 54 CE A4 86 91 74 67 .......W\/T....tg\n0x00001110 98 8C 68 3B 16 F8 E4 D1 88 F3 2F 38 6F DE 88 B3 ..h;......\/8o...\n0x00001120 53 7B E9 81 29 2D 54 61 5D AC EF 13 1C C1 15 1E S{..)-Ta].......\n0x00001130 6B EE DC D3 ED 66 06 49 0C 3C 8B 1F DE 2E 17 5C k....f.I.<.....\\\n0x00001140 F8 F2 EA EC 3F 89 4B 46 79 D3 26 C9 48 61 8F 02 ....?.KFy.&.Ha..\n0x00001150 23 66 40 56 A4 B1 85 3D 40 4B E8 80 21 BE 68 9B #f@V...=@K..!.h.\n0x00001160 5F 1F 49 63 D4 65 A9 B6 BF 16 EB CB E9 36 12 88 _.Ic.e.......6..\n0x00001170 3D 5B 45 0E C2 FC 44 B0 9A 4D 30 20 6E 56 EC 7F =[E...D..M0.nV..\n0x00001180 51 97 4B D6 50 3E 16 3B C9 C4 74 B2 D3 85 03 5F Q.K.P>.;..t...._\n0x00001190 C2 A0 AA 3B 5B EC 33 17 55 66 A5 E2 6C C4 B9 57 ...;[.3.Uf..l..W\n0x000011A0 38 08 AD 63 EE 76 B7 A4 A2 4C E7 FC E2 FD 6C 54 8..c.v...L....lT\n0x000011B0 1A E3 3A C2 12 5E CD 98 B3 DC FE 7A 31 90 C6 93 ..:..^.....z1...\n0x000011C0 46 FD D1 F9 6F AE 0B C4 59 8B 79 54 C6 6D AB 6E F...o...Y.yT.m.n\n0x000011D0 B1 97 D5 3F 5D 67 7C DA FC 98 D8 97 99 85 85 E1 ...?]g|.........\n0x000011E0 16 5C 1A AD 06 78 63 CB 14 66 AD 0F 1E 88 85 0C .\\...xc..f......\n0x000011F0 32 8E 66 26 46 FD 85 F1 B8 D3 9F ED 94 23 90 30 2.f&F........#.0\n0x00001200 23 1C 78 5C 7E F7 AC A6 AD 38 29 92 08 D0 50 AA #.x\\.....8)...P.\n0x00001210 3B A6 37 63 38 2B 9D E7 5D B2 62 50 02 AC FC 43 ;.7c8+..].bP...C\n0x00001220 E1 66 B5 37 5A D9 08 05 90 B4 CA BF 2B 10 FD CA .f.7Z.......+...\n0x00001230 2F C1 FC 07 32 5F 1F F5 D9 9A 9F 39 02 EC 98 D2 \/...2_.....9....\n0x00001240 D3 1C 4E 2A 56 C3 35 A9 30 5D B0 AC 36 5D D7 4F ..N*V.5.0]..6].O\n0x00001250 5B 53 1F 74 6A B8 82 7E 04 22 65 C3 8C A1 99 4A [S.tj....\"e....J\n0x00001260 57 10 E3 98 EE 1D 5C D9 AC 7B 4C 17 D8 E6 74 86 W.....\\..{L...t.\n0x00001270 F7 45 1D A4 D8 95 F2 6E 6F 0B F2 68 AF 6B 74 B2 .E.....no..h.kt.\n0x00001280 67 8A 1B 43 26 18 EE E5 0F 87 45 24 98 49 E1 AB g..C&.....E$.I..\n0x00001290 8F B0 57 33 A0 ED 18 16 A6 EF F0 9A 7E AB 85 35 ..W3...........5\n0x000012A0 AD D7 38 97 CB 80 D6 F2 30 BD DC 87 E4 BF 63 EC ..8.....0.....c.\n0x000012B0 99 74 AE 68 95 EC D6 A3 70 B7 C8 D7 7F B1 B4 A7 .t.h....p.......\n0x000012C0 34 D8 17 91 C2 46 C5 B8 35 1A AA B7 D0 05 F7 FC 4....F..5.......\n0x000012D0 09 44 31 B0 0F 8D FA C5 6C 76 2E 6B 7F 19 25 D8 .D1.....lv.k..%.\n0x000012E0 6C 4A D9 85 17 8E CD 94 6C 12 56 47 47 65 59 F8 lJ......l.VGGeY.\n0x000012F0 5B D7 00 42 97 0E 70 1D C3 3A AB 22 1A 75 B5 A1 [..B..p..:.\".u.." ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: javax.crypto.spec.SecretKeySpec
Args: [ "\n0x00000000 AD 30 AE 7D 0C 88 1F DB 69 BF 49 45 21 67 9C E2 .0.}....i.IE!g..", "AES" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: doFinal
Args: [ "\n0x00000000 D3 A9 5B 46 B1 50 CB D6 77 37 08 C2 3D F0 C1 6F ..[F.P..w7..=..o\n0x00000010 05 9D 50 B9 84 87 D8 90 6C 22 46 E3 C2 06 7A BE ..P.....l\"F...z." ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: javax.crypto.spec.SecretKeySpec
Args: [ "\n0x00000000 AD 30 AE 7D 0C 88 1F DB 69 BF 49 45 21 67 9C E2 .0.}....i.IE!g..", "AES" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: doFinal
Args: [ "\n0x00000000 C6 75 22 EB 66 D1 26 F4 D1 62 B4 B4 70 CE C5 71 .u\".f.&..b..p..q\n0x00000010 4C 7D C6 5B 40 E2 F6 9B 4A F4 7C 30 29 5F 98 49 L}.[@...J.|0)_.I" ]
Return: No Return Data
-----------------------------------------------------------------------------
**********************账户、应用管理***********************
**********************通话、wifi接口***********************
Method: getNetworkOperator
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getNetworkOperatorName
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getSimCountryIso
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getNetworkOperatorName
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getNetworkCountryIso
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getNetworkOperator
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getNetworkOperatorName
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getNetworkCountryIso
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getNetworkCountryIso
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getNetworkOperator
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
**********************dalvik组件调用***********************
Method: dalvik.system.DexFile
Args: [ "\/system\/framework\/com.android.location.provider.jar" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexFile
Args: [ { "path": "\/system\/framework\/com.android.location.provider.jar" } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexFile
Args: [ "\/system\/framework\/com.android.media.remotedisplay.jar" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexFile
Args: [ { "path": "\/system\/framework\/com.android.media.remotedisplay.jar" } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexFile
Args: [ "\/data\/app\/com.google.android.gms-1.apk" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexFile
Args: [ { "path": "\/data\/app\/com.google.android.gms-1.apk" } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.PathClassLoader
Args: [ "\/system\/framework\/com.android.location.provider.jar:\/system\/framework\/com.android.media.remotedisplay.jar:\/data\/app\/com.google.android.gms-1.apk", "\/data\/app-lib\/com.google.android.gms-1", { "packages": { "com.android.org.conscrypt": { "implTitle": "Unknown", "implVendor": "Unknown", "implVersion": "0.0", "name": "com.android.org.conscrypt", "specTitle": "Unknown", "specVendor": "Unknown", "specVersion": "0.0" } } } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexFile
Args: [ "\/data\/data\/com.dumplingsandwich.pencilsketch\/cache\/ads1463872402.jar", "\/data\/data\/com.dumplingsandwich.pencilsketch\/cache\/ads1463872402.dex", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: loadDex
Args: [ "\/data\/data\/com.dumplingsandwich.pencilsketch\/cache\/ads1463872402.jar", "\/data\/data\/com.dumplingsandwich.pencilsketch\/cache\/ads1463872402.dex", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexClassLoader
Args: [ "\/data\/data\/com.dumplingsandwich.pencilsketch\/cache\/ads1463872402.jar", "\/data\/data\/com.dumplingsandwich.pencilsketch\/cache", "dalvik.system.PathClassLoader[DexPathList[[zip file \"\/data\/app\/com.dumplingsandwich.pencilsketch-1.apk\"],nativeLibraryDirectories=[\/data\/app-lib\/com.dumplingsandwich.pencilsketch-1, \/system\/lib]]]" ]
Return: No Return Data
-----------------------------------------------------------------------------
*************************创建进程*************************
************************数据库读写************************
Method: put
Args: [ "fb_attribution" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "first_run", "true" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "first_android_id", "6d5ebccdd1a030ff" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "first_telephony_id" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "pack_identifier", "com.aviary.effectpack.04" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "pack_type", "effect" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "pack_versionKey", "53a0643f5920039d84000167" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "pack_visible", "1" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "pack_displayOrder", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "content_displayName", "Original" ]
Return: No Return Data
-----------------------------------------------------------------------------
*************************短信接口*************************
*************************网络接入*************************
***************************URL****************************
URL (0): file:///data/local/tmp/test.apk
URL (1): http://cds-gateway.aviary.com/v1/gateway/manifest?apiKey=5bdd636e3694470fa58e0ea0f195e0d3&contentGroup=I&country=US&formFactor=phone&language=en&osVersion=19&platform=android&resolution=xhigh&sdkVersion=4.1.1&versionKey=0&signature=XXqvj
URL (2): file:///android
URL (3): http://assets.aviary.com/cdsv2/testcontent/com.aviary.effectpack.04/images.androidFeatureImage.81f193b2-d02c-4dba-8811-31a77b359fbb.980.jpg
URL (4): http://assets.aviary.com/cdsv2/assets/com.aviary.effectpack.04/zips.androidPreviewPhoneXXHiRes.4e8edf7f-538b-4afa-bb63-3f5327b51436.zip
URL (5): http://assets.aviary.com/cdsv2/testcontent/com.aviary.effectpack.04/images.androidDetailImage.dff72372-7f7e-4bc1-aa98-88ac17fb5457.1080.jpg
URL (6): http://assets.aviary.com/cdsv2/assets/com.aviary.sticker.53d185cc6b76fe302f001cde/zips.contentAndroidHiRes.0137fe97-9900-480e-bacc-51ed4128ca46.zip
URL (7): http://assets.aviary.com/cdsv2/assets/com.aviary.sticker.53d185cc6b76fe302f001cde/images.androidFeatureImage.faedc45c-e914-4bd4-95f7-5ebeccb781be.980.jpg
URL (8): http://assets.aviary.com/cdsv2/assets/com.aviary.frame.53ced8b78abeb3083b001e4a/zips.contentAndroidHiRes.51b9118e-1527-4a42-bea9-856adff83db3.zip
URL (9): http://assets.aviary.com/cdsv2/assets/com.aviary.frame.53ced8b78abeb3083b001e4a/images.androidFeatureImage.31ad3bc8-af49-4a00-9445-1463854ad589.980.jpg
URL (10): http://assets.aviary.com/cdsv2/assets/com.aviary.overlay.54384c3ffd87927c3c000001/zips.contentAndroidHiRes.636f77f1-da87-48da-a294-377e0fc1d5d7.zip
URL (11): http://assets.aviary.com/cdsv2/assets/com.aviary.overlay.54384c3ffd87927c3c000001/images.androidFeatureImage.d4f40ea1-14ce-43f4-b091-c0968b743e31.980.jpg
URL (12): http://assets.aviary.com
URL (13): http://cds-gateway.aviary.com/v1/gateway/manifest?apiKey=5bdd636e3694470fa58e0ea0f195e0d3&contentGroup=I&country=US&formFactor=phone&language=en&osVersion=19&platform=android&resolution=xhigh&sdkVersion=4.1.1&versionKey=0&signature=XXqvj%2FCIJGKzXX5%2BjHLyXoWbbya2ofnubXLh%2FHkIMnU%3D
*************************E-mail***************************
**********************创建的xml文件************************
XmlFilePath (0): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/shared_prefs/com.aviary.android.feather.standalone.xml
XmlFilePath (1): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/shared_prefs/CommonLearnedSettings.xml
XmlFilePath (2): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/shared_prefs/Foundation.xml
XmlFilePath (3): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/shared_prefs/multidex.version.xml
XmlFilePath (4): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/shared_prefs/SDKIDFA.xml
XmlFilePath (5): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/shared_prefs/adb_foundation_auth_aes_preference.xml
XmlFilePath (6): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/shared_prefs/FBAdPrefs.xml
*********************创建的sqlite文件**********************
SQLiteDBFilePath (0): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/databases/com.localytics.android.a94e5b5d646d8f1a0facee025f0d598625a47cc18f768c05010e993f8e930ec3.sqlite
SQLiteDBFilePath (1): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/databases/aviarycds.sqlite
SQLiteDBFilePath (2): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/app_webview/Web Data
SQLiteDBFilePath (3): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/app_webview/Cookies
*************************其他文件*************************
OtherFilePath (0): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/ab/.alpha-beta
OtherFilePath (1): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.overlay.54384c3ffd87927c3c000001/icon/images.largeIcon.e9d184f0-e91d-46e1-afc2-56096684a954.300.png.png
OtherFilePath (2): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/icon/images.largeIcon.be9be7e9-745f-4234-a84b-b0e043618328.300.jpg.png
OtherFilePath (3): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default12.json
OtherFilePath (4): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default2.json
OtherFilePath (5): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default13.json
OtherFilePath (6): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default8.json
OtherFilePath (7): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default5.json
OtherFilePath (8): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default9.json
OtherFilePath (9): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default7.json
OtherFilePath (10): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default6.json
OtherFilePath (11): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default1.json
OtherFilePath (12): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default3.json
OtherFilePath (13): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default10.json
OtherFilePath (14): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/default11.json
OtherFilePath (15): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.effectpack.04/pack_content/status.json
OtherFilePath (16): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.frame.53ced8b78abeb3083b001e4a/icon/images.largeIcon.7b749c3b-f657-4c39-8919-9f065caef753.300.png.png
OtherFilePath (17): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/files/cdsv2/com.aviary.sticker.53d185cc6b76fe302f001cde/icon/images.largeIcon.593086a0-76eb-44a5-9285-2459e4660bd8.300.png.png
OtherFilePath (18): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/databases/aviarycds.sqlite-journal
OtherFilePath (19): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/databases/com.localytics.android.a94e5b5d646d8f1a0facee025f0d598625a47cc18f768c05010e993f8e930ec3.sqlite-journal
OtherFilePath (20): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp1678111673.tmp
OtherFilePath (21): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp-1096916608.tmp
OtherFilePath (22): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp1986879173.tmp
OtherFilePath (23): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp-240558631.tmp
OtherFilePath (24): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp1464976026.tmp
OtherFilePath (25): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp1411279705.tmp
OtherFilePath (26): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp-680616515.tmp
OtherFilePath (27): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp1128185213.tmp
OtherFilePath (28): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp1793534730.tmp
OtherFilePath (29): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp-1734855744.tmp
OtherFilePath (30): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp-1374984886.tmp
OtherFilePath (31): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp-2121127486.tmp
OtherFilePath (32): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp1463872402.tmp
OtherFilePath (33): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp18448745.tmp
OtherFilePath (34): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp28316938.tmp
OtherFilePath (35): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp267241764.tmp
OtherFilePath (36): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/cache/temp687705423.tmp
OtherFilePath (37): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/app_webview/Cookies-journal
OtherFilePath (38): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/app_webview/Web Data-journal
OtherFilePath (39): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/app_webview/Cache/378305f4b1f37156_2
OtherFilePath (40): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/app_webview/Cache/the-real-index
OtherFilePath (41): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/app_webview/Cache/378305f4b1f37156_1
OtherFilePath (42): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/app_webview/Cache/index
OtherFilePath (43): ./DeviceData/data/data/com.dumplingsandwich.pencilsketch/app_webview/Cache/378305f4b1f37156_0
