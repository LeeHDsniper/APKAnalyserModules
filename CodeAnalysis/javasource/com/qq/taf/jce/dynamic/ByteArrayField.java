package com.qq.taf.jce.dynamic;

public class ByteArrayField
  extends JceField
{
  private byte[] data;
  
  ByteArrayField(byte[] paramArrayOfByte, int paramInt)
  {
    super(paramInt);
    data = paramArrayOfByte;
  }
  
  public byte[] get()
  {
    return data;
  }
  
  public void set(byte[] paramArrayOfByte)
  {
    data = paramArrayOfByte;
  }
}
