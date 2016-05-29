#include <iostream>
#include <string>
#include "dvm_permissions.h"
#include "manifestdata.h"
#include "../utils/tinyxml/tinyxml.h"
#include "../utils/tinyxml/xmlanalysis.h"

using namespace std;

string	minsdk;
string	maxsdk;
string	targetsdk;

string	package;
string	androidversioncode;
string	androidversionname;

string	activity_list[1024];
string	mainact;

string service_list[1024];

string provider_list[1024];

string receiver_list[1024];

string library_list[1024];

Permission dvm_permission_list[MANI_PERMISSIONS_SUM];


void ManifestData(string manifest_path)
{
	TiXmlDocument doc;
	if ( loadXML( manifest_path, doc ) != 0 )
		return;
	TiXmlElement	* root	= doc.FirstChildElement();
	int		sum	= 0;
	TiXmlElement	* elementsList[1500];
	int		temp_sum = 0;
	TiXmlElement	*templist[1500];
	TiXmlAttribute	*attr;
	TiXmlAttribute	*temp_attr;
	/* SDK */
	if ( getElementsByName( root, sum, elementsList, 1500, "uses-sdk" ) == 0 )
	{
		int i = 0;
		while ( elementsList[i] != NULL )
		{
			if ( getAttributeByName( elementsList[i], attr, "android:minSdkVersion" ) == 0 )
			{
				minsdk = attr->Value();
			}
			if ( getAttributeByName( elementsList[i], attr, "android:maxSdkVersion" ) == 0 )
			{
				maxsdk = attr->Value();
			}
			if ( getAttributeByName( elementsList[i], attr, "android:targetSdkVersion" ) == 0 )
			{
				targetsdk = attr->Value();
			}
			i++;
		}
		for ( int i = 0; i < 1500; i++ )
			elementsList[i] = NULL;
		attr	= NULL;
		sum	= 0;
	}
	/* MANIFEST */
	if ( getElementsByName( root, sum, elementsList, 1500, "manifest" ) == 0 )
	{
		int i = 0;
		while ( elementsList[i] != NULL )
		{
			if ( getAttributeByName( elementsList[i], attr, "package" ) == 0 )
			{
				package = attr->Value();
			}
			if ( getAttributeByName( elementsList[i], attr, "android:versionCode" ) == 0 )
			{
				androidversioncode = attr->Value();
			}
			if ( getAttributeByName( elementsList[i], attr, "android:versionName" ) == 0 )
			{
				androidversionname = attr->Value();
			}
			i++;
		}
		for ( int i = 0; i < 1500; i++ )
		{
			elementsList[i] = NULL;
			templist[i]	= NULL;
		}
		attr	= NULL;
		sum	= 0;
	}
	/* ACTIVITY */
	if ( getElementsByName( root, sum, elementsList, 1500, "activity" ) == 0 )
	{
		int	i	= 0;
		int	p	= 0;
		while ( elementsList[i] != NULL )
		{
			int j = 0;
			if ( getAttributeByName( elementsList[i], attr, "android:name" ) == 0 )
			{
				activity_list[p] = attr->Value();
				p++;
			}
			if ( mainact.length() == 0 )
			{
				if ( getElementsByName( elementsList[i], temp_sum, templist, 1500, "action" ) == 0 )
				{
					while ( templist[j] != NULL )
					{
						if ( getAttributeByName( templist[j], temp_attr, "android:name" ) == 0 )
						{
							if ( strcmp( temp_attr->Value(), "android.intent.action.MAIN" ) == 0 )
							{
								mainact = attr->Value();
							}
						}
						j++;
					}
					for ( int i = 0; i < 1500; i++ )
						templist[i] = NULL;
				}
			}
			i++;
		}

		i		= 0;
		temp_attr	= NULL;
		attr		= NULL;
		sum		= 0;
		temp_sum	= 0;
		if ( mainact == "" )
		{
			while ( elementsList[i] != NULL )
			{
				getAttributeByName( elementsList[i], attr, "android:name" );
				int j = 0;
				if ( getElementsByName( elementsList[i], temp_sum, templist, 1500, "category" ) == 0 )
				{
					while ( templist[j] != NULL )
					{
						if ( getAttributeByName( templist[j], temp_attr, "android:name" ) == 0 )
						{
							if ( strcmp( temp_attr->Value(), "android.intent.category.LAUNCHER" ) == 0 )
							{
								mainact = attr->Value();
							}
						}
						j++;
					}
					for ( int i = 0; i < 1500; i++ )
						templist[i] = NULL;
				}
				i++;
			}
		}
		for ( int i = 0; i < 1500; i++ )
		{
			elementsList[i] = NULL;
			templist[i]	= NULL;
		}
		attr		= NULL;
		temp_attr	= NULL;
		sum		= 0;
		temp_sum	= 0;
	}
	/* SERVICE */
	if ( getElementsByName( root, sum, elementsList, 1500, "service" ) == 0 )
	{
		int	i	= 0;
		int	p	= 0;
		while ( elementsList[i] != NULL )
		{
			if ( getAttributeByName( elementsList[i], attr, "android:name" ) == 0 )
			{
				service_list[p] = attr->Value();
				p++;
			}
			i++;
		}
		for ( int i = 0; i < 1500; i++ )
		{
			elementsList[i] = NULL;
		}
		attr	= NULL;
		sum	= 0;
	}
	/* PROVIDER */
	if ( getElementsByName( root, sum, elementsList, 1500, "provider" ) == 0 )
	{
		int	i	= 0;
		int	p	= 0;
		while ( elementsList[i] != NULL )
		{
			if ( getAttributeByName( elementsList[i], attr, "android:name" ) == 0 )
			{
				provider_list[p] = attr->Value();
				p++;
			}
			i++;
		}
		for ( int i = 0; i < 1500; i++ )
		{
			elementsList[i] = NULL;
		}
		attr	= NULL;
		sum	= 0;
	}
	/* RECERVER */
	if ( getElementsByName( root, sum, elementsList, 1500, "receiver" ) == 0 )
	{
		int	i	= 0;
		int	p	= 0;
		while ( elementsList[i] != NULL )
		{
			if ( getAttributeByName( elementsList[i], attr, "android:name" ) == 0 )
			{
				receiver_list[p] = attr->Value();
				p++;
			}
			i++;
		}
		for ( int i = 0; i < 1500; i++ )
		{
			elementsList[i] = NULL;
		}
		attr	= NULL;
		sum	= 0;
	}
	/* LIBRARY */
	if ( getElementsByName( root, sum, elementsList, 1500, "uses-library" ) == 0 )
	{
		int	i	= 0;
		int	p	= 0;
		while ( elementsList[i] != NULL )
		{
			if ( getAttributeByName( elementsList[i], attr, "android:name" ) == 0 )
			{
				library_list[p] = attr->Value();
				p++;
			}
			i++;
		}
		for ( int i = 0; i < 1500; i++ )
		{
			elementsList[i] = NULL;
		}
		attr	= NULL;
		sum	= 0;
	}
	/* PERMISSION */
	if ( getElementsByName( root, sum, elementsList, 1500, "uses-permission" ) == 0 )
	{
		int	i	= 0;
		int	p	= 0;
		string	permission_list[1024];
		while ( elementsList[i] != NULL )
		{
			if ( getAttributeByName( elementsList[i], attr, "android:name" ) == 0 )
			{
				permission_list[p] = attr->Value();
				p++;
			}
			i++;
		}
		for ( int i = 0; i < 1500; i++ )
		{
			elementsList[i] = NULL;
		}
		attr	= NULL;
		sum	= 0;
		i	= 0;
		p	= 0;
		Manifest_Permissions m;
		while ( permission_list[i] != "" )
		{
			int pos = permission_list[i].rfind( "." );
			if ( pos != -1 )
			{
				char *pmn = &permission_list[i][pos];
				pmn++;
				Permission *search_p = m.search( pmn );
				if ( search_p != NULL )
				{
					int index=0;
					bool has=false;
					while(dvm_permission_list[index].Permission_Name!="")
					{
						if(dvm_permission_list[index].Permission_Name==(string)pmn)
						{
							has=true;
							break;
						}
						index++;
					}
					if(!has)
					{
						dvm_permission_list[p] = *search_p;
						p++;
					}
				}else  {
					dvm_permission_list[p] = Permission( pmn, "dangerous", "Unknown permission from android reference", "Unknown permission from android reference" );
					p++;
				}
			}
			i++;
		}
	}
}