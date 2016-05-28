package com.adobe.creativesdk.foundation.internal.storage.controllers.commands;

import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;

public class AdobeAssetViewNavigateToDesignLibraryCollectionCommand
  extends AdobeAssetViewCommandData
{
  public String collectionGUID;
  public String collectionHref;
  public String collectionName;
  public AdobeAssetLibrary library;
  public String parentHref;
  
  public AdobeAssetViewNavigateToDesignLibraryCollectionCommand() {}
}
