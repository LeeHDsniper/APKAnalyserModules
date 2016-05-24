package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItem;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemColor;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemColorTheme;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItemImage;
import com.adobe.creativesdk.foundation.storage.AdobeSelectionLibraryAsset;
import java.util.ArrayList;

public class AdobeStorageLibrarySelectionState
{
  private static boolean _sIsSelectModeActive;
  private static AdobeAssetLibrary _selectLibrary;
  private static AdobeAssetLibraryItem _selectLibraryItem;
  
  private static AdobeSelectionLibraryAsset creationSelectionLibrary(AdobeAssetLibraryItem paramAdobeAssetLibraryItem, AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    if ((paramAdobeAssetLibraryItem == null) || (paramAdobeAssetLibrary == null)) {
      paramAdobeAssetLibrary = null;
    }
    ArrayList localArrayList;
    AdobeSelectionLibraryAssetInternal localAdobeSelectionLibraryAssetInternal;
    do
    {
      return paramAdobeAssetLibrary;
      localArrayList = new ArrayList();
      localArrayList.add(paramAdobeAssetLibraryItem.getItemID());
      localAdobeSelectionLibraryAssetInternal = new AdobeSelectionLibraryAssetInternal(paramAdobeAssetLibrary);
      if ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemColor))
      {
        localAdobeSelectionLibraryAssetInternal.setSelectedColorIDs(localArrayList);
        return localAdobeSelectionLibraryAssetInternal;
      }
      if ((paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemColorTheme))
      {
        localAdobeSelectionLibraryAssetInternal.setSelectedColorThemeIDs(localArrayList);
        return localAdobeSelectionLibraryAssetInternal;
      }
      paramAdobeAssetLibrary = localAdobeSelectionLibraryAssetInternal;
    } while (!(paramAdobeAssetLibraryItem instanceof AdobeAssetLibraryItemImage));
    localAdobeSelectionLibraryAssetInternal.setSelectedImageIDs(localArrayList);
    return localAdobeSelectionLibraryAssetInternal;
  }
  
  public static AdobeSelectionLibraryAsset creationSelectionLibraryFromCurrentSelection()
  {
    return creationSelectionLibrary(_selectLibraryItem, _selectLibrary);
  }
  
  public static AdobeAssetLibraryItem getSelectedLibraryItem()
  {
    return _selectLibraryItem;
  }
  
  public static boolean hasSelection()
  {
    return (_selectLibraryItem != null) && (_selectLibrary != null);
  }
  
  public static boolean isLibraryItemSame(String paramString)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (_selectLibraryItem != null)
    {
      bool1 = bool2;
      if (paramString != null) {
        bool1 = paramString.equalsIgnoreCase(_selectLibraryItem.getItemID());
      }
    }
    return bool1;
  }
  
  public static boolean isSelectModeActive()
  {
    return _sIsSelectModeActive;
  }
  
  public static void resetSelection()
  {
    _selectLibraryItem = null;
  }
  
  public static void selectLibraryItem(AdobeAssetLibraryItem paramAdobeAssetLibraryItem, AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    _selectLibraryItem = paramAdobeAssetLibraryItem;
    _selectLibrary = paramAdobeAssetLibrary;
  }
  
  public static void setSelectModeActive(boolean paramBoolean)
  {
    _sIsSelectModeActive = paramBoolean;
  }
}
