package oicq.wlogin_sdk.devicelock;

import oicq.wlogin_sdk.tools.util;

public class j
  extends e
{
  public byte[] a = new byte[0];
  public byte[] b = new byte[0];
  public int c;
  public int d;
  
  public j()
  {
    _type = 14;
  }
  
  public void parse()
  {
    int i = _head_len;
    c = util.buf_to_int16(_buf, i);
    int j = i + 2;
    i = util.buf_to_int16(_buf, j);
    j += 2;
    a = new byte[i];
    System.arraycopy(_buf, j, a, 0, i);
    i = j + i;
    d = util.buf_to_int16(_buf, i);
    j = i + 2;
    i = util.buf_to_int16(_buf, j);
    j += 2;
    b = new byte[i];
    System.arraycopy(_buf, j, b, 0, i);
  }
}
