#include <iostream>
#include <fstream>
#include <string>
#include "../utils/tinyxml/tinyxml.h"
#include "../utils/tinyxml/xmlanalysis.h"
#include "strings.h"

using namespace std;

string Strings_List[99999];

void Strings( string java_path, string jar_path, string apk_path, string out_path )
{
	FILE	* f;
	string	cmd = java_path + " -jar " + jar_path + " d " + apk_path + " -o " + out_path + "stringres -f";
	f = popen( cmd.c_str(), "r" );
	if ( f == NULL )
	{
		return;
	}
	pclose( f );
	TiXmlDocument doc;
	if ( loadXML( out_path + "stringres/res/values/strings.xml", doc ) != 0 )
		return;
	TiXmlElement	* root	= doc.FirstChildElement();
	int		sum	= 0;
	TiXmlElement	* elementsList[99999];
	if ( getElementsByName( root, sum, elementsList, 99999, "string" ) == 0 )
	{
		int	i	= 0;
		int	index	= 0;
		while ( elementsList[i] != NULL )
		{
			if ( elementsList[i]->GetText() != NULL && (string) (elementsList[i]->GetText() ) != "" )
			{
				Strings_List[index] = elementsList[i]->GetText();
				index++;
			}
			i++;
		}
	}
}