#include <iostream>
#include "../utils/utils.h"
#include "../utils/zlib/unzip.h"
#include "../utils/zlib/zlib.h"
#include "apkdecompress.h"


using namespace std;

int main()
{
	Decompress("../TestResult/test.apk","../TestResult/14897e76b4920e13ac6a455dbaff68df/");
	return(0);
}


