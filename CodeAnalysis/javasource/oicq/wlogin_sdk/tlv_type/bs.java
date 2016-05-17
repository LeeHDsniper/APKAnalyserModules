package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class bs
  extends a
{
  int h = 0;
  int i = 0;
  
  public bs()
  {
    g = 386;
  }
  
  public Boolean e()
  {
    if (e < 5) {
      return Boolean.valueOf(false);
    }
    h = util.buf_to_int16(f, d + 1);
    i = util.buf_to_int16(f, d + 1 + 2);
    return Boolean.valueOf(true);
  }
  
  public int f()
  {
    return h;
  }
  
  public int g()
  {
    return i;
  }
}
