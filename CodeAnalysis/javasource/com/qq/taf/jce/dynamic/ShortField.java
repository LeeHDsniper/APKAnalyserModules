package com.qq.taf.jce.dynamic;

public final class ShortField
  extends NumberField
{
  private short data;
  
  ShortField(short paramShort, int paramInt)
  {
    super(paramInt);
    data = paramShort;
  }
  
  public short get()
  {
    return data;
  }
  
  public Number getNumber()
  {
    return Short.valueOf(data);
  }
  
  public void set(short paramShort)
  {
    data = paramShort;
  }
}
