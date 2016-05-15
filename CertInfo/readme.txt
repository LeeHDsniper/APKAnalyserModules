模块功能：
利用CertPrint.jar解析APK的签名信息
并写入certinfo.txt文件

**********************

文件结构：

certinfo.h           C++头文件
certinfo.cpp         C++源文件
----------------------
test.cpp             C++源文件/*程序入口*/
test                 可执行文件
----------------------
83a2cba1cb708c7fd7bb00d20021e932/                            只保留了签名文件的apk解压缩包
83a2cba1cb708c7fd7bb00d20021e932/META-INF/ANDROIDR.RSA       签名文件
----------------------
CertPrint.jar        jar文件

**********************

编译环境：

Ubuntu 16.04LTS
g++ 5.3.1

**********************

编译方法：

终端下输入g++ certinfo.cpp test.cpp -o test

**********************

运行：

终端下输入：./test
最终结果：在当前文件夹生成解析出的certinfo.txt文件
