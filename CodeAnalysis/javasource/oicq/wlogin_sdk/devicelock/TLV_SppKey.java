package oicq.wlogin_sdk.devicelock;

public class TLV_SppKey
  extends e
{
  public byte[] SppKey = new byte[0];
  
  public TLV_SppKey()
  {
    _type = 11;
  }
  
  public void parse()
  {
    SppKey = get_data();
  }
}
