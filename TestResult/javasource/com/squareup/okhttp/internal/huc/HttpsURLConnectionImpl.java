package com.squareup.okhttp.internal.huc;

import com.squareup.okhttp.Handshake;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.internal.http.HttpEngine;
import java.net.URL;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;

public final class HttpsURLConnectionImpl
  extends DelegatingHttpsURLConnection
{
  private final HttpURLConnectionImpl delegate;
  
  public HttpsURLConnectionImpl(HttpURLConnectionImpl paramHttpURLConnectionImpl)
  {
    super(paramHttpURLConnectionImpl);
    delegate = paramHttpURLConnectionImpl;
  }
  
  public HttpsURLConnectionImpl(URL paramURL, OkHttpClient paramOkHttpClient)
  {
    this(new HttpURLConnectionImpl(paramURL, paramOkHttpClient));
  }
  
  public HostnameVerifier getHostnameVerifier()
  {
    return delegate.client.getHostnameVerifier();
  }
  
  public SSLSocketFactory getSSLSocketFactory()
  {
    return delegate.client.getSslSocketFactory();
  }
  
  protected Handshake handshake()
  {
    if (delegate.httpEngine == null) {
      throw new IllegalStateException("Connection has not yet been established");
    }
    if (delegate.httpEngine.hasResponse()) {
      return delegate.httpEngine.getResponse().handshake();
    }
    return delegate.handshake;
  }
  
  public void setFixedLengthStreamingMode(long paramLong)
  {
    delegate.setFixedLengthStreamingMode(paramLong);
  }
  
  public void setHostnameVerifier(HostnameVerifier paramHostnameVerifier)
  {
    delegate.client.setHostnameVerifier(paramHostnameVerifier);
  }
  
  public void setSSLSocketFactory(SSLSocketFactory paramSSLSocketFactory)
  {
    delegate.client.setSslSocketFactory(paramSSLSocketFactory);
  }
}
