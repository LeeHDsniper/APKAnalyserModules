package com.behance.sdk.factory;

public class BehanceSDKImageProperties
{
  private int height;
  private String name;
  private long size;
  private String type;
  private int width;
  
  public BehanceSDKImageProperties() {}
  
  public int getHeight()
  {
    return height;
  }
  
  public String getName()
  {
    return name;
  }
  
  public long getSize()
  {
    return size;
  }
  
  public String getType()
  {
    return type;
  }
  
  public int getWidth()
  {
    return width;
  }
  
  public void setHeight(int paramInt)
  {
    height = paramInt;
  }
  
  public void setSize(long paramLong)
  {
    size = paramLong;
  }
  
  public void setType(String paramString)
  {
    type = paramString;
  }
  
  public void setWidth(int paramInt)
  {
    width = paramInt;
  }
}
