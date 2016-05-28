#include <iostream>
#include <string>
#include <cstring>
#include <fstream>
#include "../utils/utils.h"
#include "../utils/zlib/unzip.h"
#include "../utils/zlib/zlib.h"
#include "apkdecompress.h"

using namespace std;

int makedirectory( unzFile zfile, char *extractdirectory )
{
	unsigned int	fileName_BufSize	= 516;
	char		*fileName_WithPath	= new char[fileName_BufSize];
	char		*file_Path		= new char[fileName_BufSize];
	char		*p, *fileName_WithoutPath;
	unz_file_info64 zFileInfo;
	if ( UNZ_OK != unzGetCurrentFileInfo64( zfile, &zFileInfo, fileName_WithPath, fileName_BufSize, NULL, 0, NULL, 0 ) )
	{
		return(-1);
	}
	char *temp = new char[fileName_BufSize];
	strcpy( temp, extractdirectory );
	strcat( temp, fileName_WithPath );
	fileName_WithPath	= temp;
	p			= fileName_WithoutPath = fileName_WithPath;
	while ( (*p) != '\0' )
	{
		if ( ( (*p) == '/') || ( (*p) == '\\') )
			fileName_WithoutPath = p + 1;
		p++;
	}
	int length = (int) strlen( fileName_WithPath ) - (int) strlen( fileName_WithoutPath );
	memcpy( file_Path, fileName_WithPath, length );
	mymkdir( file_Path );
}


int extract_currentfile( unzFile zfile, char *extractdirectory )
{
	unsigned int	fileName_BufSize	= 516;
	char		*fileName_WithPath	= new char[fileName_BufSize];
	char		*p, *fileName_WithoutPath;
	unz_file_info64 zFileInfo;

	if ( UNZ_OK != unzGetCurrentFileInfo64( zfile, &zFileInfo, fileName_WithPath, fileName_BufSize, NULL, 0, NULL, 0 ) )
	{
		return(-1);
	}
	char *temp = new char[fileName_BufSize];
	strcpy( temp, extractdirectory );
	strcat( temp, fileName_WithPath );
	fileName_WithPath	= temp;
	p			= fileName_WithoutPath = fileName_WithPath;
	while ( (*p) != '\0' )
	{
		if ( ( (*p) == '/') || ( (*p) == '\\') )
			fileName_WithoutPath = p + 1;
		p++;
	}
	if ( UNZ_OK != unzOpenCurrentFile( zfile ) )
	{
		return(-2);
	}
	fstream file;
	file.open( fileName_WithPath, ios_base::out | ios_base::binary );
	ZPOS64_T	fileLength	= zFileInfo.uncompressed_size;
	char		*fileData	= new char[fileLength];
	/* 解压缩文件 */
	ZPOS64_T err = unzReadCurrentFile( zfile, (voidp) fileData, fileLength );
	if ( err < 0 )
	{
		return(-3);
	}
	file.write( fileData, fileLength );
	file.close();
	free( fileData );
	return(0);
}
void Decompress(string filepath,string decompress_to_path)
{
	unzFile zfile;
	zfile = unzOpen64( filepath.c_str() );
	if ( zfile == NULL )
	{
		cout << "[ERROR] 文件不存在" << endl;
		return;
	}else  
	{
		cout << "[INFO] 成功打开压缩文件:" << filepath << endl;
	}
	unz_global_info64 zGlobalInfo;
	if ( UNZ_OK != unzGetGlobalInfo64( zfile, &zGlobalInfo ) )
	{
		cout << "[ERROR] 获取压缩文件全局信息失败" << endl;
		return;
	}
	for ( int i = 0; i < zGlobalInfo.number_entry; i++ )
	{
		int err = makedirectory( zfile, &decompress_to_path[0] );
		unzCloseCurrentFile( zfile );
		unzGoToNextFile( zfile );
	}
	unzGoToFirstFile( zfile );
	for ( int i = 0; i < zGlobalInfo.number_entry; i++ )
	{
		int err = extract_currentfile( zfile, &decompress_to_path[0] );
		unzCloseCurrentFile( zfile );
		unzGoToNextFile( zfile );
	}
	cout << "[INFO] 解压完成" << endl;
}


