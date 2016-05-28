模块功能：
由于apk中的AndroidManifest.xml是乱码，不能直接解析
利用AXMLPrinter2.jar程序重新编码apk解压缩后的AndroidManifest.xml
并写入manifest.xml文件

**********************

文件结构：

getmanifest.h        C++头文件
getmanifest.cpp      C++源文件
----------------------
test.cpp             C++源文件/*程序入口*/
test                 可执行文件
----------------------

**********************

编译环境：

Ubuntu 16.04LTS
g++ 5.3.1

**********************

编译方法：

终端下输入g++ test.cpp getmanifest.cpp -o test

**********************

运行：

终端下输入：./test
最终结果：在TestResult下app解压后文件夹生成重新编码后的manifest.xml文件
