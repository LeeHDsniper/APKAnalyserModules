package com.adobe.creativesdk.foundation.adobeinternal.storage.dcx;

import java.lang.ref.WeakReference;
import org.json.JSONObject;

public class AdobeDCXManifestNode
{
  protected JSONObject _dict;
  protected WeakReference<AdobeDCXManifest> _manifest;
  protected String _parentPath;
  
  static
  {
    if (!AdobeDCXManifestNode.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  protected AdobeDCXManifestNode() {}
  
  public AdobeDCXManifestNode(JSONObject paramJSONObject, AdobeDCXManifest paramAdobeDCXManifest, String paramString)
  {
    _dict = paramJSONObject;
    _manifest = new WeakReference(paramAdobeDCXManifest);
    _parentPath = paramString;
  }
  
  public static AdobeDCXManifestNode createManifestNodeFromDictionary(JSONObject paramJSONObject, AdobeDCXManifest paramAdobeDCXManifest, String paramString)
  {
    return new AdobeDCXManifestNode(paramJSONObject, paramAdobeDCXManifest, paramString);
  }
  
  public Object get(String paramString)
  {
    assert ((!paramString.equals("children")) && (!paramString.equals("components"))) : ("The key " + paramString + " is a reserved key for a AdobeDCXManifestNode.");
    return _dict.opt(paramString);
  }
  
  public long getAbsoluteIndex()
  {
    if ((_manifest != null) && (_manifest.get() != null)) {
      return ((AdobeDCXManifest)_manifest.get()).getAbsoluteIndexOf(this);
    }
    return -1L;
  }
  
  public String getAbsolutePath()
  {
    if (getPath() == null) {
      return null;
    }
    return AdobeDCXUtils.stringByAppendingLastPathComponent(getParentPath(), getPath());
  }
  
  public String getName()
  {
    return _dict.optString("name", null);
  }
  
  public String getNodeId()
  {
    return _dict.optString("id", null);
  }
  
  public String getParentPath()
  {
    return _parentPath;
  }
  
  public String getPath()
  {
    return _dict.optString("path", null);
  }
  
  public String getType()
  {
    return _dict.optString("type", null);
  }
}
