#include <iostream>
#include <cstring>
#include <fstream>
#include <dirent.h>
#include <sys/stat.h>
#include <sys/types.h>
#include "unzip.h"
#include "zlib.h"
#include "apkdecompress.h"

using namespace std;

int main()
{
	unzFile zfile;
	char	filepath[] = "./test.apk";
	zfile = unzOpen64( filepath );
	if ( zfile == NULL )
	{
		cout << "[ERROR] 文件不存在" << endl;
		return(-1);
	}else  {
		cout << "[INFO] 成功打开压缩文件:" << filepath << endl;
	}
	unz_global_info64 zGlobalInfo;
	if ( UNZ_OK != unzGetGlobalInfo64( zfile, &zGlobalInfo ) )
	{
		cout << "[ERROR] 获取压缩文件全局信息失败" << endl;
		return(-1);
	}
	for ( int i = 0; i < zGlobalInfo.number_entry; i++ )
	{
		int err = makedirectory( zfile, (char *) "14897e76b4920e13ac6a455dbaff68df/" );
		unzCloseCurrentFile( zfile );
		unzGoToNextFile( zfile );
	}
	unzGoToFirstFile( zfile );
	for ( int i = 0; i < zGlobalInfo.number_entry; i++ )
	{
		int err = extract_currentfile( zfile, (char *) "14897e76b4920e13ac6a455dbaff68df/" );
		unzCloseCurrentFile( zfile );
		unzGoToNextFile( zfile );
	}
	cout << "[INFO] 解压完成" << endl;
	return(0);
}


