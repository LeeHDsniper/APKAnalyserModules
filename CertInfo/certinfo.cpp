#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <dirent.h>
#include "certinfo.h"
#include "../utils/utils.h"

using namespace std;

int CertInfo( string java_path, string jar_path, string APP_path )
{
    FILE    * f;
    char    buff[1024];
    memset( buff, '\0', sizeof(buff) );
    string file_Path = APP_path + "META-INF/";
    DIR     * pDir;
    struct dirent   * ent;
    pDir = opendir( file_Path.c_str() );
    bool found = false;
    while ( (ent = readdir( pDir ) ) != NULL )
    {
        if ( (string) ent->d_name == "CERT.RSA" )
        {
            file_Path    += (string) ent->d_name;
            found       = true;
        }
    }
    closedir( pDir );
    if ( !found )
    {
        pDir = opendir( file_Path.c_str() );
        while ( (ent = readdir( pDir ) ) != NULL )
        {
            string fname = (string) ent->d_name;
            fname=tolower( fname );
            int pos = fname.rfind( '.' );
            if ( pos != string::npos )
            {
                const char *suffix;
                suffix  = fname.c_str();
                suffix  = suffix + pos;
                if ( strcmp( suffix, ".rsa" ) == 0 )
                {
                    file_Path    += (string) ent->d_name;
                    found       = true;
                    break;
                }else if ( strcmp( suffix, ".dsa" ) == 0 )
                {
                    file_Path    += (string) ent->d_name;
                    found       = true;
                    break;
                }
            }
        }
        closedir( pDir );
    }
    if ( found )
    {
        string cmd = java_path + " -jar " + jar_path + " " + file_Path;
        f = popen( cmd.c_str(), "r" );
        if ( f == NULL )
        {
            return(-1);
        }
        fstream file;
        file.open( (APP_path+"certinfo.txt").c_str(), ios_base::out );
        while ( fgets( buff, sizeof(buff), f ) != NULL )
        {
            file.write( buff, strlen( buff ) );
        }
        file.close();
        pclose( f );

        return(0);
    }else
        return(-1);
}