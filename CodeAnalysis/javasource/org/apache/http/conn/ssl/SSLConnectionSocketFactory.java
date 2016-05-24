package org.apache.http.conn.ssl;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import org.apache.http.HttpHost;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.TextUtils;

@ThreadSafe
public class SSLConnectionSocketFactory
  implements LayeredConnectionSocketFactory
{
  public static final X509HostnameVerifier ALLOW_ALL_HOSTNAME_VERIFIER = new AllowAllHostnameVerifier();
  public static final X509HostnameVerifier BROWSER_COMPATIBLE_HOSTNAME_VERIFIER = new BrowserCompatHostnameVerifier();
  public static final String SSL = "SSL";
  public static final String SSLV2 = "SSLv2";
  public static final X509HostnameVerifier STRICT_HOSTNAME_VERIFIER = new StrictHostnameVerifier();
  public static final String TLS = "TLS";
  private final X509HostnameVerifier hostnameVerifier;
  private final SSLSocketFactory socketfactory;
  private final String[] supportedCipherSuites;
  private final String[] supportedProtocols;
  
  public SSLConnectionSocketFactory(SSLContext paramSSLContext)
  {
    this(paramSSLContext, BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
  }
  
  public SSLConnectionSocketFactory(SSLContext paramSSLContext, X509HostnameVerifier paramX509HostnameVerifier)
  {
    this(((SSLContext)Args.notNull(paramSSLContext, "SSL context")).getSocketFactory(), null, null, paramX509HostnameVerifier);
  }
  
  public SSLConnectionSocketFactory(SSLContext paramSSLContext, String[] paramArrayOfString1, String[] paramArrayOfString2, X509HostnameVerifier paramX509HostnameVerifier)
  {
    this(((SSLContext)Args.notNull(paramSSLContext, "SSL context")).getSocketFactory(), paramArrayOfString1, paramArrayOfString2, paramX509HostnameVerifier);
  }
  
  public SSLConnectionSocketFactory(SSLSocketFactory paramSSLSocketFactory, X509HostnameVerifier paramX509HostnameVerifier)
  {
    this(paramSSLSocketFactory, null, null, paramX509HostnameVerifier);
  }
  
  public SSLConnectionSocketFactory(SSLSocketFactory paramSSLSocketFactory, String[] paramArrayOfString1, String[] paramArrayOfString2, X509HostnameVerifier paramX509HostnameVerifier)
  {
    socketfactory = ((SSLSocketFactory)Args.notNull(paramSSLSocketFactory, "SSL socket factory"));
    supportedProtocols = paramArrayOfString1;
    supportedCipherSuites = paramArrayOfString2;
    if (paramX509HostnameVerifier != null) {}
    for (;;)
    {
      hostnameVerifier = paramX509HostnameVerifier;
      return;
      paramX509HostnameVerifier = BROWSER_COMPATIBLE_HOSTNAME_VERIFIER;
    }
  }
  
  public static SSLConnectionSocketFactory getSocketFactory()
    throws SSLInitializationException
  {
    return new SSLConnectionSocketFactory(SSLContexts.createDefault(), BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
  }
  
  public static SSLConnectionSocketFactory getSystemSocketFactory()
    throws SSLInitializationException
  {
    return new SSLConnectionSocketFactory((SSLSocketFactory)SSLSocketFactory.getDefault(), split(System.getProperty("https.protocols")), split(System.getProperty("https.cipherSuites")), BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);
  }
  
  private void internalPrepareSocket(SSLSocket paramSSLSocket)
    throws IOException
  {
    if (supportedProtocols != null) {
      paramSSLSocket.setEnabledProtocols(supportedProtocols);
    }
    if (supportedCipherSuites != null) {
      paramSSLSocket.setEnabledCipherSuites(supportedCipherSuites);
    }
    prepareSocket(paramSSLSocket);
  }
  
  private static String[] split(String paramString)
  {
    if (TextUtils.isBlank(paramString)) {
      return null;
    }
    return paramString.split(" *, *");
  }
  
  private void verifyHostname(SSLSocket paramSSLSocket, String paramString)
    throws IOException
  {
    try
    {
      hostnameVerifier.verify(paramString, paramSSLSocket);
      return;
    }
    catch (IOException paramString) {}
    try
    {
      paramSSLSocket.close();
      throw paramString;
    }
    catch (Exception paramSSLSocket)
    {
      for (;;) {}
    }
  }
  
  public Socket connectSocket(int paramInt, Socket paramSocket, HttpHost paramHttpHost, InetSocketAddress paramInetSocketAddress1, InetSocketAddress paramInetSocketAddress2, HttpContext paramHttpContext)
    throws IOException
  {
    Args.notNull(paramHttpHost, "HTTP host");
    Args.notNull(paramInetSocketAddress1, "Remote address");
    if (paramSocket != null) {}
    for (;;)
    {
      if (paramInetSocketAddress2 != null) {
        paramSocket.bind(paramInetSocketAddress2);
      }
      try
      {
        paramSocket.connect(paramInetSocketAddress1, paramInt);
        if (!(paramSocket instanceof SSLSocket)) {
          break;
        }
        paramInetSocketAddress1 = (SSLSocket)paramSocket;
        paramInetSocketAddress1.startHandshake();
        verifyHostname(paramInetSocketAddress1, paramHttpHost.getHostName());
        return paramSocket;
      }
      catch (IOException paramHttpHost) {}
      paramSocket = createSocket(paramHttpContext);
    }
    try
    {
      paramSocket.close();
      throw paramHttpHost;
      return createLayeredSocket(paramSocket, paramHttpHost.getHostName(), paramInetSocketAddress1.getPort(), paramHttpContext);
    }
    catch (IOException paramSocket)
    {
      for (;;) {}
    }
  }
  
  public Socket createLayeredSocket(Socket paramSocket, String paramString, int paramInt, HttpContext paramHttpContext)
    throws IOException
  {
    paramSocket = (SSLSocket)socketfactory.createSocket(paramSocket, paramString, paramInt, true);
    internalPrepareSocket(paramSocket);
    paramSocket.startHandshake();
    verifyHostname(paramSocket, paramString);
    return paramSocket;
  }
  
  public Socket createSocket(HttpContext paramHttpContext)
    throws IOException
  {
    paramHttpContext = (SSLSocket)socketfactory.createSocket();
    internalPrepareSocket(paramHttpContext);
    return paramHttpContext;
  }
  
  X509HostnameVerifier getHostnameVerifier()
  {
    return hostnameVerifier;
  }
  
  protected void prepareSocket(SSLSocket paramSSLSocket)
    throws IOException
  {}
}
