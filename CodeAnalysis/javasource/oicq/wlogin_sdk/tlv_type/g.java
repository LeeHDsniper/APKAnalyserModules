package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class g
  extends a
{
  int h = 0;
  int i = 0;
  int j = 0;
  int k = 0;
  
  public g()
  {
    g = 261;
  }
  
  public Boolean e()
  {
    if (e < 2) {
      return Boolean.valueOf(false);
    }
    i = util.buf_to_int16(f, d);
    if (e < i + 2 + 2) {
      return Boolean.valueOf(false);
    }
    h = util.buf_to_int16(f, d + 2 + i);
    if (e < i + 2 + 2 + h) {
      return Boolean.valueOf(false);
    }
    k = (d + 2);
    j = (i + 2 + 2 + d);
    return Boolean.valueOf(true);
  }
  
  public byte[] f()
  {
    byte[] arrayOfByte = new byte[h];
    if (h <= 0) {
      return arrayOfByte;
    }
    System.arraycopy(f, j, arrayOfByte, 0, h);
    return arrayOfByte;
  }
  
  public byte[] g()
  {
    byte[] arrayOfByte = new byte[i];
    if (i <= 0) {
      return arrayOfByte;
    }
    System.arraycopy(f, k, arrayOfByte, 0, i);
    return arrayOfByte;
  }
}
