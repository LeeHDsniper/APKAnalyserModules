package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class cq
  extends a
{
  int h = 0;
  
  public cq()
  {
    g = 8;
  }
  
  public byte[] a(int paramInt1, int paramInt2, int paramInt3)
  {
    h = 8;
    byte[] arrayOfByte = new byte[h];
    util.int16_to_buf(arrayOfByte, 0, paramInt1);
    util.int32_to_buf(arrayOfByte, 2, paramInt2);
    util.int16_to_buf(arrayOfByte, 6, paramInt3);
    a(g);
    b(arrayOfByte, h);
    d();
    return a();
  }
}
