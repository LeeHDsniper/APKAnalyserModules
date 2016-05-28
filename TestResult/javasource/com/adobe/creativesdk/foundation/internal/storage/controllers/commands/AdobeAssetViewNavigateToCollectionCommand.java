package com.adobe.creativesdk.foundation.internal.storage.controllers.commands;

import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;

public class AdobeAssetViewNavigateToCollectionCommand
  extends AdobeAssetViewCommandData
{
  public String collectionHref;
  public AdobeAssetDataSourceType dataSourceType;
  
  public AdobeAssetViewNavigateToCollectionCommand() {}
}
