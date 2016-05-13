#include <iostream>
#include <fstream>
#include "md5.h"
using namespace std;

int main() 
{
	//计算hello的md5值
	MD5 md5_str_test("hello");
	cout<<"md5 of \"hello\" is: "<<md5_str_test.toStr()<<endl;                              
	//将world补充到hello后面，计算helloworld的md5值
	const string str="world";
    md5_str_test.update(str);
    cout<<"md5 of \"helloworld\" is: "<<md5_str_test.toStr()<<endl; 
    //计算一个apk文件的md5值
    fstream file;
    file.open("test.apk",ios_base::in|ios_base::binary);
    MD5 md5_file_test(file);
    cout<<"md5 of file test.apk is: "<<md5_file_test.toStr()<<endl; 
	return 0;
}
