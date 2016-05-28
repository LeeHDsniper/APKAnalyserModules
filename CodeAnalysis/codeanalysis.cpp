#include <iostream>
#include <string>
#include <cstring>
#include <sys/types.h>
#include <sys/stat.h>
#include <fstream>
#include <dirent.h>
#include "codeanalysis.h"
#include "../utils/utils.h"

using namespace std;

NORMALs			ct;
NORMALs			ul;
NORMALs			em;
APITracing		api_t;
ReviewTracing	rev_t;
bool		native	= false;
bool		dynamic = false;
bool		reflect = false;
bool		crypto	= false;
bool		obfus	= false;

APITracing::APITracing()
{
	api[0].Key		= "simserial";
	api[0].Description	= "获取SIM卡的序列号 ";
	api[1].Key		= "ipc";
	api[1].Description	= "进程间通信 ";
	api[2].Key		= "gs";
	api[2].Description	= "获取系统服务 ";
	api[3].Key		= "nurl";
	api[3].Description	= "URL连接，支持file,http,https,ftp和jar格式 ";
	api[4].Key		= "httpsurl";
	api[4].Description	= "HTTPS连接 ";
	api[5].Key		= "exec";
	api[5].Description	= "执行系统命令 ";
	api[6].Key		= "softver";
	api[6].Description	= "获取软件版本、IMEI/SV等 ";
	api[7].Key		= "bencode";
	api[7].Description	= "Base64编码 ";
	api[8].Key		= "datagramp";
	api[8].Description	= "UDP数据包 ";
	api[9].Key		= "webview_addjs";
	api[9].Description	= "WebView JavaScript接口 ";
	api[10].Key		= "inf_ser";
	api[10].Description	= "开启Service ";
	api[11].Key		= "inf_bro";
	api[11].Description	= "发送广播 ";
	api[12].Key		= "datagrams";
	api[12].Description	= "UDP数据报套接字 ";
	api[13].Key		= "server_socket";
	api[13].Description	= "TCP服务器套接字 ";
	api[14].Key		= "notify";
	api[14].Description	= "Android通知栏 ";
	api[15].Key		= "cellloc";
	api[15].Description	= "获取设备当前位置 ";
	api[16].Key		= "opname";
	api[16].Description	= "获取SIM卡运营商名";
	api[17].Key		= "contentq";
	api[17].Description	= "查询数据库中的短信、联系人等 ";
	api[18].Key		= "cellinfo";
	api[18].Description	= "获取设备信息 ";
	api[19].Key		= "dex";
	api[19].Description	= "加载、操作Dex文件 ";
	api[20].Key		= "httpclient";
	api[20].Description	= "HTTP请求、连接和会话 ";
	api[21].Key		= "obf";
	api[21].Description	= "混淆模块 ";
	api[22].Key		= "socket";
	api[22].Description	= "TCP套接字 ";
	api[23].Key		= "jurl";
	api[23].Description	= "JAR URL连接 ";
	api[24].Key		= "webviewpost";
	api[24].Description	= "WebView POST请求 ";
	api[25].Key		= "mdigest";
	api[25].Description	= "报文摘要 ";
	api[26].Key		= "devid";
	api[26].Description	= "获取设备的ID,IMEI,MEID/ESN等 ";
	api[27].Key		= "crypto";
	api[27].Description	= "加密模块 ";
	api[28].Key		= "bdecode";
	api[28].Description	= "Base64解码 ";
	api[29].Key		= "inf_act";
	api[29].Description	= "开启Activity";
	api[30].Key		= "subid";
	api[30].Description	= "获取用户ID ";
	api[31].Key		= "refmethod";
	api[31].Description	= "Java反射机制(Reflection)的调用 ";
	api[32].Key		= "urlcon";
	api[32].Description	= "对file/http/https/ftp/jar的URL连接 ";
	api[33].Key		= "fileio";
	api[33].Description	= "本地文件的输入/输出操作";
	api[34].Key		= "webviewget";
	api[34].Description	= "WebView GET请求 ";
	api[35].Key		= "msg";
	api[35].Description	= "发送短信 ";
	api[36].Key		= "webview";
	api[36].Description	= "WebView 加载HTML/JavaScript ";
	api[37].Key		= "httpcon";
	api[37].Description	= "HTTP连接 ";
	api[38].Key		= "simop";
	api[38].Description	= "获取SIM卡供应商信息 ";
	api[39].Key		= "gps";
	api[39].Description	= "GPS定位";
}


