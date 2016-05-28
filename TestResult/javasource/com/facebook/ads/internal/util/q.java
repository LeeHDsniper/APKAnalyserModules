package com.facebook.ads.internal.util;

import java.net.Socket;
import java.security.KeyStore;
import java.security.cert.X509Certificate;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

public class q
  extends org.apache.http.conn.ssl.SSLSocketFactory
{
  SSLContext a = SSLContext.getInstance("TLS");
  
  public q(KeyStore paramKeyStore)
  {
    super(paramKeyStore);
    paramKeyStore = new X509TrustManager()
    {
      public void checkClientTrusted(X509Certificate[] paramAnonymousArrayOfX509Certificate, String paramAnonymousString) {}
      
      public void checkServerTrusted(X509Certificate[] paramAnonymousArrayOfX509Certificate, String paramAnonymousString) {}
      
      public X509Certificate[] getAcceptedIssuers()
      {
        return null;
      }
    };
    a.init(null, new TrustManager[] { paramKeyStore }, null);
  }
  
  public Socket createSocket()
  {
    return a.getSocketFactory().createSocket();
  }
  
  public Socket createSocket(Socket paramSocket, String paramString, int paramInt, boolean paramBoolean)
  {
    return a.getSocketFactory().createSocket(paramSocket, paramString, paramInt, paramBoolean);
  }
}
