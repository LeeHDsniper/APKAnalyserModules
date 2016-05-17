#include <iostream>
#include <string>
#include <cstring>
#include <fstream>
#include "jar2java.h"
using namespace std;

int Jar2Java( string java_path, string jar_path,string file_path )
{
	int pos=jar_path.rfind("/");
	const char *suffix;
    suffix  = jar_path.c_str();
    suffix  = suffix + pos+1;
    string cmd;
    FILE *f;
    if(strcmp(suffix,"jd-core.jar")==0)
    {
    	cmd=java_path+" -jar "+jar_path+" "+file_path+" ./javasource";
    	f = popen( cmd.c_str(), "r" );
    	pclose( f );
    	return 0;
    }
    else
    {
    	return -1;
    }
    return(0);
}