ReviewTracing::ReviewTracing()
{
	code[0].Key		= "rand";
	code[0].Description	= "该应用程序使用了一个不安全的随机数生成器 ";
	code[0].Security	= "high";
	code[1].Key		= "d_jsenabled";
	code[1].Description	= "不安全的WebView的实现：在WebView执行用户控制的代码是一个严重的安全漏洞 ";
	code[1].Security	= "warning";
	code[2].Key		= "dex_tamper";
	code[2].Description	= "识别出DexGuard的篡改检测代码 ";
	code[2].Security	= "secure";
	code[3].Key		= "dex_debug";
	code[3].Description	= "DexGuard的调试检测代码：用于检测应用程序是否可调试或不可识别 ";
	code[3].Security	= "secure";
	code[4].Key		= "d_webviewdisablessl";
	code[4].Description	= "不安全的WebView的实现：WebView忽略SSL证书错误 ";
	code[4].Security	= "high";
	code[5].Key		= "dex_emulator";
	code[5].Description	= "识别出DexGuard的模拟器检测代码 ";
	code[5].Security	= "secure";
	code[6].Key		= "d_rootcheck";
	code[6].Description	= "该应用程序可能有检测功能的root权限 ";
	code[6].Security	= "secure";
	code[7].Key		= "dex_debug_key";
	code[7].Description	= "DexGuard代码：用于检测应用程序是否被debug key签名或不可识别 ";
	code[7].Security	= "secure";
	code[8].Key		= "d_con_world_writable";
	code[8].Description	= "该文件是world-writable的：任何应用程序都可对其进行写操作 ";
	code[8].Security	= "high";
	code[9].Key		= "log";
	code[9].Description	= "该应用程序记录日志信息，不应记录敏感信息 ";
	code[9].Security	= "info";
	code[10].Key		= "d_sensitive";
	code[10].Description	= "该文件可能包含敏感信息，如用户名、口令、key等 ";
	code[10].Security	= "high";
	code[11].Key		= "d_sqlite";
	code[11].Description	= "该应用程序使用SQLite数据库执行原始SQL查询：不可信用户的原始SQL查询可能导致SQL注入，还应对敏感信息进行加密并写入数据库 ";
	code[11].Security	= "high";
	code[12].Key		= "d_extstorage";
	code[12].Description	= "该应用程序能读/写外部存储：任何应用程序都可读取外部存储中的数据 ";
	code[12].Security	= "high";
	code[13].Key		= "dex_cert";
	code[13].Description	= "识别出DexGuard签名证书的篡改检测代码 ";
	code[13].Security	= "secure";
	code[14].Key		= "d_ssl_pin";
	code[14].Description	= "该应用程序使用了SSL Pinning Library：用来防止中间人攻击的安全通信通道 ";
	code[14].Security	= "secure";
	code[15].Key		= "d_con_world_readable";
	code[15].Description	= "该文件是world-readable的：任何应用程序都可对其进行读操作 ";
	code[15].Security	= "high";
	code[16].Key		= "d_con_private";
	code[16].Description	= "该应用程序可以对应用程序目录进行写操作，敏感信息应加密 ";
	code[16].Security	= "info";
	code[17].Key		= "d_tmpfile";
	code[17].Description	= "该应用程序创建了临时文件，不应将敏感信息写入临时文件中 ";
	code[17].Security	= "high";
	code[18].Key		= "d_ssl";
	code[18].Description	= "不安全的SSL实现：信任所有的证书或接受自签署证书是一个严重的安全漏洞 ";
	code[18].Security	= "high";
	code[19].Key		= "d_root";
	code[19].Description	= "该应用程序可能回请求root（超级用户）权限 ";
	code[19].Security	= "high";
	code[20].Key		= "d_webviewdebug";
	code[20].Description	= "远程的WebView调试是可用的 ";
	code[20].Security	= "high";
	code[21].Key		= "d_hcode";
	code[21].Description	= "该应用程序使用java哈希代码：这是一个弱哈希函数，不应该用于实现安全加密 ";
	code[21].Security	= "high";
	code[22].Key		= "dex_debug_con";
	code[22].Description	= "识别出DexGuard的调试检测代码 ";
	code[22].Security	= "secure";
	code[23].Key		= "dex_root";
	code[23].Description	= "识别出DexGuard的root检测代码 ";
	code[23].Security	= "secure";
}


