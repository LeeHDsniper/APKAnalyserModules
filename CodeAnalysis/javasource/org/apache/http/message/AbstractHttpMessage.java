package org.apache.http.message;

import org.apache.http.Header;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpMessage;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@NotThreadSafe
public abstract class AbstractHttpMessage
  implements HttpMessage
{
  protected HeaderGroup headergroup = new HeaderGroup();
  @Deprecated
  protected HttpParams params;
  
  protected AbstractHttpMessage()
  {
    this(null);
  }
  
  @Deprecated
  protected AbstractHttpMessage(HttpParams paramHttpParams)
  {
    params = paramHttpParams;
  }
  
  public void addHeader(String paramString1, String paramString2)
  {
    Args.notNull(paramString1, "Header name");
    headergroup.addHeader(new BasicHeader(paramString1, paramString2));
  }
  
  public void addHeader(Header paramHeader)
  {
    headergroup.addHeader(paramHeader);
  }
  
  public boolean containsHeader(String paramString)
  {
    return headergroup.containsHeader(paramString);
  }
  
  public Header[] getAllHeaders()
  {
    return headergroup.getAllHeaders();
  }
  
  public Header getFirstHeader(String paramString)
  {
    return headergroup.getFirstHeader(paramString);
  }
  
  public Header[] getHeaders(String paramString)
  {
    return headergroup.getHeaders(paramString);
  }
  
  public Header getLastHeader(String paramString)
  {
    return headergroup.getLastHeader(paramString);
  }
  
  @Deprecated
  public HttpParams getParams()
  {
    if (params == null) {
      params = new BasicHttpParams();
    }
    return params;
  }
  
  public HeaderIterator headerIterator()
  {
    return headergroup.iterator();
  }
  
  public HeaderIterator headerIterator(String paramString)
  {
    return headergroup.iterator(paramString);
  }
  
  public void removeHeader(Header paramHeader)
  {
    headergroup.removeHeader(paramHeader);
  }
  
  public void removeHeaders(String paramString)
  {
    if (paramString == null) {}
    for (;;)
    {
      return;
      HeaderIterator localHeaderIterator = headergroup.iterator();
      while (localHeaderIterator.hasNext()) {
        if (paramString.equalsIgnoreCase(localHeaderIterator.nextHeader().getName())) {
          localHeaderIterator.remove();
        }
      }
    }
  }
  
  public void setHeader(String paramString1, String paramString2)
  {
    Args.notNull(paramString1, "Header name");
    headergroup.updateHeader(new BasicHeader(paramString1, paramString2));
  }
  
  public void setHeader(Header paramHeader)
  {
    headergroup.updateHeader(paramHeader);
  }
  
  public void setHeaders(Header[] paramArrayOfHeader)
  {
    headergroup.setHeaders(paramArrayOfHeader);
  }
  
  @Deprecated
  public void setParams(HttpParams paramHttpParams)
  {
    params = ((HttpParams)Args.notNull(paramHttpParams, "HTTP parameters"));
  }
}
