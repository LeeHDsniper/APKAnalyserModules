模块功能：

计算文件的md5

**********************

文件结构：

md5.h      C++头文件
md5.cpp    C++源文件
----------------------
getmd5.cpp C++源文件
getmd5     可执行文件
----------------------
test.apk   apk文件

**********************

编译环境：

Ubuntu 16.04LTS
g++ 5.3.1

**********************

编译方法：

终端下输入g++ md5.cpp test.cpp -o test

**********************

运行：

终端下输入：./test
输出：
md5 of "hello" is: 5d41402abc4b2a76b9719d911017c592
md5 of "helloworld" is: fc5e038d38a57032085441e7fe7010b0
md5 of file test.apk is: 83a2cba1cb708c7fd7bb00d20021e932
