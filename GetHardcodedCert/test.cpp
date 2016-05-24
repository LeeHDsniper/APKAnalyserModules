#include <iostream>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <string>
#include <cstring>
#include "gethardcodecert.h"
using namespace std;

int main()
{
  char  *file_Path[10];
  string  f;
  int sum = 0;
  GetHardcodedCert( "./14897e76b4920e13ac6a455dbaff68df", sum, file_Path );
  for ( int i = 0; i < sum; i++ )
    cout << file_Path[i] << endl;
  return(0);
}


