#include <iostream>
#include <string>
#include <cstring>
#include <fstream>
#include "jar2java.h"
using namespace std;

int Jar2Java( string java_path, string tools_path,string jarfile_path,string out_path)
{

    string cmd=java_path+" -jar "+tools_path+"jd-core.jar "+jarfile_path+" "+out_path;
    FILE *f;
    f = popen( cmd.c_str(), "r" );
    pclose( f );
    return(0);
}