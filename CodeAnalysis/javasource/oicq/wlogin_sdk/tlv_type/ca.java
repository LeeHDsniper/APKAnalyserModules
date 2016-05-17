package oicq.wlogin_sdk.tlv_type;

public class ca
  extends a
{
  byte[] h = new byte[0];
  
  public ca()
  {
    g = 402;
  }
  
  public Boolean e()
  {
    h = new byte[e];
    System.arraycopy(f, d, h, 0, e);
    return Boolean.valueOf(true);
  }
  
  public String f()
  {
    return new String(h);
  }
}
