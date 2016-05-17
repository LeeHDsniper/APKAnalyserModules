package com.tencent.theme;

import android.content.Context;
import java.lang.reflect.Method;

public class m
{
  private m() {}
  
  public static String a(Context paramContext, String paramString)
    throws IllegalArgumentException
  {
    try
    {
      paramContext = paramContext.getClassLoader().loadClass("android.os.SystemProperties");
      paramContext = (String)paramContext.getMethod("get", new Class[] { String.class }).invoke(paramContext, new Object[] { new String(paramString) });
      return paramContext;
    }
    catch (IllegalArgumentException paramContext)
    {
      throw paramContext;
    }
    catch (Exception paramContext) {}
    return "";
  }
}
