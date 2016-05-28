#include <iostream>
#include <string>
#include <cstring>
#include <sstream>
#include <ctime>
#include <fstream>
#include <sys/stat.h>
#include <sys/types.h>
#include <dirent.h>
#include <unistd.h>
#include <regex.h>
/*These two libs below seems were wrote by one author:ggicci,Thanks.*/
/*a Json lib,thanks for https://github.com/ggicci/ggicci--json*/
#include "../utils/json/gci-json.h"
/*a base64 decode & encode lib,thanks for http://blog.csdn.net/ggicci/article/details/10600403*/
#include "../utils/base64/base64.h"
#include "dynamicanalysis.h"
#include "../utils/utils.h"

using namespace ggicci;
using namespace std;

API_ANAs	API_BASE64;
API_ANAs	API_FILEIO;
API_ANAs	API_REFLECT;
API_ANAs	API_SYSPROP;
API_ANAs	API_CNTRSLVR;
API_ANAs	API_CNTVAL;
API_ANAs	API_BINDER;
API_ANAs	API_CRYPTO;
API_ANAs	API_ACNTMNGER;
API_ANAs	API_DEVICEINFO;
API_ANAs	API_NET;
API_ANAs	API_DEXLOADER;
API_ANAs	API_CMD;
API_ANAs	API_SMS;
string 	URLs[256];
string 	EMAILs[256];
string 	XmlFiles[256];
string 	SQLiteDB[256];
string	OtherFiles[256];
int url_index=0;
int email_index=0;
int xmlfile_index=0;
int sqlitedb_index=0;
int otherfile_index=0;
FILE *process_proxy;

void API_ANAs:: append( DICT_APIANA d )
{
  dict[called_times]=d;
  called_times++;
}
DICT_APIANA::DICT_APIANA()
{
}
DICT_APIANA::DICT_APIANA(string method,string args,string ret,string info)
{
	Method=method;
	Args=args;
	Return=ret;
	Info=info;
}

