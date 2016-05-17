package com.qq.taf.jce.dynamic;

public class DoubleField
  extends NumberField
{
  private double data;
  
  DoubleField(double paramDouble, int paramInt)
  {
    super(paramInt);
    data = paramDouble;
  }
  
  public double get()
  {
    return data;
  }
  
  public Number getNumber()
  {
    return Double.valueOf(data);
  }
  
  public void set(double paramDouble)
  {
    data = paramDouble;
  }
}
