#include <iostream>
#include <string>
#include <fstream>
#include "dex2jar.h"

using namespace std;

int Dex2Jar( string APP_path )
{
	FILE *f;
	string sh_invoke_path="./tools/d2j2/d2j_invoke.sh";
	string sh_dex2jar_path="./tools/d2j2/d2j-dex2jar.sh";
	string cmd = "chmod 777 "+sh_invoke_path;
    f = popen( cmd.c_str(), "r" );
    cmd="chmod 777 "+sh_dex2jar_path;
    f = popen( cmd.c_str(), "r" );
    cmd=sh_dex2jar_path+" "+APP_path+"classes.dex"+" -o ./classes.jar";
    f==NULL;
    f = popen( cmd.c_str(), "r" );
    pclose( f );
    return 0;
}