package oicq.wlogin_sdk.tlv_type;

public class q
  extends a
{
  int h = 0;
  
  public q()
  {
    g = 274;
  }
  
  public byte[] a(byte[] paramArrayOfByte)
  {
    byte[] arrayOfByte = paramArrayOfByte;
    if (paramArrayOfByte == null) {
      arrayOfByte = new byte[0];
    }
    h = arrayOfByte.length;
    paramArrayOfByte = new byte[h];
    System.arraycopy(arrayOfByte, 0, paramArrayOfByte, 0, arrayOfByte.length);
    int i = arrayOfByte.length;
    a(g);
    b(paramArrayOfByte, h);
    d();
    return a();
  }
}
