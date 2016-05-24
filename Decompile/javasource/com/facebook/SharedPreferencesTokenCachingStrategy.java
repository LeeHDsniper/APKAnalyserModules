package com.facebook;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import com.facebook.internal.Logger;
import com.facebook.internal.Utility;
import com.facebook.internal.Validate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SharedPreferencesTokenCachingStrategy
  extends TokenCachingStrategy
{
  private static final String TAG = SharedPreferencesTokenCachingStrategy.class.getSimpleName();
  private SharedPreferences cache;
  private String cacheKey;
  
  public SharedPreferencesTokenCachingStrategy(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public SharedPreferencesTokenCachingStrategy(Context paramContext, String paramString)
  {
    Validate.notNull(paramContext, "context");
    String str = paramString;
    if (Utility.isNullOrEmpty(paramString)) {
      str = "com.facebook.SharedPreferencesTokenCachingStrategy.DEFAULT_KEY";
    }
    cacheKey = str;
    paramString = paramContext.getApplicationContext();
    if (paramString != null) {
      paramContext = paramString;
    }
    cache = paramContext.getSharedPreferences(cacheKey, 0);
  }
  
  private void deserializeKey(String paramString, Bundle paramBundle)
    throws JSONException
  {
    Object localObject1 = new JSONObject(cache.getString(paramString, "{}"));
    Object localObject2 = ((JSONObject)localObject1).getString("valueType");
    if (((String)localObject2).equals("bool")) {
      paramBundle.putBoolean(paramString, ((JSONObject)localObject1).getBoolean("value"));
    }
    do
    {
      int i;
      do
      {
        return;
        if (((String)localObject2).equals("bool[]"))
        {
          localObject1 = ((JSONObject)localObject1).getJSONArray("value");
          localObject2 = new boolean[((JSONArray)localObject1).length()];
          i = 0;
          for (;;)
          {
            if (i >= localObject2.length)
            {
              paramBundle.putBooleanArray(paramString, (boolean[])localObject2);
              return;
            }
            localObject2[i] = ((JSONArray)localObject1).getBoolean(i);
            i += 1;
          }
        }
        if (((String)localObject2).equals("byte"))
        {
          paramBundle.putByte(paramString, (byte)((JSONObject)localObject1).getInt("value"));
          return;
        }
        if (((String)localObject2).equals("byte[]"))
        {
          localObject1 = ((JSONObject)localObject1).getJSONArray("value");
          localObject2 = new byte[((JSONArray)localObject1).length()];
          i = 0;
          for (;;)
          {
            if (i >= localObject2.length)
            {
              paramBundle.putByteArray(paramString, (byte[])localObject2);
              return;
            }
            localObject2[i] = ((byte)((JSONArray)localObject1).getInt(i));
            i += 1;
          }
        }
        if (((String)localObject2).equals("short"))
        {
          paramBundle.putShort(paramString, (short)((JSONObject)localObject1).getInt("value"));
          return;
        }
        if (((String)localObject2).equals("short[]"))
        {
          localObject1 = ((JSONObject)localObject1).getJSONArray("value");
          localObject2 = new short[((JSONArray)localObject1).length()];
          i = 0;
          for (;;)
          {
            if (i >= localObject2.length)
            {
              paramBundle.putShortArray(paramString, (short[])localObject2);
              return;
            }
            localObject2[i] = ((short)((JSONArray)localObject1).getInt(i));
            i += 1;
          }
        }
        if (((String)localObject2).equals("int"))
        {
          paramBundle.putInt(paramString, ((JSONObject)localObject1).getInt("value"));
          return;
        }
        if (((String)localObject2).equals("int[]"))
        {
          localObject1 = ((JSONObject)localObject1).getJSONArray("value");
          localObject2 = new int[((JSONArray)localObject1).length()];
          i = 0;
          for (;;)
          {
            if (i >= localObject2.length)
            {
              paramBundle.putIntArray(paramString, (int[])localObject2);
              return;
            }
            localObject2[i] = ((JSONArray)localObject1).getInt(i);
            i += 1;
          }
        }
        if (((String)localObject2).equals("long"))
        {
          paramBundle.putLong(paramString, ((JSONObject)localObject1).getLong("value"));
          return;
        }
        if (((String)localObject2).equals("long[]"))
        {
          localObject1 = ((JSONObject)localObject1).getJSONArray("value");
          localObject2 = new long[((JSONArray)localObject1).length()];
          i = 0;
          for (;;)
          {
            if (i >= localObject2.length)
            {
              paramBundle.putLongArray(paramString, (long[])localObject2);
              return;
            }
            localObject2[i] = ((JSONArray)localObject1).getLong(i);
            i += 1;
          }
        }
        if (((String)localObject2).equals("float"))
        {
          paramBundle.putFloat(paramString, (float)((JSONObject)localObject1).getDouble("value"));
          return;
        }
        if (((String)localObject2).equals("float[]"))
        {
          localObject1 = ((JSONObject)localObject1).getJSONArray("value");
          localObject2 = new float[((JSONArray)localObject1).length()];
          i = 0;
          for (;;)
          {
            if (i >= localObject2.length)
            {
              paramBundle.putFloatArray(paramString, (float[])localObject2);
              return;
            }
            localObject2[i] = ((float)((JSONArray)localObject1).getDouble(i));
            i += 1;
          }
        }
        if (((String)localObject2).equals("double"))
        {
          paramBundle.putDouble(paramString, ((JSONObject)localObject1).getDouble("value"));
          return;
        }
        if (((String)localObject2).equals("double[]"))
        {
          localObject1 = ((JSONObject)localObject1).getJSONArray("value");
          localObject2 = new double[((JSONArray)localObject1).length()];
          i = 0;
          for (;;)
          {
            if (i >= localObject2.length)
            {
              paramBundle.putDoubleArray(paramString, (double[])localObject2);
              return;
            }
            localObject2[i] = ((JSONArray)localObject1).getDouble(i);
            i += 1;
          }
        }
        if (!((String)localObject2).equals("char")) {
          break;
        }
        localObject1 = ((JSONObject)localObject1).getString("value");
      } while ((localObject1 == null) || (((String)localObject1).length() != 1));
      paramBundle.putChar(paramString, ((String)localObject1).charAt(0));
      return;
      Object localObject3;
      if (((String)localObject2).equals("char[]"))
      {
        localObject1 = ((JSONObject)localObject1).getJSONArray("value");
        localObject2 = new char[((JSONArray)localObject1).length()];
        i = 0;
        for (;;)
        {
          if (i >= localObject2.length)
          {
            paramBundle.putCharArray(paramString, (char[])localObject2);
            return;
          }
          localObject3 = ((JSONArray)localObject1).getString(i);
          if ((localObject3 != null) && (((String)localObject3).length() == 1)) {
            localObject2[i] = ((String)localObject3).charAt(0);
          }
          i += 1;
        }
      }
      if (((String)localObject2).equals("string"))
      {
        paramBundle.putString(paramString, ((JSONObject)localObject1).getString("value"));
        return;
      }
      if (((String)localObject2).equals("stringList"))
      {
        localObject2 = ((JSONObject)localObject1).getJSONArray("value");
        int j = ((JSONArray)localObject2).length();
        localObject3 = new ArrayList(j);
        i = 0;
        if (i >= j)
        {
          paramBundle.putStringArrayList(paramString, (ArrayList)localObject3);
          return;
        }
        localObject1 = ((JSONArray)localObject2).get(i);
        if (localObject1 == JSONObject.NULL) {}
        for (localObject1 = null;; localObject1 = (String)localObject1)
        {
          ((ArrayList)localObject3).add(i, localObject1);
          i += 1;
          break;
        }
      }
    } while (!((String)localObject2).equals("enum"));
    try
    {
      paramBundle.putSerializable(paramString, Enum.valueOf(Class.forName(((JSONObject)localObject1).getString("enumType")), ((JSONObject)localObject1).getString("value")));
      return;
    }
    catch (ClassNotFoundException paramString) {}catch (IllegalArgumentException paramString) {}
  }
  
  private void serializeKey(String paramString, Bundle paramBundle, SharedPreferences.Editor paramEditor)
    throws JSONException
  {
    int j = 0;
    int k = 0;
    int m = 0;
    int n = 0;
    int i1 = 0;
    int i2 = 0;
    int i3 = 0;
    int i = 0;
    Object localObject2 = paramBundle.get(paramString);
    if (localObject2 == null) {}
    for (;;)
    {
      return;
      paramBundle = null;
      Object localObject1 = null;
      JSONObject localJSONObject = new JSONObject();
      if ((localObject2 instanceof Byte))
      {
        paramBundle = "byte";
        localJSONObject.put("value", ((Byte)localObject2).intValue());
      }
      while (paramBundle != null)
      {
        localJSONObject.put("valueType", paramBundle);
        if (localObject1 != null) {
          localJSONObject.putOpt("value", localObject1);
        }
        paramEditor.putString(paramString, localJSONObject.toString());
        return;
        if ((localObject2 instanceof Short))
        {
          paramBundle = "short";
          localJSONObject.put("value", ((Short)localObject2).intValue());
        }
        else if ((localObject2 instanceof Integer))
        {
          paramBundle = "int";
          localJSONObject.put("value", ((Integer)localObject2).intValue());
        }
        else if ((localObject2 instanceof Long))
        {
          paramBundle = "long";
          localJSONObject.put("value", ((Long)localObject2).longValue());
        }
        else if ((localObject2 instanceof Float))
        {
          paramBundle = "float";
          localJSONObject.put("value", ((Float)localObject2).doubleValue());
        }
        else if ((localObject2 instanceof Double))
        {
          paramBundle = "double";
          localJSONObject.put("value", ((Double)localObject2).doubleValue());
        }
        else if ((localObject2 instanceof Boolean))
        {
          paramBundle = "bool";
          localJSONObject.put("value", ((Boolean)localObject2).booleanValue());
        }
        else if ((localObject2 instanceof Character))
        {
          paramBundle = "char";
          localJSONObject.put("value", localObject2.toString());
        }
        else if ((localObject2 instanceof String))
        {
          paramBundle = "string";
          localJSONObject.put("value", (String)localObject2);
        }
        else if ((localObject2 instanceof Enum))
        {
          paramBundle = "enum";
          localJSONObject.put("value", localObject2.toString());
          localJSONObject.put("enumType", localObject2.getClass().getName());
        }
        else
        {
          JSONArray localJSONArray = new JSONArray();
          String str;
          if ((localObject2 instanceof byte[]))
          {
            str = "byte[]";
            localObject2 = (byte[])localObject2;
            j = localObject2.length;
            for (;;)
            {
              localObject1 = localJSONArray;
              paramBundle = str;
              if (i >= j) {
                break;
              }
              localJSONArray.put(localObject2[i]);
              i += 1;
            }
          }
          if ((localObject2 instanceof short[]))
          {
            str = "short[]";
            localObject2 = (short[])localObject2;
            k = localObject2.length;
            i = j;
            for (;;)
            {
              localObject1 = localJSONArray;
              paramBundle = str;
              if (i >= k) {
                break;
              }
              localJSONArray.put(localObject2[i]);
              i += 1;
            }
          }
          if ((localObject2 instanceof int[]))
          {
            str = "int[]";
            localObject2 = (int[])localObject2;
            j = localObject2.length;
            i = k;
            for (;;)
            {
              localObject1 = localJSONArray;
              paramBundle = str;
              if (i >= j) {
                break;
              }
              localJSONArray.put(localObject2[i]);
              i += 1;
            }
          }
          if ((localObject2 instanceof long[]))
          {
            str = "long[]";
            localObject2 = (long[])localObject2;
            j = localObject2.length;
            i = m;
            for (;;)
            {
              localObject1 = localJSONArray;
              paramBundle = str;
              if (i >= j) {
                break;
              }
              localJSONArray.put(localObject2[i]);
              i += 1;
            }
          }
          if ((localObject2 instanceof float[]))
          {
            str = "float[]";
            localObject2 = (float[])localObject2;
            j = localObject2.length;
            i = n;
            for (;;)
            {
              localObject1 = localJSONArray;
              paramBundle = str;
              if (i >= j) {
                break;
              }
              localJSONArray.put(localObject2[i]);
              i += 1;
            }
          }
          if ((localObject2 instanceof double[]))
          {
            str = "double[]";
            localObject2 = (double[])localObject2;
            j = localObject2.length;
            i = i1;
            for (;;)
            {
              localObject1 = localJSONArray;
              paramBundle = str;
              if (i >= j) {
                break;
              }
              localJSONArray.put(localObject2[i]);
              i += 1;
            }
          }
          if ((localObject2 instanceof boolean[]))
          {
            str = "bool[]";
            localObject2 = (boolean[])localObject2;
            j = localObject2.length;
            i = i2;
            for (;;)
            {
              localObject1 = localJSONArray;
              paramBundle = str;
              if (i >= j) {
                break;
              }
              localJSONArray.put(localObject2[i]);
              i += 1;
            }
          }
          if ((localObject2 instanceof char[]))
          {
            str = "char[]";
            localObject2 = (char[])localObject2;
            j = localObject2.length;
            i = i3;
            for (;;)
            {
              localObject1 = localJSONArray;
              paramBundle = str;
              if (i >= j) {
                break;
              }
              localJSONArray.put(String.valueOf(localObject2[i]));
              i += 1;
            }
          }
          if ((localObject2 instanceof List))
          {
            str = "stringList";
            localObject2 = ((List)localObject2).iterator();
            for (;;)
            {
              localObject1 = localJSONArray;
              paramBundle = str;
              if (!((Iterator)localObject2).hasNext()) {
                break;
              }
              localObject1 = (String)((Iterator)localObject2).next();
              paramBundle = (Bundle)localObject1;
              if (localObject1 == null) {
                paramBundle = JSONObject.NULL;
              }
              localJSONArray.put(paramBundle);
            }
          }
          localObject1 = null;
        }
      }
    }
  }
  
  public void clear()
  {
    cache.edit().clear().commit();
  }
  
  public Bundle load()
  {
    Bundle localBundle = new Bundle();
    Iterator localIterator = cache.getAll().keySet().iterator();
    for (;;)
    {
      if (!localIterator.hasNext()) {
        return localBundle;
      }
      String str = (String)localIterator.next();
      try
      {
        deserializeKey(str, localBundle);
      }
      catch (JSONException localJSONException)
      {
        Logger.log(LoggingBehavior.CACHE, 5, TAG, "Error reading cached value for key: '" + str + "' -- " + localJSONException);
      }
    }
    return null;
  }
  
  public void save(Bundle paramBundle)
  {
    Validate.notNull(paramBundle, "bundle");
    SharedPreferences.Editor localEditor = cache.edit();
    Iterator localIterator = paramBundle.keySet().iterator();
    for (;;)
    {
      if (!localIterator.hasNext())
      {
        if (!localEditor.commit()) {
          Logger.log(LoggingBehavior.CACHE, 5, TAG, "SharedPreferences.Editor.commit() was not successful");
        }
        return;
      }
      String str = (String)localIterator.next();
      try
      {
        serializeKey(str, paramBundle, localEditor);
      }
      catch (JSONException paramBundle)
      {
        Logger.log(LoggingBehavior.CACHE, 5, TAG, "Error processing value for key: '" + str + "' -- " + paramBundle);
      }
    }
  }
}
