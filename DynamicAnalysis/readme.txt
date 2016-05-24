模块功能：

使用虚拟机和网络代理对apk进行动态分析
对apk的所有Activity和所有可外部调用的activity进行逐一测试
检测其中的API调用（例如：base64加密、文件读写、网络请求、账户管理、系统调用等）、URL请求、Email信息、创建的xml文件、sqlite数据库使用等

**********************

文件结构：

--activity_screenshots                 /*所有活动测试运行时截图文件夹*/
--DeviceData 			       /*APK运行时产生的数据文件夹*/
--exported_screenshots		       /*所有可外部调用活动运行时截图文件夹*/
--WebProxy 			       /*Tornado（可扩展的非阻塞式 web 服务器）代理web服务器*/
   |--proxydata			       /*apk运行时web请求数据存储文件夹*/
       |--requestdb                    /*所有的apk请求文件*/
       |--urls			       /*所有web请求中的url*/
       |--WebTraffic.txt	       /*所有web代理的数据流*/
   |--pyWebProxy  		       /*web代理服务器运行脚本*/
   |--startproxy.py  		       /*代理服务器启动脚本*/#运行指令：python startproxy.py -i [ip address] -p [port]
--com.tencent.mobileqq.tar             /*apk运行时产生的数据文件的压缩包*/
--dump.txt                             /*虚拟机安卓系统运行报告*/
--errorlog.txt                         /*虚拟机安卓系统错误日志*/
--logcat.txt			       /*虚拟几安卓系统运行日志*/
--webproxy.log			       /*web代理服务器运行日志*/

--base64.h			       /*base64编码解码头文件*/
--base64.cpp 			       /*base64编码解码源文件*/
--gci-json.h			       /*json数据包操作头文件*/
--gci-json.cc			       /*json数据包操作源文件*/
--dynamicanalysis.h                    /*动态分析头文件*/
--dynamicanalysis.cpp                  /*动态分析源文件*/

--test.cpp			       /*C++源文件/*程序入口*/
--test				       /*可执行文件*/

**********************

编译环境：
Ubuntu 15.10
g++ 5.2.1
python 2.7.10
python第三方包 tornado 4.1			（获取：pip install tornado)
Oracle Virtual Box 5.0.18			（获取：https://www.virtualbox.org/wiki/Download_Old_Builds_5_0）
MobSF_VM_0.2.ova 安卓虚拟机			（获取：https://drive.google.com/file/d/0B_Ci-1YbMqshUnhHOU1LTDllRUE/view）
adb工具(Android Debug Bridge version 1.0.31)	（获取：sudo apt-get install android-tools-adb)

**********************

编译方法：

