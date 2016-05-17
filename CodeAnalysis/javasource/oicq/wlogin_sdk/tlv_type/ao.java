package oicq.wlogin_sdk.tlv_type;

public class ao
  extends a
{
  public int h = 0;
  
  public ao()
  {
    g = 325;
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
    b(paramArrayOfByte, paramArrayOfByte.length);
    d();
    return a();
  }
}
