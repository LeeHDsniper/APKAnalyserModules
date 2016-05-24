#ifndef DYNAMICANALYSIS_H
#define DYNAMICANALYSIS_H
#define APIANA_SUM		1024


struct DICT_APIANA
{
	DICT_APIANA();
	DICT_APIANA(std::string method,std::string args,std::string ret,std::string info);
	std::string	Method;
	std::string	Args;
	std::string	Return;
	std::string	Info;
};
struct API_ANAs
{
	void append( DICT_APIANA d );	
	DICT_APIANA dict[APIANA_SUM];
};

extern API_ANAs	API_BASE64;
extern API_ANAs	API_FILEIO;
extern API_ANAs	API_REFLECT;
extern API_ANAs	API_SYSPROP;
extern API_ANAs	API_CNTVAL;
extern API_ANAs	API_BINDER;
extern API_ANAs	API_CRYPTO;
extern API_ANAs	API_ACNTMNGER;
extern API_ANAs	API_DEVICEINFO;
extern API_ANAs	API_NET;
extern API_ANAs	API_DEXLOADER;
extern API_ANAs	API_CMD;
extern API_ANAs	API_SMS;
extern std::string 	URLs[256];
extern std::string	EMAILs[256];
extern std::string 	XmlFiles[256];
extern std::string 	SQLiteDB[256];
extern std::string	OtherFiles[256];
extern FILE *process_proxy;
void RefreshVM(std::string vboxmessage_path,std::string uuid,std::string snapshot_uuid);
void Install_Run(std::string device_IP,std::string device_Port,std::string APP_path,std::string package,std::string mainactivity);
void WebProxy(std::string proxy_ip,std::string proxy_port,bool status);
void GetScreenSize(std::string device_IP,std::string device_Port);
void ScreenShot(std::string device_IP,std::string device_Port,std::string out_path);
void Touch(std::string device_IP,std::string device_Port,std::string x_axis,std::string y_axis);
void ExecuteADB(std::string device_IP,std::string device_Port,std::string ADB_cmd);
void StopTest(std::string device_IP,std::string device_Port,std::string out_logcat_path,std::string out_errorlog_path,std::string out_dumpsys_path,std::string package);
void DumpData(std::string device_IP,std::string device_Port,std::string out_appfile_path,std::string package,int timeout);
void ExportedActivityTest(std::string device_IP,std::string device_Port,std::string exported_activity_list[],std::string package,std::string screenshot_path);
void ActivityTest(std::string device_IP,std::string device_Port,std::string activity_list[],std::string package,std::string screenshot_path);
void APIAnalysis(std::string errorlog_path,std::string package);
void RunAnalysis(std::string logs_path,std::string package);
void ExtractTar(std::string tarextract_path,std::string package);
void CheckDeviceFile(std::string devicefile_path);
#endif