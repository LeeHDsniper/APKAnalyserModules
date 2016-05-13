#include <iostream>
#include <string>
#include "tinyxml.h"
#include "dvm_permissions.h"
#include "manifestdata.h"

using namespace std;

int main( int argc, char* argv[] )
{
    ManifestData();
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
    while ( dvm_permission_list[i].Permission_Name != "" )
    {
        cout << "permission_list[" << i << "]=" << dvm_permission_list[i].Permission_Name << endl;
        i++;
    }
    return(0);
}