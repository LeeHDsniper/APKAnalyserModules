#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <dirent.h>
#include "certinfo.h"
using namespace std;
int main()
{
	CertInfo( "/usr/bin/jdk1.8.0_91/bin/java", "./CertPrint.jar", "./83a2cba1cb708c7fd7bb00d20021e932/" );
	return(0);
}


