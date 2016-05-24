package org.apache.http.client.methods;

import java.net.URI;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
public class HttpPut
  extends HttpEntityEnclosingRequestBase
{
  public static final String METHOD_NAME = "PUT";
  
  public HttpPut() {}
  
  public HttpPut(String paramString)
  {
    setURI(URI.create(paramString));
  }
  
  public HttpPut(URI paramURI)
  {
    setURI(paramURI);
  }
  
  public String getMethod()
  {
    return "PUT";
  }
}
