package com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary;

import android.os.Bundle;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetsViewDesignLibraryItemsContainerFragment;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItem;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;

public class LibraryItemsOneUpViewController
{
  private static LibraryItemsOneUpViewController _sInstance;
  private ArrayList<AdobeAssetLibraryItem> _itemsList;
  private AdobeAssetLibrary _library;
  private int _startIndex;
  
  private LibraryItemsOneUpViewController() {}
  
  private void buildLibraryItemsList()
  {
    _itemsList.addAll(_library.getColors().values());
    _itemsList.addAll(_library.getColorThemes().values());
    _itemsList.addAll(_library.getImages().values());
  }
  
  public static void createInstanceFromConfigurationBundle(Bundle paramBundle)
  {
    LibraryItemsOneUpViewController localLibraryItemsOneUpViewController = new LibraryItemsOneUpViewController();
    AdobeAssetLibrary localAdobeAssetLibrary = AdobeAssetsViewDesignLibraryItemsContainerFragment.getLibraryFolderFromHref(paramBundle.getString("collectionhref"), paramBundle.getString("collectionparenthref"));
    localLibraryItemsOneUpViewController.setStartIndex(paramBundle.getInt("startindex"));
    localLibraryItemsOneUpViewController.setLibrary(localAdobeAssetLibrary);
    setInstance(localLibraryItemsOneUpViewController);
  }
  
  public static void createInstanceFromLibrary(AdobeAssetLibrary paramAdobeAssetLibrary, ArrayList<AdobeAssetLibraryItem> paramArrayList, int paramInt)
  {
    LibraryItemsOneUpViewController localLibraryItemsOneUpViewController = new LibraryItemsOneUpViewController();
    localLibraryItemsOneUpViewController.setLibraryAndItems(paramAdobeAssetLibrary, paramArrayList);
    localLibraryItemsOneUpViewController.setStartIndex(paramInt);
    setInstance(localLibraryItemsOneUpViewController);
  }
  
  public static LibraryItemsOneUpViewController getInstance()
  {
    return _sInstance;
  }
  
  private static void setInstance(LibraryItemsOneUpViewController paramLibraryItemsOneUpViewController)
  {
    _sInstance = paramLibraryItemsOneUpViewController;
  }
  
  private void setLibrary(AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    _library = paramAdobeAssetLibrary;
    buildLibraryItemsList();
  }
  
  private void setLibraryAndItems(AdobeAssetLibrary paramAdobeAssetLibrary, ArrayList<AdobeAssetLibraryItem> paramArrayList)
  {
    _library = paramAdobeAssetLibrary;
    _itemsList = paramArrayList;
  }
  
  private void setStartIndex(int paramInt)
  {
    _startIndex = paramInt;
  }
  
  public int getCount()
  {
    if (_itemsList != null) {
      return _itemsList.size();
    }
    return 0;
  }
  
  public AdobeAssetLibraryItem getItemAtPos(int paramInt)
  {
    if ((_itemsList != null) && (paramInt >= 0) && (paramInt < _itemsList.size())) {
      return (AdobeAssetLibraryItem)_itemsList.get(paramInt);
    }
    return null;
  }
  
  public int getStartIndex()
  {
    return _startIndex;
  }
  
  public void saveInstanceState(Bundle paramBundle)
  {
    paramBundle.putInt("startindex", _startIndex);
    paramBundle.putString("collectionhref", _library.getHref().toString());
    paramBundle.putString("collectionparenthref", _library.getParentHref().toString());
  }
}
