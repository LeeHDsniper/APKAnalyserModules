package oicq.wlogin_sdk.devicelock;

import oicq.wlogin_sdk.tools.util;

public class i
  extends e
{
  public int a = 0;
  public int b = 0;
  public int c = 0;
  public byte[] d = new byte[0];
  public byte[] e = new byte[0];
  public byte[] f = new byte[0];
  public byte[] g = new byte[0];
  
  public i()
  {
    _type = 3;
  }
  
  public void parse()
  {
    int i = _head_len;
    a = util.buf_to_int32(_buf, i);
    i += 4;
    b = util.buf_to_int8(_buf, i);
    int j = i + 1;
    i = util.buf_to_int16(_buf, j);
    j += 2;
    d = new byte[i];
    System.arraycopy(_buf, j, d, 0, i);
    j += i;
    i = util.buf_to_int16(_buf, j);
    j += 2;
    e = new byte[i];
    System.arraycopy(_buf, j, e, 0, i);
    j += i;
    i = util.buf_to_int16(_buf, j);
    j += 2;
    f = new byte[i];
    System.arraycopy(_buf, j, f, 0, i);
    i = j + i;
    c = util.buf_to_int16(_buf, i);
    j = i + 2;
    i = util.buf_to_int16(_buf, j);
    j += 2;
    g = new byte[i];
    System.arraycopy(_buf, j, g, 0, i);
  }
}
