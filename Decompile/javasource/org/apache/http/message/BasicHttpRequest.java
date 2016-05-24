package org.apache.http.message;

import org.apache.http.HttpRequest;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolVersion;
import org.apache.http.RequestLine;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class BasicHttpRequest
  extends AbstractHttpMessage
  implements HttpRequest
{
  private final String method;
  private RequestLine requestline;
  private final String uri;
  
  public BasicHttpRequest(String paramString1, String paramString2)
  {
    method = ((String)Args.notNull(paramString1, "Method name"));
    uri = ((String)Args.notNull(paramString2, "Request URI"));
    requestline = null;
  }
  
  public BasicHttpRequest(String paramString1, String paramString2, ProtocolVersion paramProtocolVersion)
  {
    this(new BasicRequestLine(paramString1, paramString2, paramProtocolVersion));
  }
  
  public BasicHttpRequest(RequestLine paramRequestLine)
  {
    requestline = ((RequestLine)Args.notNull(paramRequestLine, "Request line"));
    method = paramRequestLine.getMethod();
    uri = paramRequestLine.getUri();
  }
  
  public ProtocolVersion getProtocolVersion()
  {
    return getRequestLine().getProtocolVersion();
  }
  
  public RequestLine getRequestLine()
  {
    if (requestline == null) {
      requestline = new BasicRequestLine(method, uri, HttpVersion.HTTP_1_1);
    }
    return requestline;
  }
  
  public String toString()
  {
    return method + " " + uri + " " + headergroup;
  }
}
