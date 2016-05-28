package android.support.v4.text;

import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

class ICUCompatIcs
{
  private static Method sAddLikelySubtagsMethod;
  private static Method sGetScriptMethod;
  
  static
  {
    try
    {
      Class localClass = Class.forName("libcore.icu.ICU");
      if (localClass != null)
      {
        sGetScriptMethod = localClass.getMethod("getScript", new Class[] { String.class });
        sAddLikelySubtagsMethod = localClass.getMethod("addLikelySubtags", new Class[] { String.class });
      }
      return;
    }
    catch (Exception localException)
    {
      Log.w("ICUCompatIcs", localException);
    }
  }
  
  public static String addLikelySubtags(String paramString)
  {
    try
    {
      if (sAddLikelySubtagsMethod != null)
      {
        String str = (String)sAddLikelySubtagsMethod.invoke(null, new Object[] { paramString });
        return str;
      }
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      Log.w("ICUCompatIcs", localIllegalAccessException);
      return paramString;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      for (;;)
      {
        Log.w("ICUCompatIcs", localInvocationTargetException);
      }
    }
  }
  
  public static String getScript(String paramString)
  {
    try
    {
      if (sGetScriptMethod != null)
      {
        paramString = (String)sGetScriptMethod.invoke(null, new Object[] { paramString });
        return paramString;
      }
    }
    catch (IllegalAccessException paramString)
    {
      Log.w("ICUCompatIcs", paramString);
      return null;
    }
    catch (InvocationTargetException paramString)
    {
      for (;;)
      {
        Log.w("ICUCompatIcs", paramString);
      }
    }
  }
}
