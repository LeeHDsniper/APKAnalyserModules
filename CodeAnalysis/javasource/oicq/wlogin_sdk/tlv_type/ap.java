package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class ap
  extends a
{
  public int h = 0;
  public int i = 0;
  public int j = 0;
  
  public ap()
  {
    g = 326;
  }
  
  public Boolean e()
  {
    if (e < 12) {
      return Boolean.valueOf(false);
    }
    int k = util.buf_to_int16(f, d + 4);
    if (e < k + 12) {
      return Boolean.valueOf(false);
    }
    h = k;
    k = util.buf_to_int16(f, d + 6 + h);
    if (e < h + 12 + k) {
      return Boolean.valueOf(false);
    }
    i = k;
    k = util.buf_to_int16(f, d + 10 + h + i);
    if (e < h + 12 + i + k) {
      return Boolean.valueOf(false);
    }
    j = k;
    return Boolean.valueOf(true);
  }
  
  public byte[] f()
  {
    byte[] arrayOfByte = new byte[h];
    System.arraycopy(f, d + 6, arrayOfByte, 0, h);
    return arrayOfByte;
  }
  
  public byte[] g()
  {
    byte[] arrayOfByte = new byte[i];
    System.arraycopy(f, d + 8 + h, arrayOfByte, 0, i);
    return arrayOfByte;
  }
  
  public int h()
  {
    return util.buf_to_int16(f, d + 8 + h + i);
  }
  
  public byte[] i()
  {
    byte[] arrayOfByte = new byte[j];
    System.arraycopy(f, d + 12 + h + i, arrayOfByte, 0, j);
    return arrayOfByte;
  }
}
