package org.apache.http.impl.client;

import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.util.EntityUtils;

@NotThreadSafe
class CloseableHttpResponseProxy
  implements InvocationHandler
{
  private final HttpResponse original;
  
  CloseableHttpResponseProxy(HttpResponse paramHttpResponse)
  {
    original = paramHttpResponse;
  }
  
  public static CloseableHttpResponse newProxy(HttpResponse paramHttpResponse)
  {
    ClassLoader localClassLoader = CloseableHttpResponseProxy.class.getClassLoader();
    paramHttpResponse = new CloseableHttpResponseProxy(paramHttpResponse);
    return (CloseableHttpResponse)Proxy.newProxyInstance(localClassLoader, new Class[] { CloseableHttpResponse.class }, paramHttpResponse);
  }
  
  public void close()
    throws IOException
  {
    EntityUtils.consume(original.getEntity());
  }
  
  public Object invoke(Object paramObject, Method paramMethod, Object[] paramArrayOfObject)
    throws Throwable
  {
    if (paramMethod.getName().equals("close"))
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
