#include <iostream>
#include <string>
#include "tinyxml.h"

using namespace std;

/*@input
TiXmlNode *root : point of root element
int * sum : will changed with elements amount 
TiXmlElement *elementsList : point list where store elements' point
int size : The number thar elementsList can store as much as possible
*/
/*@return
-1 : xml's root element doesn't exit
-2 : All elements in xml document is more than elementsList's [size]
0  : All elements are stored in elementsList
*/
int getAllElements(TiXmlNode * root,int &sum,TiXmlElement **elementsList,int size)
{
    if(root == NULL)
    {
        elementsList[sum]=NULL;
        sum=0;
        return -1;
    }
    elementsList[sum]=root->ToElement();
    sum++;

    TiXmlNode* pchild = root->FirstChildElement();
    while(pchild)
    {
        if(sum==size)
            return -2;
        getAllElements(pchild,sum,elementsList,size);
        pchild=pchild->NextSiblingElement();
        if(pchild==NULL)
            return 0;
    }
}
/*@input
TiXmlNode *root : point of root element
int * sum : will changed with elements amount 
TiXmlElement *elementsList : point list where store consistent elements' point
int size : The number thar elementsList can store as much as possible
const string elemName : the name of element you want to search
*/
/*@return
-1 : xml's root element doesn't exit
-2 : All consistent elements in xml document is more than elementsList's [size]
0  : All consistent elements are stored in elementsList
*/
int getElementsByName(TiXmlNode *root,int &sum,TiXmlElement **elementsList,int size,const string elemName="")
{
    if(elemName=="")
        getAllElements(root,sum,elementsList,size);
    if(root==NULL)
    {
        elementsList[sum]=NULL;
        sum=0;
        return -1;
    }
    if(root->Value()==elemName)
    {
        elementsList[sum]=root->ToElement();
        sum++;
    }
    TiXmlNode* pchild = root->FirstChildElement();
    while(pchild)
    {
        if(sum==size)
           return -2;
        getElementsByName(pchild,sum,elementsList,size,elemName);
        pchild=pchild->NextSiblingElement();
        if(pchild==NULL)
            return 0;
    }
}
/*@input
TiXmlElement *element : the element you want to search attribute in
TiXmlAttribute *&attr : the point of a TiXmlAttribute you want to store 
const string attrName : the name of attribute you want to search
*/
/*@return
-1 : xml's element or attrName is NULL
-2 : the element doesn't have this attribute
0  : find attribute successful
*/
int getAttributeByName(TiXmlElement *element,TiXmlAttribute *&attr, const string attrName="")
{
    if((attrName=="")||(element==NULL))
    {
        attr=NULL;
        return -1;
    }
    attr=element->FirstAttribute();
    while(attr!=NULL)
    {
        if(attr->Name()==attrName)
            return 0;
        else
            attr=attr->Next();
    }
    attr=NULL;
    return -2;
}
/*@return:
-1 : file doesn't exit
-2 : xml file doesn't have root element
*/
int loadXML(string xml_path,TiXmlDocument &doc)
{

    if(!doc.LoadFile((xml_path.c_str())))
    {
        return -1;
    }

    TiXmlElement* root = doc.FirstChildElement();
    if(root == NULL)
    {
        doc.Clear();
        return -2;
    }
    return 0;
}
void ManifestAnalysis(string mainact)
{
    TiXmlDocument doc;
    if(loadXML("manifest.xml",doc) !=0)
        return;
    TiXmlElement* root=doc.FirstChildElement();
    int sum=0;
    TiXmlElement* elementsList[1500];
    TiXmlAttribute *attr;
    //SDK
    if(getElementsByName(root,sum,elementsList,1500,"uses-sdk")==0)
    {
    }
}
int main(int argc, char* argv[])
{
    return 0;
}