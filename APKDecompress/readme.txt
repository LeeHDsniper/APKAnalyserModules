模块功能：

解压缩apk文件

**********************

文件结构：


apkdecompress.h   C++头文件
apkdecompress.cpp C++源文件 \* 封装了解压所需要的函数 *\
----------------------
test.cpp    	  C++源文件 \* 程序入口 *\
test              可执行文件

**********************

编译环境：

Ubuntu 16.04LTS
g++ 5.3.1

**********************

编译方法：

1. 解压zlib-1.2.8.zip到zlib文件夹
2. 终端执行
   ./zlib/configure
   make
   sudo make install
3. 终端下输入 g++ ./test.cpp apkdecompress.cpp ../utils/zlib/unzip.o ../utils/zlib/ioapi.o ../utils/utils.cpp -o test -lz 得到可执行文件

**********************

运行：

终端下输入：./test
输出：
[INFO] 成功打开压缩文件:./test.apk
[INFO] 解压完成
最终结果：
apk文件被解压到TestResult文件夹中

