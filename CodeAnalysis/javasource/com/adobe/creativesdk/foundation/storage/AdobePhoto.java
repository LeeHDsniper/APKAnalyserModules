package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceType;
import com.adobe.creativesdk.foundation.internal.storage.photo.AdobePhotoSession;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.Date;

public class AdobePhoto
  implements Externalizable
{
  protected String _GUID = null;
  protected String _baseHref = null;
  protected AdobeCloud _cloud = null;
  protected Date _creationDate = null;
  protected String _href = null;
  protected String _internalID = null;
  protected Date _modificationDate = null;
  
  public AdobePhoto() {}
  
  public AdobeCloud getCloud()
  {
    return _cloud;
  }
  
  public Date getCreationDate()
  {
    return _creationDate;
  }
  
  public String getGUID()
  {
    return _GUID;
  }
  
  public String getHref()
  {
    return _href;
  }
  
  public Date getModificationDate()
  {
    return _modificationDate;
  }
  
  protected AdobePhotoSession getSession()
  {
    return (AdobePhotoSession)_cloud.getSessionForService(AdobeCloudServiceType.AdobeCloudServiceTypePhoto);
  }
  
  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    _internalID = ((String)paramObjectInput.readObject());
    _GUID = ((String)paramObjectInput.readObject());
    _href = ((String)paramObjectInput.readObject());
    _baseHref = ((String)paramObjectInput.readObject());
    _creationDate = ((Date)paramObjectInput.readObject());
    _modificationDate = ((Date)paramObjectInput.readObject());
    _cloud = ((AdobeCloud)paramObjectInput.readObject());
  }
  
  public void setBaseHref(String paramString)
  {
    _baseHref = paramString;
  }
  
  public void setCloud(AdobeCloud paramAdobeCloud)
  {
    _cloud = paramAdobeCloud;
  }
  
  public void setHref(String paramString)
  {
    _href = paramString;
  }
  
  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeObject(_internalID);
    paramObjectOutput.writeObject(_GUID);
    paramObjectOutput.writeObject(_href);
    paramObjectOutput.writeObject(_baseHref);
    paramObjectOutput.writeObject(_creationDate);
    paramObjectOutput.writeObject(_modificationDate);
    paramObjectOutput.writeObject(_cloud);
  }
}
