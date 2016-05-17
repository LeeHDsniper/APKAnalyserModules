package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class bp
  extends a
{
  public int h = 0;
  public int i = 0;
  
  public bp()
  {
    g = 381;
  }
  
  public Boolean e()
  {
    if (e < 8) {
      return Boolean.valueOf(false);
    }
    int j = util.buf_to_int16(f, d + 2);
    if (e < j + 8) {
      return Boolean.valueOf(false);
    }
    h = j;
    j = util.buf_to_int16(f, d + 2 + 2 + h + 2);
    if (e < h + 8 + j) {
      return Boolean.valueOf(false);
    }
    i = j;
    return Boolean.valueOf(true);
  }
  
  public int f()
  {
    return util.buf_to_int16(f, d);
  }
  
  public byte[] g()
  {
    byte[] arrayOfByte = new byte[h];
    System.arraycopy(f, d + 2 + 2, arrayOfByte, 0, h);
    return arrayOfByte;
  }
  
  public int h()
  {
    return util.buf_to_int16(f, d + 2 + 2 + h);
  }
  
  public byte[] i()
  {
    byte[] arrayOfByte = new byte[i];
    System.arraycopy(f, d + 2 + 2 + h + 2 + 2, arrayOfByte, 0, i);
    return arrayOfByte;
  }
}
