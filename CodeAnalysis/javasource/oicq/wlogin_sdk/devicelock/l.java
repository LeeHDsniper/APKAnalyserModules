package oicq.wlogin_sdk.devicelock;

public class l
  extends e
{
  public int a = 0;
  
  public l()
  {
    _type = 5;
  }
  
  public byte[] a(long paramLong)
  {
    fill_head();
    fill_body(new byte[4], 4);
    put_int32(paramLong, _head_len);
    return get_buf();
  }
}
