package com.facebook.ads;

public class NativeAdView
{
  public static enum Type
  {
    private final int a;
    private final int b;
    
    private Type(int paramInt1, int paramInt2)
    {
      a = paramInt1;
      b = paramInt2;
    }
    
    public int getValue()
    {
      switch (b)
      {
      default: 
        return -1;
      case 100: 
        return 1;
      case 120: 
        return 2;
      case 300: 
        return 3;
      }
      return 4;
    }
  }
}
