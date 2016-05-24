package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;
import com.adobe.creativesdk.foundation.storage.AdobeSelectionLibraryAsset;
import java.util.ArrayList;

public class AdobeSelectionLibraryAssetInternal
  extends AdobeSelectionLibraryAsset
{
  public AdobeSelectionLibraryAssetInternal(AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    super(paramAdobeAssetLibrary);
  }
  
  public void setSelectedColorIDs(ArrayList<String> paramArrayList)
  {
    selectedColorIDs = paramArrayList;
  }
  
  public void setSelectedColorThemeIDs(ArrayList<String> paramArrayList)
  {
    selectedColorThemeIDs = paramArrayList;
  }
  
  public void setSelectedImageIDs(ArrayList<String> paramArrayList)
  {
    selectedImageIDs = paramArrayList;
  }
}
