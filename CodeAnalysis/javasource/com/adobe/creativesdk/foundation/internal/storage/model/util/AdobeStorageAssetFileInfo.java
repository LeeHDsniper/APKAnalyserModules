package com.adobe.creativesdk.foundation.internal.storage.model.util;

import com.adobe.creativesdk.foundation.adobeinternal.cloud.AdobeCloud;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetFileInternal;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import java.io.Serializable;
import java.net.URI;
import java.util.Date;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeStorageAssetFileInfo
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  public String GUID;
  public AdobeCloud cloud;
  public Date creationDate;
  public int currentVersion;
  public String etag;
  public long fileSize;
  public String hlsHref;
  public URI href;
  public String md5Hash;
  public Date modificationDate;
  public String name;
  private String optionalMetadata;
  public URI parentHref;
  public String type;
  
  public AdobeStorageAssetFileInfo(AdobeAssetFile paramAdobeAssetFile)
  {
    GUID = paramAdobeAssetFile.getGUID();
    href = paramAdobeAssetFile.getHref();
    parentHref = paramAdobeAssetFile.getParentHref();
    etag = paramAdobeAssetFile.getEtag();
    name = paramAdobeAssetFile.getName();
    creationDate = paramAdobeAssetFile.getCreationDate();
    modificationDate = paramAdobeAssetFile.getModificationDate();
    type = paramAdobeAssetFile.getType();
    md5Hash = paramAdobeAssetFile.getMd5Hash();
    fileSize = paramAdobeAssetFile.getFileSize();
    currentVersion = paramAdobeAssetFile.getCurrentVersion();
    if ((paramAdobeAssetFile instanceof AdobeAssetFileInternal)) {}
    for (Object localObject = ((AdobeAssetFileInternal)paramAdobeAssetFile).getHlsHref();; localObject = null)
    {
      hlsHref = ((String)localObject);
      localObject = paramAdobeAssetFile.getOptionalMetadata();
      if (localObject != null) {
        optionalMetadata = ((JSONObject)localObject).toString();
      }
      cloud = paramAdobeAssetFile.getCloud();
      return;
    }
  }
  
  public JSONObject getOptionalMetadata()
  {
    Object localObject = null;
    if (optionalMetadata == null) {
      return null;
    }
    try
    {
      JSONObject localJSONObject = new JSONObject(optionalMetadata);
      localObject = localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      for (;;) {}
    }
    return localObject;
  }
}
