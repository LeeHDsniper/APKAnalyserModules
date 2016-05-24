#include <iostream>
#include "dex2jar.h"
#include "dex2smali.h"
#include "jar2java.h"
using namespace std;
int main()
{
	Dex2Jar("./14897e76b4920e13ac6a455dbaff68df/");
	Dex2Smali( "/usr/bin/jdk1.8.0_91/bin/java", "./tools/baksmali.jar", "./14897e76b4920e13ac6a455dbaff68df/" );
	Jar2Java( "/usr/bin/jdk1.8.0_91/bin/java", "./tools/jd-core.jar","./classes.jar" );
	return 0;
}
