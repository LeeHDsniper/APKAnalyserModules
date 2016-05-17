package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class bw
  extends a
{
  private int h;
  
  public bw()
  {
    g = 390;
  }
  
  public Boolean e()
  {
    if (e < 2) {
      return Boolean.valueOf(false);
    }
    h = util.buf_to_int8(f, d + 1);
    return Boolean.valueOf(true);
  }
  
  public boolean f()
  {
    return h == 1;
  }
}
