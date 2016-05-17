package oicq.wlogin_sdk.tlv_type;

import oicq.wlogin_sdk.tools.util;

public class cf
  extends a
{
  int h = 0;
  int i = 0;
  
  public cf()
  {
    g = 2;
  }
  
  public byte[] a(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2)
  {
    byte[] arrayOfByte = paramArrayOfByte1;
    if (paramArrayOfByte1 == null) {
      arrayOfByte = new byte[0];
    }
    paramArrayOfByte1 = paramArrayOfByte2;
    if (paramArrayOfByte2 == null) {
      paramArrayOfByte1 = new byte[0];
    }
    h = (arrayOfByte.length + 6 + paramArrayOfByte1.length);
    paramArrayOfByte2 = new byte[h];
    util.int16_to_buf(paramArrayOfByte2, 0, i);
    util.int16_to_buf(paramArrayOfByte2, 2, arrayOfByte.length);
    System.arraycopy(arrayOfByte, 0, paramArrayOfByte2, 4, arrayOfByte.length);
    int j = arrayOfByte.length + 4;
    util.int16_to_buf(paramArrayOfByte2, j, paramArrayOfByte1.length);
    j += 2;
    System.arraycopy(paramArrayOfByte1, 0, paramArrayOfByte2, j, paramArrayOfByte1.length);
    j = paramArrayOfByte1.length;
    a(g);
    b(paramArrayOfByte2, h);
    d();
    return a();
  }
}
