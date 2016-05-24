package org.apache.http.client;

import java.net.URI;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolException;
import org.apache.http.protocol.HttpContext;

@Deprecated
public abstract interface RedirectHandler
{
  public abstract URI getLocationURI(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws ProtocolException;
  
  public abstract boolean isRedirectRequested(HttpResponse paramHttpResponse, HttpContext paramHttpContext);
}
