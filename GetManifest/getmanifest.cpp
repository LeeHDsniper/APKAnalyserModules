#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include "getmanifest.h"

using namespace std;

int GetManifest( string java_path, string jar_path, string APP_path )
{
    FILE    * f;
    char    buff[1024];
    string xml_path=APP_path+"AndroidManifest.xml";
    memset( buff, '\0', sizeof(buff) );
    string cmd = java_path + " -jar " + jar_path + " " + xml_path;
    f = popen( cmd.c_str(), "r" );
    if ( f == NULL )
    {
        return(-1);
    }
    fstream file;
    file.open( "manifest.xml", ios_base::out );
    while ( fgets( buff, sizeof(buff), f ) != NULL )
    {
        file.write( buff, strlen( buff ) );
    }
    file.close();
    pclose( f );

    return(0);
}