package org.apache.http.impl.client;

import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.HttpRequest;
import org.apache.http.RequestLine;
import org.apache.http.annotation.Immutable;

@Immutable
public class StandardHttpRequestRetryHandler
  extends DefaultHttpRequestRetryHandler
{
  private final Map<String, Boolean> idempotentMethods = new ConcurrentHashMap();
  
  public StandardHttpRequestRetryHandler()
  {
    this(3, false);
  }
  
  public StandardHttpRequestRetryHandler(int paramInt, boolean paramBoolean)
  {
    super(paramInt, paramBoolean);
    idempotentMethods.put("GET", Boolean.TRUE);
    idempotentMethods.put("HEAD", Boolean.TRUE);
    idempotentMethods.put("PUT", Boolean.TRUE);
    idempotentMethods.put("DELETE", Boolean.TRUE);
    idempotentMethods.put("OPTIONS", Boolean.TRUE);
    idempotentMethods.put("TRACE", Boolean.TRUE);
  }
  
  protected boolean handleAsIdempotent(HttpRequest paramHttpRequest)
  {
    paramHttpRequest = paramHttpRequest.getRequestLine().getMethod().toUpperCase(Locale.US);
    paramHttpRequest = (Boolean)idempotentMethods.get(paramHttpRequest);
    return (paramHttpRequest != null) && (paramHttpRequest.booleanValue());
  }
}
