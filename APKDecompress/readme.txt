模块功能：

解压缩apk文件

**********************

文件结构：

ioapi.h    C头文件+++++++++++++++++++++
ioapi.c    C源文件                    +                                  
unzip.h    C头文件                    +--------->zlib库文件
unzip.c    C源文件                    +
zlib.h     C头文件+++++++++++++++++++++
----------------------
ioapi.o    obj文件        \* obj 文件由gcc ioapi.c -c生成*\
unzip.o    obj文件        \* obj 文件由gcc unzip.c -c生成*\
----------------------
apkdecompress.h   C++头文件
apkdecompress.cpp C++源文件 \* 封装了解压所需要的函数 *\
----------------------
test.cpp    	  C++源文件 \* 程序入口 *\
test              可执行文件
----------------------
test.apk          apk文件
zlib-1.2.8.zip    zlib官方库文件

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
3. 终端下输入 g++ test.cpp apkdecompress.cpp ioapi.o unzip.o -o test -lz 得到可执行文件

**********************

运行：

终端下输入：./test
输出：
[INFO] 成功打开压缩文件:./test.apk
[INFO] 解压完成
最终结果：
apk文件被解压

