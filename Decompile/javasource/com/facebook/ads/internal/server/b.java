package com.facebook.ads.internal.server;

import com.facebook.ads.internal.dto.a;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class b
{
  private static b a = new b();
  
  public b() {}
  
  public static b a()
  {
    try
    {
      b localB = a;
      return localB;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private d a(JSONObject paramJSONObject)
  {
    int i = 0;
    Object localObject2 = paramJSONObject.getJSONArray("placements").getJSONObject(0);
    Object localObject1 = com.facebook.ads.internal.dto.d.a(((JSONObject)localObject2).getJSONObject("definition"));
    paramJSONObject = new com.facebook.ads.internal.dto.c((com.facebook.ads.internal.dto.d)localObject1);
    localObject1 = ((com.facebook.ads.internal.dto.d)localObject1).a();
    if (((JSONObject)localObject2).has("ads"))
    {
      localObject2 = ((JSONObject)localObject2).getJSONArray("ads");
      while (i < ((JSONArray)localObject2).length())
      {
        a localA = new a((AdPlacementType)localObject1);
        Object localObject3 = ((JSONArray)localObject2).getJSONObject(i);
        localA.a(((JSONObject)localObject3).getString("adapter"));
        JSONObject localJSONObject = ((JSONObject)localObject3).getJSONObject("data");
        localObject3 = ((JSONObject)localObject3).optJSONArray("trackers");
        if (localObject3 != null) {
          localJSONObject.put("trackers", localObject3);
        }
        localA.a(localJSONObject);
        paramJSONObject.a(localA);
        i += 1;
      }
    }
    return new d(paramJSONObject);
  }
  
  private e b(JSONObject paramJSONObject)
  {
    try
    {
      Object localObject = com.facebook.ads.internal.dto.d.a(paramJSONObject.getJSONArray("placements").getJSONObject(0).getJSONObject("definition"));
      localObject = new e(paramJSONObject.optString("message", ""), new com.facebook.ads.internal.dto.c((com.facebook.ads.internal.dto.d)localObject));
      return localObject;
    }
    catch (JSONException localJSONException) {}
    return c(paramJSONObject);
  }
  
  private e c(JSONObject paramJSONObject)
  {
    return new e(paramJSONObject.optString("message", ""), null);
  }
  
  public c a(String paramString)
  {
    paramString = new JSONObject(paramString);
    String str = paramString.optString("type");
    int i = -1;
    switch (str.hashCode())
    {
    }
    for (;;)
    {
      switch (i)
      {
      default: 
        paramString = paramString.optJSONObject("error");
        if (paramString == null) {
          break label129;
        }
        return c(paramString);
        if (str.equals("ads"))
        {
          i = 0;
          continue;
          if (str.equals("error")) {
            i = 1;
          }
        }
        break;
      }
    }
    return a(paramString);
    return b(paramString);
    label129:
    return new c(c.a.a, null);
  }
}