void DICT_API:: append( string value )
{
	for ( int i = 0; i < DICT_VALUES_SUM; i++ )
	{
		if ( Values[i] == "" )
		{
			Values[i] = value;
			return;
		}
	}
}


void DICT_REVIEW:: append( string value )
{
	for ( int i = 0; i < DICT_VALUES_SUM; i++ )
	{
		if ( Values[i] == "" )
		{
			Values[i] = value;
			return;
		}
	}
}


void DICT_NORMAL:: append( string value )
{
	for ( int i = 0; i < DICT_VALUES_SUM; i++ )
	{
		if ( Values[i] == "" )
		{
			Values[i] = value;
			return;
		}
	}
}


DICT_API* APITracing::operator []( string key )
{
	int i = 0;
	while ( api[i].Key != "" )
	{
		if ( api[i].Key == key )
		{
			return(&api[i]);
		}
		i++;
	}
	if ( i <= APITRACING_SUM )
	{
		api[i].Key = key;
		return(&api[i]);
	}
	return(NULL);
}


DICT_REVIEW* ReviewTracing::operator []( string key )
{
	int i = 0;
	while ( code[i].Key != "" )
	{
		if ( code[i].Key == key )
		{
			return(&code[i]);
		}
		i++;
	}
	if ( i <= REVIEWTRACING_SUM )
	{
		code[i].Key = key;
		return(&code[i]);
	}
	return(NULL);
}


DICT_NORMAL* NORMALs::operator []( string key )
{
	int i = 0;
	while ( dict[i].Key != "" )
	{
		if ( dict[i].Key == key )
		{
			return(&dict[i]);
		}
		i++;
	}
	if ( i <= NORMALTRACING_SUM )
	{
		dict[i].Key = key;
		return(&dict[i]);
	}
	return(NULL);
}

bool find_in_permissions( Permission *perm, string perm_name )
{
	for ( int i = 0; i < MANI_PERMISSIONS_SUM; i++ )
	{
		if ( perm->Permission_Name == perm_name )
			return(true);
		perm++;
	}
	return(false);
}

