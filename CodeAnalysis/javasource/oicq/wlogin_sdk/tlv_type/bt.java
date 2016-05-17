package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class bt
  extends a
{
  long h = 0L;
  
  public bt()
  {
    g = 387;
  }
  
  public Boolean e()
  {
    if (e < 8) {
      return Boolean.valueOf(false);
    }
    h = util.buf_to_int64(f, d);
    return Boolean.valueOf(true);
  }
  
  public long f()
  {
    return h;
  }
}
