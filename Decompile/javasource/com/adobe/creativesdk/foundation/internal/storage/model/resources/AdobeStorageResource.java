package com.adobe.creativesdk.foundation.internal.storage.model.resources;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudManager;
import java.net.URI;

public class AdobeStorageResource
{
  protected AdobeCloud cloud;
  public AdobeCollaborationType collaboration = AdobeCollaborationType.ADOBE_COLLABORATION_TYPE_PRIVATE;
  public String created;
  public String etag;
  public URI href;
  public String internalID;
  public boolean isCollection;
  public String modified;
  public String name;
  public long ordinal;
  public String type;
  
  public AdobeStorageResource() {}
  
  public AdobeCloud getCloud()
  {
    if (cloud == null) {
      cloud = AdobeCloudManager.getSharedCloudManager().getDefaultCloud();
    }
    return cloud;
  }
  
  public void setCloud(AdobeCloud paramAdobeCloud)
  {
    cloud = paramAdobeCloud;
  }
}
