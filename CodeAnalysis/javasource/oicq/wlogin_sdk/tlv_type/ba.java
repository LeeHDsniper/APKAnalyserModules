package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class ba
  extends a
{
  public int h = 0;
  
  public ba()
  {
    g = 359;
  }
  
  public Boolean e()
  {
    if (e < 4) {
      return Boolean.valueOf(false);
    }
    int i = util.buf_to_int16(f, d + 1 + 1);
    if (e < i + 4) {
      return Boolean.valueOf(false);
    }
    h = i;
    return Boolean.valueOf(true);
  }
  
  public byte[] f()
  {
    byte[] arrayOfByte = new byte[1];
    System.arraycopy(f, d, arrayOfByte, 0, 1);
    return arrayOfByte;
  }
  
  public byte[] g()
  {
    byte[] arrayOfByte = new byte[1];
    System.arraycopy(f, d + 1, arrayOfByte, 0, 1);
    return arrayOfByte;
  }
  
  public byte[] h()
  {
    byte[] arrayOfByte = new byte[h];
    System.arraycopy(f, d + 1 + 1 + 2, arrayOfByte, 0, h);
    return arrayOfByte;
  }
}
