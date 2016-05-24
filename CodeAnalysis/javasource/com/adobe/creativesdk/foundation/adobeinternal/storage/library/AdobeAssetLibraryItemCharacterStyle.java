package com.adobe.creativesdk.foundation.adobeinternal.storage.library;

import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXManifestNode;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibrary;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLibraryItem;
import org.json.JSONObject;

public class AdobeAssetLibraryItemCharacterStyle
  extends AdobeAssetLibraryItem
{
  private AdobeAssetFile rendition;
  private float renditionHeight;
  private float renditionWidth;
  private JSONObject styleData;
  
  public AdobeAssetLibraryItemCharacterStyle(AdobeDCXManifestNode paramAdobeDCXManifestNode, String paramString, JSONObject paramJSONObject, AdobeAssetFile paramAdobeAssetFile, int paramInt1, int paramInt2, AdobeAssetLibrary paramAdobeAssetLibrary)
  {
    super(paramAdobeDCXManifestNode, paramString, paramAdobeAssetLibrary);
    styleData = paramJSONObject;
    rendition = paramAdobeAssetFile;
    renditionHeight = paramInt1;
    renditionWidth = paramInt2;
  }
  
  public AdobeAssetFile getRendition()
  {
    return rendition;
  }
  
  public float getRenditionHeight()
  {
    return renditionHeight;
  }
  
  public float getRenditionWidth()
  {
    return renditionWidth;
  }
  
  public JSONObject getStyleData()
  {
    return styleData;
  }
  
  public String nameOrIdForDisplay()
  {
    JSONObject localJSONObject = getStyleData();
    double d = 0.0D;
    String str2 = localJSONObject.optString("fontFamily");
    Object localObject = null;
    String str1 = null;
    localJSONObject = localJSONObject.optJSONObject("fontSize");
    if (localJSONObject != null)
    {
      localObject = localJSONObject.optString("value");
      str1 = localJSONObject.optString("type");
    }
    if ((str2 != null) && (str2.length() > 0))
    {
      if (localObject != null) {
        d = Double.parseDouble((String)localObject);
      }
      if (localObject != null)
      {
        localObject = Double.valueOf(d);
        if (str1 == null) {
          break label123;
        }
      }
      for (;;)
      {
        return String.format("%s %.1f%s", new Object[] { str2, localObject, str1 });
        localObject = "";
        break;
        label123:
        str1 = "";
      }
    }
    return super.nameOrIdForDisplay();
  }
}
