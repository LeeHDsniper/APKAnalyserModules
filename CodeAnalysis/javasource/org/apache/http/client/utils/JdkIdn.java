package org.apache.http.client.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import org.apache.http.annotation.Immutable;

@Immutable
public class JdkIdn
  implements Idn
{
  private final Method toUnicode;
  
  public JdkIdn()
    throws ClassNotFoundException
  {
    Class localClass = Class.forName("java.net.IDN");
    try
    {
      toUnicode = localClass.getMethod("toUnicode", new Class[] { String.class });
      return;
    }
    catch (SecurityException localSecurityException)
    {
      throw new IllegalStateException(localSecurityException.getMessage(), localSecurityException);
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new IllegalStateException(localNoSuchMethodException.getMessage(), localNoSuchMethodException);
    }
  }
  
  public String toUnicode(String paramString)
  {
    try
    {
      paramString = (String)toUnicode.invoke(null, new Object[] { paramString });
      return paramString;
    }
    catch (IllegalAccessException paramString)
    {
      throw new IllegalStateException(paramString.getMessage(), paramString);
    }
    catch (InvocationTargetException paramString)
    {
      paramString = paramString.getCause();
      throw new RuntimeException(paramString.getMessage(), paramString);
    }
  }
}
