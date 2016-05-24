package org.apache.http.client;

import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.ProtocolException;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.protocol.HttpContext;

public abstract interface RedirectStrategy
{
  public abstract HttpUriRequest getRedirect(HttpRequest paramHttpRequest, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws ProtocolException;
  
  public abstract boolean isRedirected(HttpRequest paramHttpRequest, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws ProtocolException;
}
