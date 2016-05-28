package org.apache.http.impl.client;

import java.security.Principal;
import javax.net.ssl.SSLSession;
import org.apache.http.HttpConnection;
import org.apache.http.annotation.Immutable;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthState;
import org.apache.http.auth.Credentials;
import org.apache.http.client.UserTokenHandler;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.protocol.HttpContext;

@Immutable
public class DefaultUserTokenHandler
  implements UserTokenHandler
{
  public static final DefaultUserTokenHandler INSTANCE = new DefaultUserTokenHandler();
  
  public DefaultUserTokenHandler() {}
  
  private static Principal getAuthPrincipal(AuthState paramAuthState)
  {
    AuthScheme localAuthScheme = paramAuthState.getAuthScheme();
    if ((localAuthScheme != null) && (localAuthScheme.isComplete()) && (localAuthScheme.isConnectionBased()))
    {
      paramAuthState = paramAuthState.getCredentials();
      if (paramAuthState != null) {
        return paramAuthState.getUserPrincipal();
      }
    }
    return null;
  }
  
  public Object getUserToken(HttpContext paramHttpContext)
  {
    Object localObject2 = HttpClientContext.adapt(paramHttpContext);
    paramHttpContext = null;
    Object localObject1 = ((HttpClientContext)localObject2).getTargetAuthState();
    if (localObject1 != null)
    {
      localObject1 = getAuthPrincipal((AuthState)localObject1);
      paramHttpContext = (HttpContext)localObject1;
      if (localObject1 == null) {
        paramHttpContext = getAuthPrincipal(((HttpClientContext)localObject2).getProxyAuthState());
      }
    }
    localObject1 = paramHttpContext;
    if (paramHttpContext == null)
    {
      localObject2 = ((HttpClientContext)localObject2).getConnection();
      localObject1 = paramHttpContext;
      if (((HttpConnection)localObject2).isOpen())
      {
        localObject1 = paramHttpContext;
        if ((localObject2 instanceof ManagedHttpClientConnection))
        {
          localObject2 = ((ManagedHttpClientConnection)localObject2).getSSLSession();
          localObject1 = paramHttpContext;
          if (localObject2 != null) {
            localObject1 = ((SSLSession)localObject2).getLocalPrincipal();
          }
        }
      }
    }
    return localObject1;
  }
}
