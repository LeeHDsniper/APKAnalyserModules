package org.apache.http.client.methods;

import java.net.URI;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
public class HttpPost
  extends HttpEntityEnclosingRequestBase
{
  public static final String METHOD_NAME = "POST";
  
  public HttpPost() {}
  
  public HttpPost(String paramString)
  {
    setURI(URI.create(paramString));
  }
  
  public HttpPost(URI paramURI)
  {
    setURI(paramURI);
  }
  
  public String getMethod()
  {
    return "POST";
  }
}
