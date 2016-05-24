package com.localytics.android;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public final class ReflectionUtils
{
  private static <T> T helper(Object paramObject, Class<?> paramClass, String paramString1, String paramString2, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
  {
    if (paramClass != null) {}
    for (;;)
    {
      try
      {
        return paramClass.getMethod(paramString2, paramArrayOfClass).invoke(paramObject, paramArrayOfObject);
      }
      catch (NoSuchMethodException paramObject)
      {
        throw new RuntimeException(paramObject);
      }
      catch (IllegalAccessException paramObject)
      {
        throw new RuntimeException(paramObject);
      }
      catch (InvocationTargetException paramObject)
      {
        throw new RuntimeException(paramObject);
      }
      catch (ClassNotFoundException paramObject)
      {
        throw new RuntimeException(paramObject);
      }
      if (paramObject != null) {
        paramClass = paramObject.getClass();
      } else {
        paramClass = Class.forName(paramString1);
      }
    }
  }
  
  public static <T> T tryInvokeConstructor(String paramString, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
  {
    try
    {
      paramString = Class.forName(paramString).getDeclaredConstructor(paramArrayOfClass).newInstance(paramArrayOfObject);
      return paramString;
    }
    catch (InstantiationException paramString)
    {
      throw new RuntimeException(paramString);
    }
    catch (IllegalAccessException paramString)
    {
      throw new RuntimeException(paramString);
    }
    catch (InvocationTargetException paramString)
    {
      throw new RuntimeException(paramString);
    }
    catch (NoSuchMethodException paramString)
    {
      throw new RuntimeException(paramString);
    }
    catch (ClassNotFoundException paramString)
    {
      throw new RuntimeException(paramString);
    }
  }
  
  public static <T> T tryInvokeInstance(Object paramObject, String paramString, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
  {
    return helper(paramObject, null, null, paramString, paramArrayOfClass, paramArrayOfObject);
  }
  
  public static <T> T tryInvokeStatic(String paramString1, String paramString2, Class<?>[] paramArrayOfClass, Object[] paramArrayOfObject)
  {
    return helper(null, null, paramString1, paramString2, paramArrayOfClass, paramArrayOfObject);
  }
}
