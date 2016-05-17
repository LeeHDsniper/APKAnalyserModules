package com.qq.taf.jce.dynamic;

public final class ByteField
  extends NumberField
{
  private byte data;
  
  ByteField(byte paramByte, int paramInt)
  {
    super(paramInt);
    data = paramByte;
  }
  
  public byte get()
  {
    return data;
  }
  
  public Number getNumber()
  {
    return Byte.valueOf(data);
  }
  
  public void set(byte paramByte)
  {
    data = paramByte;
  }
}
