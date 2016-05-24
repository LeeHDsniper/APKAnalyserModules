package com.adobe.creativesdk.foundation.internal.storage;

import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceCollection;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceItem;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import java.net.MalformedURLException;
import java.net.URL;

public class AdobeAssetFileInternal
  extends AdobeAssetFile
{
  public int _videDuration;
  public String hlsHref;
  
  public AdobeAssetFileInternal() {}
  
  public AdobeAssetFileInternal(AdobeStorageResourceItem paramAdobeStorageResourceItem, AdobeStorageResourceCollection paramAdobeStorageResourceCollection)
  {
    super(paramAdobeStorageResourceItem, paramAdobeStorageResourceCollection);
  }
  
  public boolean canStreamVideo()
  {
    boolean bool = false;
    if (hlsHref != null) {}
    try
    {
      URL localURL = new URL(hlsHref);
      if (localURL != null)
      {
        bool = true;
        return bool;
      }
      return false;
    }
    catch (MalformedURLException localMalformedURLException) {}
    return false;
  }
  
  public String getHlsHref()
  {
    return hlsHref;
  }
  
  public int getVideoDuration()
  {
    return _videDuration;
  }
}
