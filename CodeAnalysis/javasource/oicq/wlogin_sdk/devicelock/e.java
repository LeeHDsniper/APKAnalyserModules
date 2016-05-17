package oicq.wlogin_sdk.devicelock;

import oicq.wlogin_sdk.tools.util;

public class e
{
  protected int _body_len = 0;
  protected byte[] _buf = new byte[_max];
  protected int _head_len = 4;
  protected int _max = 128;
  protected int _pos = 0;
  protected int _type = 0;
  
  public e() {}
  
  public void fill_body(byte[] paramArrayOfByte, int paramInt)
  {
    if (paramInt > _max - _head_len)
    {
      _max = (_head_len + paramInt + 64);
      byte[] arrayOfByte = new byte[_max];
      System.arraycopy(_buf, 0, arrayOfByte, 0, _pos);
      _buf = arrayOfByte;
    }
    _body_len = paramInt;
    System.arraycopy(paramArrayOfByte, 0, _buf, _pos, paramInt);
    _pos += paramInt;
    set_length();
  }
  
  public void fill_head()
  {
    util.int16_to_buf(_buf, _pos, _type);
    _pos += 2;
    util.int16_to_buf(_buf, _pos, 0);
    _pos += 2;
  }
  
  public byte[] get_buf()
  {
    byte[] arrayOfByte = new byte[_pos];
    System.arraycopy(_buf, 0, arrayOfByte, 0, _pos);
    return arrayOfByte;
  }
  
  public byte[] get_data()
  {
    byte[] arrayOfByte = new byte[_body_len];
    System.arraycopy(_buf, _head_len, arrayOfByte, 0, _body_len);
    return arrayOfByte;
  }
  
  public int get_data_len()
  {
    return _body_len;
  }
  
  public int get_size()
  {
    return _pos;
  }
  
  public int get_type()
  {
    return _type;
  }
  
  public void parse() {}
  
  public int put_block(byte[] paramArrayOfByte, int paramInt)
  {
    int i = paramArrayOfByte.length;
    util.int16_to_buf(_buf, paramInt, i);
    paramInt += 2;
    System.arraycopy(paramArrayOfByte, 0, _buf, paramInt, i);
    return i + paramInt;
  }
  
  public int put_int16(int paramInt1, int paramInt2)
  {
    util.int16_to_buf(_buf, paramInt2, paramInt1);
    return paramInt2 + 2;
  }
  
  public int put_int32(long paramLong, int paramInt)
  {
    util.int64_to_buf32(_buf, paramInt, paramLong);
    return paramInt + 4;
  }
  
  public int put_int64(long paramLong, int paramInt)
  {
    util.int64_to_buf(_buf, paramInt, paramLong);
    return paramInt + 8;
  }
  
  public int put_int8(int paramInt1, int paramInt2)
  {
    util.int8_to_buf(_buf, paramInt2, paramInt1);
    return paramInt2 + 1;
  }
  
  public int set_buf(byte[] paramArrayOfByte, int paramInt)
  {
    if (paramInt > _max)
    {
      _max = (paramInt + 128);
      _buf = new byte[_max];
    }
    _pos = paramInt;
    System.arraycopy(paramArrayOfByte, 0, _buf, 0, paramInt);
    _type = util.buf_to_int16(paramArrayOfByte, 0);
    _body_len = (paramInt - _head_len);
    try
    {
      parse();
      return 0;
    }
    catch (Exception paramArrayOfByte) {}
    return 64527;
  }
  
  public int set_data(byte[] paramArrayOfByte, int paramInt)
  {
    if (_head_len + paramInt > _max)
    {
      _max = (_head_len + paramInt + 128);
      byte[] arrayOfByte = new byte[_max];
      System.arraycopy(_buf, 0, arrayOfByte, 0, _head_len);
      _buf = arrayOfByte;
    }
    _pos = (_head_len + paramInt);
    System.arraycopy(paramArrayOfByte, 0, _buf, _head_len, paramInt);
    _body_len = paramInt;
    util.int16_to_buf(_buf, 0, _type);
    util.int16_to_buf(_buf, 2, _body_len);
    try
    {
      parse();
      return 0;
    }
    catch (Exception paramArrayOfByte) {}
    return 64527;
  }
  
  public void set_length()
  {
    util.int16_to_buf(_buf, 2, _pos - _head_len);
  }
  
  public String toString()
  {
    String str = "";
    int i = 0;
    while (i < _pos)
    {
      str = str + Integer.toHexString(_buf[i] >> 4 & 0xF);
      str = str + Integer.toHexString(_buf[i] & 0xF);
      i += 1;
    }
    return str;
  }
}
