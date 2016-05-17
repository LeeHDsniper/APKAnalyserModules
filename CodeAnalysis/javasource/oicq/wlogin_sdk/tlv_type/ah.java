package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class ah
  extends a
{
  int h = 0;
  int i = 0;
  
  public ah()
  {
    g = 306;
  }
  
  public Boolean e()
  {
    if (e < 2) {
      return Boolean.valueOf(false);
    }
    h = util.buf_to_int16(f, d);
    if (h + 2 + 4 + 2 > e) {
      return Boolean.valueOf(false);
    }
    i = util.buf_to_int16(f, d + 2 + h + 4);
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
    System.arraycopy(f, d + 2 + h + 4 + 2, arrayOfByte, 0, arrayOfByte.length);
    return arrayOfByte;
  }
}
