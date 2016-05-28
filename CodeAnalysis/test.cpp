#include <iostream>
#include "../utils/tinyxml/tinyxml.h"
#include "../ManifestData/dvm_permissions.h"
#include "../ManifestData/manifestdata.h"
#include "codeanalysis.h"

using namespace std;

int main()
{
	ManifestData("../TestResult/14897e76b4920e13ac6a455dbaff68df/manifest.xml");
	CodeAnalysis( "../TestResult/javasource/", "14897e76b4920e13ac6a455dbaff68df", &dvm_permission_list[0] );
	if ( native )
		cout << "native = true" << endl;
	else
		cout << "native = false" << endl;
	if ( dynamic )
		cout << "dynamic = true" << endl;
	else
		cout << "dynamic = false" << endl;
	if ( reflect )
		cout << "reflect = true" << endl;
	else
		cout << "reflect = false" << endl;
	if ( crypto )
		cout << "crypto = true" << endl;
	else
		cout << "crypto = false" << endl;
	if ( obfus )
		cout << "obfus = true" << endl;
	else
		cout << "obfus = false" << endl;
	cout << "*****************************URL Analysis******************************" << endl;
	int i = 0;
	while ( ul.dict[i].Key != "" )
	{
		cout << ul.dict[i].Key << ":" << endl;
		int j = 0;
		while ( ul.dict[i].Values[j] != "" )
		{
			cout << "- " << ul.dict[i].Values[j] << endl;
			j++;
		}
		cout << "-------------------------------------------------------------------" << endl;
		i++;
	}
	i = 0;
	cout << "****************************Email Analysis*****************************" << endl;
	while ( em.dict[i].Key != "" )
	{
		cout << em.dict[i].Key << ":" << endl;
		int j = 0;
		while ( em.dict[i].Values[j] != "" )
		{
			cout << "- " << em.dict[i].Values[j] << endl;
			j++;
		}
		cout << "-------------------------------------------------------------------" << endl;
		i++;
	}
	i = 0;
	cout << "*****************************API Analysis******************************" << endl;
	while ( api_t.api[i].Key != "" )
	{
		if ( api_t.api[i].Values[0] != "" )
		{
			cout << "* API:" << api_t.api[i].Key << endl;
			cout << "* Description:" << api_t.api[i].Description << endl;
		}
		int j = 0;
		while ( api_t.api[i].Values[j] != "" )
		{
			cout << "- " << api_t.api[i].Values[j] << endl;
			j++;
		}
		cout << "-------------------------------------------------------------------" << endl;
		i++;
	}
	i = 0;
	cout << "***********************Sensitive Code Analysis*************************" << endl;
	while ( rev_t.code[i].Key != "" )
	{
		if ( rev_t.code[i].Values[0] != "" )
		{
			cout << "* Key:" << rev_t.code[i].Key << endl;
			cout << "* Security:" << rev_t.code[i].Security << endl;
			cout << "* Description:" << rev_t.code[i].Description << endl;
		}
		int j = 0;
		while ( rev_t.code[i].Values[j] != "" )
		{
			cout << "- " << rev_t.code[i].Values[j] << endl;
			j++;
		}
		i++;
		cout << "-------------------------------------------------------------------" << endl;
	}
	return(0);
}
