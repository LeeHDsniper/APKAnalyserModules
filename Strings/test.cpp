#include <iostream>
#include <string>
#include "strings.h"

using namespace std;
int main()
{
	Strings( "/usr/bin/jdk1.8.0_91/bin/java", "../Tools/strings_from_apk.jar", "../TestResult/test.apk", "../TestResult/" );
	int i = 0;
	while ( Strings_List[i] != "")
	{
		cout << Strings_List[i] << endl;
		i++;
	}
	return(0);
}