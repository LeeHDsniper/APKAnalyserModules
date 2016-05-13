#ifndef APKDECOMPRESS_H
#define APKDECOMPRESS_H

void mymkdir( char * file_Path );


int makedirectory( unzFile zfile, char *extractdirectory );


int extract_currentfile( unzFile zfile, char *extractdirectory );


#endif