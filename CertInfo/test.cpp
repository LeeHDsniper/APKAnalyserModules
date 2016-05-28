#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <dirent.h>
#include "certinfo.h"
using namespace std;
int main()
{
	CertInfo( "/usr/bin/jdk1.8.0_91/bin/java", "../Tools/CertPrint.jar", "../TestResult/14897e76b4920e13ac6a455dbaff68df/" );
	return(0);
}


