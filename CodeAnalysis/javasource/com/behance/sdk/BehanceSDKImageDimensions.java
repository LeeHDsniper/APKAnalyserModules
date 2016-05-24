package com.behance.sdk;

public class BehanceSDKImageDimensions
{
  private int height;
  private int width;
  
  public BehanceSDKImageDimensions() {}
  
  public static BehanceSDKImageDimensions getInstance(int paramInt1, int paramInt2)
  {
    BehanceSDKImageDimensions localBehanceSDKImageDimensions = new BehanceSDKImageDimensions();
    localBehanceSDKImageDimensions.setWidth(paramInt1);
    localBehanceSDKImageDimensions.setHeight(paramInt2);
    return localBehanceSDKImageDimensions;
  }
  
  public int getHeight()
  {
    return height;
  }
  
  public int getWidth()
  {
    return width;
  }
  
  public void setHeight(int paramInt)
  {
    height = paramInt;
  }
  
  public void setWidth(int paramInt)
  {
    width = paramInt;
  }
}
