package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class ad
  extends a
{
  int h = 0;
  
  public ad()
  {
    g = 294;
  }
  
  public Boolean e()
  {
    if (e < 2) {
      return Boolean.valueOf(false);
    }
    if (e < 4) {
      return Boolean.valueOf(false);
    }
    h = util.buf_to_int16(f, d + 2);
    if (h + 2 + 2 > e) {
      return Boolean.valueOf(false);
    }
    return Boolean.valueOf(true);
  }
  
  public byte[] f()
  {
    byte[] arrayOfByte = new byte[h];
    System.arraycopy(f, d + 2 + 2, arrayOfByte, 0, arrayOfByte.length);
    return arrayOfByte;
  }
}
