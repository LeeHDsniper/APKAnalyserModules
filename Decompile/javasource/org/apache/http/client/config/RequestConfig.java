package org.apache.http.client.config;

import java.net.InetAddress;
import java.util.Collection;
import org.apache.http.HttpHost;

public class RequestConfig
  implements Cloneable
{
  public static final RequestConfig DEFAULT = new Builder().build();
  private final boolean authenticationEnabled;
  private final boolean circularRedirectsAllowed;
  private final int connectTimeout;
  private final int connectionRequestTimeout;
  private final String cookieSpec;
  private final boolean expectContinueEnabled;
  private final InetAddress localAddress;
  private final int maxRedirects;
  private final HttpHost proxy;
  private final Collection<String> proxyPreferredAuthSchemes;
  private final boolean redirectsEnabled;
  private final boolean relativeRedirectsAllowed;
  private final int socketTimeout;
  private final boolean staleConnectionCheckEnabled;
  private final Collection<String> targetPreferredAuthSchemes;
  
  RequestConfig(boolean paramBoolean1, HttpHost paramHttpHost, InetAddress paramInetAddress, boolean paramBoolean2, String paramString, boolean paramBoolean3, boolean paramBoolean4, boolean paramBoolean5, int paramInt1, boolean paramBoolean6, Collection<String> paramCollection1, Collection<String> paramCollection2, int paramInt2, int paramInt3, int paramInt4)
  {
    expectContinueEnabled = paramBoolean1;
    proxy = paramHttpHost;
    localAddress = paramInetAddress;
    staleConnectionCheckEnabled = paramBoolean2;
    cookieSpec = paramString;
    redirectsEnabled = paramBoolean3;
    relativeRedirectsAllowed = paramBoolean4;
    circularRedirectsAllowed = paramBoolean5;
    maxRedirects = paramInt1;
    authenticationEnabled = paramBoolean6;
    targetPreferredAuthSchemes = paramCollection1;
    proxyPreferredAuthSchemes = paramCollection2;
    connectionRequestTimeout = paramInt2;
    connectTimeout = paramInt3;
    socketTimeout = paramInt4;
  }
  
  public static Builder copy(RequestConfig paramRequestConfig)
  {
    return new Builder().setExpectContinueEnabled(paramRequestConfig.isExpectContinueEnabled()).setProxy(paramRequestConfig.getProxy()).setLocalAddress(paramRequestConfig.getLocalAddress()).setStaleConnectionCheckEnabled(paramRequestConfig.isStaleConnectionCheckEnabled()).setCookieSpec(paramRequestConfig.getCookieSpec()).setRedirectsEnabled(paramRequestConfig.isRedirectsEnabled()).setRelativeRedirectsAllowed(paramRequestConfig.isRelativeRedirectsAllowed()).setCircularRedirectsAllowed(paramRequestConfig.isCircularRedirectsAllowed()).setMaxRedirects(paramRequestConfig.getMaxRedirects()).setAuthenticationEnabled(paramRequestConfig.isAuthenticationEnabled()).setTargetPreferredAuthSchemes(paramRequestConfig.getTargetPreferredAuthSchemes()).setProxyPreferredAuthSchemes(paramRequestConfig.getProxyPreferredAuthSchemes()).setConnectionRequestTimeout(paramRequestConfig.getConnectionRequestTimeout()).setConnectTimeout(paramRequestConfig.getConnectTimeout()).setSocketTimeout(paramRequestConfig.getSocketTimeout());
  }
  
  public static Builder custom()
  {
    return new Builder();
  }
  
  protected RequestConfig clone()
    throws CloneNotSupportedException
  {
    return (RequestConfig)super.clone();
  }
  
  public int getConnectTimeout()
  {
    return connectTimeout;
  }
  
  public int getConnectionRequestTimeout()
  {
    return connectionRequestTimeout;
  }
  
  public String getCookieSpec()
  {
    return cookieSpec;
  }
  
  public InetAddress getLocalAddress()
  {
    return localAddress;
  }
  
  public int getMaxRedirects()
  {
    return maxRedirects;
  }
  
  public HttpHost getProxy()
  {
    return proxy;
  }
  
  public Collection<String> getProxyPreferredAuthSchemes()
  {
    return proxyPreferredAuthSchemes;
  }
  
  public int getSocketTimeout()
  {
    return socketTimeout;
  }
  
  public Collection<String> getTargetPreferredAuthSchemes()
  {
    return targetPreferredAuthSchemes;
  }
  
  public boolean isAuthenticationEnabled()
  {
    return authenticationEnabled;
  }
  
  public boolean isCircularRedirectsAllowed()
  {
    return circularRedirectsAllowed;
  }
  
  public boolean isExpectContinueEnabled()
  {
    return expectContinueEnabled;
  }
  
  public boolean isRedirectsEnabled()
  {
    return redirectsEnabled;
  }
  
  public boolean isRelativeRedirectsAllowed()
  {
    return relativeRedirectsAllowed;
  }
  
  public boolean isStaleConnectionCheckEnabled()
  {
    return staleConnectionCheckEnabled;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(", expectContinueEnabled=").append(expectContinueEnabled);
    localStringBuilder.append(", proxy=").append(proxy);
    localStringBuilder.append(", localAddress=").append(localAddress);
    localStringBuilder.append(", staleConnectionCheckEnabled=").append(staleConnectionCheckEnabled);
    localStringBuilder.append(", cookieSpec=").append(cookieSpec);
    localStringBuilder.append(", redirectsEnabled=").append(redirectsEnabled);
    localStringBuilder.append(", relativeRedirectsAllowed=").append(relativeRedirectsAllowed);
    localStringBuilder.append(", maxRedirects=").append(maxRedirects);
    localStringBuilder.append(", circularRedirectsAllowed=").append(circularRedirectsAllowed);
    localStringBuilder.append(", authenticationEnabled=").append(authenticationEnabled);
    localStringBuilder.append(", targetPreferredAuthSchemes=").append(targetPreferredAuthSchemes);
    localStringBuilder.append(", proxyPreferredAuthSchemes=").append(proxyPreferredAuthSchemes);
    localStringBuilder.append(", connectionRequestTimeout=").append(connectionRequestTimeout);
    localStringBuilder.append(", connectTimeout=").append(connectTimeout);
    localStringBuilder.append(", socketTimeout=").append(socketTimeout);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
  
  public static class Builder
  {
    private boolean authenticationEnabled = true;
    private boolean circularRedirectsAllowed;
    private int connectTimeout = -1;
    private int connectionRequestTimeout = -1;
    private String cookieSpec;
    private boolean expectContinueEnabled;
    private InetAddress localAddress;
    private int maxRedirects = 50;
    private HttpHost proxy;
    private Collection<String> proxyPreferredAuthSchemes;
    private boolean redirectsEnabled = true;
    private boolean relativeRedirectsAllowed = true;
    private int socketTimeout = -1;
    private boolean staleConnectionCheckEnabled = true;
    private Collection<String> targetPreferredAuthSchemes;
    
    Builder() {}
    
    public RequestConfig build()
    {
      return new RequestConfig(expectContinueEnabled, proxy, localAddress, staleConnectionCheckEnabled, cookieSpec, redirectsEnabled, relativeRedirectsAllowed, circularRedirectsAllowed, maxRedirects, authenticationEnabled, targetPreferredAuthSchemes, proxyPreferredAuthSchemes, connectionRequestTimeout, connectTimeout, socketTimeout);
    }
    
    public Builder setAuthenticationEnabled(boolean paramBoolean)
    {
      authenticationEnabled = paramBoolean;
      return this;
    }
    
    public Builder setCircularRedirectsAllowed(boolean paramBoolean)
    {
      circularRedirectsAllowed = paramBoolean;
      return this;
    }
    
    public Builder setConnectTimeout(int paramInt)
    {
      connectTimeout = paramInt;
      return this;
    }
    
    public Builder setConnectionRequestTimeout(int paramInt)
    {
      connectionRequestTimeout = paramInt;
      return this;
    }
    
    public Builder setCookieSpec(String paramString)
    {
      cookieSpec = paramString;
      return this;
    }
    
    public Builder setExpectContinueEnabled(boolean paramBoolean)
    {
      expectContinueEnabled = paramBoolean;
      return this;
    }
    
    public Builder setLocalAddress(InetAddress paramInetAddress)
    {
      localAddress = paramInetAddress;
      return this;
    }
    
    public Builder setMaxRedirects(int paramInt)
    {
      maxRedirects = paramInt;
      return this;
    }
    
    public Builder setProxy(HttpHost paramHttpHost)
    {
      proxy = paramHttpHost;
      return this;
    }
    
    public Builder setProxyPreferredAuthSchemes(Collection<String> paramCollection)
    {
      proxyPreferredAuthSchemes = paramCollection;
      return this;
    }
    
    public Builder setRedirectsEnabled(boolean paramBoolean)
    {
      redirectsEnabled = paramBoolean;
      return this;
    }
    
    public Builder setRelativeRedirectsAllowed(boolean paramBoolean)
    {
      relativeRedirectsAllowed = paramBoolean;
      return this;
    }
    
    public Builder setSocketTimeout(int paramInt)
    {
      socketTimeout = paramInt;
      return this;
    }
    
    public Builder setStaleConnectionCheckEnabled(boolean paramBoolean)
    {
      staleConnectionCheckEnabled = paramBoolean;
      return this;
    }
    
    public Builder setTargetPreferredAuthSchemes(Collection<String> paramCollection)
    {
      targetPreferredAuthSchemes = paramCollection;
      return this;
    }
  }
}
