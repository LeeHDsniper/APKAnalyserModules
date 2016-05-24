package com.adobe.creativesdk.foundation.internal.utils;

import org.json.JSONException;
import org.json.JSONObject;

public class AdobeJSONObject
{
  JSONObject jsonObject;
  
  public AdobeJSONObject(String paramString)
    throws JSONException
  {
    jsonObject = new JSONObject(paramString);
  }
  
  public String getString(String paramString)
  {
    String str = null;
    if (jsonObject.has(paramString)) {}
    try
    {
      str = jsonObject.getString(paramString);
      return str;
    }
    catch (JSONException paramString)
    {
      paramString.printStackTrace();
    }
    return null;
  }
  
  public boolean has(String paramString)
  {
    return jsonObject.has(paramString);
  }
}
