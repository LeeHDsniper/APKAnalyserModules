#include <string>
#include <iostream>

#define MANI_PERMISSIONS_SUM 144
#define MANI_GROUP_PERMISSIONS_SUM 11

using namespace std;

struct Permission
{
	Permission();
	Permission(string name,string level,string info,string description);
	string Permission_Name;
	string Permission_Level;
	string Permission_Info;
	string Permission_Description;
};
struct Manifest_Permissions
{
	Manifest_Permissions();
	Permission* search(string name);
	Permission permissions[MANI_PERMISSIONS_SUM];
};
struct Manifest_Permission_Group
{
	Manifest_Permission_Group();
	Permission* search(string name);
	Permission permissions[MANI_GROUP_PERMISSIONS_SUM];
};