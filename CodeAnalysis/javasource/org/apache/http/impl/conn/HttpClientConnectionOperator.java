package org.apache.http.impl.conn;

import java.io.IOException;
import java.net.ConnectException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketTimeoutException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpHost;
import org.apache.http.annotation.Immutable;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.config.Lookup;
import org.apache.http.config.SocketConfig;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.conn.DnsResolver;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.HttpHostConnectException;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.conn.SchemePortResolver;
import org.apache.http.conn.UnsupportedSchemeException;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
class HttpClientConnectionOperator
{
  static final String SOCKET_FACTORY_REGISTRY = "http.socket-factory-registry";
  private final DnsResolver dnsResolver;
  private final Log log = LogFactory.getLog(HttpClientConnectionManager.class);
  private final SchemePortResolver schemePortResolver;
  private final Lookup<ConnectionSocketFactory> socketFactoryRegistry;
  
  HttpClientConnectionOperator(Lookup<ConnectionSocketFactory> paramLookup, SchemePortResolver paramSchemePortResolver, DnsResolver paramDnsResolver)
  {
    Args.notNull(paramLookup, "Socket factory registry");
    socketFactoryRegistry = paramLookup;
    if (paramSchemePortResolver != null)
    {
      schemePortResolver = paramSchemePortResolver;
      if (paramDnsResolver == null) {
        break label51;
      }
    }
    for (;;)
    {
      dnsResolver = paramDnsResolver;
      return;
      paramSchemePortResolver = DefaultSchemePortResolver.INSTANCE;
      break;
      label51:
      paramDnsResolver = SystemDefaultDnsResolver.INSTANCE;
    }
  }
  
  private Lookup<ConnectionSocketFactory> getSocketFactoryRegistry(HttpContext paramHttpContext)
  {
    Lookup localLookup = (Lookup)paramHttpContext.getAttribute("http.socket-factory-registry");
    paramHttpContext = localLookup;
    if (localLookup == null) {
      paramHttpContext = socketFactoryRegistry;
    }
    return paramHttpContext;
  }
  
  public void connect(ManagedHttpClientConnection paramManagedHttpClientConnection, HttpHost paramHttpHost, InetSocketAddress paramInetSocketAddress, int paramInt, SocketConfig paramSocketConfig, HttpContext paramHttpContext)
    throws IOException
  {
    ConnectionSocketFactory localConnectionSocketFactory = (ConnectionSocketFactory)getSocketFactoryRegistry(paramHttpContext).lookup(paramHttpHost.getSchemeName());
    if (localConnectionSocketFactory == null) {
      throw new UnsupportedSchemeException(paramHttpHost.getSchemeName() + " protocol is not supported");
    }
    InetAddress[] arrayOfInetAddress = dnsResolver.resolve(paramHttpHost.getHostName());
    int k = schemePortResolver.resolve(paramHttpHost);
    int i = 0;
    for (;;)
    {
      Object localObject;
      int j;
      Socket localSocket;
      if (i < arrayOfInetAddress.length)
      {
        localObject = arrayOfInetAddress[i];
        if (i != arrayOfInetAddress.length - 1) {
          break label283;
        }
        j = 1;
        localSocket = localConnectionSocketFactory.createSocket(paramHttpContext);
        localSocket.setReuseAddress(paramSocketConfig.isSoReuseAddress());
        paramManagedHttpClientConnection.bind(localSocket);
        localObject = new InetSocketAddress((InetAddress)localObject, k);
        if (log.isDebugEnabled()) {
          log.debug("Connecting to " + localObject);
        }
      }
      try
      {
        localSocket.setSoTimeout(paramSocketConfig.getSoTimeout());
        localSocket = localConnectionSocketFactory.connectSocket(paramInt, localSocket, paramHttpHost, (InetSocketAddress)localObject, paramInetSocketAddress, paramHttpContext);
        localSocket.setTcpNoDelay(paramSocketConfig.isTcpNoDelay());
        localSocket.setKeepAlive(paramSocketConfig.isSoKeepAlive());
        int m = paramSocketConfig.getSoLinger();
        if (m >= 0) {
          if (m <= 0) {
            break label289;
          }
        }
        label283:
        label289:
        for (boolean bool = true;; bool = false)
        {
          localSocket.setSoLinger(bool, m);
          paramManagedHttpClientConnection.bind(localSocket);
          return;
          j = 0;
          break;
        }
      }
      catch (SocketTimeoutException localSocketTimeoutException)
      {
        if (j != 0) {
          throw new ConnectTimeoutException(localSocketTimeoutException, paramHttpHost, arrayOfInetAddress);
        }
      }
      catch (ConnectException localConnectException)
      {
        if (j != 0)
        {
          if ("Connection timed out".equals(localConnectException.getMessage())) {
            throw new ConnectTimeoutException(localConnectException, paramHttpHost, arrayOfInetAddress);
          }
          throw new HttpHostConnectException(localConnectException, paramHttpHost, arrayOfInetAddress);
        }
        if (log.isDebugEnabled()) {
          log.debug("Connect to " + localObject + " timed out. " + "Connection will be retried using another IP address");
        }
        i += 1;
      }
    }
  }
  
  public void upgrade(ManagedHttpClientConnection paramManagedHttpClientConnection, HttpHost paramHttpHost, HttpContext paramHttpContext)
    throws IOException
  {
    Object localObject = (ConnectionSocketFactory)getSocketFactoryRegistry(HttpClientContext.adapt(paramHttpContext)).lookup(paramHttpHost.getSchemeName());
    if (localObject == null) {
      throw new UnsupportedSchemeException(paramHttpHost.getSchemeName() + " protocol is not supported");
    }
    if (!(localObject instanceof LayeredConnectionSocketFactory)) {
      throw new UnsupportedSchemeException(paramHttpHost.getSchemeName() + " protocol does not support connection upgrade");
    }
    localObject = (LayeredConnectionSocketFactory)localObject;
    Socket localSocket = paramManagedHttpClientConnection.getSocket();
    int i = schemePortResolver.resolve(paramHttpHost);
    paramManagedHttpClientConnection.bind(((LayeredConnectionSocketFactory)localObject).createLayeredSocket(localSocket, paramHttpHost.getHostName(), i, paramHttpContext));
  }
}
