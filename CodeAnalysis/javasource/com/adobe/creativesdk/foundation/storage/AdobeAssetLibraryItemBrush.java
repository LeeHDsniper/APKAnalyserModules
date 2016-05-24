package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifestNode;

public class AdobeAssetLibraryItemBrush
  extends AdobeAssetLibraryItem
{
  private AdobeAssetFile brush;
  private AdobeAssetFile rendition;
  private float renditionHeight;
  private float renditionWidth;
  
  protected AdobeAssetLibraryItemBrush(AdobeDCXManifestNode paramAdobeDCXManifestNode, String paramString, AdobeAssetFile paramAdobeAssetFile1, AdobeAssetFile paramAdobeAssetFile2, int paramInt1, int paramInt2, AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    super(paramAdobeDCXManifestNode, paramString, paramAdobeAssetLibrary);
    brush = paramAdobeAssetFile1;
    rendition = paramAdobeAssetFile2;
    renditionHeight = paramInt1;
    renditionWidth = paramInt2;
  }
  
  public AdobeAssetFile getRendition()
  {
    return rendition;
  }
  
  public float getRenditionHeight()
  {
    return renditionHeight;
  }
  
  public float getRenditionWidth()
  {
    return renditionWidth;
  }
  
  public String nameOrIdForDisplay()
  {
    if (name != null) {
      return name;
    }
    return itemID;
  }
}
