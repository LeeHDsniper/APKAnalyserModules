package org.apache.http.client.methods;

import java.net.URI;
import java.util.HashSet;
import java.util.Set;
import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class HttpOptions
  extends HttpRequestBase
{
  public static final String METHOD_NAME = "OPTIONS";
  
  public HttpOptions() {}
  
  public HttpOptions(String paramString)
  {
    setURI(URI.create(paramString));
  }
  
  public HttpOptions(URI paramURI)
  {
    setURI(paramURI);
  }
  
  public Set<String> getAllowedMethods(HttpResponse paramHttpResponse)
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    paramHttpResponse = paramHttpResponse.headerIterator("Allow");
    HashSet localHashSet = new HashSet();
    while (paramHttpResponse.hasNext())
    {
      HeaderElement[] arrayOfHeaderElement = paramHttpResponse.nextHeader().getElements();
      int j = arrayOfHeaderElement.length;
      int i = 0;
      while (i < j)
      {
        localHashSet.add(arrayOfHeaderElement[i].getName());
        i += 1;
      }
    }
    return localHashSet;
  }
  
  public String getMethod()
  {
    return "OPTIONS";
  }
}
