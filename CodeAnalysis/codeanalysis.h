#ifndef CODEANALYSIS_H
#define CODEANALYSIS_H
#define APITRACING_SUM		64
#define REVIEWTRACING_SUM	64
#define NORMALTRACING_SUM	256
#define DICT_VALUES_SUM		9999

#include "./ManifestData/dvm_permissions.h"

struct DICT_API
{
	void append( std::string value );


	std::string	Key;
	std::string	Values[DICT_VALUES_SUM];
	std::string	Description;
};
struct DICT_REVIEW
{
	void append( std::string value );


	std::string	Key;
	std::string	Security;
	std::string	Values[DICT_VALUES_SUM];
	std::string	Description;
};
struct DICT_NORMAL
{
	void append( std::string value );


	std::string	Key;
	std::string	Values[DICT_VALUES_SUM];
};
struct APITracing
{
	APITracing();
	DICT_API* operator []( std::string key );


	DICT_API api[APITRACING_SUM];
};
struct ReviewTracing
{
	ReviewTracing();
	DICT_REVIEW* operator []( std::string key );


	DICT_REVIEW code[APITRACING_SUM];
};
struct NORMALs
{
	DICT_NORMAL *operator[]( std::string key );


	DICT_NORMAL dict[NORMALTRACING_SUM];
};

extern NORMALs			ul;
extern NORMALs			em;
extern APITracing		api_t;
extern ReviewTracing	rev_t;

extern bool		native;
extern bool		dynamic;
extern bool		reflect;
extern bool		crypto;
extern bool		obfus;

void CodeAnalysis( std::string javasource_path, std::string md5, Permission *perm );


void JavaAnalysis( std::string javasource_path, std::string md5, Permission *perm );


#endif