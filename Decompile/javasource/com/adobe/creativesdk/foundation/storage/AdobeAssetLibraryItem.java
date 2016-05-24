package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifestNode;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXUtils;
import java.lang.ref.WeakReference;
import java.util.Date;

public class AdobeAssetLibraryItem
{
  protected Date creationDate;
  protected String itemID;
  protected WeakReference<AdobeAssetLibrary> library;
  protected Date modificationDate;
  protected String name;
  protected String renditionName;
  
  protected AdobeAssetLibraryItem(AdobeDCXManifestNode paramAdobeDCXManifestNode, String paramString, AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    Date localDate1 = new Date(AdobeDCXUtils.getLongVal(paramAdobeDCXManifestNode.get("library#created")));
    Date localDate2 = new Date(AdobeDCXUtils.getLongVal(paramAdobeDCXManifestNode.get("library#modified")));
    name = paramAdobeDCXManifestNode.getName();
    renditionName = paramString;
    itemID = paramAdobeDCXManifestNode.getNodeId();
    creationDate = localDate1;
    modificationDate = localDate2;
    library = new WeakReference(paramAdobeAssetLibrary);
  }
  
  public String getItemID()
  {
    return itemID;
  }
  
  public AdobeAssetLibrary getLibrary()
  {
    return (AdobeAssetLibrary)library.get();
  }
  
  public String getName()
  {
    return name;
  }
  
  public String nameOrIdForDisplay()
  {
    if (name != null) {
      return name;
    }
    if (renditionName != null) {
      return renditionName;
    }
    return itemID;
  }
}
