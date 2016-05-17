package oicq.wlogin_sdk.devicelock;

public class TLV_QuerySig
  extends e
{
  public byte[] QuerySig = new byte[0];
  
  public TLV_QuerySig()
  {
    _type = 8;
  }
  
  public void parse()
  {
    QuerySig = get_data();
  }
}
