#ifndef MD5_H
#define MD5_H

/*MD5变换的参数*/
#define s11 7
#define s12 12
#define s13 17
#define s14 22
#define s21 5
#define s22 9
#define s23 14
#define s24 20
#define s31 4
#define s32 11
#define s33 16
#define s34 23
#define s41 6
#define s42 10
#define s43 15
#define s44 21

/*MD5变换的辅助函数*/
#define F(x, y, z) (((x) & (y)) | ((~x) & (z)))
#define G(x, y, z) (((x) & (z)) | ((y) & (~z)))
#define H(x, y, z) ((x) ^ (y) ^ (z))
#define I(x, y, z) ((y) ^ ((x) | (~z)))

#define ROTATELEFT(num, n) (((num) << (n)) | ((num) >> (32-(n))))

/*
MD5的四种基本变换
*/
#define FF(a, b, c, d, x, s, ac) { \
  (a) += F ((b), (c), (d)) + (x) + ac; \
  (a) = ROTATELEFT ((a), (s)); \
  (a) += (b); \
}
#define GG(a, b, c, d, x, s, ac) { \
  (a) += G ((b), (c), (d)) + (x) + ac; \
  (a) = ROTATELEFT ((a), (s)); \
  (a) += (b); \
}
#define HH(a, b, c, d, x, s, ac) { \
  (a) += H ((b), (c), (d)) + (x) + ac; \
  (a) = ROTATELEFT ((a), (s)); \
  (a) += (b); \
}
#define II(a, b, c, d, x, s, ac) { \
  (a) += I ((b), (c), (d)) + (x) + ac; \
  (a) = ROTATELEFT ((a), (s)); \
  (a) += (b); \
}

#include <cstring>
#include <fstream>
#include <iostream>
using namespace std;

/*定义byte类型结构体*/
typedef unsigned char byte;
/*定义bit32类型结构体*/
typedef unsigned int bit32;

class MD5 {
public:
  /*两个构造函数，分别以字符串和文件为参数 */
  MD5(const string& message);
  MD5(fstream &in);
  /*update函数用来追加字符串计算md5，事实上是对init函数的封装*/
  void update(const string& message);
  /*获取消息摘要*/
  const byte* getDigest();
  /*将摘要转换为字符串*/
  string toStr();
  
private:
  /*两个init函数*/
  void init(const byte* input, size_t len);
  void init(fstream &in);
  /*reset函数用来重置存储单元*/
  void reset();
  /*MD5基本变换*/
  void transform(const byte block[64]);
  /*将long型(64bit)整数转为8*8bit的byte(unsigned char)型*/
  void encode(const bit32* input, byte* output, size_t length);
  void decode(const byte* input, bit32* output, size_t length);

private:
  /*表示计算是否完成*/
  bool finished;
  /*MD5变换的4个缓冲器*/
  bit32 state[4];

  bit32 oldIndex;
  /*buffer的bit数，count[0]是低位*/
  bit32 count[2];

  /*MD5基本变换的单元*/
  byte buffer[64];

  /*128位的消息摘要*/
  byte digest[16];
  /*最多补位64Bytes，所以补位的数组共64Bytes*/
  static const byte PADDING[64];
  /*文件读取的基本单元*/
  static const bit32 BUFFER_SIZE=1024;
  /* Hex numbers. */
  static const char HEX_NUMBERS[16];
};

#endif // MD5_H
