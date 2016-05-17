package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class cd
  extends a
{
  int h = 0;
  byte[] i = new byte[0];
  byte[] j = new byte[0];
  
  public cd()
  {
    g = 406;
  }
  
  public Boolean e()
  {
    if (e < 5) {
      return Boolean.valueOf(false);
    }
    int k = d;
    h = util.buf_to_int8(f, k);
    int m = k + 1;
    k = util.buf_to_int16(f, m);
    m += 2;
    if (m - d + k > e) {
      return Boolean.valueOf(false);
    }
    i = new byte[k];
    System.arraycopy(f, m, i, 0, k);
    m += k;
    k = util.buf_to_int16(f, m);
    m += 2;
    if (m - d + k > e) {
      return Boolean.valueOf(false);
    }
    j = new byte[k];
    System.arraycopy(f, m, j, 0, k);
    return Boolean.valueOf(true);
  }
  
  public int f()
  {
    return h;
  }
  
  public String g()
  {
    return new String(i);
  }
  
  public String h()
  {
    return new String(j);
  }
}
