#include <iostream>
#include "dex2jar.h"
#include "dex2smali.h"
#include "jar2java.h"
using namespace std;
int main()
{
	Dex2Jar("../TestResult/14897e76b4920e13ac6a455dbaff68df/","../Tools/","../TestResult/");
	Dex2Smali( "/usr/bin/jdk1.8.0_91/bin/java", "../Tools/", "../TestResult/14897e76b4920e13ac6a455dbaff68df/","../TestResult/smali_source" );
	Jar2Java( "/usr/bin/jdk1.8.0_91/bin/java", "../Tools/","../TestResult/classes.jar","../TestResult/javasource");
	return 0;
}
