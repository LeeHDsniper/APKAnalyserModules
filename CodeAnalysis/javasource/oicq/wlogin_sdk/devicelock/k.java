package oicq.wlogin_sdk.devicelock;

import oicq.wlogin_sdk.tools.util;

public class k
  extends e
{
  public byte[] a = new byte[0];
  public byte[] b = new byte[0];
  public int c;
  public int d;
  public int e;
  
  public k()
  {
    _type = 4;
  }
  
  public void parse()
  {
    int j = _head_len;
    int i = util.buf_to_int16(_buf, j);
    j += 2;
    a = new byte[i];
    System.arraycopy(_buf, j, a, 0, i);
    j += i;
    i = util.buf_to_int16(_buf, j);
    j += 2;
    b = new byte[i];
    System.arraycopy(_buf, j, b, 0, i);
    i = j + i;
    c = util.buf_to_int32(_buf, i);
    i += 4;
    d = util.buf_to_int16(_buf, i);
    i += 2;
    e = util.buf_to_int16(_buf, i);
  }
}
