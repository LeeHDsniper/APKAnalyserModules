#ifndef DVM_PERMISSIONS_H
#define DVM_PERMISSIONS_H

#include <string>
#include <iostream>

#define MANI_PERMISSIONS_SUM		144
#define MANI_GROUP_PERMISSIONS_SUM	11


struct Permission
{
	Permission();
	Permission( std::string name, std::string level, std::string info, std::string description,double weight=0 );
	std::string	Permission_Name;
	std::string	Permission_Level;
	std::string	Permission_Info;
	std::string	Permission_Description;
	double Permission_Weight;
};
struct Manifest_Permissions
{
	Manifest_Permissions();
	Permission* search( std::string name );


	Permission permissions[MANI_PERMISSIONS_SUM];
};
struct Manifest_Permission_Group
{
	Manifest_Permission_Group();
	Permission* search( std::string name );


	Permission permissions[MANI_GROUP_PERMISSIONS_SUM];
};
#endif