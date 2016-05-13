#include <iostream>
#include <string>
#include "tinyxml.h"
#include "dvm_permissions.h"

using namespace std;

static string minsdk;
static string maxsdk;
static string targetsdk;

static string package;
static string androidversioncode;
static string androidversionname;

static string activity_list[1024];
static string mainact;

static string service_list[1024];

static string provider_list[1024];

static string receiver_list[1024];

static string library_list[1024];

static Permission dvm_permission_list[MANI_PERMISSIONS_SUM];
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
void ManifestData()
{
    TiXmlDocument doc;
    if(loadXML("manifest.xml",doc) !=0)
        return;
    TiXmlElement* root=doc.FirstChildElement();
    int sum=0;
    TiXmlElement* elementsList[1500];
    int temp_sum=0;
    TiXmlElement *templist[1500];
    TiXmlAttribute *attr;
    TiXmlAttribute *temp_attr;
    //SDK
    if(getElementsByName(root,sum,elementsList,1500,"uses-sdk")==0)
    {
        int i=0;
        while(elementsList[i]!=NULL)
        {
            if(getAttributeByName(elementsList[i],attr,"android:minSdkVersion")==0)
            {
                minsdk=attr->Value();
            }
            if(getAttributeByName(elementsList[i],attr,"android:maxSdkVersion")==0)
            {
                maxsdk=attr->Value();
            }
            if(getAttributeByName(elementsList[i],attr,"android:targetSdkVersion")==0)
            {
                targetsdk=attr->Value();
            }
            i++;
        }
        for(int i=0;i<1500;i++)
            elementsList[i]=NULL;
        attr=NULL;
        sum=0;
    }
    //MANIFEST
    if(getElementsByName(root,sum,elementsList,1500,"manifest")==0)
    {
        int i=0;
        while(elementsList[i]!=NULL)
        {
            
            if(getAttributeByName(elementsList[i],attr,"package")==0)
            {
                package=attr->Value();
            }
            if(getAttributeByName(elementsList[i],attr,"android:versionCode")==0)
            {
                androidversioncode=attr->Value();
            }
            if(getAttributeByName(elementsList[i],attr,"android:versionName")==0)
            {
                androidversionname=attr->Value();
            }
            i++;
        }
        for(int i=0;i<1500;i++)
        {
            elementsList[i]=NULL;
            templist[i]=NULL;
        }
        attr=NULL;
        sum=0;
    }
    //ACTIVITY
    if(getElementsByName(root,sum,elementsList,1500,"activity")==0)
    {
        int i=0;
        int p=0;
        while(elementsList[i]!=NULL)
        {
            int j=0;   
            if(getAttributeByName(elementsList[i],attr,"android:name")==0)
            {
                activity_list[p]=attr->Value();
                p++;
            }
            if(mainact.length()==0)
            {
                if(getElementsByName(elementsList[i],temp_sum,templist,1500,"action")==0)
                { 
                    while(templist[j]!=NULL)
                    {
                        
                        if(getAttributeByName(templist[j],temp_attr,"android:name")==0)
                        {
                            if(strcmp(temp_attr->Value(),"android.intent.action.MAIN")==0)
                            {
                                mainact=attr->Value();
                            }
                        }
                        j++;
                    }
                    for(int i=0;i<1500;i++)
                        templist[i]=NULL;
                }
            }
            i++;
        }
        
        i=0;
        temp_attr=NULL;
        attr=NULL;
        sum=0;
        temp_sum=0;
        if(mainact=="")
        {
            while(elementsList[i]!=NULL)
            {
                getAttributeByName(elementsList[i],attr,"android:name");
                int j=0;   
                if(getElementsByName(elementsList[i],temp_sum,templist,1500,"category")==0)
                { 
                    while(templist[j]!=NULL)
                    {
                        if(getAttributeByName(templist[j],temp_attr,"android:name")==0)
                        {
                            if(strcmp(temp_attr->Value(),"android.intent.category.LAUNCHER")==0)
                            {
                                mainact=attr->Value();
                            }
                        }
                        j++;
                    }
                    for(int i=0;i<1500;i++)
                        templist[i]=NULL;
                }
            i++;
            }
        }
        for(int i=0;i<1500;i++)
        {
            elementsList[i]=NULL;
            templist[i]=NULL;
        }
        attr=NULL;
        temp_attr=NULL;
        sum=0;
        temp_sum=0;
    }
    //SERVICE
    if(getElementsByName(root,sum,elementsList,1500,"service")==0)
    {
        int i=0;
        int p=0;
        while(elementsList[i]!=NULL)
        {
            
            if(getAttributeByName(elementsList[i],attr,"android:name")==0)
            {
                service_list[p]=attr->Value();
                p++;
            }
            i++;
        }
        for(int i=0;i<1500;i++)
        {
            elementsList[i]=NULL;
        }
        attr=NULL;
        sum=0;
    }
    //PROVIDER
    if(getElementsByName(root,sum,elementsList,1500,"provider")==0)
    {
        int i=0;
        int p=0;
        while(elementsList[i]!=NULL)
        {
            
            if(getAttributeByName(elementsList[i],attr,"android:name")==0)
            {
                provider_list[p]=attr->Value();
                p++;
            }
            i++;
        }
        for(int i=0;i<1500;i++)
        {
            elementsList[i]=NULL;
        }
        attr=NULL;
        sum=0;
    }
    //RECERVER
    if(getElementsByName(root,sum,elementsList,1500,"receiver")==0)
    {
        int i=0;
        int p=0;
        while(elementsList[i]!=NULL)
        {
            
            if(getAttributeByName(elementsList[i],attr,"android:name")==0)
            {
                receiver_list[p]=attr->Value();
                p++;
            }
            i++;
        }
        for(int i=0;i<1500;i++)
        {
            elementsList[i]=NULL;
        }
        attr=NULL;
        sum=0;
    }
    //LIBRARY
    if(getElementsByName(root,sum,elementsList,1500,"uses-library")==0)
    {
        int i=0;
        int p=0;
        while(elementsList[i]!=NULL)
        {
            
            if(getAttributeByName(elementsList[i],attr,"android:name")==0)
            {
                library_list[p]=attr->Value();
                p++;
            }
            i++;
        }
        for(int i=0;i<1500;i++)
        {
            elementsList[i]=NULL;
        }
        attr=NULL;
        sum=0;
    }
    //PERMISSION
    if(getElementsByName(root,sum,elementsList,1500,"uses-permission")==0)
    {
        int i=0;
        int p=0;
        string permission_list[1024];
        while(elementsList[i]!=NULL)
        {
            
            if(getAttributeByName(elementsList[i],attr,"android:name")==0)
            {
                permission_list[p]=attr->Value();
                p++;
            }
            i++;
        }
        for(int i=0;i<1500;i++)
        {
            elementsList[i]=NULL;
        }
        attr=NULL;
        sum=0;
        i=0;
        p=0;
        Manifest_Permissions m;
        while(permission_list[i]!="")
        {
            
            int pos=permission_list[i].rfind(".");
            if(pos!=-1)
            {
                char *pmn=&permission_list[i][pos];
                pmn++;
                Permission *search_p=m.search(pmn);
                if(search_p!=NULL)
                {
                    dvm_permission_list[p]=*search_p;
                    p++;
                }
                else
                {
                    dvm_permission_list[p]=Permission(pmn,"dangerous", "Unknown permission from android reference", "Unknown permission from android reference");
                    p++;
                }
            }
            i++;
        }
    }
}
int main(int argc, char* argv[])
{
    ManifestData();
    cout<<"minsdk="<<minsdk<<endl;
    cout<<"maxsdk="<<maxsdk<<endl;
    cout<<"targetsdk="<<targetsdk<<endl;
    cout<<"package="<<package<<endl;
    cout<<"androidversioncode="<<androidversioncode<<endl;
    cout<<"androidversionname="<<androidversionname<<endl;
    cout<<"mainact="<<mainact<<endl;
    int i=0;
    while(activity_list[i]!="")
    {
        cout<<"activity_list["<<i<<"]="<<activity_list[i]<<endl;
        i++;
    }
    i=0;
    while(service_list[i]!="")
    {
        cout<<"service_list["<<i<<"]="<<service_list[i]<<endl;
        i++;
    }
    i=0;
    while(provider_list[i]!="")
    {
        cout<<"provider_list["<<i<<"]="<<provider_list[i]<<endl;
        i++;
    }
    i=0;
    while(receiver_list[i]!="")
    {
        cout<<"receiver_list["<<i<<"]="<<receiver_list[i]<<endl;
        i++;
    }
    i=0;
    while(library_list[i]!="")
    {
        cout<<"library_list["<<i<<"]="<<library_list[i]<<endl;
        i++;
    }
    i=0;
    while(dvm_permission_list[i].Permission_Name!="")
    {
        cout<<"permission_list["<<i<<"]="<<dvm_permission_list[i].Permission_Name<<endl;
        i++;
    }
    return 0;
}