package oicq.wlogin_sdk.devicelock;

import oicq.wlogin_sdk.tools.util;

public class m
  extends e
{
  public int a = 0;
  public int b = 0;
  
  public m()
  {
    _type = 6;
  }
  
  public void parse()
  {
    int i = _head_len;
    a = util.buf_to_int16(_buf, i);
    b = util.buf_to_int16(_buf, i + 2);
  }
}
