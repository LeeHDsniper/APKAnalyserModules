#include <iostream>
#include <fstream>
#include <string>
#include <cstring>

using namespace std;

int GetManifest (string java_path,string jar_path,string xml_path)  
{
    FILE * f;
    char buff[1024];  
    memset (buff ,'\0', sizeof(buff));
    string cmd =  java_path+" -jar "+jar_path+" "+xml_path;  
    f= popen (cmd.c_str (), "r");  
    if(f==NULL) {  
        return -1;  
    }
    fstream file;
    file.open("manifest.xml", ios_base::out);
    while(fgets (buff, sizeof(buff), f)!=NULL)     
    {      
        file.write(buff,strlen(buff));
    }    
    file.close();
    pclose(f);
  
    return 0;  
}  
int main()
{
GetManifest("/usr/bin/jdk1.8.0_91/bin/java","./AXMLPrinter2.jar","./AndroidManifest.xml");
return 0;
}
