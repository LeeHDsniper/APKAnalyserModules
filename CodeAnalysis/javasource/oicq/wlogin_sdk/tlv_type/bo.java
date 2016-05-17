package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class bo
  extends a
{
  int h = 0;
  
  public bo()
  {
    g = 380;
  }
  
  public byte[] a(byte[] paramArrayOfByte)
  {
    byte[] arrayOfByte = paramArrayOfByte;
    if (paramArrayOfByte == null) {
      arrayOfByte = new byte[0];
    }
    h = (arrayOfByte.length + 2);
    paramArrayOfByte = new byte[h];
    util.int16_to_buf(paramArrayOfByte, 0, arrayOfByte.length);
    System.arraycopy(arrayOfByte, 0, paramArrayOfByte, 2, arrayOfByte.length);
    int i = arrayOfByte.length;
    a(g);
    b(paramArrayOfByte, h);
    d();
    return a();
  }
}
