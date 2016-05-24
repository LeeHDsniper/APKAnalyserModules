package com.nostra13.universalimageloader.core.assist;

public class ImageSize
{
  private final int height;
  private final int width;
  
  public ImageSize(int paramInt1, int paramInt2)
  {
    width = paramInt1;
    height = paramInt2;
  }
  
  public ImageSize(int paramInt1, int paramInt2, int paramInt3)
  {
    if (paramInt3 % 180 == 0)
    {
      width = paramInt1;
      height = paramInt2;
      return;
    }
    width = paramInt2;
    height = paramInt1;
  }
  
  public int getHeight()
  {
    return height;
  }
  
  public int getWidth()
  {
    return width;
  }
  
  public ImageSize scale(float paramFloat)
  {
    return new ImageSize((int)(width * paramFloat), (int)(height * paramFloat));
  }
  
  public ImageSize scaleDown(int paramInt)
  {
    return new ImageSize(width / paramInt, height / paramInt);
  }
  
  public String toString()
  {
    return 9 + width + "x" + height;
  }
}
