package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.MD5;
import oicq.wlogin_sdk.tools.util;

public class bu
  extends a
{
  byte[] h = new byte[0];
  
  public bu()
  {
    g = 388;
  }
  
  public byte[] a(long paramLong, String paramString)
  {
    paramString = MD5.toMD5Byte(paramString);
    int i = paramString.length;
    byte[] arrayOfByte = new byte[i + 8];
    System.arraycopy(paramString, 0, arrayOfByte, 0, i);
    i = 0 + i;
    util.int64_to_buf(arrayOfByte, i, paramLong);
    paramString = MD5.toMD5Byte(arrayOfByte);
    a(g);
    b(paramString, paramString.length);
    d();
    return a();
  }
  
  public Boolean e()
  {
    if (e < 16) {
      return Boolean.valueOf(false);
    }
    h = new byte[16];
    System.arraycopy(f, d, h, 0, 16);
    return Boolean.valueOf(true);
  }
}
