package org.apache.http.impl.conn;

import java.io.IOException;
import java.net.ConnectException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpHost;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.conn.ClientConnectionOperator;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.conn.DnsResolver;
import org.apache.http.conn.HttpInetSocketAddress;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeLayeredSocketFactory;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.scheme.SchemeSocketFactory;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
@ThreadSafe
public class DefaultClientConnectionOperator
  implements ClientConnectionOperator
{
  protected final DnsResolver dnsResolver;
  private final Log log = LogFactory.getLog(getClass());
  protected final SchemeRegistry schemeRegistry;
  
  public DefaultClientConnectionOperator(SchemeRegistry paramSchemeRegistry)
  {
    Args.notNull(paramSchemeRegistry, "Scheme registry");
    schemeRegistry = paramSchemeRegistry;
    dnsResolver = new SystemDefaultDnsResolver();
  }
  
  public DefaultClientConnectionOperator(SchemeRegistry paramSchemeRegistry, DnsResolver paramDnsResolver)
  {
    Args.notNull(paramSchemeRegistry, "Scheme registry");
    Args.notNull(paramDnsResolver, "DNS resolver");
    schemeRegistry = paramSchemeRegistry;
    dnsResolver = paramDnsResolver;
  }
  
  private SchemeRegistry getSchemeRegistry(HttpContext paramHttpContext)
  {
    SchemeRegistry localSchemeRegistry = (SchemeRegistry)paramHttpContext.getAttribute("http.scheme-registry");
    paramHttpContext = localSchemeRegistry;
    if (localSchemeRegistry == null) {
      paramHttpContext = schemeRegistry;
    }
    return paramHttpContext;
  }
  
  public OperatedClientConnection createConnection()
  {
    return new DefaultClientConnection();
  }
  
  public void openConnection(OperatedClientConnection paramOperatedClientConnection, HttpHost paramHttpHost, InetAddress paramInetAddress, HttpContext paramHttpContext, HttpParams paramHttpParams)
    throws IOException
  {
    Args.notNull(paramOperatedClientConnection, "Connection");
    Args.notNull(paramHttpHost, "Target host");
    Args.notNull(paramHttpParams, "HTTP parameters");
    boolean bool;
    Object localObject;
    SchemeSocketFactory localSchemeSocketFactory;
    InetAddress[] arrayOfInetAddress;
    int k;
    int i;
    if (!paramOperatedClientConnection.isOpen())
    {
      bool = true;
      Asserts.check(bool, "Connection must not be open");
      localObject = getSchemeRegistry(paramHttpContext).getScheme(paramHttpHost.getSchemeName());
      localSchemeSocketFactory = ((Scheme)localObject).getSchemeSocketFactory();
      arrayOfInetAddress = resolveHostname(paramHttpHost.getHostName());
      k = ((Scheme)localObject).resolvePort(paramHttpHost.getPort());
      i = 0;
    }
    int j;
    HttpInetSocketAddress localHttpInetSocketAddress;
    label283:
    label309:
    label360:
    for (;;)
    {
      if (i < arrayOfInetAddress.length)
      {
        localObject = arrayOfInetAddress[i];
        if (i != arrayOfInetAddress.length - 1) {
          break label283;
        }
      }
      for (j = 1;; j = 0)
      {
        Socket localSocket1 = localSchemeSocketFactory.createSocket(paramHttpParams);
        paramOperatedClientConnection.opening(localSocket1, paramHttpHost);
        localHttpInetSocketAddress = new HttpInetSocketAddress(paramHttpHost, (InetAddress)localObject, k);
        localObject = null;
        if (paramInetAddress != null) {
          localObject = new InetSocketAddress(paramInetAddress, 0);
        }
        if (log.isDebugEnabled()) {
          log.debug("Connecting to " + localHttpInetSocketAddress);
        }
        try
        {
          Socket localSocket2 = localSchemeSocketFactory.connectSocket(localSocket1, localHttpInetSocketAddress, (InetSocketAddress)localObject, paramHttpParams);
          localObject = localSocket1;
          if (localSocket1 != localSocket2)
          {
            localObject = localSocket2;
            paramOperatedClientConnection.opening((Socket)localObject, paramHttpHost);
          }
          prepareSocket((Socket)localObject, paramHttpContext, paramHttpParams);
          paramOperatedClientConnection.openCompleted(localSchemeSocketFactory.isSecure((Socket)localObject), paramHttpParams);
          return;
        }
        catch (ConnectException localConnectException)
        {
          if (j == 0) {
            break label309;
          }
          throw localConnectException;
        }
        catch (ConnectTimeoutException localConnectTimeoutException)
        {
          if (j == 0) {
            break label309;
          }
          throw localConnectTimeoutException;
          if (!log.isDebugEnabled()) {
            break label360;
          }
          log.debug("Connect to " + localHttpInetSocketAddress + " timed out. " + "Connection will be retried using another IP address");
          i += 1;
        }
        bool = false;
        break;
      }
    }
  }
  
  protected void prepareSocket(Socket paramSocket, HttpContext paramHttpContext, HttpParams paramHttpParams)
    throws IOException
  {
    paramSocket.setTcpNoDelay(HttpConnectionParams.getTcpNoDelay(paramHttpParams));
    paramSocket.setSoTimeout(HttpConnectionParams.getSoTimeout(paramHttpParams));
    int i = HttpConnectionParams.getLinger(paramHttpParams);
    if (i >= 0) {
      if (i <= 0) {
        break label44;
      }
    }
    label44:
    for (boolean bool = true;; bool = false)
    {
      paramSocket.setSoLinger(bool, i);
      return;
    }
  }
  
  protected InetAddress[] resolveHostname(String paramString)
    throws UnknownHostException
  {
    return dnsResolver.resolve(paramString);
  }
  
  public void updateSecureConnection(OperatedClientConnection paramOperatedClientConnection, HttpHost paramHttpHost, HttpContext paramHttpContext, HttpParams paramHttpParams)
    throws IOException
  {
    Args.notNull(paramOperatedClientConnection, "Connection");
    Args.notNull(paramHttpHost, "Target host");
    Args.notNull(paramHttpParams, "Parameters");
    Asserts.check(paramOperatedClientConnection.isOpen(), "Connection must be open");
    Object localObject = getSchemeRegistry(paramHttpContext).getScheme(paramHttpHost.getSchemeName());
    Asserts.check(((Scheme)localObject).getSchemeSocketFactory() instanceof LayeredConnectionSocketFactory, "Socket factory must implement SchemeLayeredSocketFactory");
    SchemeLayeredSocketFactory localSchemeLayeredSocketFactory = (SchemeLayeredSocketFactory)((Scheme)localObject).getSchemeSocketFactory();
    localObject = localSchemeLayeredSocketFactory.createLayeredSocket(paramOperatedClientConnection.getSocket(), paramHttpHost.getHostName(), ((Scheme)localObject).resolvePort(paramHttpHost.getPort()), paramHttpParams);
    prepareSocket((Socket)localObject, paramHttpContext, paramHttpParams);
    paramOperatedClientConnection.update((Socket)localObject, paramHttpHost, localSchemeLayeredSocketFactory.isSecure((Socket)localObject), paramHttpParams);
  }
}
