package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifestNode;

public class AdobeAssetLibraryItemImage
  extends AdobeAssetLibraryItem
{
  private AdobeAssetFile image;
  private float imageHeight;
  private float imageWidth;
  private String primaryComponentType;
  private AdobeAssetFile rendition;
  private float renditionHeight;
  private float renditionWidth;
  
  protected AdobeAssetLibraryItemImage(AdobeDCXManifestNode paramAdobeDCXManifestNode, String paramString1, AdobeAssetFile paramAdobeAssetFile1, int paramInt1, int paramInt2, AdobeAssetFile paramAdobeAssetFile2, int paramInt3, int paramInt4, String paramString2, AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    super(paramAdobeDCXManifestNode, paramString1, paramAdobeAssetLibrary);
    image = paramAdobeAssetFile1;
    imageHeight = paramInt1;
    imageWidth = paramInt2;
    rendition = paramAdobeAssetFile2;
    renditionHeight = paramInt3;
    renditionWidth = paramInt4;
    primaryComponentType = paramString2;
  }
  
  public AdobeAssetFile getImage()
  {
    return image;
  }
  
  public float getImageHeight()
  {
    return imageHeight;
  }
  
  public float getImageWidth()
  {
    return imageWidth;
  }
  
  public String getPrimaryComponentType()
  {
    return primaryComponentType;
  }
  
  public AdobeAssetFile getRendition()
  {
    return rendition;
  }
}
