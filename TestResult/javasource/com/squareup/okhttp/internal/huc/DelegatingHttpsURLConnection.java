package com.squareup.okhttp.internal.huc;

import com.squareup.okhttp.Handshake;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.security.Permission;
import java.security.Principal;
import java.security.cert.Certificate;
import java.util.List;
import java.util.Map;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLPeerUnverifiedException;

abstract class DelegatingHttpsURLConnection
  extends HttpsURLConnection
{
  private final HttpURLConnection delegate;
  
  public DelegatingHttpsURLConnection(HttpURLConnection paramHttpURLConnection)
  {
    super(paramHttpURLConnection.getURL());
    delegate = paramHttpURLConnection;
  }
  
  public void addRequestProperty(String paramString1, String paramString2)
  {
    delegate.addRequestProperty(paramString1, paramString2);
  }
  
  public void connect()
    throws IOException
  {
    connected = true;
    delegate.connect();
  }
  
  public void disconnect()
  {
    delegate.disconnect();
  }
  
  public boolean getAllowUserInteraction()
  {
    return delegate.getAllowUserInteraction();
  }
  
  public String getCipherSuite()
  {
    Handshake localHandshake = handshake();
    if (localHandshake != null) {
      return localHandshake.cipherSuite();
    }
    return null;
  }
  
  public int getConnectTimeout()
  {
    return delegate.getConnectTimeout();
  }
  
  public Object getContent()
    throws IOException
  {
    return delegate.getContent();
  }
  
  public Object getContent(Class[] paramArrayOfClass)
    throws IOException
  {
    return delegate.getContent(paramArrayOfClass);
  }
  
  public String getContentEncoding()
  {
    return delegate.getContentEncoding();
  }
  
  public int getContentLength()
  {
    return delegate.getContentLength();
  }
  
  public String getContentType()
  {
    return delegate.getContentType();
  }
  
  public long getDate()
  {
    return delegate.getDate();
  }
  
  public boolean getDefaultUseCaches()
  {
    return delegate.getDefaultUseCaches();
  }
  
  public boolean getDoInput()
  {
    return delegate.getDoInput();
  }
  
  public boolean getDoOutput()
  {
    return delegate.getDoOutput();
  }
  
  public InputStream getErrorStream()
  {
    return delegate.getErrorStream();
  }
  
  public long getExpiration()
  {
    return delegate.getExpiration();
  }
  
  public String getHeaderField(int paramInt)
  {
    return delegate.getHeaderField(paramInt);
  }
  
  public String getHeaderField(String paramString)
  {
    return delegate.getHeaderField(paramString);
  }
  
  public long getHeaderFieldDate(String paramString, long paramLong)
  {
    return delegate.getHeaderFieldDate(paramString, paramLong);
  }
  
  public int getHeaderFieldInt(String paramString, int paramInt)
  {
    return delegate.getHeaderFieldInt(paramString, paramInt);
  }
  
  public String getHeaderFieldKey(int paramInt)
  {
    return delegate.getHeaderFieldKey(paramInt);
  }
  
  public Map<String, List<String>> getHeaderFields()
  {
    return delegate.getHeaderFields();
  }
  
  public long getIfModifiedSince()
  {
    return delegate.getIfModifiedSince();
  }
  
  public InputStream getInputStream()
    throws IOException
  {
    return delegate.getInputStream();
  }
  
  public boolean getInstanceFollowRedirects()
  {
    return delegate.getInstanceFollowRedirects();
  }
  
  public long getLastModified()
  {
    return delegate.getLastModified();
  }
  
  public Certificate[] getLocalCertificates()
  {
    Object localObject = handshake();
    if (localObject == null) {}
    do
    {
      return null;
      localObject = ((Handshake)localObject).localCertificates();
    } while (((List)localObject).isEmpty());
    return (Certificate[])((List)localObject).toArray(new Certificate[((List)localObject).size()]);
  }
  
  public Principal getLocalPrincipal()
  {
    Handshake localHandshake = handshake();
    if (localHandshake != null) {
      return localHandshake.localPrincipal();
    }
    return null;
  }
  
  public OutputStream getOutputStream()
    throws IOException
  {
    return delegate.getOutputStream();
  }
  
  public Principal getPeerPrincipal()
    throws SSLPeerUnverifiedException
  {
    Handshake localHandshake = handshake();
    if (localHandshake != null) {
      return localHandshake.peerPrincipal();
    }
    return null;
  }
  
  public Permission getPermission()
    throws IOException
  {
    return delegate.getPermission();
  }
  
  public int getReadTimeout()
  {
    return delegate.getReadTimeout();
  }
  
  public String getRequestMethod()
  {
    return delegate.getRequestMethod();
  }
  
  public Map<String, List<String>> getRequestProperties()
  {
    return delegate.getRequestProperties();
  }
  
  public String getRequestProperty(String paramString)
  {
    return delegate.getRequestProperty(paramString);
  }
  
  public int getResponseCode()
    throws IOException
  {
    return delegate.getResponseCode();
  }
  
  public String getResponseMessage()
    throws IOException
  {
    return delegate.getResponseMessage();
  }
  
  public Certificate[] getServerCertificates()
    throws SSLPeerUnverifiedException
  {
    Object localObject = handshake();
    if (localObject == null) {}
    do
    {
      return null;
      localObject = ((Handshake)localObject).peerCertificates();
    } while (((List)localObject).isEmpty());
    return (Certificate[])((List)localObject).toArray(new Certificate[((List)localObject).size()]);
  }
  
  public URL getURL()
  {
    return delegate.getURL();
  }
  
  public boolean getUseCaches()
  {
    return delegate.getUseCaches();
  }
  
  protected abstract Handshake handshake();
  
  public void setAllowUserInteraction(boolean paramBoolean)
  {
    delegate.setAllowUserInteraction(paramBoolean);
  }
  
  public void setChunkedStreamingMode(int paramInt)
  {
    delegate.setChunkedStreamingMode(paramInt);
  }
  
  public void setConnectTimeout(int paramInt)
  {
    delegate.setConnectTimeout(paramInt);
  }
  
  public void setDefaultUseCaches(boolean paramBoolean)
  {
    delegate.setDefaultUseCaches(paramBoolean);
  }
  
  public void setDoInput(boolean paramBoolean)
  {
    delegate.setDoInput(paramBoolean);
  }
  
  public void setDoOutput(boolean paramBoolean)
  {
    delegate.setDoOutput(paramBoolean);
  }
  
  public void setFixedLengthStreamingMode(int paramInt)
  {
    delegate.setFixedLengthStreamingMode(paramInt);
  }
  
  public void setIfModifiedSince(long paramLong)
  {
    delegate.setIfModifiedSince(paramLong);
  }
  
  public void setInstanceFollowRedirects(boolean paramBoolean)
  {
    delegate.setInstanceFollowRedirects(paramBoolean);
  }
  
  public void setReadTimeout(int paramInt)
  {
    delegate.setReadTimeout(paramInt);
  }
  
  public void setRequestMethod(String paramString)
    throws ProtocolException
  {
    delegate.setRequestMethod(paramString);
  }
  
  public void setRequestProperty(String paramString1, String paramString2)
  {
    delegate.setRequestProperty(paramString1, paramString2);
  }
  
  public void setUseCaches(boolean paramBoolean)
  {
    delegate.setUseCaches(paramBoolean);
  }
  
  public String toString()
  {
    return delegate.toString();
  }
  
  public boolean usingProxy()
  {
    return delegate.usingProxy();
  }
}
