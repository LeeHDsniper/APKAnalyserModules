package org.apache.http.protocol;

import java.util.LinkedList;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.HttpResponseInterceptor;

public class HttpProcessorBuilder
{
  private ChainBuilder<HttpRequestInterceptor> requestChainBuilder;
  private ChainBuilder<HttpResponseInterceptor> responseChainBuilder;
  
  HttpProcessorBuilder() {}
  
  public static HttpProcessorBuilder create()
  {
    return new HttpProcessorBuilder();
  }
  
  private ChainBuilder<HttpRequestInterceptor> getRequestChainBuilder()
  {
    if (requestChainBuilder == null) {
      requestChainBuilder = new ChainBuilder();
    }
    return requestChainBuilder;
  }
  
  private ChainBuilder<HttpResponseInterceptor> getResponseChainBuilder()
  {
    if (responseChainBuilder == null) {
      responseChainBuilder = new ChainBuilder();
    }
    return responseChainBuilder;
  }
  
  public HttpProcessorBuilder add(HttpRequestInterceptor paramHttpRequestInterceptor)
  {
    return addLast(paramHttpRequestInterceptor);
  }
  
  public HttpProcessorBuilder add(HttpResponseInterceptor paramHttpResponseInterceptor)
  {
    return addLast(paramHttpResponseInterceptor);
  }
  
  public HttpProcessorBuilder addAll(HttpRequestInterceptor... paramVarArgs)
  {
    return addAllLast(paramVarArgs);
  }
  
  public HttpProcessorBuilder addAll(HttpResponseInterceptor... paramVarArgs)
  {
    return addAllLast(paramVarArgs);
  }
  
  public HttpProcessorBuilder addAllFirst(HttpRequestInterceptor... paramVarArgs)
  {
    if (paramVarArgs == null) {
      return this;
    }
    getRequestChainBuilder().addAllFirst(paramVarArgs);
    return this;
  }
  
  public HttpProcessorBuilder addAllFirst(HttpResponseInterceptor... paramVarArgs)
  {
    if (paramVarArgs == null) {
      return this;
    }
    getResponseChainBuilder().addAllFirst(paramVarArgs);
    return this;
  }
  
  public HttpProcessorBuilder addAllLast(HttpRequestInterceptor... paramVarArgs)
  {
    if (paramVarArgs == null) {
      return this;
    }
    getRequestChainBuilder().addAllLast(paramVarArgs);
    return this;
  }
  
  public HttpProcessorBuilder addAllLast(HttpResponseInterceptor... paramVarArgs)
  {
    if (paramVarArgs == null) {
      return this;
    }
    getResponseChainBuilder().addAllLast(paramVarArgs);
    return this;
  }
  
  public HttpProcessorBuilder addFirst(HttpRequestInterceptor paramHttpRequestInterceptor)
  {
    if (paramHttpRequestInterceptor == null) {
      return this;
    }
    getRequestChainBuilder().addFirst(paramHttpRequestInterceptor);
    return this;
  }
  
  public HttpProcessorBuilder addFirst(HttpResponseInterceptor paramHttpResponseInterceptor)
  {
    if (paramHttpResponseInterceptor == null) {
      return this;
    }
    getResponseChainBuilder().addFirst(paramHttpResponseInterceptor);
    return this;
  }
  
  public HttpProcessorBuilder addLast(HttpRequestInterceptor paramHttpRequestInterceptor)
  {
    if (paramHttpRequestInterceptor == null) {
      return this;
    }
    getRequestChainBuilder().addLast(paramHttpRequestInterceptor);
    return this;
  }
  
  public HttpProcessorBuilder addLast(HttpResponseInterceptor paramHttpResponseInterceptor)
  {
    if (paramHttpResponseInterceptor == null) {
      return this;
    }
    getResponseChainBuilder().addLast(paramHttpResponseInterceptor);
    return this;
  }
  
  public HttpProcessor build()
  {
    LinkedList localLinkedList2 = null;
    if (requestChainBuilder != null) {}
    for (LinkedList localLinkedList1 = requestChainBuilder.build();; localLinkedList1 = null)
    {
      if (responseChainBuilder != null) {
        localLinkedList2 = responseChainBuilder.build();
      }
      return new ImmutableHttpProcessor(localLinkedList1, localLinkedList2);
    }
  }
}
