#include <iostream>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string>
#include <cstring>

using namespace std;

void GetHardcodedCert( const char *path, int &sum, char **file_Path )
{
  struct dirent * ent = NULL;
  DIR   *pDir;
  pDir = opendir( path );
  if ( pDir == NULL )
  {
    return;
  }
  while ( (ent = readdir( pDir ) ) != NULL )
  {
    if ( ent->d_type == 8 )
    {
      char *p, *suffix;
      p = ent->d_name;
      while ( (*p) != '\0' )
      {
        if ( ( (*p) == '.') )
          suffix = p + 1;
        p++;
      }
      if ( (strcmp( suffix, "cer" ) == 0) || (strcmp( suffix, "pem" ) == 0) ||
           (strcmp( suffix, "cert" ) == 0) || (strcmp( suffix, "crt" ) == 0) ||
           (strcmp( suffix, "pub" ) == 0) || (strcmp( suffix, "key" ) == 0) ||
           (strcmp( suffix, "pfx" ) == 0) || (strcmp( suffix, "p12" ) == 0) )
      {
        int len = (int) strlen( path ) + (int) strlen( ent->d_name ) + 1;
        file_Path[sum] = new char[len];
        strcpy( file_Path[sum], path );
        file_Path[sum][(int) strlen( path )] = '/';
        strcat( file_Path[sum], ent->d_name );
        sum++;
      }
    }else  {
      if ( strcmp( ent->d_name, "." ) == 0 || strcmp( ent->d_name, ".." ) == 0 )
      {
        continue;
      }
      /* directory */
      string  _path( path );
      string  _dirName( ent->d_name );
      string  fullDirPath = _path + "/" + _dirName;
      GetHardcodedCert( fullDirPath.c_str(), sum, file_Path );
    }
  }
}