package com.adobe.creativesdk.foundation.storage;

public class AdobeAssetImageDimensions
{
  public float height;
  public float width;
  
  public AdobeAssetImageDimensions(float paramFloat1, float paramFloat2)
  {
    width = paramFloat1;
    height = paramFloat2;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof AdobeAssetImageDimensions)) {}
    do
    {
      return false;
      paramObject = (AdobeAssetImageDimensions)paramObject;
    } while ((width != width) || (height != height));
    return true;
  }
  
  public String toString()
  {
    return "[" + width + "," + height + "]";
  }
}
