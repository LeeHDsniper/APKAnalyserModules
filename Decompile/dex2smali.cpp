#include <iostream>
#include <string>
#include <fstream>
#include "dex2smali.h"
using namespace std;

int Dex2Smali( string java_path, string jar_path, string dex_path,string out_path)
{
    FILE *f;
    string cmd = java_path + " -jar " + jar_path + "baksmali.jar " + dex_path+"classes.dex -o "+out_path;
    f = popen( cmd.c_str(), "r" );
    pclose( f );
    return(0);
}