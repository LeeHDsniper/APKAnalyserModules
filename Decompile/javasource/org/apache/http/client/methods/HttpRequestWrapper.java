package org.apache.http.client.methods;

import java.net.URI;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpRequest;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.message.AbstractHttpMessage;
import org.apache.http.message.BasicRequestLine;
import org.apache.http.params.HttpParams;

@NotThreadSafe
public class HttpRequestWrapper
  extends AbstractHttpMessage
  implements HttpUriRequest
{
  private final String method;
  private final HttpRequest original;
  private URI uri;
  private ProtocolVersion version;
  
  private HttpRequestWrapper(HttpRequest paramHttpRequest)
  {
    original = paramHttpRequest;
    version = original.getRequestLine().getProtocolVersion();
    method = original.getRequestLine().getMethod();
    if ((paramHttpRequest instanceof HttpUriRequest)) {}
    for (uri = ((HttpUriRequest)paramHttpRequest).getURI();; uri = null)
    {
      setHeaders(paramHttpRequest.getAllHeaders());
      return;
    }
  }
  
  public static HttpRequestWrapper wrap(HttpRequest paramHttpRequest)
  {
    if (paramHttpRequest == null) {
      return null;
    }
    if ((paramHttpRequest instanceof HttpEntityEnclosingRequest)) {
      return new HttpEntityEnclosingRequestWrapper((HttpEntityEnclosingRequest)paramHttpRequest);
    }
    return new HttpRequestWrapper(paramHttpRequest);
  }
  
  public void abort()
    throws UnsupportedOperationException
  {
    throw new UnsupportedOperationException();
  }
  
  public String getMethod()
  {
    return method;
  }
  
  public HttpRequest getOriginal()
  {
    return original;
  }
  
  @Deprecated
  public HttpParams getParams()
  {
    if (params == null) {
      params = original.getParams().copy();
    }
    return params;
  }
  
  public ProtocolVersion getProtocolVersion()
  {
    if (version != null) {
      return version;
    }
    return original.getProtocolVersion();
  }
  
  public RequestLine getRequestLine()
  {
    if (uri != null) {}
    for (String str1 = uri.toASCIIString();; str1 = original.getRequestLine().getUri())
    {
      String str2;
      if (str1 != null)
      {
        str2 = str1;
        if (str1.length() != 0) {}
      }
      else
      {
        str2 = "/";
      }
      return new BasicRequestLine(method, str2, getProtocolVersion());
    }
  }
  
  public URI getURI()
  {
    return uri;
  }
  
  public boolean isAborted()
  {
    return false;
  }
  
  public void setProtocolVersion(ProtocolVersion paramProtocolVersion)
  {
    version = paramProtocolVersion;
  }
  
  public void setURI(URI paramURI)
  {
    uri = paramURI;
  }
  
  public String toString()
  {
    return getRequestLine() + " " + headergroup;
  }
  
  static class HttpEntityEnclosingRequestWrapper
    extends HttpRequestWrapper
    implements HttpEntityEnclosingRequest
  {
    private HttpEntity entity;
    
    public HttpEntityEnclosingRequestWrapper(HttpEntityEnclosingRequest paramHttpEntityEnclosingRequest)
    {
      super(null);
      entity = paramHttpEntityEnclosingRequest.getEntity();
    }
    
    public boolean expectContinue()
    {
      Header localHeader = getFirstHeader("Expect");
      return (localHeader != null) && ("100-continue".equalsIgnoreCase(localHeader.getValue()));
    }
    
    public HttpEntity getEntity()
    {
      return entity;
    }
    
    public void setEntity(HttpEntity paramHttpEntity)
    {
      entity = paramHttpEntity;
    }
  }
}
