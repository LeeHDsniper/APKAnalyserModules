package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class at
  extends a
{
  public int h = 0;
  
  public at()
  {
    g = 336;
  }
  
  public Boolean e()
  {
    if (e < 7) {
      return Boolean.valueOf(false);
    }
    int i = util.buf_to_int16(f, d + 5);
    if (e < i + 7) {
      return Boolean.valueOf(false);
    }
    h = i;
    return Boolean.valueOf(true);
  }
  
  public int f()
  {
    return util.buf_to_int32(f, d);
  }
  
  public byte g()
  {
    return (byte)(util.buf_to_int8(f, d + 4) & 0xFF);
  }
}
