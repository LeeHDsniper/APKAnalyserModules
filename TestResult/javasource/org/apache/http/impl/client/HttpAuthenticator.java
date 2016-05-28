package org.apache.http.impl.client;

import org.apache.commons.logging.Log;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthState;
import org.apache.http.client.AuthenticationStrategy;
import org.apache.http.protocol.HttpContext;

@Deprecated
public class HttpAuthenticator
  extends org.apache.http.impl.auth.HttpAuthenticator
{
  public HttpAuthenticator() {}
  
  public HttpAuthenticator(Log paramLog)
  {
    super(paramLog);
  }
  
  public boolean authenticate(HttpHost paramHttpHost, HttpResponse paramHttpResponse, AuthenticationStrategy paramAuthenticationStrategy, AuthState paramAuthState, HttpContext paramHttpContext)
  {
    return handleAuthChallenge(paramHttpHost, paramHttpResponse, paramAuthenticationStrategy, paramAuthState, paramHttpContext);
  }
}
