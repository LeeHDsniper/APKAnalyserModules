#include <iostream>
#include <string>
#include "dvm_permissions.h"
#include "manifestdata.h"
#include "../utils/tinyxml/tinyxml.h"
#include "../utils/tinyxml/xmlanalysis.h"
using namespace std;

int main( int argc, char* argv[] )
{
    ManifestData("../TestResult/14897e76b4920e13ac6a455dbaff68df/manifest.xml");
    cout << "minsdk=" << minsdk << endl;
    cout << "maxsdk=" << maxsdk << endl;
    cout << "targetsdk=" << targetsdk << endl;
    cout << "package=" << package << endl;
    cout << "androidversioncode=" << androidversioncode << endl;
    cout << "androidversionname=" << androidversionname << endl;
    cout << "mainact=" << mainact << endl;
    int i = 0;
    while ( activity_list[i] != "" )
    {
        cout << "activity_list[" << i << "]=" << activity_list[i] << endl;
        i++;
    }
    i = 0;
    while ( service_list[i] != "" )
    {
        cout << "service_list[" << i << "]=" << service_list[i] << endl;
        i++;
    }
    i = 0;
    while ( provider_list[i] != "" )
    {
        cout << "provider_list[" << i << "]=" << provider_list[i] << endl;
        i++;
    }
    i = 0;
    while ( receiver_list[i] != "" )
    {
        cout << "receiver_list[" << i << "]=" << receiver_list[i] << endl;
        i++;
    }
    i = 0;
    while ( library_list[i] != "" )
    {
        cout << "library_list[" << i << "]=" << library_list[i] << endl;
        i++;
    }
    i = 0;
    double Weight=0;
    while ( dvm_permission_list[i].Permission_Name != "" )
    {
        cout << "permission_list[" << i << "]=" << dvm_permission_list[i].Permission_Name << endl;
        cout<<"Description:"<<dvm_permission_list[i].Permission_Description<<endl;
        cout<<"weight:"<<dvm_permission_list[i].Permission_Weight<<endl;
        Weight+=dvm_permission_list[i].Permission_Weight;
        cout<<"-----------------------------------"<<endl;
        i++;
    }
    cout<<"Result:"<<Weight<<endl;
    return(0);
}