void RefreshVM(string vboxmessage_path,string uuid,string snapshot_uuid)
{
	FILE *f;
	char buff[1024];
	string cmd = vboxmessage_path+" controlvm "+ uuid+" poweroff";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd = vboxmessage_path+" snapshot "+ uuid+" restore "+snapshot_uuid;
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd = vboxmessage_path+" startvm "+ uuid;
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
}
void WebProxy(string proxy_ip,string proxy_port,bool status)
{
	char buff[1024];
	if(status)
	{
		string cmd="python ./WebProxy/startproxy.py -i "+proxy_ip+" -p "+proxy_port;
		process_proxy=popen(cmd.c_str(),"w");
		if(process_proxy==NULL)
		{
			return ;
		}
	}
	else
	{
		char stop[5]="stop";
		fputs(stop,process_proxy);
		sleep(5);
		pclose(process_proxy);
		return ;
	}
}
void Install_Run(string device_IP,string device_Port,string APP_path,string package,string mainactivity)
{
	FILE *f;
	char    buff[1024];
	string cmd ="adb kill-server";
      	f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       pclose( f );
       cmd ="adb start-server";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd ="adb connect "+device_IP+":"+device_Port;
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd ="adb wait-for-device";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
	cmd ="adb -s "+device_IP+":"+device_Port+" shell su -c mount -o rw,remount,rw /system";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd ="adb -s "+device_IP+":"+device_Port+" shell mount -o rw,remount -t rfs /dev/block/sda6 /system";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd ="adb -s "+device_IP+":"+device_Port+" install -r "+APP_path;
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       	cout<<buff<<endl;
       }
       pclose( f );
       if(mainactivity!="")
       {
       		cmd ="adb -s "+device_IP+":"+device_Port+" shell am start -n "+package+"/"+mainactivity;
       		f = popen( cmd.c_str(), "r" );
       		if ( f == NULL )
       		{
       		return;
       		}
       		while( fgets( buff, sizeof(buff), f ) != NULL )
       		{
      			}
       		pclose( f );
       }
}
void GetScreenSize(string device_IP,string device_Port)
{
	FILE *f;
	string cmd ="adb -s "+device_IP+":"+device_Port+" shell dumpsys window";
	char buff[1024];
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       while( fgets( buff, sizeof(buff),f) != NULL )
       {
	       if(((string)buff).find("mUnrestrictedScreen")!=string::npos)
		{
			int pos;
			pos=((string)buff).rfind(")");
			char *p=buff;
			p=p+pos+2;
			pos=((string)p).find("x");
			string w;
			w.assign(p,pos);
			cout<<w<<endl;
			cout<<p+pos+1<<endl;
		}
       }
       pclose( f );
}
void ScreenShot(string device_IP,string device_Port,string out_path)
{
	FILE *f;
	char    buff[1024];
	string cmd ="adb -s "+device_IP+":"+device_Port+" shell screencap -p /data/local/screen.png";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       		return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd ="adb -s "+device_IP+":"+device_Port+" pull /data/local/screen.png  "+out_path+"screen.png";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       		return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose(f);
}
void Touch(string device_IP,string device_Port,string x_axis,string y_axis)
{
	FILE *f;
	char    buff[1024];
	string cmd ="adb -s "+device_IP+":"+device_Port+" shell input tap "+x_axis+" "+y_axis;
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       		return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
}
void ExecuteADB(string device_IP,string device_Port,string ADB_cmd)
{
	FILE *f;
	char    buff[1024];
	string cmd ="adb -s "+device_IP+":"+device_Port+" "+ADB_cmd;
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       		return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
}
void StopTest(string device_IP,string device_Port,string out_logcat_path,string out_errorlog_path,string out_dumpsys_path,string package)
{
	FILE *f;
	char    buff[1024];
	string cmd ="adb -s "+device_IP+":"+device_Port+" logcat -d dalvikvm:W ActivityManager:I > "+out_logcat_path+"logcat.txt";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       		return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd ="adb -s "+device_IP+":"+device_Port+" pull /data/data/de.robv.android.xposed.installer/log/error.log  "+out_errorlog_path+"errorlog.txt";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       		return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd ="adb -s "+device_IP+":"+device_Port+" shell dumpsys >  "+out_dumpsys_path+"dump.txt ";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       		return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd ="adb -s "+device_IP+":"+device_Port+" shell am force-stop "+package;
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       		return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
}
void DumpData(string device_IP,string device_Port,string out_appfile_path,string package,int timeout)
{
	FILE *f;
	char    buff[1024];
	string cmd ="adb -s "+device_IP+":"+device_Port+" shell rm /sdcard/mobsec_status";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       		return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd ="adb -s "+device_IP+":"+device_Port+" shell am startservice -a "+package+" opensecurity.ajin.datapusher/.GetPackageLocation";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       		return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       time_t start_time;
       time(&start_time);
       while(true)
       {
       		time_t current_time;
       		time(&current_time);
       		cmd ="adb -s "+device_IP+":"+device_Port+" shell cat /sdcard/mobsec_status";
	       f = popen( cmd.c_str(), "r" );
	       if ( f == NULL )
	       {
	       		return;
	       }
	       if( fgets( buff, sizeof(buff), f ) != NULL )
	       {
	       		if(((string)buff).find("MOBSEC-TAR-CREATED")!=string::npos)
	       		{
	       			break;
	       		}
	       		if((current_time-start_time)>timeout)
	       		{
	       			break;
	       		}
	       }
       }
       cmd ="adb -s "+device_IP+":"+device_Port+" pull /data/local/"+package+".tar "+out_appfile_path+package+".tar";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       		return;
       }
       while( fgets( buff, sizeof(buff), f ) != NULL )
       {
       }
       pclose( f );
       cmd ="adb kill-server";
       f = popen( cmd.c_str(), "r" );
       if ( f == NULL )
       {
       	return;
       }
       pclose( f );
}
void ExportedActivityTest(string device_IP,string device_Port,string exported_activity_list[],string package,string screenshot_path)
{
	int index=0;
	for(index;exported_activity_list[index]!="";index++)
	{
		FILE *f;
		char    buff[1024];
		string cmd ="adb -s "+device_IP+":"+device_Port+" shell am start -n "+package+"/"+exported_activity_list[index];
	       f = popen( cmd.c_str(), "r" );
	       if ( f == NULL )
	       {
	       		return;
	       }
	       sleep(4);
	       pclose( f );
	       cmd ="adb -s "+device_IP+":"+device_Port+" shell screencap -p /data/local/screen.png";
	       f = popen( cmd.c_str(), "r" );
	       if ( f == NULL )
	       {
	       		return;
	       }
	       pclose( f );
	       cmd ="adb -s "+device_IP+":"+device_Port+" pull /data/local/screen.png  "+screenshot_path+"expscreen"+str(index)+".png";
       		f = popen( cmd.c_str(), "r" );
	       if ( f == NULL )
	       {
	       		return;
	       }
	       while( fgets( buff, sizeof(buff), f ) != NULL )
	       {
	       }
	       pclose(f);
	       cmd ="adb -s "+device_IP+":"+device_Port+" shell am force-stop  "+package;
       		f = popen( cmd.c_str(), "r" );
	       if ( f == NULL )
	       {
	       		return;
	       }
	       while( fgets( buff, sizeof(buff), f ) != NULL )
	       {
	       }
	       pclose(f);
	}
}
void ActivityTest(string device_IP,string device_Port,string activity_list[],string package,string screenshot_path)
{
	int index=0;
	for(index;activity_list[index]!="";index++)
	{
		FILE *f;
		char    buff[1024];
		string cmd ="adb -s "+device_IP+":"+device_Port+" shell am start -n "+package+"/"+activity_list[index];
	       f = popen( cmd.c_str(), "r" );
	       if ( f == NULL )
	       {
	       		return;
	       }
	       sleep(4);
	       pclose( f );
	       cmd ="adb -s "+device_IP+":"+device_Port+" shell screencap -p /data/local/screen.png";
	       f = popen( cmd.c_str(), "r" );
	       if ( f == NULL )
	       {
	       		return;
	       }
	       pclose( f );
	       cmd ="adb -s "+device_IP+":"+device_Port+" pull /data/local/screen.png  "+screenshot_path+"actscreen"+str(index)+".png";
       	f = popen( cmd.c_str(), "r" );
	       if ( f == NULL )
	       {
	       		return;
	       }
	       while( fgets( buff, sizeof(buff), f ) != NULL )
	       {
	       }
	       pclose(f);
	       cmd ="adb -s "+device_IP+":"+device_Port+" shell am force-stop  "+package;
       		f = popen( cmd.c_str(), "r" );
	       if ( f == NULL )
	       {
	       		return;
	       }
	       while( fgets( buff, sizeof(buff), f ) != NULL )
	       {
	       }
	       pclose(f);
	}
}
void APIAnalysis(string errorlog_path,string package)
{
	fstream errorlog;
	errorlog.open((errorlog_path+"errorlog.txt").c_str(),ios_base::in);
	char line[999999];
	string ID="Droidmon-apimonitor-" + package +":";
	int i=0;
	int j=1;
	while(errorlog.getline(line,999999)!=NULL)
	{
		j++;
		int json_pos;
		if(((string)line).find(ID)!=string::npos)
		{
			json_pos=((string)line).find("{");
			try
			{
   				Json API = Json::Parse(line+json_pos);
   				string Return;
   				string Class;
   				string Method;
   				string Args;
   				Method=API["method"].AsString();
   				Class=API["class"].AsString();
   				if(!API["return"].IsNull())
   					Return=API["return"].ToString();
   				else 
   					Return="No Return Data";
   				if(!API["args"].IsNull())
   					Args=API["args"].ToString();
   				else 
   					Return="No Arguments Passed";
   				DICT_APIANA D(Method,Args,Return,"");
   				if(Class.find("android.util.Base64")!=string::npos)
   				{

   					if(Method.find("decode")!=string::npos)
   					{
   						string encode=API["args"][0].AsString();
   						if(isBase64(encode))
   						{
   							D.Info="Decode string : "+base64_decode(encode);
   						}	
   					}
   					API_BASE64.append(D);
   				}
   				if(regex_search("libcore.io|android.app.SharedPreferencesImpl$EditorImpl",Class))
   				{
   					API_FILEIO.append(D);
   				}
   				if(regex_search("java.lang.reflect",Class))
   				{
   					API_REFLECT.append(D);
   				}
   				if(regex_search("android.content.ContentResolver|android.location.Location|android.media.AudioRecord|android.media.MediaRecorder|android.os.SystemProperties",Class))
   				{
   					API_SYSPROP.append(D);
   				}
   				if(regex_search("android.app.Activity|android.app.ContextImpl|android.app.ActivityThread",Class))
   				{
   					API_BINDER.append(D);
   				}
   				if(regex_search("javax.crypto.spec.SecretKeySpec|javax.crypto.Cipher|javax.crypto.Mac",Class))
   				{
   					API_CRYPTO.append(D);
   				}
   				if(regex_search("android.accounts.AccountManager|android.app.ApplicationPackageManager|android.app.NotificationManager|android.net.ConnectivityManager|android.content.BroadcastReceiver",Class))
   				{
   					API_ACNTMNGER.append(D);
   				}
   				if(regex_search("android.telephony.TelephonyManager|android.net.wifi.WifiInfo|android.os.Debug",Class))
   				{
   					API_DEVICEINFO.append(D);
   				}
   				if(regex_search("dalvik.system.BaseDexClassLoader|dalvik.system.DexFile|dalvik.system.DexClassLoader|dalvik.system.PathClassLoader",Class))
   				{
   					API_DEXLOADER.append(D);
   				}
   				if(regex_search("java.lang.Runtime|java.lang.ProcessBuilder|java.io.FileOutputStream|java.io.FileInputStream|android.os.Process",Class))
   				{
   					API_CMD.append(D);
   				}
   				if(regex_search("android.content.ContentValues",Class))
   				{
   					API_CNTVAL.append(D);
   				}
   				if(regex_search("android.telephony.SmsManager",Class))
   				{
   					API_SMS.append(D);
   				}
   				if(regex_search("java.net.URL|org.apache.http.impl.client.AbstractHttpClient",Class))
   				{
   					API_NET.append(D);
   				}
   				i++;
			}
			catch (exception& e)
			{
				i--;
			}
		}
	}
	i=0;
	errorlog.close();
}
void RunAnalysis(string logs_path,string package)
{
	fstream log;
	log.open((logs_path+"logcat.txt").c_str(),ios_base::in);
	char line[999999];
	while(log.getline(line,999999)!=NULL)
	{	
		string url_result[100];
		string email_result[100];
		regex_findall("((https://|http://|ftps://|file://|javascript:|data:|www[0-9]{0,3}[.])[a-zA-Z0-9.=/;,#:@?&~*+!$\'{}-]*)",line,url_result);
		int j=0;
		while(url_result[j]!="")
		{
			bool alreadyhas=false;
			for(int t=0;t<url_index;t++)
			{
				if(url_result[j]==URLs[t])
					alreadyhas=true;
			}
			if(alreadyhas)
				break;
			URLs[url_index]=url_result[j];
			j++;
			url_index++;
		}
		regex_findall( "([a-zA-Z0-9-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9]+)", line, email_result );
		j = 0;
		while ( email_result[j] != ""&&email_result[j]!="yodleebanglore@gmail.com")
		{
			bool alreadyhas=false;
			for(int t=0;t<email_index;t++)
			{
				if(email_result[j]==EMAILs[t])
					alreadyhas=true;
			}
			if(alreadyhas)
				break;
			EMAILs[email_index]=email_result[j];
			j++;
			email_index++;
		}
	}
	log.close();
	fstream errorlog;
	errorlog.open((logs_path+"errorlog.txt").c_str(),ios_base::in);
	memset( line, '\0', 999999);
	int linenum=0;
	while(errorlog.getline(line,999999)!=NULL)
	{
		linenum++;
		string repline=replace(line,"\\","");
		string url_result[100];
		string email_result[100];
		regex_findall("((https://|http://|ftps://|file://|javascript:|data:|www[0-9]{0,3}[.])[a-zA-Z0-9.=/;,#:@?&~*+!$\'{}-]*)",repline,url_result);
		int j=0;
		while(url_result[j]!="")
		{
			bool alreadyhas=false;
			for(int t=0;t<url_index;t++)
			{
				if(url_result[j]==URLs[t])
					alreadyhas=true;
			}
			if(alreadyhas)
				break;
			URLs[url_index]=url_result[j];
			j++;
			url_index++;
		}
		regex_findall( "([a-zA-Z0-9-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9]+)", line, email_result );
		j = 0;
		while ( email_result[j] != ""&&email_result[j]!="yodleebanglore@gmail.com" )
		{
			bool alreadyhas=false;
			for(int t=0;t<email_index;t++)
			{
				if(email_result[j]==EMAILs[t])
					alreadyhas=true;
			}
			if(alreadyhas)
				break;
			EMAILs[email_index]=email_result[j];
			j++;
			email_index++;
		}
	}
	errorlog.close();
	fstream urllog;
	urllog.open("./WebProxy/proxydata/urls",ios_base::in);
	memset( line, '\0', 999999);
	while(urllog.getline(line,999999)!=NULL)
	{
		bool alreadyhas=false;
		for(int t=0;t<url_index;t++)
		{
			if(URLs[t]==(string)line)
				alreadyhas=true;
		}
		if(alreadyhas)
			continue;
		URLs[url_index]=(string)line;
		url_index++;
	}
	urllog.close();
}
void ExtractTar(string tarextract_path,string tar_path,string package)
{
	mymkdir(&tarextract_path[0]);
	FILE *f;
	char buff[1024];
	string cmd ="tar -xf ./"+tar_path+package+".tar -C "+tarextract_path;
	f = popen( cmd.c_str(), "r" );
	if ( f == NULL )
	{
	       	return;
	}
	while( fgets( buff, sizeof(buff), f ) != NULL )
	       {
	       }
	pclose(f);
}
void CheckDeviceFile(string devicefile_path)
{
	struct dirent	* ent = NULL;
	DIR		*pDir;
	pDir = opendir( devicefile_path.c_str() );
	if ( pDir == NULL )
	{
		return;
	}
	while ( (ent = readdir( pDir ) ) != NULL )
	{
		
		if ( ent->d_type == 8 )
		{
			string	file( ent->d_name );
			string	file_path = (devicefile_path + (string) ent->d_name);
			if ( file.find( "+" ) != string::npos )
			{
				file = replace( file, "+", "x" );
				string temp = devicefile_path + file;
				rename( file_path.c_str(), temp.c_str() );
				file_path = temp;
			}
			if(file!="lib")
			{
				if(endswith(file,".xml"))
				{
					XmlFiles[xmlfile_index]=file_path;
					xmlfile_index++;
				}
				else
				{
					fstream f;
					f.open(file_path.c_str(),ios_base::in);
					char buffer[7];
					f.get(buffer,7);
					if((string)buffer=="SQLite")
					{
						SQLiteDB[sqlitedb_index]=file_path;
						sqlitedb_index++;
					}
					else if(!endswith(file,".DS_Store"))
					{
						OtherFiles[otherfile_index]=file_path;
						otherfile_index++;
					}
				}
			}
		}
		else  
		{
			if ( strcmp( ent->d_name, "." ) == 0 || strcmp( ent->d_name, ".." ) == 0 )
			{
				continue;
			}
			string	_path( devicefile_path );
			string	_dirName( ent->d_name );
			string	fullDirPath = _path + _dirName + "/";
			CheckDeviceFile( fullDirPath.c_str() );
		}
	}
}