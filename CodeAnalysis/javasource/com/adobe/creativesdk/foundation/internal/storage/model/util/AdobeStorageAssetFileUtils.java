package com.adobe.creativesdk.foundation.internal.storage.model.util;

import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import java.net.URI;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeStorageAssetFileUtils
{
  public static final AdobeAssetImageDimensions FULL_SIZE_RENDITION = new AdobeAssetImageDimensions(0.0F, 0.0F);
  public static final AdobeAssetImageDimensions THUMBNAIL_SIZED_RENDITION = new AdobeAssetImageDimensions(250.0F, 0.0F);
  
  public static AdobeAssetImageDimensions getAssetFileImageDimensions(AdobeAssetFile paramAdobeAssetFile)
  {
    AdobeAssetImageDimensions localAdobeAssetImageDimensions = new AdobeAssetImageDimensions(0.0F, 0.0F);
    paramAdobeAssetFile = paramAdobeAssetFile.getOptionalMetadata();
    if ((paramAdobeAssetFile != null) && (paramAdobeAssetFile.has("height")) && (paramAdobeAssetFile.has("width"))) {}
    try
    {
      height = paramAdobeAssetFile.getInt("height");
      width = paramAdobeAssetFile.getInt("width");
      return localAdobeAssetImageDimensions;
    }
    catch (JSONException paramAdobeAssetFile) {}
    return localAdobeAssetImageDimensions;
  }
  
  public static boolean isRootCollection(AdobeAssetFolder paramAdobeAssetFolder)
  {
    boolean bool2 = false;
    paramAdobeAssetFolder = paramAdobeAssetFolder.getHref();
    boolean bool1 = bool2;
    if (paramAdobeAssetFolder != null)
    {
      paramAdobeAssetFolder = paramAdobeAssetFolder.toString();
      bool1 = bool2;
      if (paramAdobeAssetFolder != null)
      {
        bool1 = bool2;
        if (paramAdobeAssetFolder.equalsIgnoreCase("/files/")) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
}
