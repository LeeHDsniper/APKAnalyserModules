#include <iostream>
#include <string>
#include <fstream>
#include "dex2smali.h"
using namespace std;

int Dex2Smali( string java_path, string jar_path, string APP_path )
{
    string out_path="./smali_source/";
    FILE *f;
    string dex_path=APP_path+"classes.dex";
    string cmd = java_path + " -jar " + jar_path + " " + dex_path+" -o "+out_path;
    f = popen( cmd.c_str(), "r" );
    pclose( f );
    return(0);
}