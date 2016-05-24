package org.apache.http.protocol;

import java.io.IOException;
import java.util.List;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseInterceptor;
import org.apache.http.annotation.ThreadSafe;

@ThreadSafe
public final class ImmutableHttpProcessor
  implements HttpProcessor
{
  private final HttpRequestInterceptor[] requestInterceptors;
  private final HttpResponseInterceptor[] responseInterceptors;
  
  public ImmutableHttpProcessor(List<HttpRequestInterceptor> paramList, List<HttpResponseInterceptor> paramList1)
  {
    if (paramList != null) {}
    for (requestInterceptors = ((HttpRequestInterceptor[])paramList.toArray(new HttpRequestInterceptor[paramList.size()])); paramList1 != null; requestInterceptors = new HttpRequestInterceptor[0])
    {
      responseInterceptors = ((HttpResponseInterceptor[])paramList1.toArray(new HttpResponseInterceptor[paramList1.size()]));
      return;
    }
    responseInterceptors = new HttpResponseInterceptor[0];
  }
  
  @Deprecated
  public ImmutableHttpProcessor(HttpRequestInterceptorList paramHttpRequestInterceptorList, HttpResponseInterceptorList paramHttpResponseInterceptorList)
  {
    int j;
    int i;
    if (paramHttpRequestInterceptorList != null)
    {
      j = paramHttpRequestInterceptorList.getRequestInterceptorCount();
      requestInterceptors = new HttpRequestInterceptor[j];
      i = 0;
      while (i < j)
      {
        requestInterceptors[i] = paramHttpRequestInterceptorList.getRequestInterceptor(i);
        i += 1;
      }
    }
    requestInterceptors = new HttpRequestInterceptor[0];
    if (paramHttpResponseInterceptorList != null)
    {
      j = paramHttpResponseInterceptorList.getResponseInterceptorCount();
      responseInterceptors = new HttpResponseInterceptor[j];
      i = 0;
      while (i < j)
      {
        responseInterceptors[i] = paramHttpResponseInterceptorList.getResponseInterceptor(i);
        i += 1;
      }
    }
    responseInterceptors = new HttpResponseInterceptor[0];
  }
  
  public ImmutableHttpProcessor(HttpRequestInterceptor... paramVarArgs)
  {
    this(paramVarArgs, null);
  }
  
  public ImmutableHttpProcessor(HttpRequestInterceptor[] paramArrayOfHttpRequestInterceptor, HttpResponseInterceptor[] paramArrayOfHttpResponseInterceptor)
  {
    int i;
    if (paramArrayOfHttpRequestInterceptor != null)
    {
      i = paramArrayOfHttpRequestInterceptor.length;
      requestInterceptors = new HttpRequestInterceptor[i];
      System.arraycopy(paramArrayOfHttpRequestInterceptor, 0, requestInterceptors, 0, i);
    }
    while (paramArrayOfHttpResponseInterceptor != null)
    {
      i = paramArrayOfHttpResponseInterceptor.length;
      responseInterceptors = new HttpResponseInterceptor[i];
      System.arraycopy(paramArrayOfHttpResponseInterceptor, 0, responseInterceptors, 0, i);
      return;
      requestInterceptors = new HttpRequestInterceptor[0];
    }
    responseInterceptors = new HttpResponseInterceptor[0];
  }
  
  public ImmutableHttpProcessor(HttpResponseInterceptor... paramVarArgs)
  {
    this(null, paramVarArgs);
  }
  
  public void process(HttpRequest paramHttpRequest, HttpContext paramHttpContext)
    throws IOException, HttpException
  {
    HttpRequestInterceptor[] arrayOfHttpRequestInterceptor = requestInterceptors;
    int j = arrayOfHttpRequestInterceptor.length;
    int i = 0;
    while (i < j)
    {
      arrayOfHttpRequestInterceptor[i].process(paramHttpRequest, paramHttpContext);
      i += 1;
    }
  }
  
  public void process(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws IOException, HttpException
  {
    HttpResponseInterceptor[] arrayOfHttpResponseInterceptor = responseInterceptors;
    int j = arrayOfHttpResponseInterceptor.length;
    int i = 0;
    while (i < j)
    {
      arrayOfHttpResponseInterceptor[i].process(paramHttpResponse, paramHttpContext);
      i += 1;
    }
  }
}
