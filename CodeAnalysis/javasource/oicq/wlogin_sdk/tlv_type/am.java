package oicq.wlogin_sdk.tlv_type;

public class am
  extends a
{
  public int h = 0;
  
  public am()
  {
    g = 323;
  }
  
  public byte[] a(byte[] paramArrayOfByte)
  {
    h = paramArrayOfByte.length;
    byte[] arrayOfByte = new byte[h];
    System.arraycopy(paramArrayOfByte, 0, arrayOfByte, 0, paramArrayOfByte.length);
    a(g);
    b(arrayOfByte, h);
    d();
    return a();
  }
}
