#include <iostream>
#include <string>
#include <cstring>
#include <sys/types.h>
#include <sys/stat.h>
#include <fstream>
#include <dirent.h>
#include <regex.h>
#include "codeanalysis.h"

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
	api[0].Description	= "Get SIM Serial Number ";
	api[1].Key		= "ipc";
	api[1].Description	= "Inter Process Communication ";
	api[2].Key		= "gs";
	api[2].Description	= "Get System Service ";
	api[3].Key		= "nurl";
	api[3].Description	= "URL Connection supports file,http,https,ftp and jar ";
	api[4].Key		= "httpsurl";
	api[4].Description	= "HTTPS Connection ";
	api[5].Key		= "exec";
	api[5].Description	= "Execute System Command ";
	api[6].Key		= "softver";
	api[6].Description	= "Get Software Version, IMEI/SV etc. ";
	api[7].Key		= "bencode";
	api[7].Description	= "Base64 Encode ";
	api[8].Key		= "datagramp";
	api[8].Description	= "UDP Datagram Packet ";
	api[9].Key		= "webview_addjs";
	api[9].Description	= "WebView JavaScript Interface ";
	api[10].Key		= "inf_ser";
	api[10].Description	= "Starting Service";
	api[11].Key		= "inf_bro";
	api[11].Description	= "Sending Broadcast";
	api[12].Key		= "datagrams";
	api[12].Description	= "UDP Datagram Socket ";
	api[13].Key		= "server_socket";
	api[13].Description	= "TCP Server Socket ";
	api[14].Key		= "notify";
	api[14].Description	= "Android Notifications ";
	api[15].Key		= "cellloc";
	api[15].Description	= "Get Cell Location ";
	api[16].Key		= "opname";
	api[16].Description	= "Get SIM Operator Name ";
	api[17].Key		= "contentq";
	api[17].Description	= "Query Database of SMS, Contacts etc. ";
	api[18].Key		= "cellinfo";
	api[18].Description	= "Get Cell Information ";
	api[19].Key		= "dex";
	api[19].Description	= "Load and Manipulate Dex Files ";
	api[20].Key		= "httpclient";
	api[20].Description	= "HTTP Requests, Connections and Sessions ";
	api[21].Key		= "obf";
	api[21].Description	= "Obfuscation ";
	api[22].Key		= "socket";
	api[22].Description	= "TCP Socket ";
	api[23].Key		= "jurl";
	api[23].Description	= "JAR URL Connection ";
	api[24].Key		= "webviewpost";
	api[24].Description	= "WebView POST Request ";
	api[25].Key		= "mdigest";
	api[25].Description	= "Message Digest ";
	api[26].Key		= "devid";
	api[26].Description	= "Get Device ID, IMEI,MEID/ESN etc. ";
	api[27].Key		= "crypto";
	api[27].Description	= "Crypto ";
	api[28].Key		= "bdecode";
	api[28].Description	= "Base64 Decode ";
	api[29].Key		= "inf_act";
	api[29].Description	= "Starting Activity";
	api[30].Key		= "subid";
	api[30].Description	= "Get Subscriber ID ";
	api[31].Key		= "refmethod";
	api[31].Description	= "Java Reflection Method Invocation ";
	api[32].Key		= "urlcon";
	api[32].Description	= "URL Connection to file/http/https/ftp/jar ";
	api[33].Key		= "fileio";
	api[33].Description	= "Local File I/O Operations";
	api[34].Key		= "webviewget";
	api[34].Description	= "WebView GET Request ";
	api[35].Key		= "msg";
	api[35].Description	= "Send SMS ";
	api[36].Key		= "webview";
	api[36].Description	= "WebView Load HTML/JavaScript ";
	api[37].Key		= "httpcon";
	api[37].Description	= "HTTP Connection ";
	api[38].Key		= "simop";
	api[38].Description	= "Get SIM Provider Details ";
	api[39].Key		= "gps";
	api[39].Description	= "GPS Location";
}


