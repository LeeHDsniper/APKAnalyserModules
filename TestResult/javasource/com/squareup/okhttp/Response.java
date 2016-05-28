package com.squareup.okhttp;

import com.squareup.okhttp.internal.http.OkHeaders;
import java.util.Collections;
import java.util.List;

public final class Response
{
  private final ResponseBody body;
  private volatile CacheControl cacheControl;
  private Response cacheResponse;
  private final int code;
  private final Handshake handshake;
  private final Headers headers;
  private final String message;
  private Response networkResponse;
  private final Response priorResponse;
  private final Protocol protocol;
  private final Request request;
  
  private Response(Builder paramBuilder)
  {
    request = request;
    protocol = protocol;
    code = code;
    message = message;
    handshake = handshake;
    headers = headers.build();
    body = body;
    networkResponse = networkResponse;
    cacheResponse = cacheResponse;
    priorResponse = priorResponse;
  }
  
  public ResponseBody body()
  {
    return body;
  }
  
  public CacheControl cacheControl()
  {
    CacheControl localCacheControl = cacheControl;
    if (localCacheControl != null) {
      return localCacheControl;
    }
    localCacheControl = CacheControl.parse(headers);
    cacheControl = localCacheControl;
    return localCacheControl;
  }
  
  public Response cacheResponse()
  {
    return cacheResponse;
  }
  
  public List<Challenge> challenges()
  {
    if (code == 401) {}
    for (String str = "WWW-Authenticate";; str = "Proxy-Authenticate")
    {
      return OkHeaders.parseChallenges(headers(), str);
      if (code != 407) {
        break;
      }
    }
    return Collections.emptyList();
  }
  
  public int code()
  {
    return code;
  }
  
  public Handshake handshake()
  {
    return handshake;
  }
  
  public String header(String paramString)
  {
    return header(paramString, null);
  }
  
  public String header(String paramString1, String paramString2)
  {
    paramString1 = headers.get(paramString1);
    if (paramString1 != null) {
      return paramString1;
    }
    return paramString2;
  }
  
  public Headers headers()
  {
    return headers;
  }
  
  public boolean isRedirect()
  {
    switch (code)
    {
    case 304: 
    case 305: 
    case 306: 
    default: 
      return false;
    }
    return true;
  }
  
  public String message()
  {
    return message;
  }
  
  public Response networkResponse()
  {
    return networkResponse;
  }
  
  public Builder newBuilder()
  {
    return new Builder(this, null);
  }
  
  public Protocol protocol()
  {
    return protocol;
  }
  
  public Request request()
  {
    return request;
  }
  
  public String toString()
  {
    return "Response{protocol=" + protocol + ", code=" + code + ", message=" + message + ", url=" + request.urlString() + '}';
  }
  
  public static class Builder
  {
    private ResponseBody body;
    private Response cacheResponse;
    private int code = -1;
    private Handshake handshake;
    private Headers.Builder headers;
    private String message;
    private Response networkResponse;
    private Response priorResponse;
    private Protocol protocol;
    private Request request;
    
    public Builder()
    {
      headers = new Headers.Builder();
    }
    
    private Builder(Response paramResponse)
    {
      request = request;
      protocol = protocol;
      code = code;
      message = message;
      handshake = handshake;
      headers = headers.newBuilder();
      body = body;
      networkResponse = networkResponse;
      cacheResponse = cacheResponse;
      priorResponse = priorResponse;
    }
    
    private void checkPriorResponse(Response paramResponse)
    {
      if (body != null) {
        throw new IllegalArgumentException("priorResponse.body != null");
      }
    }
    
    private void checkSupportResponse(String paramString, Response paramResponse)
    {
      if (body != null) {
        throw new IllegalArgumentException(paramString + ".body != null");
      }
      if (networkResponse != null) {
        throw new IllegalArgumentException(paramString + ".networkResponse != null");
      }
      if (cacheResponse != null) {
        throw new IllegalArgumentException(paramString + ".cacheResponse != null");
      }
      if (priorResponse != null) {
        throw new IllegalArgumentException(paramString + ".priorResponse != null");
      }
    }
    
    public Builder addHeader(String paramString1, String paramString2)
    {
      headers.add(paramString1, paramString2);
      return this;
    }
    
    public Builder body(ResponseBody paramResponseBody)
    {
      body = paramResponseBody;
      return this;
    }
    
    public Response build()
    {
      if (request == null) {
        throw new IllegalStateException("request == null");
      }
      if (protocol == null) {
        throw new IllegalStateException("protocol == null");
      }
      if (code < 0) {
        throw new IllegalStateException("code < 0: " + code);
      }
      return new Response(this, null);
    }
    
    public Builder cacheResponse(Response paramResponse)
    {
      if (paramResponse != null) {
        checkSupportResponse("cacheResponse", paramResponse);
      }
      cacheResponse = paramResponse;
      return this;
    }
    
    public Builder code(int paramInt)
    {
      code = paramInt;
      return this;
    }
    
    public Builder handshake(Handshake paramHandshake)
    {
      handshake = paramHandshake;
      return this;
    }
    
    public Builder header(String paramString1, String paramString2)
    {
      headers.set(paramString1, paramString2);
      return this;
    }
    
    public Builder headers(Headers paramHeaders)
    {
      headers = paramHeaders.newBuilder();
      return this;
    }
    
    public Builder message(String paramString)
    {
      message = paramString;
      return this;
    }
    
    public Builder networkResponse(Response paramResponse)
    {
      if (paramResponse != null) {
        checkSupportResponse("networkResponse", paramResponse);
      }
      networkResponse = paramResponse;
      return this;
    }
    
    public Builder priorResponse(Response paramResponse)
    {
      if (paramResponse != null) {
        checkPriorResponse(paramResponse);
      }
      priorResponse = paramResponse;
      return this;
    }
    
    public Builder protocol(Protocol paramProtocol)
    {
      protocol = paramProtocol;
      return this;
    }
    
    public Builder removeHeader(String paramString)
    {
      headers.removeAll(paramString);
      return this;
    }
    
    public Builder request(Request paramRequest)
    {
      request = paramRequest;
      return this;
    }
  }
}
