package org.apache.http.impl.execchain;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.methods.CloseableHttpResponse;

@NotThreadSafe
class Proxies
{
  Proxies() {}
  
  static void enhanceEntity(HttpEntityEnclosingRequest paramHttpEntityEnclosingRequest)
  {
    Object localObject = paramHttpEntityEnclosingRequest.getEntity();
    if ((localObject != null) && (!((HttpEntity)localObject).isRepeatable()) && (!isEnhanced((HttpEntity)localObject)))
    {
      ClassLoader localClassLoader = HttpEntity.class.getClassLoader();
      localObject = new RequestEntityExecHandler((HttpEntity)localObject);
      paramHttpEntityEnclosingRequest.setEntity((HttpEntity)Proxy.newProxyInstance(localClassLoader, new Class[] { HttpEntity.class }, (InvocationHandler)localObject));
    }
  }
  
  public static CloseableHttpResponse enhanceResponse(HttpResponse paramHttpResponse, ConnectionHolder paramConnectionHolder)
  {
    ClassLoader localClassLoader = ResponseProxyHandler.class.getClassLoader();
    paramHttpResponse = new ResponseProxyHandler(paramHttpResponse, paramConnectionHolder);
    return (CloseableHttpResponse)Proxy.newProxyInstance(localClassLoader, new Class[] { CloseableHttpResponse.class }, paramHttpResponse);
  }
  
  static boolean isEnhanced(HttpEntity paramHttpEntity)
  {
    if ((paramHttpEntity != null) && (Proxy.isProxyClass(paramHttpEntity.getClass()))) {
      return Proxy.getInvocationHandler(paramHttpEntity) instanceof RequestEntityExecHandler;
    }
    return false;
  }
  
  static boolean isRepeatable(HttpRequest paramHttpRequest)
  {
    if ((paramHttpRequest instanceof HttpEntityEnclosingRequest))
    {
      paramHttpRequest = ((HttpEntityEnclosingRequest)paramHttpRequest).getEntity();
      if ((paramHttpRequest != null) && ((!isEnhanced(paramHttpRequest)) || (((RequestEntityExecHandler)Proxy.getInvocationHandler(paramHttpRequest)).isConsumed()))) {}
    }
    else
    {
      return true;
    }
    return paramHttpRequest.isRepeatable();
  }
}
