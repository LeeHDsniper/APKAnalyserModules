package com.facebook.ads;

public enum AdSize
{
  private final int a;
  private final int b;
  
  private AdSize(int paramInt1, int paramInt2)
  {
    a = paramInt1;
    b = paramInt2;
  }
  
  public int getHeight()
  {
    return b;
  }
  
  public int getWidth()
  {
    return a;
  }
}
