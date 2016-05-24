package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceType;
import com.adobe.creativesdk.foundation.internal.storage.model.resources.AdobeStorageResourceItem;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession;
import java.net.URI;
import java.util.Date;

public class AdobeAsset
{
  protected String GUID;
  protected Date creationDate;
  protected String etag;
  protected URI href;
  protected AdobeCloud mCloud = AdobeCloudManager.getSharedCloudManager().getDefaultCloud();
  protected Date modificationDate;
  protected String name;
  protected URI parentHref;
  
  protected AdobeAsset() {}
  
  public static String getValidatedAssetName(String paramString)
  {
    if (!AdobeStorageResourceItem.validAssetName(paramString)) {
      return null;
    }
    return AdobeStorageResourceItem.escapeAssetName(paramString);
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == null) {}
    do
    {
      do
      {
        return false;
        if (paramObject == this) {
          return true;
        }
      } while (!(paramObject instanceof AdobeAsset));
      paramObject = (AdobeAsset)paramObject;
    } while (GUID == null);
    return GUID.equals(paramObject.getGUID());
  }
  
  public AdobeCloud getCloud()
  {
    return mCloud;
  }
  
  public Date getCreationDate()
  {
    Date localDate = null;
    if (creationDate != null) {
      localDate = (Date)creationDate.clone();
    }
    return localDate;
  }
  
  public String getEtag()
  {
    return etag;
  }
  
  public String getGUID()
  {
    return GUID;
  }
  
  public URI getHref()
  {
    return href;
  }
  
  public Date getModificationDate()
  {
    return modificationDate;
  }
  
  public String getName()
  {
    return name;
  }
  
  public URI getParentHref()
  {
    return parentHref;
  }
  
  protected AdobeStorageSession getSession()
  {
    if (mCloud != null) {
      return (AdobeStorageSession)mCloud.getSessionForService(AdobeCloudServiceType.AdobeCloudServiceTypeStorage);
    }
    return null;
  }
  
  protected void setCloud(AdobeCloud paramAdobeCloud)
  {
    mCloud = paramAdobeCloud;
  }
}
