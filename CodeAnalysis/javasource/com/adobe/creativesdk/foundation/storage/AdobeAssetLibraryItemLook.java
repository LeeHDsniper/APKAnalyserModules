package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifestNode;

public class AdobeAssetLibraryItemLook
  extends AdobeAssetLibraryItem
{
  private AdobeAssetFile rendition;
  private float renditionHeight;
  private float renditionWidth;
  
  protected AdobeAssetLibraryItemLook(AdobeDCXManifestNode paramAdobeDCXManifestNode, String paramString, AdobeAssetFile paramAdobeAssetFile, int paramInt1, int paramInt2, AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    super(paramAdobeDCXManifestNode, paramString, paramAdobeAssetLibrary);
    rendition = paramAdobeAssetFile;
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
}
