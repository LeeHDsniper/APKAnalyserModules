#ifndef MANIFESTDATA_H
#define MANIFESTDATA_H


/*@
 * Global variables
 */
extern std::string	minsdk;
extern std::string	maxsdk;
extern std::string	targetsdk;

extern std::string	package;
extern std::string	androidversioncode;
extern std::string	androidversionname;

extern std::string	activity_list[1024];
extern std::string	mainact;

extern std::string service_list[1024];

extern std::string provider_list[1024];

extern std::string receiver_list[1024];

extern std::string library_list[1024];

extern Permission dvm_permission_list[MANI_PERMISSIONS_SUM];

int getAllElements( TiXmlNode * root, int &sum, TiXmlElement **elementsList, int size );


int getElementsByName( TiXmlNode *root, int &sum, TiXmlElement **elementsList, int size, std::string elemName = "" );


int getAttributeByName( TiXmlElement *element, TiXmlAttribute * &attr, std::string attrName = "" );


int loadXML( std::string xml_path, TiXmlDocument &doc );


void ManifestData();


#endif