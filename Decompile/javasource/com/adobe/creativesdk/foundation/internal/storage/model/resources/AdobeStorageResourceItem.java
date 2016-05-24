package com.adobe.creativesdk.foundation.internal.storage.model.resources;

import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageErrorUtils;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageLastPathComponentUtil;
import com.adobe.creativesdk.foundation.internal.storage.model.util.ParsingDataException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetErrorCode;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLEncoder;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeStorageResourceItem
  extends AdobeStorageResource
{
  private byte[] data;
  private Number length;
  private String md5;
  private JSONObject optionalMetadata;
  private String path;
  private Number version;
  
  public AdobeStorageResourceItem() {}
  
  public static String escapeAssetName(String paramString)
  {
    if (paramString == null) {
      return null;
    }
    try
    {
      String str = URLEncoder.encode(paramString, "UTF-8").replace("+", "%20");
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      localUnsupportedEncodingException.printStackTrace();
    }
    return paramString;
  }
  
  public static AdobeStorageResourceItem resourceFromHref(URI paramURI)
  {
    AdobeStorageResourceItem localAdobeStorageResourceItem = new AdobeStorageResourceItem();
    href = paramURI;
    name = AdobeStorageLastPathComponentUtil.getLastPathComponent(paramURI.getPath());
    return localAdobeStorageResourceItem;
  }
  
  public static boolean validAssetName(String paramString)
  {
    if (paramString == null) {}
    boolean bool1;
    boolean bool2;
    do
    {
      return false;
      bool1 = paramString.matches(".*[\\\\:\\*\\?\"\\/<>\\|\\x00-\\x1F]+.*");
      bool2 = paramString.matches(".*[\\ \\.]$");
    } while ((bool1) || (bool2));
    return true;
  }
  
  public Number getLength()
  {
    return length;
  }
  
  public String getMd5()
  {
    return md5;
  }
  
  public JSONObject getOptionalMetadata()
  {
    return optionalMetadata;
  }
  
  public String getPath()
  {
    return path;
  }
  
  public Number getVersion()
  {
    return version;
  }
  
  public void setData(byte[] paramArrayOfByte)
  {
    data = paramArrayOfByte;
  }
  
  public void setLength(Number paramNumber)
  {
    length = paramNumber;
  }
  
  public void setMd5(String paramString)
  {
    md5 = paramString;
  }
  
  public void setVersion(Number paramNumber)
  {
    version = paramNumber;
  }
  
  public void updateFromCollectionDictionary(JSONObject paramJSONObject)
    throws ParsingDataException
  {
    JSONObject localJSONObject = new JSONObject();
    Iterator localIterator = paramJSONObject.keys();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      if (str.equals("name")) {
        name = ((String)paramJSONObject.opt(str));
      } else if (str.equals("type")) {
        type = ((String)paramJSONObject.opt(str));
      } else if (str.equals("etag")) {
        etag = ((String)paramJSONObject.opt(str));
      } else if (str.equals("size")) {
        length = ((Number)paramJSONObject.opt(str));
      } else if (str.equals("md5")) {
        md5 = ((String)paramJSONObject.opt(str));
      } else if (str.equals("id")) {
        internalID = ((String)paramJSONObject.opt(str));
      } else if (str.equals("created")) {
        created = ((String)paramJSONObject.opt(str));
      } else if (str.equals("modified")) {
        modified = ((String)paramJSONObject.opt(str));
      } else if (str.equals("ordinal")) {
        ordinal = paramJSONObject.optInt(str);
      } else {
        try
        {
          localJSONObject.put(str, paramJSONObject.opt(str));
        }
        catch (JSONException localJSONException)
        {
          localJSONException.printStackTrace();
        }
      }
    }
    if (localJSONObject.opt("page") != null) {}
    try
    {
      localJSONObject.put("page", 1);
      if (localJSONObject.opt("height") != null) {}
    }
    catch (JSONException paramJSONObject)
    {
      try
      {
        localJSONObject.put("height", 0);
        if (localJSONObject.opt("width") != null) {}
      }
      catch (JSONException paramJSONObject)
      {
        try
        {
          for (;;)
          {
            localJSONObject.put("width", 0);
            optionalMetadata = localJSONObject;
            if (name != null) {
              break;
            }
            throw new ParsingDataException(AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorUnexpectedResponse, "Item doesn't have a name."));
            paramJSONObject = paramJSONObject;
            paramJSONObject.printStackTrace();
          }
          paramJSONObject = paramJSONObject;
          paramJSONObject.printStackTrace();
        }
        catch (JSONException paramJSONObject)
        {
          for (;;)
          {
            paramJSONObject.printStackTrace();
          }
          if (type == null) {
            throw new ParsingDataException(AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorUnexpectedResponse, "Item doesn't have a type."));
          }
          if (modified == null) {
            throw new ParsingDataException(AdobeStorageErrorUtils.createStorageError(AdobeAssetErrorCode.AdobeAssetErrorUnexpectedResponse, "Item doesn't have a modified time."));
          }
        }
      }
    }
  }
}
