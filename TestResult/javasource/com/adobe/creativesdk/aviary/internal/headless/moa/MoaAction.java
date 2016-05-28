package com.adobe.creativesdk.aviary.internal.headless.moa;

import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;

public class MoaAction
  implements Serializable, Cloneable
{
  private static final long serialVersionUID = 8606159496507143276L;
  protected String description;
  protected JSONArray jsonParameters;
  private final HashMap<String, Object> mOptions = new HashMap();
  protected String name;
  
  protected MoaAction(String paramString)
  {
    name = paramString;
  }
  
  private void addParam(String paramString, Object paramObject)
  {
    mOptions.put(paramString, paramObject);
  }
  
  public Object clone()
    throws CloneNotSupportedException
  {
    MoaAction localMoaAction = new MoaAction(name);
    description = description;
    if (jsonParameters != null) {}
    try
    {
      jsonParameters = new JSONArray(jsonParameters.toString());
      synchronized (mOptions)
      {
        Iterator localIterator = mOptions.entrySet().iterator();
        if (localIterator.hasNext())
        {
          localObject2 = (Map.Entry)localIterator.next();
          str = (String)((Map.Entry)localObject2).getKey();
          localObject2 = ((Map.Entry)localObject2).getValue();
          if ((localObject2 instanceof MoaParameter)) {
            localMoaAction.addParam(str, ((MoaParameter)localObject2).clone());
          }
        }
      }
    }
    catch (JSONException localJSONException)
    {
      for (;;)
      {
        Object localObject2;
        String str;
        localJSONException.printStackTrace();
        continue;
        localObject1.addParam(str, localObject2);
      }
    }
    return localObject1;
  }
  
  public Set<Map.Entry<String, Object>> entrySet()
  {
    return mOptions.entrySet();
  }
  
  public String getName()
  {
    return name;
  }
  
  public Object getValue(String paramString, Object paramObject)
  {
    if (mOptions.containsKey(paramString)) {
      paramObject = mOptions.get(paramString);
    }
    return paramObject;
  }
  
  public void setValue(String paramString, double paramDouble)
  {
    addParam(paramString, Double.valueOf(paramDouble));
  }
  
  public void setValue(String paramString, float paramFloat)
  {
    addParam(paramString, Float.valueOf(paramFloat));
  }
  
  public void setValue(String paramString, int paramInt)
  {
    addParam(paramString, Integer.valueOf(paramInt));
  }
  
  public void setValue(String paramString, MoaParameter<?> paramMoaParameter)
  {
    addParam(paramString, paramMoaParameter);
  }
  
  public void setValue(String paramString, CharSequence paramCharSequence)
  {
    addParam(paramString, paramCharSequence.toString());
  }
  
  public void setValue(String paramString1, String paramString2)
  {
    addParam(paramString1, paramString2);
  }
  
  public void setValue(String paramString, Collection<?> paramCollection)
  {
    addParam(paramString, paramCollection);
  }
  
  public void setValue(String paramString, boolean paramBoolean)
  {
    addParam(paramString, Boolean.valueOf(paramBoolean));
  }
}
