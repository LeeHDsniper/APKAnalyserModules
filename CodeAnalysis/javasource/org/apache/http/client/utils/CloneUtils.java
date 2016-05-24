package org.apache.http.client.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import org.apache.http.annotation.Immutable;

@Immutable
public class CloneUtils
{
  private CloneUtils() {}
  
  public static Object clone(Object paramObject)
    throws CloneNotSupportedException
  {
    return cloneObject(paramObject);
  }
  
  public static <T> T cloneObject(T paramT)
    throws CloneNotSupportedException
  {
    if (paramT == null) {
      return null;
    }
    if ((paramT instanceof Cloneable))
    {
      Object localObject = paramT.getClass();
      try
      {
        localObject = ((Class)localObject).getMethod("clone", (Class[])null);
        throw new CloneNotSupportedException();
      }
      catch (NoSuchMethodException paramT)
      {
        try
        {
          paramT = ((Method)localObject).invoke(paramT, (Object[])null);
          return paramT;
        }
        catch (InvocationTargetException paramT)
        {
          paramT = paramT.getCause();
          if (!(paramT instanceof CloneNotSupportedException)) {
            break label72;
          }
          throw ((CloneNotSupportedException)paramT);
          throw new Error("Unexpected exception", paramT);
        }
        catch (IllegalAccessException paramT)
        {
          throw new IllegalAccessError(paramT.getMessage());
        }
        paramT = paramT;
        throw new NoSuchMethodError(paramT.getMessage());
      }
    }
  }
}
