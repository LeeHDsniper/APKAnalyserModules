package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class ac
  extends a
{
  int h = 0;
  int i = 0;
  
  public ac()
  {
    g = 293;
  }
  
  public Boolean e()
  {
    if (e < 2) {
      return Boolean.valueOf(false);
    }
    h = util.buf_to_int16(f, d);
    if (e < h + 2 + 2) {
      return Boolean.valueOf(false);
    }
    i = util.buf_to_int16(f, d + 2 + h);
    return Boolean.valueOf(true);
  }
  
  public byte[] f()
  {
    byte[] arrayOfByte = new byte[h];
    System.arraycopy(f, d + 2, arrayOfByte, 0, arrayOfByte.length);
    return arrayOfByte;
  }
  
  public byte[] g()
  {
    byte[] arrayOfByte = new byte[i];
    System.arraycopy(f, d + 2 + h + 2, arrayOfByte, 0, arrayOfByte.length);
    return arrayOfByte;
  }
}
