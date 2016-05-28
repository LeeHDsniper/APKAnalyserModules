#include <iostream>
#include <string>
#include <cstring>
#include <dirent.h>
#include <cctype>
#include <regex.h>
#include <sstream>
#include <sys/stat.h>
#include <sys/types.h>
#include "utils.h"
#include "./base64/base64.h"
using namespace std;
void mymkdir( char * file_Path )
{
	DIR *dp;
	if ( (dp = opendir( file_Path ) ) == NULL )
	{
		int err = mkdir( file_Path, S_IRWXU | S_IRWXG | S_IROTH );
		if ( err != 0 )
		{
			int	end	= strlen( file_Path );
			char	*p	= &file_Path[end - 1];
			while ( (*p) != '/' )
			{
				p--;
			}
			int	length	= (int) strlen( file_Path ) - (int) strlen( p );
			char	*temp	= new char[length];
			memcpy( temp, file_Path, length );
			mymkdir( temp );
			err = mkdir( file_Path, S_IRWXU | S_IRWXG | S_IROTH );
		}
	}
	closedir( dp );
}
int strisdigit( string str )
{
	for ( int i = 0; i < str.length(); i++ )
	{
		if ( !isdigit( str[i] ) )
			return(-1);
	}
	return(1);
}
string tolower( string str )
{
	if ( str == "" )
		return("");
	for ( int i = 0; i < str.length(); i++ )
	{
		int temp = (int) str[i];
		if ( temp >= 65 && temp <= 90 )
		{
			temp	= temp + 32;
			str[i]	= (char) temp;
		}
	}
	return(str);
}
string replace( string str, string old_str, string new_str )
{
	int	index	= 0;
	int	pos	= 0;
	while ( (pos = str.find( old_str, index ) ) != string::npos )
	{
		str.replace( pos, old_str.length(), new_str );
		index = pos + old_str.length();
	}
	return(str);
}


int startswith( string str, string withstr )
{
	if ( str.find( withstr ) == 0 )
		return(1);
	else if ( str.find( withstr ) == string::npos )
		return(0);
	else
		return(0);
}


int endswith( string str, string withstr )
{
	if ( str.rfind( withstr ) == string::npos )
		return(0);
	else if ( (str.length() - str.rfind( withstr ) ) == withstr.length() )
		return(1);
	else
		return(0);
}
bool regex_search( string patt, string where )
{
	regex_t		reg;
	regmatch_t	pmatch[64];
	const char	* pattern = patt.c_str();
	regcomp( &reg, pattern, REG_EXTENDED );
	int ret = regexec( &reg, where.c_str(), 64, pmatch, 0 );
	regfree( &reg );
	if ( ret == 0 )
		return(true);
	else
		return(false);
}


void regex_findall( string patt, string where, string saveat[] )
{
	regex_t		reg;
	regmatch_t	pmatch[64];
	const char	* pattern = patt.c_str();
	regcomp( &reg, pattern, REG_EXTENDED );
	int ret = regexec( &reg, where.c_str(), 64, pmatch, 0 );
	regfree( &reg );
	int index = 0;
	if ( ret == 0 )
	{
		for ( int i = 1; i < 64 && pmatch[i].rm_so != -1; i++ )
		{
			char buff[500];
			memset( buff, '\0', 500 );

			int len = pmatch[i].rm_eo - pmatch[i].rm_so; /* 匹配长度 */
			strncpy( buff, where.c_str() + pmatch[i].rm_so, len );

			if ( strcmp( buff, "https://" ) != 0 && strcmp( buff, "http://" ) != 0 && strcmp( buff, "ftps://" ) != 0 && strcmp( buff, "file://" ) != 0 && strcmp( buff, "javascript:" ) != 0 && strcmp( buff, "data:" ) != 0 )
			{
				saveat[index] = string( buff );
				index++;
			}
		}
		return;
	}else
		return;
}
bool isBase64(string str)
{
	bool result=regex_search("^[A-Za-z0-9+/]+[=]{0,2}$",str);
	return result;
}
/*convert int to a string*/
string str(int n)
{
	stringstream ss;
	ss<<n;
	string str;
	ss>>str;
	return str;
}