package org.apache.http.client.methods;

import java.net.URI;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
public class HttpHead
  extends HttpRequestBase
{
  public static final String METHOD_NAME = "HEAD";
  
  public HttpHead() {}
  
  public HttpHead(String paramString)
  {
    setURI(URI.create(paramString));
  }
  
  public HttpHead(URI paramURI)
  {
    setURI(paramURI);
  }
  
  public String getMethod()
  {
    return "HEAD";
  }
}
