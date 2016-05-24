package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.os.Bundle;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPackagePages;
import java.net.URI;
import java.util.ArrayList;

public class MobilePackageItemsOneUpViewController
{
  private static MobilePackageItemsOneUpViewController _sInstance;
  private AdobeAssetPackagePages _assetPackagePages;
  private ArrayList<AdobeAssetFile> _itemsList;
  private int _startIndex;
  
  public MobilePackageItemsOneUpViewController() {}
  
  private void buildPackageItemsList()
  {
    _itemsList.addAll(_assetPackagePages.getPages());
  }
  
  public static void createInstanceFromConfigurationBundle(Bundle paramBundle)
  {
    MobilePackageItemsOneUpViewController localMobilePackageItemsOneUpViewController = new MobilePackageItemsOneUpViewController();
    AdobeAssetPackagePages localAdobeAssetPackagePages = AdobeAssetsViewMobileCreationPackageItemsContainerFragment.getPackagePagesFromHref(paramBundle.getString("collectionhref"), paramBundle.getString("collectionparenthref"));
    localMobilePackageItemsOneUpViewController.setStartIndex(paramBundle.getInt("startindex"));
    localMobilePackageItemsOneUpViewController.setPackage(localAdobeAssetPackagePages);
    setInstance(localMobilePackageItemsOneUpViewController);
  }
  
  public static void createInstanceFromPackage(AdobeAssetPackagePages paramAdobeAssetPackagePages, ArrayList<AdobeAssetFile> paramArrayList, int paramInt)
  {
    MobilePackageItemsOneUpViewController localMobilePackageItemsOneUpViewController = new MobilePackageItemsOneUpViewController();
    localMobilePackageItemsOneUpViewController.setPackageAndItems(paramAdobeAssetPackagePages, paramArrayList);
    localMobilePackageItemsOneUpViewController.setStartIndex(paramInt);
    setInstance(localMobilePackageItemsOneUpViewController);
  }
  
  public static MobilePackageItemsOneUpViewController getInstance()
  {
    return _sInstance;
  }
  
  public static void setInstance(MobilePackageItemsOneUpViewController paramMobilePackageItemsOneUpViewController)
  {
    _sInstance = paramMobilePackageItemsOneUpViewController;
  }
  
  private void setPackage(AdobeAssetPackagePages paramAdobeAssetPackagePages)
  {
    _assetPackagePages = paramAdobeAssetPackagePages;
    buildPackageItemsList();
  }
  
  private void setPackageAndItems(AdobeAssetPackagePages paramAdobeAssetPackagePages, ArrayList<AdobeAssetFile> paramArrayList)
  {
    _assetPackagePages = paramAdobeAssetPackagePages;
    _itemsList = paramArrayList;
  }
  
  public int getCount()
  {
    if (_itemsList != null) {
      return _itemsList.size();
    }
    return 0;
  }
  
  public AdobeAssetFile getItemAtPos(int paramInt)
  {
    if ((_itemsList != null) && (paramInt >= 0) && (paramInt < _itemsList.size())) {
      return (AdobeAssetFile)_itemsList.get(paramInt);
    }
    return null;
  }
  
  public AdobeAssetPackagePages getPackage()
  {
    return _assetPackagePages;
  }
  
  public int getStartIndex()
  {
    return _startIndex;
  }
  
  public void saveInstanceState(Bundle paramBundle)
  {
    paramBundle.putInt("startindex", _startIndex);
    paramBundle.putString("collectionhref", _assetPackagePages.getHref().toString());
    paramBundle.putString("collectionparenthref", _assetPackagePages.getParentHref().toString());
  }
  
  public void setStartIndex(int paramInt)
  {
    _startIndex = paramInt;
  }
}
