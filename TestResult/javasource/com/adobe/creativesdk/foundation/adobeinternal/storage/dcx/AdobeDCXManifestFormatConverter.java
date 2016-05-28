package com.adobe.creativesdk.foundation.adobeinternal.storage.dcx;

import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeDCXManifestFormatConverter
{
  static JSONObject DCXTypeMapperToVersion4 = new JSONObject();
  
  static boolean recursiveUpdateComponentsToVersion2(JSONObject paramJSONObject)
  {
    for (;;)
    {
      int i;
      try
      {
        JSONArray localJSONArray = paramJSONObject.optJSONArray("components");
        if (localJSONArray != null)
        {
          i = 0;
          if (i < localJSONArray.length())
          {
            JSONObject localJSONObject1 = localJSONArray.optJSONObject(i);
            if (localJSONObject1 == null) {
              break label188;
            }
            localJSONObject1 = localJSONObject1.optJSONObject("_links");
            if (localJSONObject1 == null) {
              break label188;
            }
            JSONObject localJSONObject2 = localJSONObject1.optJSONObject("latest-version");
            JSONObject localJSONObject3 = localJSONObject1.optJSONObject("self");
            if (localJSONObject2 != null)
            {
              localJSONObject1.put("stormcloud#asset", localJSONObject2);
              localJSONObject1.remove("latest-version");
            }
            if (localJSONObject3 != null)
            {
              localJSONObject1.put("stormcloud#asset-version", localJSONObject3);
              localJSONObject1.remove("self");
            }
            if ((localJSONObject2 != null) && (localJSONObject3 == null)) {
              localJSONObject1.put("stormcloud#asset-version", localJSONObject2);
            } else if ((localJSONObject2 == null) && (localJSONObject3 != null)) {
              localJSONObject1.put("stormcloud#asset", localJSONObject3);
            }
          }
        }
      }
      catch (JSONException localJSONException)
      {
        paramJSONObject = paramJSONObject.optJSONArray("children");
        if (paramJSONObject != null)
        {
          i = 0;
          if (i < paramJSONObject.length())
          {
            if (!recursiveUpdateComponentsToVersion2(paramJSONObject.optJSONObject(i))) {
              return false;
            }
            i += 1;
            continue;
          }
        }
        return true;
      }
      label188:
      i += 1;
    }
  }
  
  static boolean recursiveUpdateComponentsToVersion3(JSONObject paramJSONObject)
  {
    JSONArray localJSONArray = paramJSONObject.optJSONArray("components");
    int i;
    if (localJSONArray != null) {
      i = 0;
    }
    for (;;)
    {
      JSONObject localJSONObject1;
      JSONObject localJSONObject2;
      String str;
      if (i < localJSONArray.length())
      {
        localJSONObject1 = localJSONArray.optJSONObject(i);
        if (localJSONObject1 != null)
        {
          localJSONObject2 = localJSONObject1.optJSONObject("_links");
          str = localJSONObject1.optString("etag");
          if ((localJSONObject2 != null) && (str != null))
          {
            localJSONObject2 = localJSONObject2.optJSONObject("stormcloud#asset");
            if (localJSONObject2 == null) {}
          }
        }
      }
      try
      {
        localJSONObject2.put("etag", str);
        localJSONObject1.remove("etag");
        i += 1;
        continue;
        paramJSONObject = paramJSONObject.optJSONArray("children");
        if (paramJSONObject != null)
        {
          i = 0;
          while (i < paramJSONObject.length())
          {
            if (!recursiveUpdateComponentsToVersion3(paramJSONObject.optJSONObject(i))) {
              return false;
            }
            i += 1;
          }
        }
        return true;
      }
      catch (JSONException localJSONException)
      {
        for (;;) {}
      }
    }
  }
  
  static boolean recursiveUpdateComponentsToVersion4(JSONObject paramJSONObject)
  {
    if (paramJSONObject == null) {}
    for (;;)
    {
      return true;
      JSONArray localJSONArray = paramJSONObject.optJSONArray("components");
      int i;
      if (localJSONArray != null)
      {
        i = 0;
        while (i < localJSONArray.length())
        {
          JSONObject localJSONObject1 = localJSONArray.optJSONObject(i);
          if (localJSONObject1 != null)
          {
            JSONObject localJSONObject2 = localJSONObject1.optJSONObject("_links");
            if (localJSONObject2 != null)
            {
              if (localJSONObject2.opt("stormcloud#asset") != null) {
                localJSONObject2.remove("stormcloud#asset");
              }
              if (localJSONObject2.opt("stormcloud#asset-version") != null) {
                localJSONObject2.remove("stormcloud#asset-version");
              }
              if (localJSONObject2.length() == 0) {
                localJSONObject1.remove("_links");
              }
            }
          }
          i += 1;
        }
      }
      paramJSONObject = paramJSONObject.optJSONArray("children");
      if (paramJSONObject != null)
      {
        i = 0;
        while (i < paramJSONObject.length())
        {
          if (!recursiveUpdateComponentsToVersion4(paramJSONObject.optJSONObject(i))) {
            return false;
          }
          i += 1;
        }
      }
    }
  }
  
  static JSONObject recursiveUpdateComponentsToVersion5(JSONObject paramJSONObject1, JSONObject paramJSONObject2)
  {
    if (paramJSONObject1 == null) {
      return paramJSONObject2;
    }
    JSONArray localJSONArray = paramJSONObject1.optJSONArray("components");
    int i;
    if (localJSONArray != null) {
      i = 0;
    }
    for (;;)
    {
      JSONObject localJSONObject;
      String str1;
      String str2;
      if (i < localJSONArray.length())
      {
        localJSONObject = localJSONArray.optJSONObject(i);
        if (localJSONObject != null)
        {
          str1 = localJSONObject.optString("localStorageAssetId");
          if (str1 != null) {
            str2 = localJSONObject.optString("id");
          }
        }
      }
      try
      {
        paramJSONObject2.put(str2, str1);
        localJSONObject.remove("localStorageAssetId");
        i += 1;
        continue;
        localJSONArray = paramJSONObject1.optJSONArray("children");
        paramJSONObject1 = paramJSONObject2;
        if (localJSONArray != null)
        {
          i = 0;
          for (;;)
          {
            paramJSONObject1 = paramJSONObject2;
            if (i >= localJSONArray.length()) {
              break;
            }
            paramJSONObject2 = recursiveUpdateComponentsToVersion5(localJSONArray.optJSONObject(i), paramJSONObject2);
            if (paramJSONObject2 == null) {
              return null;
            }
            i += 1;
          }
        }
        return paramJSONObject1;
      }
      catch (JSONException localJSONException)
      {
        for (;;) {}
      }
    }
  }
  
  static boolean updateLocalDataInManifestDictionaryToVersion1(JSONObject paramJSONObject)
  {
    try
    {
      Object localObject2 = paramJSONObject.optJSONObject("local");
      Object localObject1 = localObject2;
      if (localObject2 == null)
      {
        localObject1 = new JSONObject();
        paramJSONObject.put("local", localObject1);
      }
      if (((JSONObject)localObject1).opt("manifestEtag") == null)
      {
        localObject2 = paramJSONObject.optString("etag", null);
        if (localObject2 != null)
        {
          ((JSONObject)localObject1).put("manifestEtag", localObject2);
          paramJSONObject.remove("etag");
        }
      }
      ((JSONObject)localObject1).put("version", 1);
      return true;
    }
    catch (JSONException paramJSONObject) {}
    return false;
  }
  
  public static boolean updateManifestDictionary(JSONObject paramJSONObject, long paramLong)
  {
    if ((paramLong < 1L) && (!updateManifestDictionaryToVersion1(paramJSONObject))) {}
    for (;;)
    {
      return false;
      if (((paramLong >= 2L) || (updateManifestDictionaryToVersion2(paramJSONObject))) && ((paramLong >= 3L) || (updateManifestDictionaryToVersion3(paramJSONObject))) && ((paramLong >= 4L) || (updateManifestDictionaryToVersion4(paramJSONObject))) && ((paramLong >= 5L) || (updateManifestDictionaryToVersion5(paramJSONObject))))
      {
        if (paramJSONObject.optJSONObject("local") != null) {}
        for (int i = paramJSONObject.optJSONObject("local").optInt("version", 0); (i >= 1) || (updateLocalDataInManifestDictionaryToVersion1(paramJSONObject)); i = 0) {
          return true;
        }
      }
    }
  }
  
  static boolean updateManifestDictionaryToVersion1(JSONObject paramJSONObject)
  {
    JSONObject localJSONObject1 = paramJSONObject.optJSONObject("_links");
    if (localJSONObject1 == null) {
      return false;
    }
    for (;;)
    {
      int i;
      try
      {
        Object localObject1 = localJSONObject1.optJSONObject("self").optString("etag");
        if (localObject1 != null)
        {
          paramJSONObject.put("etag", localObject1);
          localJSONObject1.optJSONObject("self").remove("etag");
        }
        localObject1 = localJSONObject1.optJSONArray("components");
        if (localObject1 != null)
        {
          i = 0;
          if (i < ((JSONArray)localObject1).length())
          {
            JSONObject localJSONObject2 = ((JSONArray)localObject1).optJSONObject(i);
            if (localJSONObject2 != null)
            {
              if (localJSONObject2.opt("id") == null) {
                localJSONObject2.put("id", AdobeStorageUtils.generateUuid());
              }
              Object localObject2 = localJSONObject2.optString("href");
              JSONObject localJSONObject3 = new JSONObject();
              localJSONObject3.put("href", localObject2);
              JSONObject localJSONObject4 = new JSONObject();
              localJSONObject4.put("href", localObject2);
              localObject2 = new JSONObject();
              ((JSONObject)localObject2).put("self", localJSONObject3);
              ((JSONObject)localObject2).put("latest-version", localJSONObject4);
              localJSONObject2.put("_links", localObject2);
              localJSONObject2.remove("href");
            }
          }
          else
          {
            paramJSONObject.put("components", localObject1);
            localJSONObject1.remove("components");
          }
        }
        else
        {
          localObject1 = localJSONObject1.optJSONObject("container");
          if (localObject1 != null)
          {
            localJSONObject1.put("dma#container", localObject1);
            localJSONObject1.remove("container");
          }
          paramJSONObject.put("manifest-format-version", 1);
          return true;
        }
      }
      catch (JSONException paramJSONObject)
      {
        return false;
      }
      i += 1;
    }
  }
  
  static boolean updateManifestDictionaryToVersion2(JSONObject paramJSONObject)
  {
    try
    {
      JSONObject localJSONObject1 = paramJSONObject.optJSONObject("_links");
      if (localJSONObject1 != null)
      {
        JSONObject localJSONObject2 = localJSONObject1.optJSONObject("dma#container");
        if (localJSONObject2 != null)
        {
          localJSONObject2.put("service", "stormcloud");
          localJSONObject1.put("dma#document", localJSONObject2);
          localJSONObject1.remove("dma#container");
        }
        localJSONObject2 = localJSONObject1.optJSONObject("self");
        if (localJSONObject2 != null)
        {
          localJSONObject1.put("stormcloud#asset", localJSONObject2);
          localJSONObject1.remove("self");
        }
      }
      if (!recursiveUpdateComponentsToVersion2(paramJSONObject)) {
        return false;
      }
      paramJSONObject.put("manifest-format-version", 2);
      return true;
    }
    catch (JSONException paramJSONObject) {}
    return false;
  }
  
  static boolean updateManifestDictionaryToVersion3(JSONObject paramJSONObject)
  {
    JSONObject localJSONObject = paramJSONObject.optJSONObject("_links");
    String str = paramJSONObject.optString("etag");
    if ((localJSONObject != null) && (str != null))
    {
      localJSONObject = localJSONObject.optJSONObject("stormcloud#asset");
      if (localJSONObject == null) {}
    }
    try
    {
      localJSONObject.put("etag", str);
      paramJSONObject.remove("etag");
      if (!recursiveUpdateComponentsToVersion3(paramJSONObject)) {
        return false;
      }
      try
      {
        paramJSONObject.put("manifest-format-version", 3);
        return true;
      }
      catch (JSONException paramJSONObject)
      {
        for (;;) {}
      }
    }
    catch (JSONException localJSONException)
    {
      for (;;) {}
    }
  }
  
  static boolean updateManifestDictionaryToVersion4(JSONObject paramJSONObject)
  {
    try
    {
      Object localObject = paramJSONObject.optJSONObject("_links");
      if (localObject != null)
      {
        if (((JSONObject)localObject).opt("stormcloud#asset") != null) {
          ((JSONObject)localObject).remove("stormcloud#asset");
        }
        if (((JSONObject)localObject).opt("dma#document") != null) {
          ((JSONObject)localObject).remove("dma#document");
        }
        if (((JSONObject)localObject).length() == 0) {
          paramJSONObject.remove("_links");
        }
      }
      if (!recursiveUpdateComponentsToVersion4(paramJSONObject)) {
        return false;
      }
      if (DCXTypeMapperToVersion4.length() == 0)
      {
        DCXTypeMapperToVersion4.put("application/vnd.adobe.html+cd", "application/vnd.adobe.html+dcx");
        DCXTypeMapperToVersion4.put("application/vnd.adobe.violet.sketchBook+cd", "application/vnd.adobe.sketch.project+dcx");
        DCXTypeMapperToVersion4.put("application/vnd.adobe.test+cd", "application/vnd.adobe.test+dcx");
      }
      localObject = DCXTypeMapperToVersion4.optString(paramJSONObject.optString("type"));
      if (localObject != null) {
        paramJSONObject.put("type", localObject);
      }
      paramJSONObject.put("manifest-format-version", 4);
      return true;
    }
    catch (JSONException paramJSONObject) {}
    return false;
  }
  
  static boolean updateManifestDictionaryToVersion5(JSONObject paramJSONObject)
  {
    JSONObject localJSONObject1 = recursiveUpdateComponentsToVersion5(paramJSONObject, new JSONObject());
    if (localJSONObject1 == null) {
      return false;
    }
    try
    {
      if (localJSONObject1.length() > 0)
      {
        JSONObject localJSONObject2 = new JSONObject();
        localJSONObject2.put("copyOnWrite#storageIds", localJSONObject1);
        paramJSONObject.put("local", localJSONObject2);
      }
      paramJSONObject.put("manifest-format-version", 5);
      return true;
    }
    catch (JSONException paramJSONObject) {}
    return false;
  }
}
