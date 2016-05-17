package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class i
  extends a
{
  int h = 6;
  
  public i()
  {
    g = 263;
  }
  
  public byte[] a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    byte[] arrayOfByte = new byte[h];
    util.int16_to_buf(arrayOfByte, 0, paramInt1);
    util.int8_to_buf(arrayOfByte, 2, paramInt2);
    util.int16_to_buf(arrayOfByte, 3, paramInt3);
    util.int8_to_buf(arrayOfByte, 5, paramInt4);
    a(g);
    b(arrayOfByte, h);
    d();
    return a();
  }
}
