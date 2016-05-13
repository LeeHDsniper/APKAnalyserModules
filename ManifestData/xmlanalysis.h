#ifndef XMLANALYSIS_H
#define XMLANALYSIS_H

int getAllElements( TiXmlNode * root, int &sum, TiXmlElement **elementsList, int size );


int getElementsByName( TiXmlNode *root, int &sum, TiXmlElement **elementsList, int size, std::string elemName = "" );


int getAttributeByName( TiXmlElement *element, TiXmlAttribute * &attr, std::string attrName = "" );


int loadXML( std::string xml_path, TiXmlDocument &doc );

#endif