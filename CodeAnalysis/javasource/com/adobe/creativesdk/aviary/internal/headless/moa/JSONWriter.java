package com.adobe.creativesdk.aviary.internal.headless.moa;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public final class JSONWriter
{
  public static String encode(MoaActionList paramMoaActionList, MoaMetadata paramMoaMetadata)
    throws JSONException
  {
    JSONObject localJSONObject1 = new JSONObject();
    JSONArray localJSONArray1 = new JSONArray();
    for (;;)
    {
      JSONObject localJSONObject2;
      Map.Entry localEntry;
      try
      {
        Iterator localIterator = paramMoaActionList.iterator();
        if (!localIterator.hasNext()) {
          break;
        }
        Object localObject = (MoaAction)localIterator.next();
        localJSONObject2 = new JSONObject();
        localJSONObject2.accumulate("action", ((MoaAction)localObject).getName());
        localObject = ((MoaAction)localObject).entrySet().iterator();
        if (!((Iterator)localObject).hasNext()) {
          break label239;
        }
        localEntry = (Map.Entry)((Iterator)localObject).next();
        if ((localEntry.getValue() instanceof MoaParameter))
        {
          localJSONObject2.accumulate((String)localEntry.getKey(), ((MoaParameter)localEntry.getValue()).encode());
          continue;
        }
        if (!(localEntry.getValue() instanceof Collection)) {
          break label213;
        }
      }
      finally {}
      JSONArray localJSONArray2 = new JSONArray();
      encodeCollection(localJSONArray2, (Collection)localEntry.getValue());
      localJSONObject2.accumulate((String)localEntry.getKey(), localJSONArray2);
      continue;
      label213:
      localJSONObject2.accumulate((String)localEntry.getKey(), localEntry.getValue());
      continue;
      label239:
      localJSONArray1.put(localJSONObject2);
    }
    localJSONObject1.put("metadata", paramMoaMetadata.encode());
    localJSONObject1.put("actionlist", localJSONArray1);
    return localJSONObject1.toString();
  }
  
  static void encodeCollection(JSONArray paramJSONArray, Collection paramCollection)
  {
    for (;;)
    {
      Object localObject;
      try
      {
        Iterator localIterator = paramCollection.iterator();
        if (!localIterator.hasNext()) {
          break;
        }
        localObject = localIterator.next();
        if ((localObject instanceof MoaParameter))
        {
          paramJSONArray.put(((MoaParameter)localObject).encode());
          continue;
        }
        if (!(localObject instanceof Collection)) {
          break label87;
        }
      }
      finally {}
      JSONArray localJSONArray = new JSONArray();
      encodeCollection(localJSONArray, (Collection)localObject);
      paramJSONArray.put(localJSONArray);
      continue;
      label87:
      paramJSONArray.put(localObject);
    }
  }
}
