package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import java.util.ArrayList;

public class AdobeAssetViewEditSelectedAssetsController
{
  private static AdobeAssetViewEditSelectedAssetsController _editController;
  private ArrayList<AdobeAsset> _targetAssets;
  
  private AdobeAssetViewEditSelectedAssetsController() {}
  
  public static void clearSelection()
  {
    _editController = null;
  }
  
  public static AdobeAssetViewEditSelectedAssetsController sharedController()
  {
    if (_editController == null) {
      _editController = new AdobeAssetViewEditSelectedAssetsController();
    }
    return _editController;
  }
  
  public ArrayList<AdobeAsset> getTargetAssets()
  {
    return _targetAssets;
  }
  
  public void setTargetAssets(AdobeAsset paramAdobeAsset)
  {
    _targetAssets = new ArrayList();
    _targetAssets.add(paramAdobeAsset);
  }
  
  public void setTargetAssets(ArrayList<AdobeAsset> paramArrayList)
  {
    _targetAssets = paramArrayList;
  }
}