void JavaAnalysis( string javasource_path, string md5, Permission *perm )
{
	struct dirent	* ent = NULL;
	DIR		*pDir;
	pDir = opendir( javasource_path.c_str() );
	if ( pDir == NULL )
	{
		return;
	}
	while ( (ent = readdir( pDir ) ) != NULL )
	{
		if ( ent->d_type == 8 )
		{
			string	file( ent->d_name );
			string	file_path = (javasource_path + (string) ent->d_name);
			if ( file.find( "+" ) != string::npos )
			{
				file = replace( file, "+", "x" );
				string temp = javasource_path + file;
				rename( file_path.c_str(), temp.c_str() );
				file_path = temp;
			}
			string repath = replace( javasource_path, "./javasource/", "" );
			if ( endswith( file, ".java" ) && (!startswith( repath, "android/" ) ) && (!startswith( repath, "com/google" ) ) )
			{
				fstream f;
				f.open( file_path.c_str(), ios_base::in );
				f.seekg( 0, ios::end );
				int len = f.tellg();
				f.seekg( 0, ios::beg );
				char *buffer = new char[len];
				f.read( buffer, len );

				if ( regex_search( "MODE_WORLD_READABLE|Context.MODE_WORLD_READABLE", buffer ) )
					ct["d_con_world_readable"]->append( replace( file_path, "./javasource/", "" ) );
				if ( regex_search( "MODE_WORLD_WRITABLE|Context.MODE_WORLD_WRITABLE", buffer ) )
					ct["d_con_world_writable"]->append( replace( file_path, "./javasource/", "" ) );
				if ( regex_search( "MODE_PRIVATE|Context.MODE_PRIVATE", buffer ) )
					ct["d_con_private"]->append( replace( file_path, "./javasource/", "" ) );
				if ( find_in_permissions( perm, "WRITE_EXTERNAL_STORAGE" ) && ( ( ( (string) buffer).find( ".getExternalStorage" ) != string::npos) || ( ( (string) buffer).find( ".getExternalFilesDir(" ) != string::npos) ) )
					ct["d_extstorage"]->append( replace( file_path, "./javasource/", "" ) );
				if ( find_in_permissions( perm, "WRITE_EXTERNAL_STORAGE" ) && ( ( (string) buffer).find( ".createTempFile(" ) != string::npos) )
					ct["d_tmpfile"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "setJavaScriptEnabled(true)" ) != string::npos) && ( ( (string) buffer).find( ".addJavascriptInterface(" ) != string::npos) )
					ct["d_jsenabled"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( ".setWebContentsDebuggingEnabled(true)" ) != string::npos) && ( ( (string) buffer).find( "WebView" ) != string::npos) )
					ct["d_webviewdebug"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "onReceivedSslError(WebView" ) != string::npos) && ( ( (string) buffer).find( "proceed();" ) != string::npos) )
					ct["d_webviewdisablessl"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( ( (string) buffer).find( "rawQuery(" ) != string::npos) || ( ( (string) buffer).find( "execSQL(" ) != string::npos) ) && ( ( (string) buffer).find( "android.bufferabase.sqlite" ) != string::npos) )
					ct["d_sqlite"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "javax.net.ssl" ) != string::npos) && ( ( ( (string) buffer).find( "TrustAllSSLSocket-Factory" ) != string::npos) || ( ( (string) buffer).find( "AllTrustSSLSocketFactory" ) != string::npos) || ( ( (string) buffer).find( "NonValibufferingSSLSocketFactory" ) != string::npos) || ( ( (string) buffer).find( "ALLOW_ALL_HOSTNAME_VERIFIER" ) != string::npos) || ( ( (string) buffer).find( ".setDefaultHostnameVerifier(" ) != string::npos) || ( ( (string) buffer).find( "NullHostnameVerifier(" ) != string::npos) ) )
					ct["d_ssl"]->append( replace( file_path, "./javasource/", "" ) );

				if ( ( (tolower( (string) buffer ) ).find( "password = " ) != string::npos) || ( (tolower( (string) buffer ) ).find( "secret = " ) != string::npos) || ( (tolower( (string) buffer ) ).find( "username = " ) != string::npos) || ( (tolower( (string) buffer ) ).find( "key = " ) != string::npos) )
					ct["d_sensitive"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "import dexguard.util" ) != string::npos) && ( ( (string) buffer).find( "DebugDetector.isDebuggable" ) != string::npos) )
					ct["dex_debug"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "import dexguard.util" ) != string::npos) && ( ( (string) buffer).find( "DebugDetector.isDebuggerConnected" ) != string::npos) )
					ct["dex_debug_con"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "import dexguard.util" ) != string::npos) && ( ( (string) buffer).find( "EmulatorDetector.isRunningInEmulator" ) != string::npos) )
					ct["dex_emulator"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "import dexguard.util" ) != string::npos) && ( ( (string) buffer).find( "DebugDetector.isSignedWithDebugKey" ) != string::npos) )
					ct["dex_debug_key"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "import dexguard.util" ) != string::npos) && ( ( (string) buffer).find( "RootDetector.isDeviceRooted" ) != string::npos) )
					ct["dex_root"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "import dexguard.util" ) != string::npos) && ( ( (string) buffer).find( "TamperDetector.checkApk" ) != string::npos) )
					ct["dex_tamper"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "import dexguard.util" ) != string::npos) && ( ( (string) buffer).find( "CertificateChecker.checkCertificate" ) != string::npos) )
					ct["dex_cert"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "org.thoughtcrime.ssl.pinning" ) != string::npos) && ( ( ( (string) buffer).find( "PinningHelper.getPinnedHttpsURLConnection" ) != string::npos) || ( ( (string) buffer).find( "PinningHelper.getPinnedHttpClient" ) != string::npos) || ( ( (string) buffer).find( "PinningSSLSocketFactory(" ) != string::npos) ) )
					ct["d_ssl_pin"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "com.noshufou.android.su" ) != string::npos) || ( ( (string) buffer).find( "com.thirdparty.superuser" ) != string::npos) || ( ( (string) buffer).find( "eu.chainfire.supersu" ) != string::npos) || ( ( (string) buffer).find( "com.koushikdutta.superuser" ) != string::npos) || ( ( (string) buffer).find( "eu.chainfire." ) != string::npos) )
					ct["d_root"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( ".contains(\"test-keys\")" ) != string::npos) || ( ( (string) buffer).find( "/system/app/Superuser.apk" ) != string::npos) || ( ( (string) buffer).find( "isDeviceRooted()" ) != string::npos) || ( ( (string) buffer).find( "/system/bin/failsafe/su" ) != string::npos) || ( ( (string) buffer).find( "/system/sd/xbin/su" ) != string::npos) || ( ( (string) buffer).find( "\"/system/xbin/which\", \"su\"" ) != string::npos) || ( ( (string) buffer).find( "RootTools.isAccessGiven()" ) != string::npos) )
					ct["d_rootcheck"]->append( replace( file_path, "./javasource/", "" ) );
				if ( regex_search( "java.util.Random", buffer ) )
					ct["rand"]->append( replace( file_path, "./javasource/", "" ) );
				if ( regex_search( "Log.|System.out.print", buffer ) )
					ct["log"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( (string) buffer).find( "d_hcode" ) != string::npos )
					ct["d_hcode"]->append( replace( file_path, "./javasource/", "" ) );

				if ( regex_search( "System.loadLibrary\\(|System.load\\(", buffer ) )
					native = true;
				if ( regex_search( "dalvik.system.DexClassLoader|java.security.ClassLoader|java.net.URLClassLoader|java.security.SecureClassLoader", buffer ) )
					dynamic = true;
				if ( regex_search( "java.lang.reflect.Method|java.lang.reflect.Field|Class.forName", buffer ) )
					reflect = true;
				if ( regex_search( "javax.crypto|kalium.crypto|bouncycastle.crypto", buffer ) )
				{
					crypto = true;
					ct["crypto"]->append( replace( file_path, "./javasource/", "" ) );
				}
				if ( ( ( (string) buffer).find( "utils.AESObfuscator" ) != string::npos) && ( ( (string) buffer).find( "getObfuscator" ) != string::npos) )
				{
					obfus = true;
					ct["obfus"]->append( replace( file_path, "./javasource/", "" ) );
				}
				if ( ( ( (string) buffer).find( "getRuntime().exec(" ) != string::npos) && ( ( (string) buffer).find( "getRuntime(" ) != string::npos) )
					ct["exec"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "ServerSocket" ) != string::npos) && ( ( (string) buffer).find( "net.ServerSocket" ) != string::npos) )
					ct["server_socket"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "Socket" ) != string::npos) && ( ( (string) buffer).find( "net.Socket" ) != string::npos) )
					ct["socket"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "DatagramPacket" ) != string::npos) && ( ( (string) buffer).find( "net.DatagramPacket" ) != string::npos) )
					ct["datagramp"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "DatagramSocket" ) != string::npos) && ( ( (string) buffer).find( "net.DatagramSocket" ) != string::npos) )
					ct["datagrams"]->append( replace( file_path, "./javasource/", "" ) );
				if ( regex_search( "IRemoteService|IRemoteService.Stub|IBinder|Intent", buffer ) )
					ct["ipc"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( ( (string) buffer).find( "sendMultipartTextMessage" ) != string::npos) || ( ( (string) buffer).find( "sendTextMessage" ) != string::npos) || ( ( (string) buffer).find( "vnd.android-dir/mms-sms" ) != string::npos) ) && ( ( (string) buffer).find( "telephony.SmsManager" ) != string::npos) )
					ct["msg"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "addJavascriptInterface" ) != string::npos) && ( ( (string) buffer).find( "WebView" ) != string::npos) && ( ( (string) buffer).find( "android.webkit" ) != string::npos) )
					ct["webview_addjs"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "WebView" ) != string::npos) && ( ( (string) buffer).find( "loadData" ) != string::npos) && ( ( (string) buffer).find( "android.webkit" ) != string::npos) )
					ct["webviewget"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "WebView" ) != string::npos) && ( ( (string) buffer).find( "postUrl" ) != string::npos) && ( ( (string) buffer).find( "android.webkit" ) != string::npos) )
					ct["webviewpost"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( ( (string) buffer).find( "HttpURLConnection" ) != string::npos) || ( ( (string) buffer).find( "org.apache.http" ) != string::npos) ) && ( ( ( (string) buffer).find( "openConnection" ) != string::npos) || ( ( (string) buffer).find( "connect" ) != string::npos) || ( ( (string) buffer).find( "HttpRequest" ) != string::npos) ) )
					ct["httpcon"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "net.URLConnection" ) != string::npos) && ( ( ( (string) buffer).find( "connect" ) != string::npos) || ( ( (string) buffer).find( "openConnection" ) != string::npos) || ( ( (string) buffer).find( "openStream" ) != string::npos) ) )
					ct["urlcon"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "net.JarURLConnection" ) != string::npos) && ( ( ( (string) buffer).find( "JarURLConnection" ) != string::npos) || ( ( (string) buffer).find( "jar:" ) != string::npos) ) )
					ct["jurl"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "javax.net.ssl.HttpsURLConnection" ) != string::npos) && ( ( ( (string) buffer).find( "HttpsURLConnection" ) != string::npos) || ( ( (string) buffer).find( "connect" ) != string::npos) ) )
					ct["httpsurl"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "net.URL" ) != string::npos) && ( ( ( (string) buffer).find( "openConnection" ) != string::npos) || ( ( (string) buffer).find( "openStream" ) != string::npos) ) )
					ct["nurl"]->append( replace( file_path, "./javasource/", "" ) );
				if ( regex_search( "http.client.HttpClient|net.http.AndroidHttpClient|http.impl.client.AbstractHttpClient", buffer ) )
					ct["httpclient"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "app.NotificationManager" ) != string::npos) && ( ( (string) buffer).find( "notify" ) != string::npos) )
					ct["notify"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "telephony.TelephonyManager" ) != string::npos) && ( ( (string) buffer).find( "getAllCellInfo" ) != string::npos) )
					ct["cellinfo"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "telephony.TelephonyManager" ) != string::npos) && ( ( (string) buffer).find( "getCellLocation" ) != string::npos) )
					ct["cellloc"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "telephony.TelephonyManager" ) != string::npos) && ( ( (string) buffer).find( "getSubscriberId" ) != string::npos) )
					ct["subid"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "telephony.TelephonyManager" ) != string::npos) && ( ( (string) buffer).find( "getDeviceId" ) != string::npos) )
					ct["devid"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "telephony.TelephonyManager" ) != string::npos) && ( ( (string) buffer).find( "getDeviceSoftwareVersion" ) != string::npos) )
					ct["softver"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "telephony.TelephonyManager" ) != string::npos) && ( ( (string) buffer).find( "getSimSerialNumber" ) != string::npos) )
					ct["simserial"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "telephony.TelephonyManager" ) != string::npos) && ( ( (string) buffer).find( "getSimOperator" ) != string::npos) )
					ct["simop"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "telephony.TelephonyManager" ) != string::npos) && ( ( (string) buffer).find( "getSimOperatorName" ) != string::npos) )
					ct["opname"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "content.ContentResolver" ) != string::npos) && ( ( (string) buffer).find( "query" ) != string::npos) )
					ct["contentq"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "java.lang.reflect.Method" ) != string::npos) && ( ( (string) buffer).find( "invoke" ) != string::npos) )
					ct["refmethod"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( (string) buffer).find( "getSystemService" ) != string::npos )
					ct["gs"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "android.util.Base64" ) != string::npos) && ( ( ( (string) buffer).find( ".encodeToString" ) != string::npos) || ( ( (string) buffer).find( ".encode" ) != string::npos) ) )
					ct["bencode"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "android.util.Base64" ) != string::npos) && ( ( (string) buffer).find( ".decode" ) != string::npos) )
					ct["bdecode"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( ( (string) buffer).find( "dalvik.system.PathClassLoader" ) != string::npos) || ( ( (string) buffer).find( "dalvik.system.DexFile" ) != string::npos) || ( ( (string) buffer).find( "dalvik.system.DexPathList" ) != string::npos) || ( ( (string) buffer).find( "dalvik.system.DexClassLoader" ) != string::npos) ) && ( ( ( (string) buffer).find( "loadDex" ) != string::npos) || ( ( (string) buffer).find( "loadClass" ) != string::npos) || ( ( (string) buffer).find( "DexClassLoader" ) != string::npos) || ( ( (string) buffer).find( "loadDexFile" ) != string::npos) ) )
					ct["dex"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "java.security.MessageDigest" ) != string::npos) && ( ( ( (string) buffer).find( "MessageDigestSpi" ) != string::npos) || ( ( (string) buffer).find( "MessageDigest" ) != string::npos) ) )
					ct["mdigest"]->append( replace( file_path, "./javasource/", "" ) );
				if ( ( ( (string) buffer).find( "android.location" ) != string::npos) && ( ( ( (string) buffer).find( "getLastKnownLocation(" ) != string::npos) || ( ( (string) buffer).find( "requestLocationUpdates(" ) != string::npos) || ( ( (string) buffer).find( "getLatitude(" ) != string::npos) || ( ( (string) buffer).find( "getLongitude(" ) != string::npos) ) )
					ct["gps"]->append( replace( file_path, "./javasource/", "" ) );
				if ( regex_search( "OpenFileOutput|getSharedPreferences|SharedPreferences.Editor|getCacheDir|getExternalStorageState|openOrCreateDatabase", buffer ) )
					ct["fileio"]->append( replace( file_path, "./javasource/", "" ) );
				if ( regex_search( "startActivity\\(|startActivityForResult\\(", buffer ) )
					ct["inf_act"]->append( replace( file_path, "./javasource/", "" ) );
				if ( regex_search( "startService\\(|bindService\\(", buffer ) )
					ct["inf_ser"]->append( replace( file_path, "./javasource/", "" ) );
				if ( regex_search( "sendBroadcast\\(|sendOrderedBroadcast\\(|sendStickyBroadcast\\(", buffer ) )
					ct["inf_bro"]->append( replace( file_path, "./javasource/", "" ) );
				string	url_result[16];
				string	email_result[16];
				regex_findall( "((https://|http://|ftps://|file://|javascript:|data:|www[0-9]{0,3}[.])[a-zA-Z0-9.=/;,#:@?&~*+!$\'{}-]*)", buffer, url_result );
				int i = 0;
				while ( url_result[i] != "" )
				{
					ul[replace( file_path, "./javasource/", "" )]->append( url_result[i] );
					i++;
				}
				regex_findall( "([a-zA-Z0-9.-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9.]+)", buffer, email_result );
				i = 0;
				while ( email_result[i] != "" )
				{
					em[replace( file_path, "./javasource/", "" )]->append( email_result[i] );
					i++;
				}
				delete[]buffer;
				f.close();
			}
		}else  {
			if ( strcmp( ent->d_name, "." ) == 0 || strcmp( ent->d_name, ".." ) == 0 )
			{
				continue;
			}
			string	_path( javasource_path );
			string	_dirName( ent->d_name );
			string	fullDirPath = _path + _dirName + "/";
			JavaAnalysis( fullDirPath.c_str(), md5, perm );
		}
	}
}


void CodeAnalysis( string javasource_path, string md5, Permission *perm )
{
	JavaAnalysis( javasource_path, md5, perm );
	int	i = 0;
	string	key;
	while ( (key = api_t.api[i].Key) != "" )
	{
		int j = 0;
		while ( ct[key]->Values[j] != "" )
		{
			api_t.api[i].Values[j] = ct[key]->Values[j];
			j++;
		}
		i++;
	}
	i = 0;
	while ( (key = rev_t.code[i].Key) != "" )
	{
		int j = 0;
		while ( ct[key]->Values[j] != "" )
		{
			rev_t.code[i].Values[j] = ct[key]->Values[j];
			j++;
		}
		i++;
	}
}