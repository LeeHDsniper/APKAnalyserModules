package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Challenge;
import com.squareup.okhttp.Credentials;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Request.Builder;
import com.squareup.okhttp.Response;
import java.io.IOException;
import java.net.Authenticator.RequestorType;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.PasswordAuthentication;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.net.URL;
import java.util.List;

public final class AuthenticatorAdapter
  implements com.squareup.okhttp.Authenticator
{
  public static final com.squareup.okhttp.Authenticator INSTANCE = new AuthenticatorAdapter();
  
  public AuthenticatorAdapter() {}
  
  private InetAddress getConnectToInetAddress(Proxy paramProxy, URL paramURL)
    throws IOException
  {
    if ((paramProxy != null) && (paramProxy.type() != Proxy.Type.DIRECT)) {
      return ((InetSocketAddress)paramProxy.address()).getAddress();
    }
    return InetAddress.getByName(paramURL.getHost());
  }
  
  public Request authenticate(Proxy paramProxy, Response paramResponse)
    throws IOException
  {
    List localList = paramResponse.challenges();
    paramResponse = paramResponse.request();
    URL localURL = paramResponse.url();
    int i = 0;
    int j = localList.size();
    if (i < j)
    {
      Object localObject = (Challenge)localList.get(i);
      if (!"Basic".equalsIgnoreCase(((Challenge)localObject).getScheme())) {}
      do
      {
        i += 1;
        break;
        localObject = java.net.Authenticator.requestPasswordAuthentication(localURL.getHost(), getConnectToInetAddress(paramProxy, localURL), localURL.getPort(), localURL.getProtocol(), ((Challenge)localObject).getRealm(), ((Challenge)localObject).getScheme(), localURL, Authenticator.RequestorType.SERVER);
      } while (localObject == null);
      paramProxy = Credentials.basic(((PasswordAuthentication)localObject).getUserName(), new String(((PasswordAuthentication)localObject).getPassword()));
      return paramResponse.newBuilder().header("Authorization", paramProxy).build();
    }
    return null;
  }
  
  public Request authenticateProxy(Proxy paramProxy, Response paramResponse)
    throws IOException
  {
    List localList = paramResponse.challenges();
    paramResponse = paramResponse.request();
    URL localURL = paramResponse.url();
    int i = 0;
    int j = localList.size();
    if (i < j)
    {
      Object localObject = (Challenge)localList.get(i);
      if (!"Basic".equalsIgnoreCase(((Challenge)localObject).getScheme())) {}
      do
      {
        i += 1;
        break;
        InetSocketAddress localInetSocketAddress = (InetSocketAddress)paramProxy.address();
        localObject = java.net.Authenticator.requestPasswordAuthentication(localInetSocketAddress.getHostName(), getConnectToInetAddress(paramProxy, localURL), localInetSocketAddress.getPort(), localURL.getProtocol(), ((Challenge)localObject).getRealm(), ((Challenge)localObject).getScheme(), localURL, Authenticator.RequestorType.PROXY);
      } while (localObject == null);
      paramProxy = Credentials.basic(((PasswordAuthentication)localObject).getUserName(), new String(((PasswordAuthentication)localObject).getPassword()));
      return paramResponse.newBuilder().header("Proxy-Authorization", paramProxy).build();
    }
    return null;
  }
}
