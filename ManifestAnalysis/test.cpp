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
	double Weight=0;
	if(i<25)
	{
		Weight=2.0;
	}
	else if(i<45)
	{
		Weight=4.0;
	}
	else if(i<60)
	{
		Weight=6.0;
	}
	else if(i<70)
	{
		Weight=8.0;
	}
	else if(i<75)
	{
		Weight=10.0;
	}
	else if(i<80)
	{
		Weight=12.0;
	}
	else if(i<85)
	{
		Weight=14.0;
	}
	else if(i<90)
	{
		Weight=16.0;
	}
	else if(i<95)
	{
		Weight=18.0;
	}
	else
	{
		Weight=20.0;
	}
	cout<<"Weight="<<Weight<<endl;
	return(0);
}