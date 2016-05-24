package com.adobe.creativesdk.foundation.internal.storage.model.util;

import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AdobeStorageCopyUtils
{
  public static JSONArray deepMutableCopyOfArray(JSONArray paramJSONArray)
  {
    Object localObject;
    if (paramJSONArray == null)
    {
      localObject = null;
      return localObject;
    }
    JSONArray localJSONArray = new JSONArray();
    int j = paramJSONArray.length();
    int i = 0;
    for (;;)
    {
      localObject = localJSONArray;
      if (i >= j) {
        break;
      }
      try
      {
        localObject = paramJSONArray.get(i);
        if (localObject.getClass().equals(JSONObject.class)) {
          localJSONArray.put(i, deepMutableCopyOfDictionary((JSONObject)localObject));
        } else if (localObject.getClass().equals(JSONArray.class)) {
          localJSONArray.put(i, deepMutableCopyOfArray((JSONArray)localObject));
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
      }
      localJSONArray.put(i, localJSONException);
      i += 1;
    }
  }
  
  public static JSONObject deepMutableCopyOfDictionary(JSONObject paramJSONObject)
  {
    Object localObject1;
    if (paramJSONObject == null)
    {
      localObject1 = null;
      return localObject1;
    }
    JSONObject localJSONObject = new JSONObject();
    Iterator localIterator = paramJSONObject.keys();
    for (;;)
    {
      localObject1 = localJSONObject;
      if (!localIterator.hasNext()) {
        break;
      }
      localObject1 = (String)localIterator.next();
      Object localObject2;
      try
      {
        localObject2 = paramJSONObject.get((String)localObject1);
        if (!localObject2.getClass().equals(JSONObject.class)) {
          break label87;
        }
        localJSONObject.put((String)localObject1, deepMutableCopyOfDictionary((JSONObject)localObject2));
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
      }
      continue;
      label87:
      if (localObject2.getClass().equals(JSONArray.class)) {
        localJSONObject.put(localJSONException, deepMutableCopyOfArray((JSONArray)localObject2));
      } else {
        localJSONObject.put(localJSONException, localObject2);
      }
    }
  }
}
