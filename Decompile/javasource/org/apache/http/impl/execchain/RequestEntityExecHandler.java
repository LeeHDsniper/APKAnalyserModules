package org.apache.http.impl.execchain;

import java.io.OutputStream;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import org.apache.http.HttpEntity;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
class RequestEntityExecHandler
  implements InvocationHandler
{
  private static final Method WRITE_TO_METHOD;
  private boolean consumed = false;
  private final HttpEntity original;
  
  static
  {
    try
    {
      WRITE_TO_METHOD = HttpEntity.class.getMethod("writeTo", new Class[] { OutputStream.class });
      return;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new Error(localNoSuchMethodException);
    }
  }
  
  RequestEntityExecHandler(HttpEntity paramHttpEntity)
  {
    original = paramHttpEntity;
  }
  
  public HttpEntity getOriginal()
  {
    return original;
  }
  
  public Object invoke(Object paramObject, Method paramMethod, Object[] paramArrayOfObject)
    throws Throwable
  {
    try
    {
      if (paramMethod.equals(WRITE_TO_METHOD)) {
        consumed = true;
      }
      paramObject = paramMethod.invoke(original, paramArrayOfObject);
      return paramObject;
    }
    catch (InvocationTargetException paramObject)
    {
      paramMethod = paramObject.getCause();
      if (paramMethod != null) {
        throw paramMethod;
      }
      throw paramObject;
    }
  }
  
  public boolean isConsumed()
  {
    return consumed;
  }
}
