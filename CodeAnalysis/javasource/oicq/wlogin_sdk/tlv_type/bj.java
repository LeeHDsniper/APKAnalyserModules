package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class bj
  extends a
{
  int h = 0;
  
  public bj()
  {
    g = 375;
  }
  
  public byte[] a(long paramLong, String paramString)
  {
    byte[] arrayOfByte = new byte[0];
    if (paramString != null) {
      arrayOfByte = paramString.getBytes();
    }
    h = (arrayOfByte.length + 7);
    paramString = new byte[h];
    util.int8_to_buf(paramString, 0, 1);
    util.int64_to_buf32(paramString, 1, paramLong);
    util.int16_to_buf(paramString, 5, arrayOfByte.length);
    System.arraycopy(arrayOfByte, 0, paramString, 7, arrayOfByte.length);
    int i = arrayOfByte.length;
    a(g);
    b(paramString, h);
    d();
    return a();
  }
}
