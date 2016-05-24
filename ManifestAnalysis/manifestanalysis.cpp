#include <iostream>
#include <string>
#include <cctype>
#include <sstream>
#include "tinyxml.h"
#include "xmlanalysis.h"
#include "manifestanalysis.h"

using namespace std;


/*@
 * Global variables
 */
Manifest_Anal	RET[128];
string		EXPORTED[128];
Exported_Count	exp_count;


int	RET_Index	= 0;
int	EXP_Index	= 0;

int strisdigit( string str )
{
	for ( int i = 0; i < str.length(); i++ )
	{
		if ( !isdigit( str[i] ) )
			return(-1);
	}
	return(1);
}


void ManifestAnalysis( std::string xml_path, std::string main_activity )
{
	TiXmlDocument doc;
	if ( loadXML( xml_path, doc ) != 0 )
		return;
	TiXmlElement	* root	= doc.FirstChildElement();
	int		sum	= 0;
	TiXmlElement	* elementsList[1500];
	TiXmlAttribute	*attr;
	if ( getElementsByName( root, sum, elementsList, 1500, "service" ) == 0 )
	{
		int i = 0;
		while ( elementsList[i] != NULL )
		{
			if ( getAttributeByName( elementsList[i], attr, "android:exported" ) == 0 )
			{
				if ( (string) attr->Value() == "true" )
				{
					string perm = "";
					if ( getAttributeByName( elementsList[i], attr, "android:permission" ) == 0 )
					{
						perm = " (permission " + (string) attr->Value() + " exists.) ";
					}
					if ( getAttributeByName( elementsList[i], attr, "android:name" ) == 0 )
					{
						RET[RET_Index].Issue		= "Service (" + (string) attr->Value() + ") is not Protected." + perm + " [android:exported=true]";
						RET[RET_Index].Severity		= "high";
						RET[RET_Index].Description	= "A service was found to be shared with other apps on the device without an intent filter or a permission requirement therefore leaving it accessible to any other application on the device.";
						RET_Index++;
					}
					exp_count.Service_Count++;
				}
			}
			i++;
		}
		for ( i = 0; i < 1500; i++ )
			elementsList[i] = NULL;
		attr	= NULL;
		sum	= 0;
	}
	if ( getElementsByName( root, sum, elementsList, 1500, "application" ) == 0 )
	{
		TiXmlNode	* child;
		int		i = 0;
		while ( elementsList[i] != NULL )
		{
			if ( getAttributeByName( elementsList[i], attr, "android:debuggable" ) == 0 )
			{
				if ( (string) attr->Value() == "true" )
				{
					RET[RET_Index].Issue		= "Debug Enabled For App [android:debuggable=true]";
					RET[RET_Index].Severity		= "high";
					RET[RET_Index].Description	= "Debugging was enabled on the app which makes it easier for reverse engineers to hook a debugger to it. This allows dumping a stack trace and accessing debugging helper classes.";
					RET_Index++;
				}
			}
			if ( getAttributeByName( elementsList[i], attr, "android:allowBackup" ) == 0 )
			{
				if ( (string) attr->Value() == "true" )
				{
					RET[RET_Index].Issue		= "Application Data can be Backed up [android:allowBackup=true]";
					RET[RET_Index].Severity		= "medium";
					RET[RET_Index].Description	= "This flag allows anyone to backup your application data via adb. It allows users who have enabled USB debugging to copy application data off of the device.";
					RET_Index++;
				}
			}else  {
				RET[RET_Index].Issue		= "Application Data can be Backed up [android:allowBackup] flag is missing.";
				RET[RET_Index].Severity		= "medium";
				RET[RET_Index].Description	= "The flag [android:allowBackup] should be set to false. By default it is set to true and allows anyone to backup your application data via adb. It allows users who have enabled USB debugging to copy application data off of the device.";
				RET_Index++;
			}
			if ( getAttributeByName( elementsList[i], attr, "android:testOnly" ) == 0 )
			{
				if ( (string) attr->Value() == "true" )
				{
					RET[RET_Index].Issue		= "Application is in Test Mode [android:testOnly=true]";
					RET[RET_Index].Severity		= "high";
					RET[RET_Index].Description	= "It may expose functionality or data outside of itself that would cause a security hole.";
					RET_Index++;
				}
			}
			for ( child = elementsList[i]->FirstChild(); child; child = child->NextSibling() )
			{
				if ( ( (string) child->Value() == "activity") || ( (string) child->Value() == "activity-alias") )
				{
					if ( child->ToElement()->Attribute( "android:taskAffinity" ) )
					{
						RET[RET_Index].Issue		= "TaskAffinity is set for Activity (" + (string) child->ToElement()->Attribute( "android:name" ) + ")";
						RET[RET_Index].Severity		= "high";
						RET[RET_Index].Description	= "If taskAffinity is set, then other application could read the Intents sent to Activities belonging to another task. Always use the default setting keeping the affinity as the package name in order to prevent sensitive information inside sent or received Intents from being read by another application.";
						RET_Index++;
					}else if ( child->ToElement()->Attribute( "android:launchMode" ) )
					{
						if ( ( (string) (child->ToElement()->Attribute( "android:launchMode" ) ) == "2") || ( (string) (child->ToElement()->Attribute( "android:launchMode" ) ) == "singleTask") || ( (string) (child->ToElement()->Attribute( "android:launchMode" ) ) == "3") || ( (string) (child->ToElement()->Attribute( "android:launchMode" ) ) == "singleInstance") )
						{
							RET[RET_Index].Issue		= "Launch Mode of Activity (" + (string) child->ToElement()->Attribute( "android:name" ) + ") is not standard.";
							RET[RET_Index].Severity		= "high";
							RET[RET_Index].Description	= "An Activity should not be having the launch mode attribute set to \"singleTask/singleInstance\" as it becomes root Activity and it is possible for other applications to read the contents of the calling Intent. So it is required to use the \"standard\" launch mode attribute when sensitive information is included in an Intent.";
							RET_Index++;
						}
					}else  {
					}
				}
				bool	isExp	= false;
				bool	impE	= false;
				if ( ( ( (string) child->Value() == "activity") || ( (string) child->Value() == "activity-alias") || ( (string) child->Value() == "provider") || ( (string) child->Value() == "receiver") ) && ( (child->ToElement()->Attribute( "android:exported" ) ) && ( (string) (child->ToElement()->Attribute( "android:exported" ) ) == "true") ) )
				{
					isExp = true;
					string perm;
					if ( child->ToElement()->Attribute( "android:permission" ) )
					{
						perm = " (permission " + (string) child->ToElement()->Attribute( "android:permission" ) + " exists.) ";
					}
					if ( (child->ToElement()->Attribute( "android:name" ) ) && ( ( (string) child->ToElement()->Attribute( "android:name" ) ) != main_activity) )
					{
						if ( ( (string) child->Value() == "activity") || ( (string) child->Value() == "activity-alias") )
						{
							EXPORTED[EXP_Index] = (string) child->ToElement()->Attribute( "android:name" );
							EXP_Index++;
						}
						RET[RET_Index].Issue		= (string) child->Value() + " (" + (string) child->ToElement()->Attribute( "android:name" ) + ") is not Protected." + perm + " [android:exported=true]";
						RET[RET_Index].Severity		= "high";
						RET[RET_Index].Description	= "The " + (string) child->ToElement()->Attribute( "android:name" ) + " was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device.";
						RET_Index++;
						exp_count.Activity_Count++;
					}
				}
				if ( ( ( (string) child->Value() == "activity") || ( (string) child->Value() == "activity-alias") || ( (string) child->Value() == "provider") || ( (string) child->Value() == "receiver") ) && ( (child->ToElement()->Attribute( "android:exported" ) ) && ( (string) (child->ToElement()->Attribute( "android:exported" ) ) == "false") ) )
				{
					impE = true;
				}
				if ( isExp == false && impE == false )
				{
					bool		isInf = false;
					TiXmlNode	*intentfilters;
					for ( intentfilters = child->FirstChild(); intentfilters; intentfilters = intentfilters->NextSibling() )
					{
						if ( (string) intentfilters->Value() == "intent-filter" )
							isInf = true;
					}
					if ( isInf )
					{
						if ( (child->ToElement()->Attribute( "android:name" ) ) && ( ( (string) child->ToElement()->Attribute( "android:name" ) ) != main_activity) )
						{
							if ( ( (string) child->Value() == "activity") || ( (string) child->Value() == "activity-alias") )
							{
								EXPORTED[EXP_Index] = (string) child->ToElement()->Attribute( "android:name" );
								EXP_Index++;
							}
							RET[RET_Index].Issue		= (string) child->ToElement()->Attribute( "android:name" ) + "( " + (string) child->Value() + " )" + "is not Protected.<br>An intent-filter exists.";
							RET[RET_Index].Severity		= "high";
							RET[RET_Index].Description	= "The " + (string) child->ToElement()->Attribute( "android:name" ) + " was found to be shared with other apps on the device therefore leaving it accessible to any other application on the device. The presence of intent-filter indicates that the " + (string) child->ToElement()->Attribute( "android:name" ) + " is explicitly exported.";
							RET_Index++;
							exp_count.Activity_Count++;
						}
					}
				}
			}
			i++;
		}
		for ( int i = 0; i < 1500; i++ )
			elementsList[i] = NULL;
		attr	= NULL;
		sum	= 0;
	}

	if ( getElementsByName( root, sum, elementsList, 1500, "grant-uri-permission" ) == 0 )
	{
		int	i	= 0;
		string	title	= "Improper Content Provider Permissions";
		string	desc	= "A content provider permission was set to allows access from any other app on the device. Content providers may contain sensitive information about an app and therefore should not be shared.";
		while ( elementsList[i] != NULL )
		{
			if ( (elementsList[i]->Attribute( "android:pathPrefix" ) ) && ( ( (string) elementsList[i]->Attribute( "android:pathPrefix" ) ) == "/") )
			{
				RET[RET_Index].Issue		= title + " [pathPrefix=/] ";
				RET[RET_Index].Severity		= "high";
				RET[RET_Index].Description	= desc;
				RET_Index++;
			}else if ( (elementsList[i]->Attribute( "android:path" ) ) && ( ( (string) elementsList[i]->Attribute( "android:path" ) ) == "/") )
			{
				RET[RET_Index].Issue		= title + " [path=/] ";
				RET[RET_Index].Severity		= "high";
				RET[RET_Index].Description	= desc;
				RET_Index++;
			}else if ( (elementsList[i]->Attribute( "android:pathPattern" ) ) && ( ( (string) elementsList[i]->Attribute( "android:pathPattern" ) ) == "*") )
			{
				RET[RET_Index].Issue		= title + " [path=*] ";
				RET[RET_Index].Severity		= "high";
				RET[RET_Index].Description	= desc;
				RET_Index++;
			}
			i++;
		}
		for ( i = 0; i < 1500; i++ )
			elementsList[i] = NULL;
		attr	= NULL;
		sum	= 0;
	}
	if ( getElementsByName( root, sum, elementsList, 1500, "data" ) == 0 )
	{
		int i = 0;
		while ( elementsList[i] != NULL )
		{
			if ( (elementsList[i]->Attribute( "android:scheme" ) ) && ( ( (string) elementsList[i]->Attribute( "android:scheme" ) ) == "android_secret_code") )
			{
				string desc = "A secret code was found in the manifest. These codes, when entered into the dialer grant access to hidden content that may contain sensitive information.";
				RET[RET_Index].Issue		= "Dailer Code: " + (string) elementsList[i]->Attribute( "android:host" ) + " Found [android:scheme=\"android_secret_code\"]";
				RET[RET_Index].Severity		= "high";
				RET[RET_Index].Description	= desc;
				RET_Index++;
			}else if ( elementsList[i]->Attribute( "android:port" ) )
			{
				string	title	= "Data SMS Receiver Set";
				string	desc	= "A binary SMS recevier is configured to listen on a port. Binary SMS messages sent to a device are processed by the application in whichever way the developer choses. The data in this SMS should be properly validated by the application. Furthermore, the application should assume that the SMS being received is from an untrusted source.";
				RET[RET_Index].Issue		= "on Port: " + (string) elementsList[i]->Attribute( "android:port" ) + " Found [android:port]";
				RET[RET_Index].Severity		= "high";
				RET[RET_Index].Description	= desc;
				RET_Index++;
			}
			i++;
		}
		for ( i = 0; i < 1500; i++ )
			elementsList[i] = NULL;
		attr	= NULL;
		sum	= 0;
	}
	if ( getElementsByName( root, sum, elementsList, 1500, "intent-filter" ) == 0 )
	{
		int i = 0;
		while ( elementsList[i] != NULL )
		{
			if ( (elementsList[i]->Attribute( "android:priority" ) ) && strisdigit( (string) elementsList[i]->Attribute( "android:priority" ) ) )
			{
				int		value = 0;
				stringstream	ss( (string) elementsList[i]->Attribute( "android:priority" ) );
				ss >> value;
				if ( value > 100 )
					RET[RET_Index].Issue = "High Intent Priority (" + (string) elementsList[i]->Attribute( "android:priority" ) + ") [android:priority]";
				RET[RET_Index].Severity		= "medium";
				RET[RET_Index].Description	= "By setting an intent priority higher than another intent, the app effectively overrides other requests.";
				RET_Index++;
			}
			i++;
		}
		for ( i = 0; i < 1500; i++ )
			elementsList[i] = NULL;
		attr	= NULL;
		sum	= 0;
	}
	if ( getElementsByName( root, sum, elementsList, 1500, "action" ) == 0 )
	{
		int i = 0;
		while ( elementsList[i] != NULL )
		{
			if ( (elementsList[i]->Attribute( "android:priority" ) ) && strisdigit( (string) elementsList[i]->Attribute( "android:priority" ) ) )
			{
				int		value = 0;
				stringstream	ss( (string) elementsList[i]->Attribute( "android:priority" ) );
				ss >> value;
				if ( value > 100 )
					RET[RET_Index].Issue = "High Action Priority (" + (string) elementsList[i]->Attribute( "android:priority" ) + ") [android:priority]";
				RET[RET_Index].Severity		= "medium";
				RET[RET_Index].Description	= "By setting an action priority higher than another action, the app effectively overrides other requests.";
				RET_Index++;
			}
			i++;
		}
	}
}


