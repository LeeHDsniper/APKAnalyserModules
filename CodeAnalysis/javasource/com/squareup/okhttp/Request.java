package com.squareup.okhttp;

import com.squareup.okhttp.internal.Platform;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.http.HttpMethod;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.List;

public final class Request
{
  private final RequestBody body;
  private volatile CacheControl cacheControl;
  private final Headers headers;
  private final String method;
  private final Object tag;
  private volatile URI uri;
  private volatile URL url;
  private final String urlString;
  
  private Request(Builder paramBuilder)
  {
    urlString = urlString;
    method = method;
    headers = headers.build();
    body = body;
    if (tag != null) {}
    for (Object localObject = tag;; localObject = this)
    {
      tag = localObject;
      url = url;
      return;
    }
  }
  
  public RequestBody body()
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
  
  public String header(String paramString)
  {
    return headers.get(paramString);
  }
  
  public Headers headers()
  {
    return headers;
  }
  
  public List<String> headers(String paramString)
  {
    return headers.values(paramString);
  }
  
  public boolean isHttps()
  {
    return url().getProtocol().equals("https");
  }
  
  public String method()
  {
    return method;
  }
  
  public Builder newBuilder()
  {
    return new Builder(this, null);
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder().append("Request{method=").append(method).append(", url=").append(urlString).append(", tag=");
    if (tag != this) {}
    for (Object localObject = tag;; localObject = null) {
      return localObject + '}';
    }
  }
  
  public URI uri()
    throws IOException
  {
    try
    {
      URI localURI = uri;
      if (localURI != null) {
        return localURI;
      }
      localURI = Platform.get().toUriLenient(url());
      uri = localURI;
      return localURI;
    }
    catch (URISyntaxException localURISyntaxException)
    {
      throw new IOException(localURISyntaxException.getMessage());
    }
  }
  
  public URL url()
  {
    try
    {
      URL localURL = url;
      if (localURL != null) {
        return localURL;
      }
      localURL = new URL(urlString);
      url = localURL;
      return localURL;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      throw new RuntimeException("Malformed URL: " + urlString, localMalformedURLException);
    }
  }
  
  public String urlString()
  {
    return urlString;
  }
  
  public static class Builder
  {
    private RequestBody body;
    private Headers.Builder headers;
    private String method;
    private Object tag;
    private URL url;
    private String urlString;
    
    public Builder()
    {
      method = "GET";
      headers = new Headers.Builder();
    }
    
    private Builder(Request paramRequest)
    {
      urlString = urlString;
      url = url;
      method = method;
      body = body;
      tag = tag;
      headers = headers.newBuilder();
    }
    
    public Builder addHeader(String paramString1, String paramString2)
    {
      headers.add(paramString1, paramString2);
      return this;
    }
    
    public Request build()
    {
      if (urlString == null) {
        throw new IllegalStateException("url == null");
      }
      return new Request(this, null);
    }
    
    public Builder cacheControl(CacheControl paramCacheControl)
    {
      paramCacheControl = paramCacheControl.toString();
      if (paramCacheControl.isEmpty()) {
        return removeHeader("Cache-Control");
      }
      return header("Cache-Control", paramCacheControl);
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
    
    public Builder method(String paramString, RequestBody paramRequestBody)
    {
      if ((paramString == null) || (paramString.length() == 0)) {
        throw new IllegalArgumentException("method == null || method.length() == 0");
      }
      if ((paramRequestBody != null) && (!HttpMethod.permitsRequestBody(paramString))) {
        throw new IllegalArgumentException("method " + paramString + " must not have a request body.");
      }
      RequestBody localRequestBody = paramRequestBody;
      if (paramRequestBody == null)
      {
        localRequestBody = paramRequestBody;
        if (HttpMethod.permitsRequestBody(paramString)) {
          localRequestBody = RequestBody.create(null, Util.EMPTY_BYTE_ARRAY);
        }
      }
      method = paramString;
      body = localRequestBody;
      return this;
    }
    
    public Builder removeHeader(String paramString)
    {
      headers.removeAll(paramString);
      return this;
    }
    
    public Builder url(String paramString)
    {
      if (paramString == null) {
        throw new IllegalArgumentException("url == null");
      }
      urlString = paramString;
      return this;
    }
    
    public Builder url(URL paramURL)
    {
      if (paramURL == null) {
        throw new IllegalArgumentException("url == null");
      }
      url = paramURL;
      urlString = paramURL.toString();
      return this;
    }
  }
}
