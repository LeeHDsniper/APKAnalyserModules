package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class as
  extends a
{
  public int h = 0;
  public int i = 0;
  public int j = 0;
  
  public as()
  {
    g = 329;
  }
  
  public Boolean e()
  {
    if (e < 8) {
      return Boolean.valueOf(false);
    }
    int k = util.buf_to_int16(f, d + 2);
    if (e < k + 8) {
      return Boolean.valueOf(false);
    }
    h = k;
    k = util.buf_to_int16(f, d + 2 + 2 + h);
    if (e < h + 8 + k) {
      return Boolean.valueOf(false);
    }
    i = k;
    k = util.buf_to_int16(f, d + 2 + 2 + h + 2 + i);
    if (e < h + 8 + i + k) {
      return Boolean.valueOf(false);
    }
    j = k;
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
  
  public byte[] h()
  {
    byte[] arrayOfByte = new byte[i];
    System.arraycopy(f, d + 2 + 2 + h + 2, arrayOfByte, 0, i);
    return arrayOfByte;
  }
  
  public byte[] i()
  {
    byte[] arrayOfByte = new byte[j];
    System.arraycopy(f, d + 2 + 2 + h + 2 + i + 2, arrayOfByte, 0, j);
    return arrayOfByte;
  }
}
