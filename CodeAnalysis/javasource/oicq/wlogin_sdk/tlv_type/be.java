package oicq.wlogin_sdk.tlv_type;

public class be
  extends a
{
  int h = 0;
  
  public be()
  {
    g = 366;
  }
  
  public byte[] a(byte[] paramArrayOfByte)
  {
    int i = 64;
    byte[] arrayOfByte = paramArrayOfByte;
    if (paramArrayOfByte == null) {
      arrayOfByte = new byte[0];
    }
    if (arrayOfByte.length < 64) {
      i = arrayOfByte.length;
    }
    h = i;
    paramArrayOfByte = new byte[h];
    System.arraycopy(arrayOfByte, 0, paramArrayOfByte, 0, h);
    a(g);
    b(paramArrayOfByte, h);
    d();
    return a();
  }
}
