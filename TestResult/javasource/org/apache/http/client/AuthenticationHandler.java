package org.apache.http.client;

import java.util.Map;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthenticationException;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.protocol.HttpContext;

@Deprecated
public abstract interface AuthenticationHandler
{
  public abstract Map<String, Header> getChallenges(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws MalformedChallengeException;
  
  public abstract boolean isAuthenticationRequested(HttpResponse paramHttpResponse, HttpContext paramHttpContext);
  
  public abstract AuthScheme selectScheme(Map<String, Header> paramMap, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws AuthenticationException;
}
