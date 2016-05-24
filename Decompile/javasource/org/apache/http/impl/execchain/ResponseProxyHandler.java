package org.apache.http.impl.execchain;

import java.io.Closeable;
import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
class ResponseProxyHandler
  implements InvocationHandler
{
  private static final Method CLOSE_METHOD;
  private final ConnectionHolder connHolder;
  private final HttpResponse original;
  
  static
  {
    try
    {
      CLOSE_METHOD = Closeable.class.getMethod("close", new Class[0]);
      return;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new Error(localNoSuchMethodException);
    }
  }
  
  ResponseProxyHandler(HttpResponse paramHttpResponse, ConnectionHolder paramConnectionHolder)
  {
    original = paramHttpResponse;
    connHolder = paramConnectionHolder;
    paramHttpResponse = paramHttpResponse.getEntity();
    if ((paramHttpResponse != null) && (paramHttpResponse.isStreaming()) && (paramConnectionHolder != null)) {
      original.setEntity(new ResponseEntityWrapper(paramHttpResponse, paramConnectionHolder));
    }
  }
  
  public void close()
    throws IOException
  {
    if (connHolder != null) {
      connHolder.abortConnection();
    }
  }
  
  public Object invoke(Object paramObject, Method paramMethod, Object[] paramArrayOfObject)
    throws Throwable
  {
    if (paramMethod.equals(CLOSE_METHOD))
    {
      close();
      return null;
    }
    try
    {
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
}
