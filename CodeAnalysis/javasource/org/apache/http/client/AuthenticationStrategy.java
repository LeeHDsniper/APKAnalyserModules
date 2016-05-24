package org.apache.http.client;

import java.util.Map;
import java.util.Queue;
import org.apache.http.Header;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthOption;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.MalformedChallengeException;
import org.apache.http.protocol.HttpContext;

public abstract interface AuthenticationStrategy
{
  public abstract void authFailed(HttpHost paramHttpHost, AuthScheme paramAuthScheme, HttpContext paramHttpContext);
  
  public abstract void authSucceeded(HttpHost paramHttpHost, AuthScheme paramAuthScheme, HttpContext paramHttpContext);
  
  public abstract Map<String, Header> getChallenges(HttpHost paramHttpHost, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws MalformedChallengeException;
  
  public abstract boolean isAuthenticationRequested(HttpHost paramHttpHost, HttpResponse paramHttpResponse, HttpContext paramHttpContext);
  
  public abstract Queue<AuthOption> select(Map<String, Header> paramMap, HttpHost paramHttpHost, HttpResponse paramHttpResponse, HttpContext paramHttpContext)
    throws MalformedChallengeException;
}
