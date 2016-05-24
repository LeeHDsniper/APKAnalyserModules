#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <dirent.h>
#include "certinfo.h"

using namespace std;
void tolower( string &str )
{
    if ( str == "" )
        return;
    for ( int i = 0; i < str.length(); i++ )
    {
        int temp = (int) str[i];
        if ( temp >= 65 && temp <= 90 )
        {
            temp    = temp + 32;
            str[i]  = (char) temp;
        }
    }
}


int CertInfo( string java_path, string jar_path, string APP_path )
{
    FILE    * f;
    char    buff[1024];
    memset( buff, '\0', sizeof(buff) );
    APP_path = APP_path + "META-INF/";
    DIR     * pDir;
    struct dirent   * ent;
    pDir = opendir( APP_path.c_str() );
    bool found = false;
    while ( (ent = readdir( pDir ) ) != NULL )
    {
        if ( (string) ent->d_name == "CERT.RSA" )
        {
            APP_path    += (string) ent->d_name;
            found       = true;
        }
    }
    closedir( pDir );
    if ( !found )
    {
        pDir = opendir( APP_path.c_str() );
        while ( (ent = readdir( pDir ) ) != NULL )
        {
            string fname = (string) ent->d_name;
            tolower( fname );
            int pos = fname.rfind( '.' );
            if ( pos != string::npos )
            {
                const char *suffix;
                suffix  = fname.c_str();
                suffix  = suffix + pos;
                if ( strcmp( suffix, ".rsa" ) == 0 )
                {
                    APP_path    += (string) ent->d_name;
                    found       = true;
                    break;
                }else if ( strcmp( suffix, ".dsa" ) == 0 )
                {
                    APP_path    += (string) ent->d_name;
                    found       = true;
                    break;
                }
            }
        }
        closedir( pDir );
    }
    if ( found )
    {
        string cmd = java_path + " -jar " + jar_path + " " + APP_path;
        f = popen( cmd.c_str(), "r" );
        if ( f == NULL )
        {
            return(-1);
        }
        fstream file;
        file.open( "certinfo.txt", ios_base::out );
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