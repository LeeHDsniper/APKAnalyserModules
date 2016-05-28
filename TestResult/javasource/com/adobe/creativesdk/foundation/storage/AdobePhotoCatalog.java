package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloudServiceType;
import com.adobe.creativesdk.foundation.internal.photo.util.AdobePhotoUtils;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import com.adobe.creativesdk.foundation.internal.storage.photo.AdobePhotoSession;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.ArrayList;
import org.json.JSONObject;

public class AdobePhotoCatalog
  extends AdobePhoto
  implements Externalizable
{
  private boolean _inSync;
  private String _name;
  private boolean _shared;
  private AdobePhotoCatalogType _type;
  
  public AdobePhotoCatalog() {}
  
  public AdobePhotoCatalog(String paramString1, String paramString2, AdobeCloud paramAdobeCloud)
  {
    String str = paramString2;
    if (paramString2 == null) {
      str = AdobePhotoUtils.generateGUID();
    }
    _GUID = str;
    _name = paramString1;
    _href = String.format("/v1.0/catalogs/%s", new Object[] { str });
    _inSync = false;
    _cloud = paramAdobeCloud;
  }
  
  public AdobePhotoCatalog(String paramString1, String paramString2, AdobeCloud paramAdobeCloud, AdobePhotoCatalogType paramAdobePhotoCatalogType)
  {
    this(paramString1, paramString2, paramAdobeCloud);
    _type = paramAdobePhotoCatalogType;
  }
  
  public static void listCatalogOfType(AdobePhotoCatalogType paramAdobePhotoCatalogType, AdobeCloud paramAdobeCloud, IAdobeGenericCompletionCallback<ArrayList<AdobePhotoCatalog>> paramIAdobeGenericCompletionCallback, IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    AdobePhotoSession localAdobePhotoSession = (AdobePhotoSession)paramAdobeCloud.getSessionForService(AdobeCloudServiceType.AdobeCloudServiceTypePhoto);
    if (localAdobePhotoSession == null) {
      return;
    }
    localAdobePhotoSession.listCatalogsOfType(paramAdobePhotoCatalogType, paramAdobeCloud, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
    {
      public void onCompletion(ArrayList<AdobePhotoCatalog> paramAnonymousArrayList)
      {
        if (val$completionCallback != null) {
          val$completionCallback.onCompletion(paramAnonymousArrayList);
        }
      }
    }, new IAdobeGenericErrorCallback()
    {
      public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
      {
        if (val$errorCallback != null)
        {
          val$errorCallback.onError(paramAnonymousAdobeCSDKException);
          return;
        }
        AdobeLogger.log(Level.WARN, AdobePhotoCatalog.class.getSimpleName(), "Failed to list the catalogs");
      }
    });
  }
  
  public String getName()
  {
    return _name;
  }
  
  public AdobePhotoCatalogType getType()
  {
    return _type;
  }
  
  public boolean isEqualToCatalog(AdobePhotoCatalog paramAdobePhotoCatalog)
  {
    if ((_GUID != null) && (paramAdobePhotoCatalog.getGUID() == null)) {}
    while ((_GUID == null) && (paramAdobePhotoCatalog.getGUID() != null)) {
      return false;
    }
    if ((_GUID == null) && (paramAdobePhotoCatalog.getGUID() == null)) {
      return true;
    }
    return _GUID.equals(paramAdobePhotoCatalog.getGUID());
  }
  
  public boolean isInSync()
  {
    return _inSync;
  }
  
  public void listCollectionsAfterName(String paramString, int paramInt, boolean paramBoolean, final IAdobeGenericCompletionCallback<ArrayList<AdobePhotoCollection>> paramIAdobeGenericCompletionCallback, final IAdobeGenericErrorCallback<AdobeCSDKException> paramIAdobeGenericErrorCallback)
  {
    if (getSession() == null) {
      return;
    }
    getSession().listCollectionsInCatalog(this, paramString, paramInt, new IAdobeGenericCompletionCallback()new IAdobeGenericErrorCallback
    {
      public void onCompletion(ArrayList<AdobePhotoCollection> paramAnonymousArrayList)
      {
        if (paramIAdobeGenericCompletionCallback != null) {
          paramIAdobeGenericCompletionCallback.onCompletion(paramAnonymousArrayList);
        }
      }
    }, new IAdobeGenericErrorCallback()
    {
      public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
      {
        if (paramIAdobeGenericErrorCallback != null)
        {
          paramIAdobeGenericErrorCallback.onError(paramAnonymousAdobeCSDKException);
          return;
        }
        AdobeLogger.log(Level.WARN, AdobePhotoCatalog.class.getSimpleName(), "Failed list the collections in catalog " + jdField_this_name);
      }
    });
  }
  
  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    super.readExternal(paramObjectInput);
    _name = ((String)paramObjectInput.readObject());
    _inSync = paramObjectInput.readBoolean();
  }
  
  public boolean updateFromDictionary(JSONObject paramJSONObject)
    throws AdobePhotoException
  {
    _inSync = true;
    if (paramJSONObject.optString("id", null) != null) {
      _internalID = paramJSONObject.optString("id", null);
    }
    if (paramJSONObject.optString("_id", null) != null) {
      _GUID = paramJSONObject.optString("_id", null);
    }
    if (paramJSONObject.optString("name", null) != null) {
      _name = paramJSONObject.optString("name", null);
    }
    if (paramJSONObject.opt("created") != null) {
      _creationDate = AdobeStorageUtils.convertStringToDate(paramJSONObject.optString("created"));
    }
    if (paramJSONObject.opt("updated") != null) {
      _modificationDate = AdobeStorageUtils.convertStringToDate(paramJSONObject.optString("updated"));
    }
    if ((_modificationDate == null) && (_creationDate != null)) {
      _modificationDate = _creationDate;
    }
    if ((paramJSONObject.optString("subtype", null) != null) && (paramJSONObject.optString("subtype", null).equals("lightroom"))) {
      _type = AdobePhotoCatalogType.AdobePhotoCatalogTypeLightroom;
    }
    if (_name == null) {
      throw new AdobePhotoException(AdobePhotoErrorCode.ADOBE_PHOTO_ERROR_UNEXPECTED_RESPONSE, null, "Catalog doesn't have a name");
    }
    if (_creationDate == null) {
      AdobeLogger.log(Level.WARN, AdobePhotoCatalog.class.getSimpleName(), "Catalog " + _name + " doesn't have a creation time.");
    }
    if (paramJSONObject.optString("sharing", null) == null) {}
    for (_shared = false;; _shared = true)
    {
      paramJSONObject = paramJSONObject.optJSONObject("links");
      if (paramJSONObject == null) {
        break;
      }
      paramJSONObject = paramJSONObject.optJSONObject("self");
      if (paramJSONObject != null) {
        _href = paramJSONObject.optString("href", null);
      }
      return true;
    }
    AdobeLogger.log(Level.WARN, AdobePhotoCatalog.class.getSimpleName(), "Catalog doesn't have an href.");
    _href = null;
    return true;
  }
  
  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    super.writeExternal(paramObjectOutput);
    paramObjectOutput.writeObject(_name);
    paramObjectOutput.writeBoolean(_inSync);
  }
  
  public static enum AdobePhotoCatalogType
  {
    AdobePhotoCatalogTypeLightroom;
    
    private AdobePhotoCatalogType() {}
  }
}
