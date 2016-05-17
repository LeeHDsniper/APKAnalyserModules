package oicq.wlogin_sdk.tlv_type;

public class k
  extends a
{
  int h = 0;
  
  public k()
  {
    g = 265;
  }
  
  public byte[] a(byte[] paramArrayOfByte)
  {
    byte[] arrayOfByte = paramArrayOfByte;
    if (paramArrayOfByte == null) {
      arrayOfByte = new byte[16];
    }
    h = arrayOfByte.length;
    paramArrayOfByte = new byte[h];
    System.arraycopy(arrayOfByte, 0, paramArrayOfByte, 0, arrayOfByte.length);
    a(g);
    b(paramArrayOfByte, h);
    d();
    return a();
  }
}
