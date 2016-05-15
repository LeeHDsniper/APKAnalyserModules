#include <iostream>
#include "dex2jar.h"
#include "dex2smali.h"
#include "jar2java.h"
using namespace std;
int main()
{
	Dex2Jar("./83a2cba1cb708c7fd7bb00d20021e932/");
	Dex2Smali( "/usr/bin/jdk1.8.0_91/bin/java", "./tools/baksmali.jar", "./83a2cba1cb708c7fd7bb00d20021e932/" );
	Jar2Java( "/usr/bin/jdk1.8.0_91/bin/java", "./tools/jd-core.jar","./classes.jar" );
	return 0;
}