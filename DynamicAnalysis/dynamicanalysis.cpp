#include <iostream>
#include <string>
#include <sstream>
#include <ctime>
#include <fstream>
#include <unistd.h>
#include "dynamicanalysis.h"
using namespace std;

/*convert int to a string*/
string str(int n)
{
	stringstream ss;
	ss<<n;
	string str;
	ss>>str;
	return str;
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
       	cout<<buff<<endl;
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
       	cout<<buff<<endl;
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
       	cout<<buff<<endl;
       }
       pclose( f );
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
       	cout<<buff<<endl;
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
       	cout<<buff<<endl;
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
       	cout<<buff<<endl;
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
       	cout<<buff<<endl;
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
       	cout<<buff<<endl;
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
       		cout<<cmd<<endl;
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
       		cout<<buff<<endl;
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
       		cout<<buff<<endl;
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
       		cout<<buff<<endl;
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
       		cout<<buff<<endl;
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
       		cout<<buff<<endl;
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
       		cout<<buff<<endl;
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
       		cout<<buff<<endl;
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
       		cout<<buff<<endl;
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
       		cout<<buff<<endl;
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
       		cout<<buff<<endl;
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
       		cout<<buff<<endl;
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
	       		cout<<buff<<endl;
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
	       		cout<<buff<<endl;
	       }
	       pclose(f);
	}
}
void ActivityTest(std::string device_IP,std::string device_Port,std::string activity_list[],std::string package,std::string screenshot_path)
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
	       		cout<<buff<<endl;
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
	       		cout<<buff<<endl;
	       }
	       pclose(f);
	}
}