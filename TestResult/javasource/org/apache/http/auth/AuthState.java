package org.apache.http.auth;

import java.util.Queue;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.util.Args;

@NotThreadSafe
public class AuthState
{
  private Queue<AuthOption> authOptions;
  private AuthScheme authScheme;
  private AuthScope authScope;
  private Credentials credentials;
  private AuthProtocolState state = AuthProtocolState.UNCHALLENGED;
  
  public AuthState() {}
  
  public Queue<AuthOption> getAuthOptions()
  {
    return authOptions;
  }
  
  public AuthScheme getAuthScheme()
  {
    return authScheme;
  }
  
  @Deprecated
  public AuthScope getAuthScope()
  {
    return authScope;
  }
  
  public Credentials getCredentials()
  {
    return credentials;
  }
  
  public AuthProtocolState getState()
  {
    return state;
  }
  
  public boolean hasAuthOptions()
  {
    return (authOptions != null) && (!authOptions.isEmpty());
  }
  
  @Deprecated
  public void invalidate()
  {
    reset();
  }
  
  @Deprecated
  public boolean isValid()
  {
    return authScheme != null;
  }
  
  public void reset()
  {
    state = AuthProtocolState.UNCHALLENGED;
    authOptions = null;
    authScheme = null;
    authScope = null;
    credentials = null;
  }
  
  @Deprecated
  public void setAuthScheme(AuthScheme paramAuthScheme)
  {
    if (paramAuthScheme == null)
    {
      reset();
      return;
    }
    authScheme = paramAuthScheme;
  }
  
  @Deprecated
  public void setAuthScope(AuthScope paramAuthScope)
  {
    authScope = paramAuthScope;
  }
  
  @Deprecated
  public void setCredentials(Credentials paramCredentials)
  {
    credentials = paramCredentials;
  }
  
  public void setState(AuthProtocolState paramAuthProtocolState)
  {
    if (paramAuthProtocolState != null) {}
    for (;;)
    {
      state = paramAuthProtocolState;
      return;
      paramAuthProtocolState = AuthProtocolState.UNCHALLENGED;
    }
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("state:").append(state).append(";");
    if (authScheme != null) {
      localStringBuilder.append("auth scheme:").append(authScheme.getSchemeName()).append(";");
    }
    if (credentials != null) {
      localStringBuilder.append("credentials present");
    }
    return localStringBuilder.toString();
  }
  
  public void update(Queue<AuthOption> paramQueue)
  {
    Args.notEmpty(paramQueue, "Queue of auth options");
    authOptions = paramQueue;
    authScheme = null;
    credentials = null;
  }
  
  public void update(AuthScheme paramAuthScheme, Credentials paramCredentials)
  {
    Args.notNull(paramAuthScheme, "Auth scheme");
    Args.notNull(paramCredentials, "Credentials");
    authScheme = paramAuthScheme;
    credentials = paramCredentials;
    authOptions = null;
  }
}
