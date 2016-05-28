package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.net.Proxy;
import java.util.List;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;

public final class Address
{
  final Authenticator authenticator;
  final CertificatePinner certificatePinner;
  final List<ConnectionSpec> connectionSpecs;
  final HostnameVerifier hostnameVerifier;
  final List<Protocol> protocols;
  final Proxy proxy;
  final SocketFactory socketFactory;
  final SSLSocketFactory sslSocketFactory;
  final String uriHost;
  final int uriPort;
  
  public Address(String paramString, int paramInt, SocketFactory paramSocketFactory, SSLSocketFactory paramSSLSocketFactory, HostnameVerifier paramHostnameVerifier, CertificatePinner paramCertificatePinner, Authenticator paramAuthenticator, Proxy paramProxy, List<Protocol> paramList, List<ConnectionSpec> paramList1)
  {
    if (paramString == null) {
      throw new NullPointerException("uriHost == null");
    }
    if (paramInt <= 0) {
      throw new IllegalArgumentException("uriPort <= 0: " + paramInt);
    }
    if (paramAuthenticator == null) {
      throw new IllegalArgumentException("authenticator == null");
    }
    if (paramList == null) {
      throw new IllegalArgumentException("protocols == null");
    }
    proxy = paramProxy;
    uriHost = paramString;
    uriPort = paramInt;
    socketFactory = paramSocketFactory;
    sslSocketFactory = paramSSLSocketFactory;
    hostnameVerifier = paramHostnameVerifier;
    certificatePinner = paramCertificatePinner;
    authenticator = paramAuthenticator;
    protocols = Util.immutableList(paramList);
    connectionSpecs = Util.immutableList(paramList1);
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Address))
    {
      paramObject = (Address)paramObject;
      bool1 = bool2;
      if (Util.equal(proxy, proxy))
      {
        bool1 = bool2;
        if (uriHost.equals(uriHost))
        {
          bool1 = bool2;
          if (uriPort == uriPort)
          {
            bool1 = bool2;
            if (Util.equal(sslSocketFactory, sslSocketFactory))
            {
              bool1 = bool2;
              if (Util.equal(hostnameVerifier, hostnameVerifier))
              {
                bool1 = bool2;
                if (Util.equal(certificatePinner, certificatePinner))
                {
                  bool1 = bool2;
                  if (Util.equal(authenticator, authenticator))
                  {
                    bool1 = bool2;
                    if (Util.equal(protocols, protocols)) {
                      bool1 = true;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    return bool1;
  }
  
  public List<ConnectionSpec> getConnectionSpecs()
  {
    return connectionSpecs;
  }
  
  public Proxy getProxy()
  {
    return proxy;
  }
  
  public String getUriHost()
  {
    return uriHost;
  }
  
  public int hashCode()
  {
    int m = 0;
    int n = uriHost.hashCode();
    int i1 = uriPort;
    int i;
    int j;
    if (sslSocketFactory != null)
    {
      i = sslSocketFactory.hashCode();
      if (hostnameVerifier == null) {
        break label146;
      }
      j = hostnameVerifier.hashCode();
      label48:
      if (certificatePinner == null) {
        break label151;
      }
    }
    label146:
    label151:
    for (int k = certificatePinner.hashCode();; k = 0)
    {
      int i2 = authenticator.hashCode();
      if (proxy != null) {
        m = proxy.hashCode();
      }
      return (((((((n + 527) * 31 + i1) * 31 + i) * 31 + j) * 31 + k) * 31 + i2) * 31 + m) * 31 + protocols.hashCode();
      i = 0;
      break;
      j = 0;
      break label48;
    }
  }
}
