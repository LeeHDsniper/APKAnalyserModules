package org.apache.http.client.methods;

import java.net.URI;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
public class HttpGet
  extends HttpRequestBase
{
  public static final String METHOD_NAME = "GET";
  
  public HttpGet() {}
  
  public HttpGet(String paramString)
  {
    setURI(URI.create(paramString));
  }
  
  public HttpGet(URI paramURI)
  {
    setURI(paramURI);
  }
  
  public String getMethod()
  {
    return "GET";
  }
}
