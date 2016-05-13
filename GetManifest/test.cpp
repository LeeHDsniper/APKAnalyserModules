#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include "getmanifest.h"

using namespace std;

int main()
{
GetManifest("/usr/bin/jdk1.8.0_91/bin/java","./AXMLPrinter2.jar","./AndroidManifest.xml");
return 0;
}
