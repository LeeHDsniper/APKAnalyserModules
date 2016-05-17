package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class bl
  extends a
{
  public int h = 0;
  
  public bl()
  {
    g = 377;
  }
  
  public Boolean e()
  {
    if (e < 2) {
      return Boolean.valueOf(false);
    }
    int i = util.buf_to_int16(f, d);
    if (e < i + 2) {
      return Boolean.valueOf(false);
    }
    h = i;
    return Boolean.valueOf(true);
  }
  
  public byte[] f()
  {
    byte[] arrayOfByte = new byte[h];
    System.arraycopy(f, d + 2, arrayOfByte, 0, h);
    return arrayOfByte;
  }
}
