package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class cg
  extends a
{
  byte[] h = new byte[0];
  byte[] i = new byte[0];
  
  public cg()
  {
    g = 512;
  }
  
  public Boolean e()
  {
    if (e < 2) {
      return Boolean.valueOf(false);
    }
    int j = util.buf_to_int16(f, d + 0);
    if (e < j + 2) {
      return Boolean.valueOf(false);
    }
    h = new byte[j];
    System.arraycopy(f, d + 2, h, 0, j);
    int k = j + 2;
    if (e < k + 2) {
      return Boolean.valueOf(false);
    }
    j = util.buf_to_int16(f, d + k);
    k += 2;
    if (e < k + j) {
      return Boolean.valueOf(false);
    }
    i = new byte[j];
    System.arraycopy(f, d + k, i, 0, j);
    return Boolean.valueOf(true);
  }
  
  public byte[] f()
  {
    return h;
  }
  
  public byte[] g()
  {
    return i;
  }
}
