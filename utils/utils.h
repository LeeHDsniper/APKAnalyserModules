#ifndef UTILS_H
#define UTILS_H

void mymkdir( char * file_Path );
int strisdigit( std::string str );
std::string tolower( std::string str );
std::string replace( std::string str, std::string old_str, std::string new_str );
int startswith( std::string str, std::string withstr );
int endswith( std::string str, std::string withstr );
bool regex_search( std::string patt, std::string where );
void regex_findall( std::string patt, std::string where, std::string saveat[] );
bool isBase64(std::string str);
std::string str(int n);
#endif

