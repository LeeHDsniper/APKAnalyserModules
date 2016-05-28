#include <iostream>
#include <string>
#include "manifestanalysis.h"
#include "../utils/tinyxml/tinyxml.h"
#include "../utils/tinyxml/xmlanalysis.h"
#include "../utils/utils.h"

using namespace std;
int main()
{
	ManifestAnalysis( "../TestResult/14897e76b4920e13ac6a455dbaff68df/manifest.xml", "com.dumplingsandwich.pencilsketch.activities.SplashScreenActivity" );
	
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