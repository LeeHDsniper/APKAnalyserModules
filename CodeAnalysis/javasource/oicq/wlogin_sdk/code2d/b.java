package oicq.wlogin_sdk.code2d;

import oicq.wlogin_sdk.request.u;
import oicq.wlogin_sdk.tools.util;

public class b
{
  public static int _seq = 0;
  public static c _status = new c();
  public static int _version = 50;
  public int _cmd = 0;
  public int _head_len = 43;
  public int _role = 114;
  public int _sub_cmd = 0;
  
  public b() {}
  
  protected int fill_staff(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, int paramInt)
  {
    util.int16_to_buf(paramArrayOfByte1, paramInt, paramArrayOfByte2.length);
    paramInt += 2;
    System.arraycopy(paramArrayOfByte2, 0, paramArrayOfByte1, paramInt, paramArrayOfByte2.length);
    return paramInt + paramArrayOfByte2.length;
  }
  
  protected byte[] getAppInfo(long paramLong1, long paramLong2)
  {
    byte[] arrayOfByte = new byte[28 + (u.C.length + 2 + 2 + u.E.length + 2 + u.F.length)];
    util.int64_to_buf32(arrayOfByte, 0, 5L);
    util.int64_to_buf32(arrayOfByte, 4, paramLong1);
    util.int64_to_buf32(arrayOfByte, 8, paramLong2);
    System.arraycopy(u.y, 0, arrayOfByte, 12, u.y.length);
    int i = u.y.length;
    i = fill_staff(arrayOfByte, u.C, i + 12);
    i = fill_staff(arrayOfByte, u.E, i);
    fill_staff(arrayOfByte, u.F, i);
    return arrayOfByte;
  }
  
  public int get_cmd()
  {
    return _cmd;
  }
  
  protected byte[] get_request(long paramLong, boolean paramBoolean, byte[] paramArrayOfByte)
  {
    byte[] arrayOfByte = new byte[_head_len + paramArrayOfByte.length + 1];
    util.int8_to_buf(arrayOfByte, 0, 2);
    util.int16_to_buf(arrayOfByte, 1, arrayOfByte.length);
    util.int16_to_buf(arrayOfByte, 3, _cmd);
    util.int8_to_buf(arrayOfByte, 26, 3);
    if (paramBoolean) {
      util.int16_to_buf(arrayOfByte, 27, 0);
    }
    for (;;)
    {
      util.int16_to_buf(arrayOfByte, 29, _version);
      int i = _seq;
      _seq = i + 1;
      util.int32_to_buf(arrayOfByte, 31, i);
      util.int64_to_buf(arrayOfByte, 35, paramLong);
      System.arraycopy(paramArrayOfByte, 0, arrayOfByte, 43, paramArrayOfByte.length);
      i = paramArrayOfByte.length + 43;
      util.int8_to_buf(arrayOfByte, i, 3);
      return arrayOfByte;
      util.int16_to_buf(arrayOfByte, 27, 1);
    }
  }
  
  protected byte[] get_response(byte[] paramArrayOfByte, int paramInt)
  {
    if (paramArrayOfByte.length <= _head_len) {
      return null;
    }
    byte[] arrayOfByte = new byte[paramArrayOfByte.length - _head_len];
    System.arraycopy(paramArrayOfByte, _head_len, arrayOfByte, 0, arrayOfByte.length);
    return arrayOfByte;
  }
}
