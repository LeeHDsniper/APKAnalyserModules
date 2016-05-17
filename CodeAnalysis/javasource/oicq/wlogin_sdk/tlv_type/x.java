package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class x
  extends a
{
  int h = 0;
  
  public x()
  {
    g = 285;
  }
  
  public Boolean e()
  {
    if (e < 22) {
      return Boolean.valueOf(false);
    }
    h = util.buf_to_int16(f, d + 4 + 16);
    h &= 0xFFFF;
    if (e < h + 22) {
      return Boolean.valueOf(false);
    }
    return Boolean.valueOf(true);
  }
  
  public long f()
  {
    return util.buf_to_int32(f, d) & 0xFFFFFFFF;
  }
  
  public byte[] g()
  {
    byte[] arrayOfByte = new byte[16];
    System.arraycopy(f, d + 4, arrayOfByte, 0, arrayOfByte.length);
    return arrayOfByte;
  }
  
  public byte[] h()
  {
    byte[] arrayOfByte = new byte[h];
    System.arraycopy(f, d + 4 + 16 + 2, arrayOfByte, 0, arrayOfByte.length);
    return arrayOfByte;
  }
}
