package com.adobe.creativesdk.foundation.adobeinternal.storage.library;

import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifestNode;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItem;

public class AdobeAssetLibraryItemLayoutStyle
  extends AdobeAssetLibraryItem
{
  private AdobeAssetFile layout;
  private AdobeAssetFile rendition;
  private float renditionHeight;
  private float renditionWidth;
  
  public AdobeAssetLibraryItemLayoutStyle(AdobeDCXManifestNode paramAdobeDCXManifestNode, String paramString, AdobeAssetFile paramAdobeAssetFile1, AdobeAssetFile paramAdobeAssetFile2, int paramInt1, int paramInt2, AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    super(paramAdobeDCXManifestNode, paramString, paramAdobeAssetLibrary);
    layout = paramAdobeAssetFile1;
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
}
