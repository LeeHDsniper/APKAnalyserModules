#include <iostream>
#include <string>
#include <cctype>
#include <sstream>
#include "tinyxml.h"
#include "xmlanalysis.h"
#include "manifestanalysis.h"

using namespace std;
int main()
{
	ManifestAnalysis( "manifest.xml", ".activity.SplashActivity" );
	
	cout << "----------Manifest Analysis EXPORTED_COUNT------------" << endl;
	cout << "Activity_Count: " << exp_count.Activity_Count << endl;
	cout << "Provider_Count: " << exp_count.Provider_Count << endl;
	cout << "Receiver_Count: " << exp_count.Receiver_Count << endl;
	cout << "Service_Count: " << exp_count.Service_Count << endl;
	cout<<endl;
	
	int i = 0;
	cout << "-------------Manifest Analysis EXPORTED---------------" << endl;
	while ( EXPORTED[i] != "" )
	{
		cout << "EXPORTED[" << i << "]: " << EXPORTED[i] << endl;
		i++;
	}
	cout<<endl;
	cout << "---------------Manifest Analysis RET------------------" << endl;
	i = 0;
	while ( RET[i].Issue != "" )
	{
		cout << "ManifestAnal[" << i << "]" << endl;
		cout << "Issue: " << RET[i].Issue << endl;
		cout << "Severity: " << RET[i].Severity << endl;
		cout << "Description: " << RET[i].Description << endl;
		cout << endl;
		i++;
	}
	return(0);
}