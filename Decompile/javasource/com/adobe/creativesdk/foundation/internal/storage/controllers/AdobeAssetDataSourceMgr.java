package com.adobe.creativesdk.foundation.internal.storage.controllers;

import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import java.net.URI;
import java.util.ArrayList;

public class AdobeAssetDataSourceMgr
{
  private static AdobeAssetDataSourceMgr _sInstance;
  ArrayList<String> _ccFilesChangedFolder = new ArrayList();
  
  public AdobeAssetDataSourceMgr() {}
  
  public static AdobeAssetDataSourceMgr getInstance()
  {
    if (_sInstance == null) {
      _sInstance = new AdobeAssetDataSourceMgr();
    }
    return _sInstance;
  }
  
  public boolean isFolderMarkedAsChanged(AdobeAssetFolder paramAdobeAssetFolder, boolean paramBoolean)
  {
    if (_ccFilesChangedFolder.size() == 0) {}
    for (;;)
    {
      return false;
      paramAdobeAssetFolder = paramAdobeAssetFolder.getHref().toString();
      int i = 0;
      while (i < _ccFilesChangedFolder.size())
      {
        if (((String)_ccFilesChangedFolder.get(i)).equalsIgnoreCase(paramAdobeAssetFolder))
        {
          if (paramBoolean) {
            _ccFilesChangedFolder.remove(i);
          }
          return true;
        }
        i += 1;
      }
    }
  }
  
  public void setFolderAsChanged(AdobeAssetFolder paramAdobeAssetFolder)
  {
    if (!isFolderMarkedAsChanged(paramAdobeAssetFolder, false))
    {
      paramAdobeAssetFolder = paramAdobeAssetFolder.getHref().toString();
      _ccFilesChangedFolder.add(paramAdobeAssetFolder);
    }
  }
}