ReviewTracing::ReviewTracing()
{
	code[0].Key		= "rand";
	code[0].Description	= "The App uses an insecure Random Number Generator.";
	code[0].Security	= "high";
	code[1].Key		= "d_jsenabled";
	code[1].Description	= "Insecure WebView Implementation. Execution of user controlled code in WebView is a critical Security Hole.";
	code[1].Security	= "warning";
	code[2].Key		= "dex_tamper";
	code[2].Description	= "DexGuard App Tamper Detection code is identified.";
	code[2].Security	= "secure";
	code[3].Key		= "dex_debug";
	code[3].Description	= "DexGuard Debug Detection code to detect wheather an App is debuggable or not is identified.";
	code[3].Security	= "secure";
	code[4].Key		= "d_webviewdisablessl";
	code[4].Description	= "Insecure WebView Implementation. WebView ignores SSL Certificate Errors.";
	code[4].Security	= "high";
	code[5].Key		= "dex_emulator";
	code[5].Description	= "DexGuard Emulator Detection code is identified.";
	code[5].Security	= "secure";
	code[6].Key		= "d_rootcheck";
	code[6].Description	= "This App may have root detection capabilities.";
	code[6].Security	= "secure";
	code[7].Key		= "dex_debug_key";
	code[7].Description	= "DecGuard code to detect wheather the App is signed with a debug key or not is identified.";
	code[7].Security	= "secure";
	code[8].Key		= "d_con_world_writable";
	code[8].Description	= "The file is World Writable. Any App can write to the file";
	code[8].Security	= "high";
	code[9].Key		= "log";
	code[9].Description	= "The App logs information. Sensitive information should never be logged.";
	code[9].Security	= "info";
	code[10].Key		= "d_sensitive";
	code[10].Description	= "Files may contain hardcoded sensitive informations like usernames, passwords, keys etc.";
	code[10].Security	= "high";
	code[11].Key		= "d_sqlite";
	code[11].Description	= "App uses SQLite Database and execute raw SQL query. Untrusted user input in raw SQL queries can cause SQL Injection. Also sensitive information should be encrypted and written to the database.";
	code[11].Security	= "high";
	code[12].Key		= "d_extstorage";
	code[12].Description	= "App can read/write to External Storage. Any App can read data written to External Storage.";
	code[12].Security	= "high";
	code[13].Key		= "dex_cert";
	code[13].Description	= "DexGuard Signer Certificate Tamper Detection code is identified.";
	code[13].Security	= "secure";
	code[14].Key		= "d_ssl_pin";
	code[14].Description	= " This App uses an SSL Pinning Library (org.thoughtcrime.ssl.pinning) to prevent MITM attacks in secure communication channel.";
	code[14].Security	= "secure";
	code[15].Key		= "d_con_world_readable";
	code[15].Description	= "The file is World Readable. Any App can read from the file";
	code[15].Security	= "high";
	code[16].Key		= "d_con_private";
	code[16].Description	= "App can write to App Directory. Sensitive Information should be encrypted.";
	code[16].Security	= "info";
	code[17].Key		= "d_tmpfile";
	code[17].Description	= "App creates temp file. Sensitive information should never be written into a temp file.";
	code[17].Security	= "high";
	code[18].Key		= "d_ssl";
	code[18].Description	= "Insecure Implementation of SSL. Trusting all the certificates or accepting self signed certificates is a critical Security Hole.";
	code[18].Security	= "high";
	code[19].Key		= "d_root";
	code[19].Description	= "This App may request root (Super User) privileges.";
	code[19].Security	= "high";
	code[20].Key		= "d_webviewdebug";
	code[20].Description	= "Remote WebView debugging is enabled.";
	code[20].Security	= "high";
	code[21].Key		= "d_hcode";
	code[21].Description	= "This App uses Java Hash Code. It's a weak hash function and should never be used in Secure Crypto Implementation.";
	code[21].Security	= "high";
	code[22].Key		= "dex_debug_con";
	code[22].Description	= "DexGuard Debugger Detection code is identified.";
	code[22].Security	= "secure";
	code[23].Key		= "dex_root";
	code[23].Description	= "DexGuard Root Detection code is identified.";
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


bool regex_search( string patt, string where )
{
	regex_t		reg;
	regmatch_t	pmatch[64];
	const char	* pattern = patt.c_str();
	regcomp( &reg, pattern, REG_EXTENDED );
	int ret = regexec( &reg, where.c_str(), 64, pmatch, 0 );
	regfree( &reg );
	if ( ret == 0 )
		return(true);
	else
		return(false);
}


void regex_findall( string patt, string where, string saveat[] )
{
	regex_t		reg;
	regmatch_t	pmatch[64];
	const char	* pattern = patt.c_str();
	regcomp( &reg, pattern, REG_EXTENDED );
	int ret = regexec( &reg, where.c_str(), 64, pmatch, 0 );
	regfree( &reg );
	int index = 0;
	if ( ret == 0 )
	{
		for ( int i = 1; i < 64 && pmatch[i].rm_so != -1; i++ )
		{
			char buff[500];
			memset( buff, '\0', 200 );

			int len = pmatch[i].rm_eo - pmatch[i].rm_so; /* 匹配长度 */
			strncpy( buff, where.c_str() + pmatch[i].rm_so, len );

			if ( strcmp( buff, "https://" ) != 0 && strcmp( buff, "http://" ) != 0 && strcmp( buff, "ftps://" ) != 0 && strcmp( buff, "file://" ) != 0 && strcmp( buff, "javascript:" ) != 0 && strcmp( buff, "data:" ) != 0 )
			{
				saveat[index] = string( buff );
				index++;
			}
		}
		return;
	}else
		return;
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


string tolower( string str )
{
	if ( str == "" )
		return("");
	for ( int i = 0; i < str.length(); i++ )
	{
		int temp = (int) str[i];
		if ( temp >= 65 && temp <= 90 )
		{
			temp	= temp + 32;
			str[i]	= (char) temp;
		}
	}
	return(str);
}


string replace( string str, string old_str, string new_str )
{
	int	index	= 0;
	int	pos	= 0;
	while ( (pos = str.find( old_str, index ) ) != string::npos )
	{
		str.replace( pos, old_str.length(), new_str );
		index = pos + old_str.length();
	}
	return(str);
}


int startswith( string str, string withstr )
{
	if ( str.find( withstr ) == 0 )
		return(1);
	else if ( str.find( withstr ) == string::npos )
		return(0);
	else
		return(0);
}


int endswith( string str, string withstr )
{
	if ( str.rfind( withstr ) == string::npos )
		return(0);
	else if ( (str.length() - str.rfind( withstr ) ) == withstr.length() )
		return(1);
	else
		return(0);
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