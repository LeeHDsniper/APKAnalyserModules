package org.apache.http.client.methods;

import java.net.URI;
import org.apache.http.annotation.NotThreadSafe;

@NotThreadSafe
public class HttpDelete
  extends HttpRequestBase
{
  public static final String METHOD_NAME = "DELETE";
  
  public HttpDelete() {}
  
  public HttpDelete(String paramString)
  {
    setURI(URI.create(paramString));
  }
  
  public HttpDelete(URI paramURI)
  {
    setURI(paramURI);
  }
  
  public String getMethod()
  {
    return "DELETE";
  }
}
