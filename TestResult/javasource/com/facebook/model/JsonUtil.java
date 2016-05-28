package com.facebook.model;

import android.annotation.SuppressLint;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

class JsonUtil
{
  JsonUtil() {}
  
  static void jsonObjectClear(JSONObject paramJSONObject)
  {
    paramJSONObject = paramJSONObject.keys();
    for (;;)
    {
      if (!paramJSONObject.hasNext()) {
        return;
      }
      paramJSONObject.next();
      paramJSONObject.remove();
    }
  }
  
  static boolean jsonObjectContainsValue(JSONObject paramJSONObject, Object paramObject)
  {
    Iterator localIterator = paramJSONObject.keys();
    Object localObject;
    do
    {
      if (!localIterator.hasNext()) {
        return false;
      }
      localObject = paramJSONObject.opt((String)localIterator.next());
    } while ((localObject == null) || (!localObject.equals(paramObject)));
    return true;
  }
  
  static Set<Map.Entry<String, Object>> jsonObjectEntrySet(JSONObject paramJSONObject)
  {
    HashSet localHashSet = new HashSet();
    Iterator localIterator = paramJSONObject.keys();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return localHashSet;
      }
      String str = (String)localIterator.next();
      localHashSet.add(new JSONObjectEntry(str, paramJSONObject.opt(str)));
    }
  }
  
  static Set<String> jsonObjectKeySet(JSONObject paramJSONObject)
  {
    HashSet localHashSet = new HashSet();
    paramJSONObject = paramJSONObject.keys();
    for (;;)
    {
      if (!paramJSONObject.hasNext()) {
        return localHashSet;
      }
      localHashSet.add((String)paramJSONObject.next());
    }
  }
  
  static void jsonObjectPutAll(JSONObject paramJSONObject, Map<String, Object> paramMap)
  {
    paramMap = paramMap.entrySet().iterator();
    for (;;)
    {
      if (!paramMap.hasNext()) {
        return;
      }
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      try
      {
        paramJSONObject.putOpt((String)localEntry.getKey(), localEntry.getValue());
      }
      catch (JSONException paramJSONObject)
      {
        throw new IllegalArgumentException(paramJSONObject);
      }
    }
  }
  
  static Collection<Object> jsonObjectValues(JSONObject paramJSONObject)
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramJSONObject.keys();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return localArrayList;
      }
      localArrayList.add(paramJSONObject.opt((String)localIterator.next()));
    }
  }
  
  private static final class JSONObjectEntry
    implements Map.Entry<String, Object>
  {
    private final String key;
    private final Object value;
    
    JSONObjectEntry(String paramString, Object paramObject)
    {
      key = paramString;
      value = paramObject;
    }
    
    @SuppressLint({"FieldGetter"})
    public String getKey()
    {
      return key;
    }
    
    public Object getValue()
    {
      return value;
    }
    
    public Object setValue(Object paramObject)
    {
      throw new UnsupportedOperationException("JSONObjectEntry is immutable");
    }
  }
}
