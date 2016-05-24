package com.adobe.creativesdk.foundation.internal.storage.controllers;

import java.util.Date;
import org.json.JSONObject;

public class AdobeAssetsViewCellAssetData
{
  public Date creationDate;
  public String guid;
  public String imageMD5Hash;
  public boolean isEditInProgress = false;
  public Date modificationDate;
  public JSONObject optionalMetadata;
  public Object originalAsset;
  public String title;
  
  public AdobeAssetsViewCellAssetData() {}
}
