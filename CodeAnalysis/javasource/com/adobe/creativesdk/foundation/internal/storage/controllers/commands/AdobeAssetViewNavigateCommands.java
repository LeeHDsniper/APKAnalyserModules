package com.adobe.creativesdk.foundation.internal.storage.controllers.commands;

import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPackagePages;

public class AdobeAssetViewNavigateCommands
{
  public static abstract class NavBaseCommandData
    extends AdobeAssetViewCommandData
  {
    public NavBaseCommandData() {}
  }
  
  public static class NavToAssetFolderData
    extends AdobeAssetViewNavigateCommands.NavBaseCommandData
  {
    public String collectionHref;
    public AdobeAssetDataSourceType dataSourceType;
    
    public NavToAssetFolderData() {}
  }
  
  public static class NavToDesignLibraryCollectionData
    extends AdobeAssetViewNavigateCommands.NavBaseCommandData
  {
    public String collectionGUID;
    public String collectionHref;
    public String collectionName;
    public AdobeAssetLibrary library;
    
    public NavToDesignLibraryCollectionData() {}
  }
  
  public static class NavToMobileCreationPackageCollectionData
    extends AdobeAssetViewNavigateCommands.NavBaseCommandData
  {
    public AdobeAssetPackagePages assetPackagePages;
    public String collectionGUID;
    public String collectionHref;
    public String collectionName;
    public AdobeAssetDataSourceType dataSourceType;
    public String parentHref;
    
    public NavToMobileCreationPackageCollectionData() {}
  }
  
  public static class NavToPhotoCollectionData
    extends AdobeAssetViewNavigateCommands.NavBaseCommandData
  {
    public String catalogGUID;
    public String catalogName;
    public String collectionGUID;
    public String collectionName;
    
    public NavToPhotoCollectionData() {}
  }
}
