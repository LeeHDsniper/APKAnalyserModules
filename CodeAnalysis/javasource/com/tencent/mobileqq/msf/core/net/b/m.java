package com.tencent.mobileqq.msf.core.net.b;

import org.json.JSONObject;

public class m
{
  public String a;
  public long b;
  public boolean c;
  
  public m() {}
  
  public m(String paramString, long paramLong, boolean paramBoolean)
  {
    a = paramString;
    b = paramLong;
    c = paramBoolean;
  }
  
  public static m a(String paramString)
  {
    try
    {
      paramString = paramString.split("&#&");
      if (paramString.length != 3) {
        return null;
      }
      paramString = new m(paramString[0], Long.parseLong(paramString[1]), Boolean.parseBoolean(paramString[2]));
      return paramString;
    }
    catch (Exception paramString)
    {
      paramString.printStackTrace();
    }
    return null;
  }
  
  public static m a(JSONObject paramJSONObject)
  {
    try
    {
      paramJSONObject = new m(paramJSONObject.getString("ssid"), paramJSONObject.getLong("time"), paramJSONObject.getBoolean("available"));
      return paramJSONObject;
    }
    catch (Exception paramJSONObject)
    {
      paramJSONObject.printStackTrace();
    }
    return null;
  }
  
  public String a()
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append(a).append("&#&");
    localStringBuffer.append(b).append("&#&");
    localStringBuffer.append(c);
    return localStringBuffer.toString();
  }
  
  public JSONObject b()
  {
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("ssid", a);
      localJSONObject.put("time", b);
      localJSONObject.put("available", c);
      return localJSONObject;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }
}
