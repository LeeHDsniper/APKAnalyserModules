#ifndef DYNAMICANALYSIS_H
#define DYNAMICANALYSIS_H
struct DICT_NORMAL
{
	void append( std::string value );
	std::string	Key;
	std::string	Values[DICT_VALUES_SUM];
};
struct NORMALs
{
	DICT_NORMAL *operator[]( std::string key );
	DICT_NORMAL dict[NORMALTRACING_SUM];
};
void RefreshVM(std::string vboxmessage_path,std::string uuid,std::string snapshot_uuid);
void Install_Run(std::string device_IP,std::string device_Port,std::string APP_path,std::string package,std::string mainactivity);
void GetScreenSize(std::string device_IP,std::string device_Port);
void ScreenShot(std::string device_IP,std::string device_Port,std::string out_path);
void Touch(std::string device_IP,std::string device_Port,std::string x_axis,std::string y_axis);
void ExecuteADB(std::string device_IP,std::string device_Port,std::string ADB_cmd);
void StopTest(std::string device_IP,std::string device_Port,std::string out_logcat_path,std::string out_errorlog_path,std::string out_dumpsys_path,std::string package);
void DumpData(std::string device_IP,std::string device_Port,std::string out_appfile_path,std::string package,int timeout);
void ExportedActivityTest(std::string device_IP,std::string device_Port,std::string exported_activity_list[],std::string package,std::string screenshot_path);
void ActivityTest(std::string device_IP,std::string device_Port,std::string activity_list[],std::string package,std::string screenshot_path);
#endif