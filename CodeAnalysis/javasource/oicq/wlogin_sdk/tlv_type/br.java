package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class br
  extends a
{
  int h = 22;
  int i = 1;
  int j = 1536;
  
  public br()
  {
    g = 24;
  }
  
  public byte[] a(long paramLong1, int paramInt1, long paramLong2, int paramInt2)
  {
    byte[] arrayOfByte = new byte[h];
    util.int16_to_buf(arrayOfByte, 0, i);
    util.int32_to_buf(arrayOfByte, 2, j);
    util.int32_to_buf(arrayOfByte, 6, (int)paramLong1);
    util.int32_to_buf(arrayOfByte, 10, paramInt1);
    util.int32_to_buf(arrayOfByte, 14, (int)paramLong2);
    util.int16_to_buf(arrayOfByte, 18, paramInt2);
    util.int16_to_buf(arrayOfByte, 20, 0);
    a(g);
    b(arrayOfByte, h);
    d();
    return a();
  }
}
