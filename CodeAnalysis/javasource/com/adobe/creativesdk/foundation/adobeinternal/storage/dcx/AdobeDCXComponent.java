package com.adobe.creativesdk.foundation.adobeinternal.storage.dcx;

import java.lang.ref.WeakReference;
import org.json.JSONObject;

public class AdobeDCXComponent
{
  protected JSONObject _dict;
  protected WeakReference<AdobeDCXManifest> _manifest;
  protected String _parentPath;
  
  protected AdobeDCXComponent() {}
  
  public AdobeDCXComponent(JSONObject paramJSONObject, AdobeDCXManifest paramAdobeDCXManifest, String paramString)
  {
    _dict = paramJSONObject;
    _manifest = new WeakReference(paramAdobeDCXManifest);
    _parentPath = paramString;
  }
  
  public static AdobeDCXComponent createComponentFromDictionary(JSONObject paramJSONObject, AdobeDCXManifest paramAdobeDCXManifest, String paramString)
  {
    return new AdobeDCXComponent(paramJSONObject, paramAdobeDCXManifest, paramString);
  }
  
  public String getAbsolutePath()
  {
    return AdobeDCXUtils.stringByAppendingLastPathComponent(_parentPath, getPath());
  }
  
  public String getComponentId()
  {
    return _dict.optString("id");
  }
  
  public String getEtag()
  {
    return _dict.optString("etag", null);
  }
  
  public int getHeight()
  {
    return _dict.optInt("height", -1);
  }
  
  public String getMd5()
  {
    return _dict.optString("md5", null);
  }
  
  public String getName()
  {
    return _dict.optString("name", null);
  }
  
  public String getPath()
  {
    return _dict.optString("path", null);
  }
  
  public String getRelationship()
  {
    return _dict.optString("rel", null);
  }
  
  public String getType()
  {
    return _dict.optString("type", null);
  }
  
  public int getWidth()
  {
    return _dict.optInt("width", -1);
  }
}
