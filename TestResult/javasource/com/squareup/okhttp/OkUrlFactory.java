package com.squareup.okhttp;

import com.squareup.okhttp.internal.huc.HttpURLConnectionImpl;
import com.squareup.okhttp.internal.huc.HttpsURLConnectionImpl;
import java.net.HttpURLConnection;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.net.URLStreamHandlerFactory;

public final class OkUrlFactory
  implements Cloneable, URLStreamHandlerFactory
{
  private final OkHttpClient client;
  
  public OkUrlFactory(OkHttpClient paramOkHttpClient)
  {
    client = paramOkHttpClient;
  }
  
  public OkUrlFactory clone()
  {
    return new OkUrlFactory(client.clone());
  }
  
  public URLStreamHandler createURLStreamHandler(final String paramString)
  {
    if ((!paramString.equals("http")) && (!paramString.equals("https"))) {
      return null;
    }
    new URLStreamHandler()
    {
      protected int getDefaultPort()
      {
        if (paramString.equals("http")) {
          return 80;
        }
        if (paramString.equals("https")) {
          return 443;
        }
        throw new AssertionError();
      }
      
      protected URLConnection openConnection(URL paramAnonymousURL)
      {
        return open(paramAnonymousURL);
      }
      
      protected URLConnection openConnection(URL paramAnonymousURL, Proxy paramAnonymousProxy)
      {
        return open(paramAnonymousURL, paramAnonymousProxy);
      }
    };
  }
  
  public HttpURLConnection open(URL paramURL)
  {
    return open(paramURL, client.getProxy());
  }
  
  HttpURLConnection open(URL paramURL, Proxy paramProxy)
  {
    String str = paramURL.getProtocol();
    OkHttpClient localOkHttpClient = client.copyWithDefaults();
    localOkHttpClient.setProxy(paramProxy);
    if (str.equals("http")) {
      return new HttpURLConnectionImpl(paramURL, localOkHttpClient);
    }
    if (str.equals("https")) {
      return new HttpsURLConnectionImpl(paramURL, localOkHttpClient);
    }
    throw new IllegalArgumentException("Unexpected protocol: " + str);
  }
}
