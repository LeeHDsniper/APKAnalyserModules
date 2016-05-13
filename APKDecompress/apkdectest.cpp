#include <iostream>
#include <cstring>
#include <fstream>
#include <dirent.h>
#include <sys/stat.h>
#include <sys/types.h>
#include "unzip.h"
#include "zlib.h"
using namespace std;
void mymkdir(char * file_Path)
{
	DIR *dp;
	if ((dp = opendir(file_Path)) == NULL)
	{
		int err = mkdir(file_Path,S_IRWXU|S_IRWXG|S_IROTH);
		if(err!=0)
		{
			int end=strlen(file_Path);
			char *p=&file_Path[end-1];
			while ((*p) != '/')
			{
				p--;
			}
			int length=(int)strlen(file_Path)-(int)strlen(p);
			char *temp=new char[length];
			memcpy(temp,file_Path,length);
			mymkdir(temp);
			err = mkdir(file_Path,S_IRWXU|S_IRWXG|S_IROTH);
		}
	}
	closedir(dp);
}
int makedirectory(unzFile zfile,char *extractdirectory)
{
	unsigned int fileName_BufSize=516;
	char *fileName_WithPath=new char[fileName_BufSize];
	char *file_Path=new char[fileName_BufSize];
	char *p,*fileName_WithoutPath;
	unz_file_info64 zFileInfo;
	if (UNZ_OK != unzGetCurrentFileInfo64(zfile, &zFileInfo, fileName_WithPath, fileName_BufSize, NULL, 0, NULL, 0))
	{
		return -1;
	}
	char *temp = new char[fileName_BufSize];
	strcpy(temp,extractdirectory);
	strcat(temp,fileName_WithPath);
	fileName_WithPath = temp;
	p = fileName_WithoutPath = fileName_WithPath;
	while ((*p) != '\0')
	{
		if (((*p) == '/') || ((*p) == '\\'))
		fileName_WithoutPath = p + 1;
		p++;
	}
	int length=(int)strlen(fileName_WithPath)-(int)strlen(fileName_WithoutPath);
	memcpy(file_Path,fileName_WithPath,length);
	mymkdir(file_Path);
}

int extract_currentfile(unzFile zfile,char *extractdirectory)
{
unsigned int fileName_BufSize=516;
char *fileName_WithPath=new char[fileName_BufSize];
char *p,*fileName_WithoutPath;
unz_file_info64 zFileInfo;

if (UNZ_OK != unzGetCurrentFileInfo64(zfile, &zFileInfo, fileName_WithPath, fileName_BufSize, NULL, 0, NULL, 0))
{
return -1;
}
char *temp = new char[fileName_BufSize];
strcpy(temp,extractdirectory);
strcat(temp,fileName_WithPath);
fileName_WithPath = temp;
p = fileName_WithoutPath = fileName_WithPath;
while ((*p) != '\0')
{
if (((*p) == '/') || ((*p) == '\\'))
fileName_WithoutPath = p + 1;
p++;
}
if (UNZ_OK != unzOpenCurrentFile(zfile))
{
	return -2;
}
fstream file;
file.open(fileName_WithPath, ios_base::out | ios_base::binary);
ZPOS64_T fileLength = zFileInfo.uncompressed_size;
char *fileData = new char[fileLength];
//解压缩文件  
ZPOS64_T err = unzReadCurrentFile(zfile, (voidp)fileData, fileLength);
if (err<0)
{
	return -3;
}
file.write(fileData, fileLength);
file.close();
free(fileData);
return 0;
}

int main()
{
unzFile zfile;
char filepath[]="./test.apk";
zfile=unzOpen64(filepath);
if(zfile==NULL)
{
cout<<"[ERROR] 文件不存在"<<endl;
return -1;
}
else
{
cout << "[INFO] 成功打开压缩文件:" <<filepath<< endl;
}
unz_global_info64 zGlobalInfo;
if (UNZ_OK != unzGetGlobalInfo64(zfile, &zGlobalInfo))
{
cout << "[ERROR] 获取压缩文件全局信息失败" << endl;
return -1;
}
for (int i = 0; i < zGlobalInfo.number_entry; i++)
{
int err = makedirectory(zfile, (char *)"83a2cba1cb708c7fd7bb00d20021e932/");
unzCloseCurrentFile(zfile);
unzGoToNextFile(zfile);
}
unzGoToFirstFile (zfile);
for (int i = 0; i < zGlobalInfo.number_entry; i++)
{
int err = extract_currentfile(zfile, (char *)"83a2cba1cb708c7fd7bb00d20021e932/");
unzCloseCurrentFile(zfile);
unzGoToNextFile(zfile);
}
cout<<"[INFO] 解压完成" << endl;
return 0;
}
