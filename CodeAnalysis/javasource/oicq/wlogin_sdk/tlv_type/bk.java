package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class bk
  extends a
{
  public int h = 0;
  public int i = 0;
  
  public bk()
  {
    g = 376;
  }
  
  public Boolean e()
  {
    if (e < 12) {
      return Boolean.valueOf(false);
    }
    int j = util.buf_to_int16(f, d);
    if (e < j + 12) {
      return Boolean.valueOf(false);
    }
    h = j;
    j = util.buf_to_int16(f, d + 2 + h);
    if (e < h + 12 + j) {
      return Boolean.valueOf(false);
    }
    i = j;
    return Boolean.valueOf(true);
  }
  
  public byte[] f()
  {
    byte[] arrayOfByte = new byte[h];
    System.arraycopy(f, d + 2, arrayOfByte, 0, h);
    return arrayOfByte;
  }
  
  public byte[] g()
  {
    byte[] arrayOfByte = new byte[i];
    System.arraycopy(f, d + 2 + h + 2, arrayOfByte, 0, i);
    return arrayOfByte;
  }
  
  public int h()
  {
    return util.buf_to_int32(f, d + 2 + h + 2 + i);
  }
  
  public int i()
  {
    return util.buf_to_int16(f, d + 2 + h + 2 + i + 4);
  }
  
  public int j()
  {
    return util.buf_to_int16(f, d + 2 + h + 2 + i + 4 + 2);
  }
}