终端下输入g++ test.cpp dynamicanalysis.cpp gci-json.cc base64.cpp -o test

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
************************Base64加密************************
Method: encode
Args: [ "classes2.dex99081041463829474000", "0", "32", "0" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encode
Args: [ "classes2.dex99081041463829474000", "0" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encodeToString
Args: [ "classes2.dex99081041463829474000", "0" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encode
Args: [ "classes3.dex105001921463829475000", "0", "33", "0" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encode
Args: [ "classes3.dex105001921463829475000", "0" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encodeToString
Args: [ "classes3.dex105001921463829475000", "0" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encode
Args: [ "classes5.dex83238641463829475000", "0", "32", "0" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encode
Args: [ "classes5.dex83238641463829475000", "0" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encodeToString
Args: [ "classes5.dex83238641463829475000", "0" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
Method: encode
Args: [ "classes2.dex99081041463829474000", "0", "32", "0" ]
Return: No Return Data
Info: 
-----------------------------------------------------------------------------
*************************文件读写*************************
Method: open
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes4.jar", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/proc\/meminfo", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/suicide_count", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/proc\/meminfo", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/app\/com.tencent.mobileqq-1.apk", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/com.tencent.mobileqq_2492", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes2.dex.MD5", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.tencent.mobileqq\/app_dex\/classes2\/temp_classes2.dat", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/com.tencent.mobileqq_2492", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: open
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes3.dex.MD5", "577" ]
Return: No Return Data
-----------------------------------------------------------------------------
*************************java反射*************************
Method: invoke
Args: [ "com.tencent.mobileqq_preferences", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "troop_notification_sp", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "so_sp", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "com.tencent.mobileqq_preferences", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "ro.lewa.version" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "share", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "com.tencent.mobileqq_preferences", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "ro.lewa.version" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "share", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: invoke
Args: [ "mobileQQ", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
***********************系统组件调用************************
Method: get
Args: [ "persist.sys.timezone" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: get
Args: [ "dalvik.vm.heapgrowthlimit", "" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: get
Args: [ "dalvik.vm.heapsize", "16m" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: get
Args: [ "debug.second-display.pkg" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: get
Args: [ "persist.sys.timezone" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: get
Args: [ "dalvik.vm.heapgrowthlimit", "" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: get
Args: [ "dalvik.vm.heapsize", "16m" ]
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
Method: get
Args: [ "persist.sys.timezone" ]
Return: No Return Data
-----------------------------------------------------------------------------
*************************后台进程*************************
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.SCREEN_ON", "android.intent.action.SCREEN_OFF" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.SCREEN_ON", "android.intent.action.SCREEN_OFF" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.SCREEN_ON", "android.intent.action.SCREEN_OFF" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.SCREEN_ON", "android.intent.action.SCREEN_OFF" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.SCREEN_ON", "android.intent.action.SCREEN_OFF" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.SCREEN_ON", "android.intent.action.SCREEN_OFF" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ "com.tencent.theme.SkinEngine$1@52824870", { "mActions": [ "com.tencent.qplus.THEME_UPDATE" ], "mHasPartialTypes": false, "mPriority": 0 }, "com.tencent.msg.permission.pushnotify" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.SCREEN_ON", "android.intent.action.SCREEN_OFF" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ { "mDebugUnregister": false }, { "mActions": [ "android.intent.action.SCREEN_ON", "android.intent.action.SCREEN_OFF" ], "mHasPartialTypes": false, "mPriority": 0 } ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: registerReceiver
Args: [ "com.tencent.theme.SkinEngine$1@528161fc", { "mActions": [ "com.tencent.qplus.THEME_UPDATE" ], "mHasPartialTypes": false, "mPriority": 0 }, "com.tencent.msg.permission.pushnotify" ]
Return: No Return Data
-----------------------------------------------------------------------------
*************************加密接口*************************
Method: doFinal
Args: [ "7dd8ea8385cc8e32" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: javax.crypto.spec.SecretKeySpec
Args: [ "7dd8ea8385cc8e32", "AES" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: doFinal
Args: [ "\n0x00000000 1F 8B 08 00 00 00 00 00 00 00 65 4D 4D 4B C3 40 ..........eMMK.@\n0x00000010 14 CC A2 A6 7E E4 D0 53 3D 09 39 ED A9 84 FD DE .......S=.9.....\n0x00000020 34 B8 E0 1E AC 20 18 04 A5 F7 24 BB 81 60 BA B1 4.........$..`..\n0x00000030 36 6D BD 08 FE 00 CF E2 2F 10 C1 BB 7F AF 6E BD 6m......\/.....n.\n0x00000040 3A 0F DE 30 F3 86 37 41 00 E4 70 6F 7C 7E 01 66 :..0..7A..po|..f\n0x00000050 FB BD 5D F6 F5 DF 7E 09 00 38 3D 0C 40 18 1A DB ..]......8=.@...\n0x00000060 17 4D 7B E6 F5 E0 38 00 A3 21 BA 23 08 DD E4 D7 .M{...8..!.#....\n0x00000070 F7 29 92 33 7A 75 09 8F 44 42 77 C3 53 11 96 B6 .).3zu..DBw.S...\n0x00000080 A8 3A 37 3D 20 DE 60 B7 66 1E 44 8F DB D7 ED FB .:7=..`.f.D.....\n0x00000090 20 B7 CF AB 65 CC 3F 47 DA 99 A7 AE 31 31 4B 58 ....e.?G....11KX\n0x000000A0 42 C6 AD 5D DB 36 C6 93 9F 6F 4D 14 E5 98 71 4C B..].6...oM...qL\n0x000000B0 50 CA 10 26 58 40 8D 15 46 1E 50 33 C5 08 47 44 P..&X@..F.P3..GD\n0x000000C0 4E B8 0F 70 4C A1 A6 FF D3 42 AA AA 9B 27 BD 75 N..pL....B...'.u\n0x000000D0 95 75 7D 32 EF CA A6 B5 8B 85 3F 28 84 32 22 32 .u}2......?(.2\"2\n0x000000E0 2A 33 2C 33 5A 65 12 7B 33 DD 3D F7 2C D4 14 6A *3,3Ze.{3.=.,..j\n0x000000F0 A9 84 E1 B6 AC 2A 63 70 81 28 AA 6B A8 53 AE 72 .....*cp.(.k.S.r\n0x00000100 5F 44 D5 A6 A9 1B A8 09 55 2B F7 E0 BA 8D 3B 79 _D......U+....;y\n0x00000110 FB 88 BE A2 5F EC 5B 5B E6 37 01 00 00          ...._.[[.7..." ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: doFinal
Args: [ "96b3773d8b30781d" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: javax.crypto.spec.SecretKeySpec
Args: [ "*^@K#K@!", "DES" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: javax.crypto.spec.SecretKeySpec
Args: [ "*^@K#K@!", "DES" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: doFinal
Args: [ "\n0x00000000 1F 8B 08 00 00 00 00 00 00 00 6D 8A 31 0B 82 40 ..........m.1..@\n0x00000010 18 86 3F B5 04 B5 A1 21 BE B9 C9 29 C4 EF 3A EF ..?....!...)..:.\n0x00000020 74 74 89 F6 0A 1A 23 3D 44 38 3D 14 8B FE 67 7F tt....#=D8=...g.\n0x00000030 A8 B3 31 7A 87 97 E7 81 07 5C DC 54 A6 4B 26 D5 ..1z.....\\.T.K&.\n0x00000040 57 AA 9F 92 CE DC 5B AD 86 21 86 02 9C D0 03 70 W.....[..!.....p\n0x00000050 CE EF E0 86 6B 27 5E 52 6A 27 FE D6 07 B8 AE A2 ....k'^Rj'......\n0x00000060 23 04 BE 5B 32 0C 59 2A 89 E5 73 6D 9D 7E 5C 20 #..[2.Y*..sm..\\.\n0x00000070 D8 CF D0 7B E5 C2 82 44 BF 31 A6 D1 CA F7 4A DA ...{...D.1....J.\n0x00000080 E3 62 1A 1F 5F CC D0 BD 9C 2C 30 8E 58 F6 F5 68 .b.._....,0.X..h\n0x00000090 DA 7A CB 13 9E B0 9D 56 4F A5 B7 54 CC 95 C4 88 .z.....VO..T....\n0x000000A0 24 C9 4C 70 46 C4 3E 17 BA 1E 71 CC 00 00 00    $.LpF.>...q...." ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: doFinal
Args: [ "\n0x00000000 1F 8B 08 00 00 00 00 00 00 00 63 60 12 93 48 CE ..........c`..H.\n0x00000010 CF D5 2B 49 CD 4B 4E CD 2B D1 CB CD 4F CA CC 49 ..+I.KN.+...O..I\n0x00000020 2D 2C B4 F2 0D 76 53 63 B0 64 60 E4 62 66 60 60 -,...vSc.d`.bf``\n0x00000030 0C B9 CC 99 D0 29 C0 A8 C6 6A 68 00 04 66 38 75 .....)...jh..f8u\n0x00000040 B8 31 44 F0 70 7B 30 70 B2 31 39 1A 89 71 19 19 .1D.p{0p.19..q..\n0x00000050 98 1B 1A 59 80 74 00 F9 86 68 7C 33 31 06 20 69 ...Y.t...h|31..i\n0x00000060 2A C6 5C 61 61 06 64 98 8B B1 A5 E7 E7 A7 E7 A4 *.\\aa.d.........\n0x00000070 B2 31 3B 1A 1A 8B B1 94 14 95 82 99 A6 62 4C A1 .1;..........bL.\n0x00000080 C1 40 86 91 89 98 98 63 5E 4A 51 7E 66 8A 82 89 .@.....c^JQ.f...\n0x00000090 9E 89 9E 91 4E 4E 6A 59 6A 8E 82 A1 25 48 95 B9 ....NNjYj...%H..\n0x000000A0 18 B7 A1 B9 A1 B9 A9 99 89 91 A1 A1 11 00 71 5E ..............q^\n0x000000B0 CC FC D4 00 00 00                               ......" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: javax.crypto.spec.SecretKeySpec
Args: [ "96b3773d8b30781d", "AES" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: doFinal
Args: [ "\n0x00000000 1F 8B 08 00 00 00 00 00 00 00 65 4D CB 4A C3 40 ..........eM.J.@\n0x00000010 14 4D 50 E3 A3 59 74 D5 8D 08 59 CD AA 84 79 4F .MP..Yt...Y...yO\n0x00000020 1A 1D 70 16 56 10 1A 84 4A F7 49 66 02 C1 64 62 ..p.V...J.If..db\n0x00000030 6D 6A DD 08 7E 80 6B F1 0B C4 9D 3B 7F AF 4E DD mj....k....;..N.\n0x00000040 7A 0F DC C3 79 C0 F1 3C FF 7C B8 37 BE B8 F4 17 z...y..<.|.7....\n0x00000050 FB BD 59 F5 D5 DF 7F F1 7C FF F4 C8 F3 83 40 9B ..Y.....|.....@.\n0x00000060 3E AF 9B 33 A7 07 27 9E 3F 1A C2 39 86 70 96 DD >..3..'.?..9.p..\n0x00000070 DC 25 50 2C C8 F5 15 38 E6 31 D9 81 25 3C 28 4C .%P,...8.1..%<(L\n0x00000080 5E 76 76 7A 80 9D 41 6F 75 EB 85 0F DB D7 ED FB ^vvz..Aou.......\n0x00000090 61 66 9E D7 AB 88 7D 8E 94 D5 8F 5D AD 23 1A D3 af....}....].#..\n0x000000A0 18 8F 1B F3 64 9A 08 4D 7E BE 15 96 84 21 CA 10 ....d..M.....!..\n0x000000B0 86 09 85 08 23 0E 14 92 08 BA 03 8A 4A 8A 19 C4 ....#.......J...\n0x000000C0 18 91 09 75 24 80 22 FF DB 5C C8 B2 6B E3 DE D8 ...u$.\"..\\..k...\n0x000000D0 D2 D8 3E 6E BB A2 6E CC 72 99 CE E6 53 17 4A 08 ..>n..n.r...S.J.\n0x000000E0 53 CC 53 22 52 24 52 52 A6 02 39 33 D9 0D 38 E6 S.S\"R$RR..93..8.\n0x000000F0 D2 55 84 E4 9A 99 A2 2C B5 46 39 24 B0 AA 80 4A .U.....,.F9$...J\n0x00000100 98 CC DC 18 91 9B BA AA 81 C2 44 AE ED BD ED 36 ..........D....6\n0x00000110 76 F0 F6 11 7E 85 BF 87 9A C4 45 3B 01 00 00    v.........E;..." ]
Return: No Return Data
-----------------------------------------------------------------------------
**********************账户、应用管理***********************
**********************通话、wifi接口***********************
Method: getDeviceId
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getDeviceId
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getSubscriberId
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
Method: getSimCountryIso
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getDeviceId
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getDeviceId
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getSubscriberId
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: getNetworkOperatorName
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
**********************dalvik组件调用***********************
Method: dalvik.system.DexFile
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes4.jar", "\/data\/data\/com.tencent.mobileqq\/app_dex\/classes4.dex", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: loadDex
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes4.jar", "\/data\/data\/com.tencent.mobileqq\/app_dex\/classes4.dex", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexClassLoader
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes4.jar", "\/data\/data\/com.tencent.mobileqq\/app_dex", "\/data\/data\/com.tencent.mobileqq\/files\/classes4.jar", "dalvik.system.PathClassLoader[DexPathList[[zip file \"\/system\/framework\/com.google.android.media.effects.jar\", zip file \"\/data\/app\/com.tencent.mobileqq-1.apk\"],nativeLibraryDirectories=[\/data\/app-lib\/com.tencent.mobileqq-1, \/system\/lib]]]" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexFile
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes4.jar", "\/data\/data\/com.tencent.mobileqq\/app_dex\/classes4.dex", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: loadDex
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes4.jar", "\/data\/data\/com.tencent.mobileqq\/app_dex\/classes4.dex", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexClassLoader
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes4.jar", "\/data\/data\/com.tencent.mobileqq\/app_dex", "\/data\/data\/com.tencent.mobileqq\/files\/classes4.jar", "dalvik.system.PathClassLoader[DexPathList[[zip file \"\/system\/framework\/com.google.android.media.effects.jar\", zip file \"\/data\/app\/com.tencent.mobileqq-1.apk\"],nativeLibraryDirectories=[\/data\/app-lib\/com.tencent.mobileqq-1, \/system\/lib]]]" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexFile
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes2.jar", "\/data\/data\/com.tencent.mobileqq\/app_dex\/classes2\/classes2.dex", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: loadDex
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes2.jar", "\/data\/data\/com.tencent.mobileqq\/app_dex\/classes2\/classes2.dex", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexClassLoader
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes2.jar", "\/data\/data\/com.tencent.mobileqq\/app_dex\/classes2", "\/data\/data\/com.tencent.mobileqq\/files\/classes2.jar", "dalvik.system.PathClassLoader[DexPathList[[zip file \"\/system\/framework\/com.google.android.media.effects.jar\", zip file \"\/data\/app\/com.tencent.mobileqq-1.apk\", zip file \"\/data\/data\/com.tencent.mobileqq\/files\/classes4.jar\"],nativeLibraryDirectories=[\/data\/app-lib\/com.tencent.mobileqq-1, \/system\/lib]]]" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: dalvik.system.DexFile
Args: [ "\/data\/data\/com.tencent.mobileqq\/files\/classes3.jar", "\/data\/data\/com.tencent.mobileqq\/app_dex\/classes3\/classes3.dex", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
*************************创建进程*************************
Method: exec
Args: [ [ "\/system\/bin\/sh", "-c", "getprop ro.board.platform" ] ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: exec
Args: [ [ "\/system\/bin\/sh", "-c", "getprop ro.board.platform" ] ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: read
Args: 
Return: No Arguments Passed
-----------------------------------------------------------------------------
Method: read
Args: 
Return: No Arguments Passed
-----------------------------------------------------------------------------
Method: read
Args: 
Return: No Arguments Passed
-----------------------------------------------------------------------------
Method: exec
Args: [ [ "\/system\/bin\/sh", "-c", "getprop ro.board.platform" ] ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: exec
Args: [ [ "\/system\/bin\/sh", "-c", "getprop ro.board.platform" ] ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: read
Args: 
Return: No Arguments Passed
-----------------------------------------------------------------------------
Method: read
Args: 
Return: No Arguments Passed
-----------------------------------------------------------------------------
Method: read
Args: 
Return: No Arguments Passed
-----------------------------------------------------------------------------
************************数据库读写************************
Method: put
Args: [ "_prority", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "_time", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "_type", "6" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "_datas", "\n0x00000000 AC ED 00 05 73 72 00 18 63 6F 6D 2E 74 65 6E 63 ....sr..com.tenc\n0x00000010 65 6E 74 2E 62 65 61 63 6F 6E 2E 61 2E 61 2E 66 ent.beacon.a.a.f\n0x00000020 FD DA E3 69 A1 63 C1 48 02 00 0A 49 00 01 61 4A ...i.c.H...I..aJ\n0x00000030 00 01 62 4A 00 01 63 4A 00 01 64 4A 00 01 65 4A ..bJ..cJ..dJ..eJ\n0x00000040 00 01 66 4A 00 01 67 4A 00 01 68 4A 00 01 69 4A ..fJ..gJ..hJ..iJ\n0x00000050 00 01 6A 78 70 00 00 00 00 00 00 01 54 D3 09 5B ..jxp.......T..[\n0x00000060 A1 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................\n0x00000070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................\n0x00000080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................\n0x00000090 00 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF ................\n0x000000A0 FF                                              ." ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "_length", "161" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "_prority", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "_time", "0" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "_type", "6" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "_datas", "\n0x00000000 AC ED 00 05 73 72 00 18 63 6F 6D 2E 74 65 6E 63 ....sr..com.tenc\n0x00000010 65 6E 74 2E 62 65 61 63 6F 6E 2E 61 2E 61 2E 66 ent.beacon.a.a.f\n0x00000020 FD DA E3 69 A1 63 C1 48 02 00 0A 49 00 01 61 4A ...i.c.H...I..aJ\n0x00000030 00 01 62 4A 00 01 63 4A 00 01 64 4A 00 01 65 4A ..bJ..cJ..dJ..eJ\n0x00000040 00 01 66 4A 00 01 67 4A 00 01 68 4A 00 01 69 4A ..fJ..gJ..hJ..iJ\n0x00000050 00 01 6A 78 70 00 00 00 01 00 00 01 54 D3 09 5B ..jxp.......T..[\n0x00000060 A1 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................\n0x00000070 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................\n0x00000080 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................\n0x00000090 00 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF ................\n0x000000A0 FF                                              ." ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: put
Args: [ "_length", "161" ]
Return: No Return Data
-----------------------------------------------------------------------------
*************************短信接口*************************
*************************网络接入*************************
Method: execute
Args: [ { "hostname": "astrategy.beacon.qq.com", "lcHostname": "astrategy.beacon.qq.com", "port": 8080, "schemeName": "http" }, "POST http:\/\/astrategy.beacon.qq.com:8080\/analytics\/upload?mType=beacon?sid=15bf40cfe20fee5d898646db49aff460 HTTP\/1.1\nwup_version: 3.0\nTYPE_COMPRESS: 2\nencr_type: rsapost\nbea_key: MTub\/\/S9Ks76oFMh+ycjOAm9KTpVfSajlNuhyb6vfiwjgqtU7rsMO4196rvPGs58DjtbGV2B6ohkh5GzJHFvxN3\/ChKfttAyxxcTsbR5JspNu1wh9MxbnmrF6z7TzfykqdEyeve+JUDBlh70Q+O6oBYfDhcAslkukHFtUhrrkfo=\n\nü\fÕ[ðx;\u0014û\u0001\u0011\u0007ò@\u0017Ë\u000e_æ\u001f:a}TõA\u0016ÐÖuAlÏú\tª_÷\u0013 ïVSþ<®¾´1ðoø\rk\u000fãLK¬ucñDÁÎc#6w^D\u0002¬\"%åöa\u0003êÛ\u001e\"ã=$Wuw÷`a!\u001a$à¢~MHãåß¸¿``ú÷}½\u0007°", "org.apache.http.protocol.BasicHttpContext@5284ea38" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: execute
Args: [ "POST http:\/\/astrategy.beacon.qq.com:8080\/analytics\/upload?mType=beacon?sid=15bf40cfe20fee5d898646db49aff460 HTTP\/1.1\nwup_version: 3.0\nTYPE_COMPRESS: 2\nencr_type: rsapost\nbea_key: MTub\/\/S9Ks76oFMh+ycjOAm9KTpVfSajlNuhyb6vfiwjgqtU7rsMO4196rvPGs58DjtbGV2B6ohkh5GzJHFvxN3\/ChKfttAyxxcTsbR5JspNu1wh9MxbnmrF6z7TzfykqdEyeve+JUDBlh70Q+O6oBYfDhcAslkukHFtUhrrkfo=\n\nü\fÕ[ðx;\u0014û\u0001\u0011\u0007ò@\u0017Ë\u000e_æ\u001f:a}TõA\u0016ÐÖuAlÏú\tª_÷\u0013 ïVSþ<®¾´1ðoø\rk\u000fãLK¬ucñDÁÎc#6w^D\u0002¬\"%åöa\u0003êÛ\u001e\"ã=$Wuw÷`a!\u001a$à¢~MHãåß¸¿``ú÷}½\u0007°", "org.apache.http.protocol.BasicHttpContext@5284ea38" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: execute
Args: [ { "hostname": "astrategy.beacon.qq.com", "lcHostname": "astrategy.beacon.qq.com", "port": 8080, "schemeName": "http" }, "POST http:\/\/astrategy.beacon.qq.com:8080\/analytics\/upload?mType=beacon?sid=15bf40cfe20fee5d898646db49aff460 HTTP\/1.1\nwup_version: 3.0\nTYPE_COMPRESS: 2\nencr_type: rsapost\nbea_key: MTub\/\/S9Ks76oFMh+ycjOAm9KTpVfSajlNuhyb6vfiwjgqtU7rsMO4196rvPGs58DjtbGV2B6ohkh5GzJHFvxN3\/ChKfttAyxxcTsbR5JspNu1wh9MxbnmrF6z7TzfykqdEyeve+JUDBlh70Q+O6oBYfDhcAslkukHFtUhrrkfo=\n\nü\fÕ[ðx;\u0014û\u0001\u0011\u0007ò@\u0017Ë\u000e_æ\u001f:a}TõA\u0016ÐÖuAlÏú\tª_÷\u0013 ïVSþ<®¾´1ðoø\rk\u000fãLK¬ucñDÁÎc#6w^D\u0002¬\"%åöa\u0003êÛ\u001e\"ã=$Wuw÷`a!\u001a$à¢~MHãåß¸¿``ú÷}½\u0007°", "org.apache.http.protocol.BasicHttpContext@52851524" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: execute
Args: [ "POST http:\/\/astrategy.beacon.qq.com:8080\/analytics\/upload?mType=beacon?sid=15bf40cfe20fee5d898646db49aff460 HTTP\/1.1\nwup_version: 3.0\nTYPE_COMPRESS: 2\nencr_type: rsapost\nbea_key: MTub\/\/S9Ks76oFMh+ycjOAm9KTpVfSajlNuhyb6vfiwjgqtU7rsMO4196rvPGs58DjtbGV2B6ohkh5GzJHFvxN3\/ChKfttAyxxcTsbR5JspNu1wh9MxbnmrF6z7TzfykqdEyeve+JUDBlh70Q+O6oBYfDhcAslkukHFtUhrrkfo=\n\nü\fÕ[ðx;\u0014û\u0001\u0011\u0007ò@\u0017Ë\u000e_æ\u001f:a}TõA\u0016ÐÖuAlÏú\tª_÷\u0013 ïVSþ<®¾´1ðoø\rk\u000fãLK¬ucñDÁÎc#6w^D\u0002¬\"%åöa\u0003êÛ\u001e\"ã=$Wuw÷`a!\u001a$à¢~MHãåß¸¿``ú÷}½\u0007°", "org.apache.http.protocol.BasicHttpContext@52851524" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: execute
Args: [ { "hostname": "dldir1.qq.com", "lcHostname": "dldir1.qq.com", "port": -1, "schemeName": "http" }, "GET http:\/\/dldir1.qq.com\/qqfile\/qd\/RegDevLockCfg.xml?mType=ConfigCheck HTTP\/1.1\n\n" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: execute
Args: [ { "hostname": "dldir1.qq.com", "lcHostname": "dldir1.qq.com", "port": -1, "schemeName": "http" }, "GET http:\/\/dldir1.qq.com\/qqfile\/qd\/RegDevLockCfg.xml?mType=ConfigCheck HTTP\/1.1\n\n" ]
Return: No Return Data
-----------------------------------------------------------------------------
Method: openConnection
Args: [  ]
Return: No Return Data
-----------------------------------------------------------------------------
***************************URL****************************
URL (0): file:///data/local/tmp/test.apk
URL (1): http://monitor.uu.qq.com/analytics/rqdsync
URL (2): http://mn0x00000010
URL (3): http://oth.str.mdt.qq.com:8080/analytics/upload
URL (4): http://astrategn0x00000D90
URL (5): http://aeventlog.beacon.qq.com:8080/analytics/upload?mType=beacon?rid=e9818f9f1661ab35&sid=15bf40cfe20fee5d898646db49aff460
URL (6): http://astrategy.beacon.qq.com:8080/analytics/upload?mType=beacon?sid=15bf40cfe20fee5d898646db49aff460
URL (7): http://aeventlog.beacon.qq.com:8080/analytics/upload?mType=beacon?rid=93770da5764dff66&sid=15bf40cfe20fee5d898646db49aff460
URL (8): http://aeventlog.beacon.qq.com:8080/analytics/upload?mType=beacon?rid=b6b96812566a580e&sid=15bf40cfe20fee5d898646db49aff460
URL (9): http://dldir1.qq.com/qqfile/qd/RegDevLockCfg.xml?mType=ConfigCheck
URL (10): file:///data/data/com.tencent.mobileqq/files/RegDevLockCfg.xml
URL (11): http://aeventlog.beacon.qq.com:8080/analytics/upload?mType=beacon?rid=0c791797f8f9ba98&sid=15bf40cfe20fee5d898646db49aff460
*************************E-mail***************************
Email (0): Tv@H.G
**********************创建的xml文件************************
XmlFilePath (0): ./DeviceData/data/data/com.tencent.mobileqq/shared_prefs/set_sp_mp.xml
XmlFilePath (1): ./DeviceData/data/data/com.tencent.mobileqq/shared_prefs/troop_notification_sp.xml
XmlFilePath (2): ./DeviceData/data/data/com.tencent.mobileqq/shared_prefs/gesturepassword_sharepreference.xml
XmlFilePath (3): ./DeviceData/data/data/com.tencent.mobileqq/shared_prefs/MSF.C.Util.xml
XmlFilePath (4): ./DeviceData/data/data/com.tencent.mobileqq/shared_prefs/proc_reporter.xml
XmlFilePath (5): ./DeviceData/data/data/com.tencent.mobileqq/shared_prefs/dpcConfig.xml
XmlFilePath (6): ./DeviceData/data/data/com.tencent.mobileqq/shared_prefs/screen_shot.xml
XmlFilePath (7): ./DeviceData/data/data/com.tencent.mobileqq/shared_prefs/DENGTA_META.xml
XmlFilePath (8): ./DeviceData/data/data/com.tencent.mobileqq/shared_prefs/UserGuide.xml
*********************创建的sqlite文件**********************
SQLiteDBFilePath (0): ./DeviceData/data/data/com.tencent.mobileqq/databases/beacon_db
SQLiteDBFilePath (1): ./DeviceData/data/data/com.tencent.mobileqq/databases/eup_db
*************************其他文件*************************
OtherFilePath (0): ./DeviceData/data/data/com.tencent.mobileqq/app_dex/classes2/classes2.dex
OtherFilePath (1): ./DeviceData/data/data/com.tencent.mobileqq/app_dex/classes2/classes2.dat
OtherFilePath (2): ./DeviceData/data/data/com.tencent.mobileqq/app_dex/classes3/classes3.dat
OtherFilePath (3): ./DeviceData/data/data/com.tencent.mobileqq/app_dex/classes3/classes3.dex
OtherFilePath (4): ./DeviceData/data/data/com.tencent.mobileqq/app_dex/classes5/classes5.dat
OtherFilePath (5): ./DeviceData/data/data/com.tencent.mobileqq/app_dex/classes5/classes5.dex
OtherFilePath (6): ./DeviceData/data/data/com.tencent.mobileqq/app_dex/classes4.dex
OtherFilePath (7): ./DeviceData/data/data/com.tencent.mobileqq/files/Beacon_sig_1.lock
OtherFilePath (8): ./DeviceData/data/data/com.tencent.mobileqq/files/flow/cw_36576
OtherFilePath (9): ./DeviceData/data/data/com.tencent.mobileqq/files/flow/cw_27354
OtherFilePath (10): ./DeviceData/data/data/com.tencent.mobileqq/files/flow/cw_41958
OtherFilePath (11): ./DeviceData/data/data/com.tencent.mobileqq/files/flow/cx_0
OtherFilePath (12): ./DeviceData/data/data/com.tencent.mobileqq/files/kc
OtherFilePath (13): ./DeviceData/data/data/com.tencent.mobileqq/files/imei
OtherFilePath (14): ./DeviceData/data/data/com.tencent.mobileqq/files/ConfigStore2.dat
OtherFilePath (15): ./DeviceData/data/data/com.tencent.mobileqq/files/classes2.jar
OtherFilePath (16): ./DeviceData/data/data/com.tencent.mobileqq/files/classes5.dex.MD5
OtherFilePath (17): ./DeviceData/data/data/com.tencent.mobileqq/files/classes4.jar
OtherFilePath (18): ./DeviceData/data/data/com.tencent.mobileqq/files/jni.ini
OtherFilePath (19): ./DeviceData/data/data/com.tencent.mobileqq/files/classes5.jar
OtherFilePath (20): ./DeviceData/data/data/com.tencent.mobileqq/files/verFile
OtherFilePath (21): ./DeviceData/data/data/com.tencent.mobileqq/files/classes3.dex.MD5
OtherFilePath (22): ./DeviceData/data/data/com.tencent.mobileqq/files/classes3.jar
OtherFilePath (23): ./DeviceData/data/data/com.tencent.mobileqq/files/classes2.dex.MD5
OtherFilePath (24): ./DeviceData/data/data/com.tencent.mobileqq/txlib/libDecodeSo.so
OtherFilePath (25): ./DeviceData/data/data/com.tencent.mobileqq/txlib/libNativeRQD.so
OtherFilePath (26): ./DeviceData/data/data/com.tencent.mobileqq/txlib/libwtecdh.so
OtherFilePath (27): ./DeviceData/data/data/com.tencent.mobileqq/txlib/libmsfbootV2.so
OtherFilePath (28): ./DeviceData/data/data/com.tencent.mobileqq/txlib/libcodecwrapperV2.so
OtherFilePath (29): ./DeviceData/data/data/com.tencent.mobileqq/databases/beacon_db-journal
OtherFilePath (30): ./DeviceData/data/data/com.tencent.mobileqq/databases/eup_db-journal

