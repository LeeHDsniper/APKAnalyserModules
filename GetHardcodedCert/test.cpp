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
  GetHardcodedCert( "./83a2cba1cb708c7fd7bb00d20021e932", sum, file_Path );
  for ( int i = 0; i < sum; i++ )
    cout << file_Path[i] << endl;
  return(0);
}


