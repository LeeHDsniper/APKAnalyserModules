package com.adobe.creativesdk.foundation.storage;

import java.util.ArrayList;

public class AdobeSelectionLibraryAsset
  extends AdobeSelection
{
  protected ArrayList<String> selectedColorIDs;
  protected ArrayList<String> selectedColorThemeIDs;
  protected ArrayList<String> selectedImageIDs;
  AdobeAssetLibrary selectedItem;
  
  protected AdobeSelectionLibraryAsset(AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    selectedItem = paramAdobeAssetLibrary;
  }
  
  protected void setSelectedColorIDs(ArrayList<String> paramArrayList)
  {
    selectedColorIDs = paramArrayList;
  }
  
  protected void setSelectedColorThemeIDs(ArrayList<String> paramArrayList)
  {
    selectedColorThemeIDs = paramArrayList;
  }
  
  protected void setSelectedImageIDs(ArrayList<String> paramArrayList)
  {
    selectedImageIDs = paramArrayList;
  }
}
