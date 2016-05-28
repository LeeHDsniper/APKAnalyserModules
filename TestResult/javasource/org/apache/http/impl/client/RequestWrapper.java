package org.apache.http.impl.client;

import java.net.URI;
import java.net.URISyntaxException;
import org.apache.http.HttpRequest;
import org.apache.http.ProtocolException;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.message.AbstractHttpMessage;
import org.apache.http.message.BasicRequestLine;
import org.apache.http.message.HeaderGroup;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.util.Args;

@Deprecated
@NotThreadSafe
public class RequestWrapper
  extends AbstractHttpMessage
  implements HttpUriRequest
{
  private int execCount;
  private String method;
  private final HttpRequest original;
  private URI uri;
  private ProtocolVersion version;
  
  public RequestWrapper(HttpRequest paramHttpRequest)
    throws ProtocolException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    original = paramHttpRequest;
    setParams(paramHttpRequest.getParams());
    setHeaders(paramHttpRequest.getAllHeaders());
    if ((paramHttpRequest instanceof HttpUriRequest))
    {
      uri = ((HttpUriRequest)paramHttpRequest).getURI();
      method = ((HttpUriRequest)paramHttpRequest).getMethod();
      version = null;
    }
    for (;;)
    {
      execCount = 0;
      return;
      RequestLine localRequestLine = paramHttpRequest.getRequestLine();
      try
      {
        uri = new URI(localRequestLine.getUri());
        method = localRequestLine.getMethod();
        version = paramHttpRequest.getProtocolVersion();
      }
      catch (URISyntaxException paramHttpRequest)
      {
        throw new ProtocolException("Invalid request URI: " + localRequestLine.getUri(), paramHttpRequest);
      }
    }
  }
  
  public void abort()
    throws UnsupportedOperationException
  {
    throw new UnsupportedOperationException();
  }
  
  public int getExecCount()
  {
    return execCount;
  }
  
  public String getMethod()
  {
    return method;
  }
  
  public HttpRequest getOriginal()
  {
    return original;
  }
  
  public ProtocolVersion getProtocolVersion()
  {
    if (version == null) {
      version = HttpProtocolParams.getVersion(getParams());
    }
    return version;
  }
  
  public RequestLine getRequestLine()
  {
    String str3 = getMethod();
    ProtocolVersion localProtocolVersion = getProtocolVersion();
    String str1 = null;
    if (uri != null) {
      str1 = uri.toASCIIString();
    }
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
    return new BasicRequestLine(str3, str2, localProtocolVersion);
  }
  
  public URI getURI()
  {
    return uri;
  }
  
  public void incrementExecCount()
  {
    execCount += 1;
  }
  
  public boolean isAborted()
  {
    return false;
  }
  
  public boolean isRepeatable()
  {
    return true;
  }
  
  public void resetHeaders()
  {
    headergroup.clear();
    setHeaders(original.getAllHeaders());
  }
  
  public void setMethod(String paramString)
  {
    Args.notNull(paramString, "Method name");
    method = paramString;
  }
  
  public void setProtocolVersion(ProtocolVersion paramProtocolVersion)
  {
    version = paramProtocolVersion;
  }
  
  public void setURI(URI paramURI)
  {
    uri = paramURI;
  }
}
