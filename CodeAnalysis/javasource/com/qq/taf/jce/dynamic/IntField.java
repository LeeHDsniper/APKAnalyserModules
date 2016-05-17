package com.qq.taf.jce.dynamic;

public class IntField
  extends NumberField
{
  private int data;
  
  IntField(int paramInt1, int paramInt2)
  {
    super(paramInt2);
    data = paramInt1;
  }
  
  public int get()
  {
    return data;
  }
  
  public Number getNumber()
  {
    return Integer.valueOf(data);
  }
  
  public void set(int paramInt)
  {
    data = paramInt;
  }
}
