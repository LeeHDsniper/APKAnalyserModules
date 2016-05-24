package com.adobe.creativesdk.foundation.adobeinternal.cloud;

import com.adobe.creativesdk.foundation.adobeinternal.entitlement.AdobeEntitlementSession;
import com.adobe.creativesdk.foundation.adobeinternal.imageservice.AdobeImageSession;
import com.adobe.creativesdk.foundation.internal.sendtodesktop.AdobeNotificationSession;
import com.adobe.creativesdk.foundation.internal.storage.model.services.AdobeStorageSession;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageCopyUtils;
import com.adobe.creativesdk.foundation.internal.storage.photo.AdobePhotoSession;
import com.adobe.creativesdk.foundation.internal.utils.logging.AdobeLogger;
import com.adobe.creativesdk.foundation.internal.utils.logging.Level;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeCloud
  implements Externalizable
{
  private String _GUID;
  private boolean _available;
  private String _cloudDescription;
  private String _eTag;
  private HashMap<AdobeCloudServiceType, AdobeCloudEndpoint> _endpoints = new HashMap();
  private URL _logoURL;
  private String _name;
  private JSONObject _parameters = new JSONObject();
  private boolean _privateCloud;
  private boolean _quotaEnabled;
  private String _region;
  private HashMap<AdobeCloudServiceType, AdobeCloudServiceSession> _sessions = new HashMap();
  private long _version;
  
  public AdobeCloud() {}
  
  private void setServiceType(AdobeCloudServiceType paramAdobeCloudServiceType, String paramString1, String paramString2)
    throws AdobeCloudException
  {
    AdobeCloudEndpoint localAdobeCloudEndpoint;
    if ((paramString2 != null) && (paramAdobeCloudServiceType != AdobeCloudServiceType.AdobeCloudServiceTypeUnknown))
    {
      localAdobeCloudEndpoint = (AdobeCloudEndpoint)_endpoints.get(paramAdobeCloudServiceType);
      if (localAdobeCloudEndpoint == null) {
        break label72;
      }
    }
    for (;;)
    {
      try
      {
        localAdobeCloudEndpoint.addServiceSchemaId(paramString1, new URL(paramString2));
        paramString1 = localAdobeCloudEndpoint;
        _endpoints.put(paramAdobeCloudServiceType, paramString1);
        return;
      }
      catch (MalformedURLException paramAdobeCloudServiceType)
      {
        throw new AdobeCloudException(AdobeCloudErrorCode.AdobeCloudErrorUnexpectedResponse, "Parsing of input failed", paramAdobeCloudServiceType);
      }
      try
      {
        label72:
        paramString1 = new AdobeCloudEndpoint(paramString1, new URL(paramString2), paramAdobeCloudServiceType);
      }
      catch (MalformedURLException paramAdobeCloudServiceType)
      {
        throw new AdobeCloudException(AdobeCloudErrorCode.AdobeCloudErrorUnexpectedResponse, "Parsing of input failed", paramAdobeCloudServiceType);
      }
    }
  }
  
  private String uriForKey(ArrayList<String> paramArrayList, JSONObject paramJSONObject)
  {
    Object localObject = null;
    int j = 1;
    Iterator localIterator = paramArrayList.iterator();
    for (paramArrayList = paramJSONObject;; paramArrayList = paramArrayList.optJSONObject(paramJSONObject))
    {
      i = j;
      if (!localIterator.hasNext()) {
        break label57;
      }
      paramJSONObject = (String)localIterator.next();
      if (paramArrayList.optJSONObject(paramJSONObject) == null) {
        break;
      }
    }
    int i = 0;
    label57:
    paramJSONObject = localObject;
    if (i != 0) {
      paramJSONObject = paramArrayList.optString("uri", null);
    }
    return paramJSONObject;
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (paramObject != null)
    {
      bool1 = bool2;
      if ((paramObject instanceof AdobeCloud))
      {
        paramObject = (AdobeCloud)paramObject;
        if (_GUID == null) {
          break label43;
        }
        bool1 = _GUID.equals(_GUID);
      }
    }
    return bool1;
    label43:
    return _GUID == null;
  }
  
  protected HashMap<AdobeCloudServiceType, AdobeCloudEndpoint> getEndpoints()
  {
    return _endpoints;
  }
  
  protected String getEtag()
  {
    return _eTag;
  }
  
  public String getName()
  {
    return _name;
  }
  
  public AdobeCloudServiceSession getSessionForService(AdobeCloudServiceType paramAdobeCloudServiceType)
  {
    AdobeCloudServiceSession localAdobeCloudServiceSession = null;
    if (_sessions.containsKey(paramAdobeCloudServiceType))
    {
      localAdobeCloudServiceSession = (AdobeCloudServiceSession)_sessions.get(paramAdobeCloudServiceType);
      return localAdobeCloudServiceSession;
    }
    AdobeCloudEndpoint localAdobeCloudEndpoint = (AdobeCloudEndpoint)_endpoints.get(paramAdobeCloudServiceType);
    Object localObject = localAdobeCloudEndpoint;
    if (localAdobeCloudEndpoint != null)
    {
      localObject = localAdobeCloudEndpoint;
      if (localAdobeCloudEndpoint.getServiceType() != paramAdobeCloudServiceType) {
        localObject = null;
      }
    }
    localAdobeCloudEndpoint = null;
    switch (1.$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$cloud$AdobeCloudServiceType[paramAdobeCloudServiceType.ordinal()])
    {
    default: 
      AdobeLogger.log(Level.ERROR, AdobeCloud.class.getSimpleName(), "Invalid cloud type specified.");
      localObject = localAdobeCloudEndpoint;
    }
    while (localObject != null)
    {
      ((AdobeCloudServiceSession)localObject).setPrivateService(isPrivateCloud());
      _sessions.put(paramAdobeCloudServiceType, localObject);
      return localObject;
      localObject = AdobeImageSession.getSessionForCloudEndpoint((AdobeCloudEndpoint)localObject);
      continue;
      localObject = null;
      continue;
      localObject = AdobePhotoSession.getSessionForCloudEndpoint((AdobeCloudEndpoint)localObject);
      continue;
      localObject = AdobeStorageSession.getSessionForCloudEndpoint((AdobeCloudEndpoint)localObject);
      continue;
      localObject = AdobeEntitlementSession.getSessionForCloudEndpoint((AdobeCloudEndpoint)localObject);
      continue;
      localObject = AdobeNotificationSession.getSessionForCloudEndpoint((AdobeCloudEndpoint)localObject);
    }
  }
  
  public boolean isAvailable()
  {
    return _available;
  }
  
  public boolean isPrivateCloud()
  {
    return _privateCloud;
  }
  
  public boolean isQuotaEnabled()
  {
    return _quotaEnabled;
  }
  
  public boolean isStrictlyEqual(AdobeCloud paramAdobeCloud)
  {
    boolean bool2 = equals(paramAdobeCloud);
    boolean bool1 = bool2;
    if (getEtag() != null)
    {
      bool1 = bool2;
      if (paramAdobeCloud.getEtag() != null) {
        bool1 = bool2 & getEtag().equals(paramAdobeCloud.getEtag());
      }
    }
    return bool1;
  }
  
  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    _GUID = ((String)paramObjectInput.readObject());
    _eTag = ((String)paramObjectInput.readObject());
    _name = ((String)paramObjectInput.readObject());
    _cloudDescription = ((String)paramObjectInput.readObject());
    _region = ((String)paramObjectInput.readObject());
    _logoURL = ((URL)paramObjectInput.readObject());
    _endpoints = ((HashMap)paramObjectInput.readObject());
    try
    {
      _parameters = new JSONObject((String)paramObjectInput.readObject());
      _version = paramObjectInput.readLong();
      _available = paramObjectInput.readBoolean();
      _privateCloud = paramObjectInput.readBoolean();
      _quotaEnabled = paramObjectInput.readBoolean();
      return;
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        AdobeLogger.log(Level.DEBUG, AdobeCloud.class.getSimpleName(), null, localJSONException);
      }
    }
  }
  
  public void removeAllServices()
  {
    if (_sessions != null)
    {
      Iterator localIterator = _sessions.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        ((AdobeCloudServiceSession)localEntry.getValue()).tearDownService();
        ((AdobeCloudServiceSession)localEntry.getValue()).getHttpServices().clear();
      }
      _sessions.clear();
    }
  }
  
  protected void setAvailable(boolean paramBoolean)
  {
    _available = paramBoolean;
  }
  
  public void setGUID(String paramString)
  {
    _GUID = paramString;
  }
  
  public void setName(String paramString)
  {
    _name = paramString;
  }
  
  public void setPrivateCloud(boolean paramBoolean)
  {
    _privateCloud = paramBoolean;
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    if (_GUID != null) {
      localHashMap.put("guid", _GUID);
    }
    if (_eTag != null) {
      localHashMap.put("etag", _eTag);
    }
    if (_name != null) {
      localHashMap.put("name", _name);
    }
    if (_cloudDescription != null) {
      localHashMap.put("cloudDescription", _cloudDescription);
    }
    if (_region != null) {
      localHashMap.put("region", _region);
    }
    if (_endpoints != null) {
      localHashMap.put("endpoints", _endpoints);
    }
    if (_parameters != null) {
      localHashMap.put("parameters", _parameters);
    }
    if (_sessions != null) {
      localHashMap.put("sessions", _sessions);
    }
    localHashMap.put("version", Long.valueOf(_version));
    localHashMap.put("availability", Boolean.valueOf(isAvailable()));
    localHashMap.put("private", Boolean.valueOf(isPrivateCloud()));
    localHashMap.put("quotaEnabled", Boolean.valueOf(isQuotaEnabled()));
    return localHashMap.toString();
  }
  
  public boolean updateFromDictionary(JSONObject paramJSONObject)
    throws AdobeCloudException
  {
    if (paramJSONObject == null) {
      return false;
    }
    _GUID = paramJSONObject.optString("id", null);
    _eTag = paramJSONObject.optString("etag", null);
    _name = paramJSONObject.optString("name", null);
    _cloudDescription = paramJSONObject.optString("cloudDescription", null);
    _region = paramJSONObject.optString("region", null);
    Object localObject;
    boolean bool;
    if ((paramJSONObject.opt("iconUrl") != null) && ((paramJSONObject.opt("iconUrl") instanceof URL)))
    {
      _logoURL = ((URL)paramJSONObject.opt("iconUrl"));
      localObject = paramJSONObject.optString("status", null);
      if (localObject == null) {
        break label542;
      }
      if ((!((String)localObject).equals("Provisioned")) && (!((String)localObject).equals("online"))) {
        break label537;
      }
      bool = true;
      label138:
      _available = bool;
      _privateCloud = paramJSONObject.optBoolean("private", false);
      _quotaEnabled = true;
      localObject = paramJSONObject.optJSONObject("parameters");
      if (localObject != null)
      {
        _parameters = AdobeStorageCopyUtils.deepMutableCopyOfDictionary((JSONObject)localObject);
        if (((JSONObject)localObject).optBoolean("quota")) {
          _quotaEnabled = ((JSONObject)localObject).optBoolean("quota");
        }
      }
      paramJSONObject = paramJSONObject.optJSONObject("features");
      if (!isPrivateCloud()) {
        break label547;
      }
      bool = AdobeEntitlementServices.getSharedServices().hasAccessToPrivateStorageServices();
      label223:
      if (!bool) {
        break label557;
      }
      localObject = new ArrayList();
      ((ArrayList)localObject).add("files");
      ((ArrayList)localObject).add("storage");
      localObject = uriForKey((ArrayList)localObject, paramJSONObject);
      setServiceType(AdobeCloudServiceType.AdobeCloudServiceTypeStorage, "files", (String)localObject);
      localObject = new ArrayList();
      ((ArrayList)localObject).add("assets");
      ((ArrayList)localObject).add("storage");
      localObject = uriForKey((ArrayList)localObject, paramJSONObject);
      setServiceType(AdobeCloudServiceType.AdobeCloudServiceTypeStorage, "assets", (String)localObject);
      localObject = new ArrayList();
      ((ArrayList)localObject).add("files");
      ((ArrayList)localObject).add("archive");
      localObject = uriForKey((ArrayList)localObject, paramJSONObject);
      setServiceType(AdobeCloudServiceType.AdobeCloudServiceTypeStorage, "archive", (String)localObject);
      localObject = new ArrayList();
      ((ArrayList)localObject).add("libraries");
      ((ArrayList)localObject).add("storage");
      localObject = uriForKey((ArrayList)localObject, paramJSONObject);
      setServiceType(AdobeCloudServiceType.AdobeCloudServiceTypeStorage, "libraries", (String)localObject);
      localObject = new ArrayList();
      ((ArrayList)localObject).add("imageservices");
      ((ArrayList)localObject).add("service");
      localObject = uriForKey((ArrayList)localObject, paramJSONObject);
      setServiceType(AdobeCloudServiceType.AdobeCloudServiceTypeImage, "imageservices", (String)localObject);
      localObject = new ArrayList();
      ((ArrayList)localObject).add("clipboard");
      ((ArrayList)localObject).add("storage");
      paramJSONObject = uriForKey((ArrayList)localObject, paramJSONObject);
      setServiceType(AdobeCloudServiceType.AdobeCloudServiceTypeClipBoard, "clipboard", paramJSONObject);
    }
    for (;;)
    {
      return true;
      localObject = paramJSONObject.optString("iconUrl", null);
      if (localObject == null) {
        break;
      }
      try
      {
        _logoURL = new URL(paramJSONObject.optString("iconUrl", null));
        _logoURL = new URL((String)localObject);
      }
      catch (MalformedURLException localMalformedURLException)
      {
        _logoURL = null;
      }
      break;
      label537:
      bool = false;
      break label138;
      label542:
      bool = false;
      break label138;
      label547:
      bool = AdobeEntitlementServices.getSharedServices().hasAccessToPublicStorageServices();
      break label223;
      label557:
      _quotaEnabled = false;
    }
  }
  
  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeObject(_GUID);
    paramObjectOutput.writeObject(_eTag);
    paramObjectOutput.writeObject(_name);
    paramObjectOutput.writeObject(_cloudDescription);
    paramObjectOutput.writeObject(_region);
    paramObjectOutput.writeObject(_logoURL);
    paramObjectOutput.writeObject(_endpoints);
    if (_parameters != null) {}
    for (String str = _parameters.toString();; str = null)
    {
      paramObjectOutput.writeObject(str);
      paramObjectOutput.writeLong(_version);
      paramObjectOutput.writeBoolean(_available);
      paramObjectOutput.writeBoolean(_privateCloud);
      paramObjectOutput.writeBoolean(_quotaEnabled);
      return;
    }
  }
}
