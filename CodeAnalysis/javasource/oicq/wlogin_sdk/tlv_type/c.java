package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class c
  extends a
{
  int h = 1;
  int i = 5;
  int j = 22;
  
  public c()
  {
    g = 256;
  }
  
  public byte[] a(long paramLong1, long paramLong2, int paramInt1, int paramInt2)
  {
    byte[] arrayOfByte = new byte[j];
    util.int16_to_buf(arrayOfByte, 0, h);
    util.int32_to_buf(arrayOfByte, 2, i);
    util.int32_to_buf(arrayOfByte, 6, (int)paramLong1);
    util.int32_to_buf(arrayOfByte, 10, (int)paramLong2);
    util.int32_to_buf(arrayOfByte, 14, paramInt1);
    util.int32_to_buf(arrayOfByte, 18, paramInt2);
    a(g);
    b(arrayOfByte, j);
    d();
    return a();
  }
}
