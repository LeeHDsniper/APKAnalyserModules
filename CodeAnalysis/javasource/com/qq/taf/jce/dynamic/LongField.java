package com.qq.taf.jce.dynamic;

public class LongField
  extends NumberField
{
  private long data;
  
  LongField(long paramLong, int paramInt)
  {
    super(paramInt);
    data = paramLong;
  }
  
  public long get()
  {
    return data;
  }
  
  public Number getNumber()
  {
    return Long.valueOf(data);
  }
  
  public void set(long paramLong)
  {
    data = paramLong;
  }
}
