模块功能：

从apk解压出的文件夹中找到所有后缀名为cer|pem|cert|crt|pub|key|pfx|p12的文件路径

**********************

文件结构：

gethardcodedcert.h                    C++头文件
gethardcodedcert.cpp                  C++源文件
----------------------
test.cpp                              C++源文件/*程序入口*/
test                                  可执行文件
----------------------
./83a2cba1cb708c7fd7bb00d20021e932    文件夹(包含apk解压后的所有文件)

**********************

编译环境：

Ubuntu 16.04LTS
g++ 5.3.1

**********************

编译方法：

终端下输入g++ test.cpp gethardcodedcert.cpp -o test

**********************

运行：

终端下输入：./test
输出：
./83a2cba1cb708c7fd7bb00d20021e932/assets/videosdkcrt/sec.video.qq.com.crt
