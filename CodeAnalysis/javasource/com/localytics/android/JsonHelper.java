package com.localytics.android;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class JsonHelper
{
  public static Object fromJson(Object paramObject)
    throws JSONException
  {
    Object localObject;
    if (paramObject == JSONObject.NULL) {
      localObject = null;
    }
    do
    {
      return localObject;
      if ((paramObject instanceof JSONObject)) {
        return toMap((JSONObject)paramObject);
      }
      localObject = paramObject;
    } while (!(paramObject instanceof JSONArray));
    return toList((JSONArray)paramObject);
  }
  
  public static int getSafeIntegerFromMap(Map<String, Object> paramMap, String paramString)
  {
    int i = 0;
    paramMap = paramMap.get(paramString);
    if (paramMap == null) {
      return 0;
    }
    if ((paramMap instanceof Integer)) {
      i = ((Integer)paramMap).intValue();
    }
    for (;;)
    {
      return i;
      if ((paramMap instanceof String)) {
        i = Integer.parseInt((String)paramMap);
      }
    }
  }
  
  public static List<Object> getSafeListFromMap(Map<String, Object> paramMap, String paramString)
  {
    Object localObject = null;
    paramString = paramMap.get(paramString);
    if (paramString == null) {
      return null;
    }
    paramMap = localObject;
    if ((paramString instanceof List)) {
      paramMap = (List)paramString;
    }
    return paramMap;
  }
  
  public static Map<String, Object> getSafeMapFromMap(Map<String, Object> paramMap, String paramString)
  {
    Object localObject = null;
    paramString = paramMap.get(paramString);
    if (paramString == null) {
      return null;
    }
    paramMap = localObject;
    if ((paramString instanceof Map)) {
      paramMap = (Map)paramString;
    }
    return paramMap;
  }
  
  public static String getSafeStringFromMap(Map<String, Object> paramMap, String paramString)
  {
    Object localObject = null;
    paramString = paramMap.get(paramString);
    if (paramString == null) {
      return null;
    }
    if ((paramString instanceof Integer)) {
      paramMap = Integer.toString(((Integer)paramString).intValue());
    }
    for (;;)
    {
      return paramMap;
      paramMap = localObject;
      if ((paramString instanceof String)) {
        paramMap = (String)paramString;
      }
    }
  }
  
  public static String getSafeStringFromValue(Object paramObject)
  {
    String str = null;
    if (paramObject == null) {
      return null;
    }
    if ((paramObject instanceof Integer)) {
      str = Integer.toString(((Integer)paramObject).intValue());
    }
    for (;;)
    {
      return str;
      if ((paramObject instanceof String)) {
        str = (String)paramObject;
      }
    }
  }
  
  public static Object toJSON(Object paramObject)
    throws JSONException
  {
    Object localObject1;
    Object localObject2;
    if ((paramObject instanceof Map))
    {
      localObject1 = new JSONObject();
      localObject2 = (Map)paramObject;
      Iterator localIterator = ((Map)localObject2).keySet().iterator();
      for (;;)
      {
        paramObject = localObject1;
        if (!localIterator.hasNext()) {
          break;
        }
        paramObject = localIterator.next();
        ((JSONObject)localObject1).put(paramObject.toString(), toJSON(((Map)localObject2).get(paramObject)));
      }
    }
    if ((paramObject instanceof Iterable))
    {
      localObject1 = new JSONArray();
      localObject2 = ((Iterable)paramObject).iterator();
      for (;;)
      {
        paramObject = localObject1;
        if (!((Iterator)localObject2).hasNext()) {
          break;
        }
        ((JSONArray)localObject1).put(((Iterator)localObject2).next());
      }
    }
    return paramObject;
  }
  
  public static List toList(JSONArray paramJSONArray)
    throws JSONException
  {
    ArrayList localArrayList = new ArrayList();
    int i = 0;
    while (i < paramJSONArray.length())
    {
      localArrayList.add(fromJson(paramJSONArray.get(i)));
      i += 1;
    }
    return localArrayList;
  }
  
  public static Map<String, Object> toMap(JSONObject paramJSONObject)
    throws JSONException
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramJSONObject.keys();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, fromJson(paramJSONObject.get(str)));
    }
    return localHashMap;
  }
}
