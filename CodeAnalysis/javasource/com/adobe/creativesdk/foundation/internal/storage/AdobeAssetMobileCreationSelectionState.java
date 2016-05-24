package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.storage.AdobeAssetCompFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDrawFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLineFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPSMixFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPackagePages;
import com.adobe.creativesdk.foundation.storage.AdobeAssetSketchbook;
import com.adobe.creativesdk.foundation.storage.AdobeSelection;
import com.adobe.creativesdk.foundation.storage.AdobeSelectionCompFile;
import com.adobe.creativesdk.foundation.storage.AdobeSelectionDrawAsset;
import com.adobe.creativesdk.foundation.storage.AdobeSelectionLineAsset;
import com.adobe.creativesdk.foundation.storage.AdobeSelectionPSMixFile;
import com.adobe.creativesdk.foundation.storage.AdobeSelectionSketchAsset;
import java.util.ArrayList;

public class AdobeAssetMobileCreationSelectionState
{
  private static AdobeAssetPackagePages _selectPackage;
  private static AdobeAssetFile _selectPackageItem;
  
  private static AdobeSelection creationSelectionPackage(AdobeAssetFile paramAdobeAssetFile, AdobeAssetPackagePages paramAdobeAssetPackagePages)
  {
    Object localObject = null;
    if ((paramAdobeAssetPackagePages == null) || (paramAdobeAssetFile == null)) {
      return null;
    }
    if ((paramAdobeAssetPackagePages instanceof AdobeAssetSketchbook)) {
      localObject = new AdobeSelectionSketchAsset((AdobeAssetSketchbook)paramAdobeAssetPackagePages, paramAdobeAssetPackagePages.getPages().indexOf(paramAdobeAssetFile));
    }
    if ((paramAdobeAssetPackagePages instanceof AdobeAssetLineFile)) {
      localObject = new AdobeSelectionLineAsset((AdobeAssetLineFile)paramAdobeAssetPackagePages, paramAdobeAssetPackagePages.getPages().indexOf(paramAdobeAssetFile));
    }
    if ((paramAdobeAssetPackagePages instanceof AdobeAssetDrawFile)) {
      localObject = new AdobeSelectionDrawAsset((AdobeAssetDrawFile)paramAdobeAssetPackagePages, paramAdobeAssetPackagePages.getPages().indexOf(paramAdobeAssetFile));
    }
    if ((paramAdobeAssetPackagePages instanceof AdobeAssetPSMixFile)) {
      localObject = new AdobeSelectionPSMixFile((AdobeAssetPSMixFile)paramAdobeAssetPackagePages, paramAdobeAssetPackagePages.getPages().indexOf(paramAdobeAssetFile));
    }
    if ((paramAdobeAssetPackagePages instanceof AdobeAssetCompFile)) {
      localObject = new AdobeSelectionCompFile((AdobeAssetCompFile)paramAdobeAssetPackagePages, paramAdobeAssetPackagePages.getPages().indexOf(paramAdobeAssetFile));
    }
    return localObject;
  }
  
  public static AdobeSelection creationSelectionPackageFromCurrentSelection()
  {
    return creationSelectionPackage(_selectPackageItem, _selectPackage);
  }
  
  public static AdobeAssetFile getSelectedPackageItem()
  {
    return _selectPackageItem;
  }
  
  public static boolean hasSelection()
  {
    return (_selectPackageItem != null) && (_selectPackage != null);
  }
  
  public static boolean isPackageItemSame(String paramString)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (_selectPackageItem != null)
    {
      bool1 = bool2;
      if (paramString != null) {
        bool1 = paramString.equalsIgnoreCase(_selectPackageItem.getGUID());
      }
    }
    return bool1;
  }
  
  public static void resetSelection()
  {
    _selectPackageItem = null;
  }
  
  public static void selectPackageItem(AdobeAssetPackagePages paramAdobeAssetPackagePages, AdobeAssetFile paramAdobeAssetFile)
  {
    _selectPackageItem = paramAdobeAssetFile;
    _selectPackage = paramAdobeAssetPackagePages;
  }
}
