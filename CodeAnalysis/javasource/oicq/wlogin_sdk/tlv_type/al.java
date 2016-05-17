package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class al
  extends a
{
  int h = 0;
  int i = 0;
  
  public al()
  {
    g = 322;
  }
  
  public byte[] a(byte[] paramArrayOfByte)
  {
    byte[] arrayOfByte = paramArrayOfByte;
    if (paramArrayOfByte == null) {
      arrayOfByte = new byte[0];
    }
    int j = c(arrayOfByte, 32);
    i = (j + 4);
    paramArrayOfByte = new byte[i];
    util.int16_to_buf(paramArrayOfByte, 0, h);
    util.int16_to_buf(paramArrayOfByte, 2, j);
    System.arraycopy(arrayOfByte, 0, paramArrayOfByte, 4, j);
    a(g);
    b(paramArrayOfByte, paramArrayOfByte.length);
    d();
    return a();
  }
}
