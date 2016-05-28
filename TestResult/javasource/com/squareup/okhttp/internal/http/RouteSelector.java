package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Address;
import com.squareup.okhttp.CertificatePinner;
import com.squareup.okhttp.Connection;
import com.squareup.okhttp.ConnectionPool;
import com.squareup.okhttp.ConnectionSpec;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Route;
import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.Network;
import com.squareup.okhttp.internal.RouteDatabase;
import com.squareup.okhttp.internal.Util;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.net.ProxySelector;
import java.net.Socket;
import java.net.SocketException;
import java.net.URI;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLProtocolException;
import javax.net.ssl.SSLSocketFactory;

public final class RouteSelector
{
  private final Address address;
  private final OkHttpClient client;
  private List<ConnectionSpec> connectionSpecs = Collections.emptyList();
  private List<InetSocketAddress> inetSocketAddresses = Collections.emptyList();
  private InetSocketAddress lastInetSocketAddress;
  private Proxy lastProxy;
  private ConnectionSpec lastSpec;
  private final Network network;
  private int nextInetSocketAddressIndex;
  private int nextProxyIndex;
  private int nextSpecIndex;
  private final ConnectionPool pool;
  private final List<Route> postponedRoutes = new ArrayList();
  private List<Proxy> proxies = Collections.emptyList();
  private final ProxySelector proxySelector;
  private final Request request;
  private final RouteDatabase routeDatabase;
  private final URI uri;
  
  private RouteSelector(Address paramAddress, URI paramURI, OkHttpClient paramOkHttpClient, Request paramRequest)
  {
    address = paramAddress;
    uri = paramURI;
    client = paramOkHttpClient;
    proxySelector = paramOkHttpClient.getProxySelector();
    pool = paramOkHttpClient.getConnectionPool();
    routeDatabase = Internal.instance.routeDatabase(paramOkHttpClient);
    network = Internal.instance.network(paramOkHttpClient);
    request = paramRequest;
    resetNextProxy(paramURI, paramAddress.getProxy());
  }
  
  public static RouteSelector get(Request paramRequest, OkHttpClient paramOkHttpClient)
    throws IOException
  {
    String str = paramRequest.url().getHost();
    if ((str == null) || (str.length() == 0)) {
      throw new UnknownHostException(paramRequest.url().toString());
    }
    SSLSocketFactory localSSLSocketFactory = null;
    HostnameVerifier localHostnameVerifier = null;
    CertificatePinner localCertificatePinner = null;
    if (paramRequest.isHttps())
    {
      localSSLSocketFactory = paramOkHttpClient.getSslSocketFactory();
      localHostnameVerifier = paramOkHttpClient.getHostnameVerifier();
      localCertificatePinner = paramOkHttpClient.getCertificatePinner();
    }
    return new RouteSelector(new Address(str, Util.getEffectivePort(paramRequest.url()), paramOkHttpClient.getSocketFactory(), localSSLSocketFactory, localHostnameVerifier, localCertificatePinner, paramOkHttpClient.getAuthenticator(), paramOkHttpClient.getProxy(), paramOkHttpClient.getProtocols(), paramOkHttpClient.getConnectionSpecs()), paramRequest.uri(), paramOkHttpClient, paramRequest);
  }
  
  private boolean hasNextConnectionSpec()
  {
    return nextSpecIndex < connectionSpecs.size();
  }
  
  private boolean hasNextInetSocketAddress()
  {
    return nextInetSocketAddressIndex < inetSocketAddresses.size();
  }
  
  private boolean hasNextPostponed()
  {
    return !postponedRoutes.isEmpty();
  }
  
  private boolean hasNextProxy()
  {
    return nextProxyIndex < proxies.size();
  }
  
  private ConnectionSpec nextConnectionSpec()
    throws IOException
  {
    if (!hasNextConnectionSpec()) {
      throw new SocketException("No route to " + address.getUriHost() + "; exhausted connection specs: " + connectionSpecs);
    }
    List localList = connectionSpecs;
    int i = nextSpecIndex;
    nextSpecIndex = (i + 1);
    return (ConnectionSpec)localList.get(i);
  }
  
  private InetSocketAddress nextInetSocketAddress()
    throws IOException
  {
    if (!hasNextInetSocketAddress()) {
      throw new SocketException("No route to " + address.getUriHost() + "; exhausted inet socket addresses: " + inetSocketAddresses);
    }
    Object localObject = inetSocketAddresses;
    int i = nextInetSocketAddressIndex;
    nextInetSocketAddressIndex = (i + 1);
    localObject = (InetSocketAddress)((List)localObject).get(i);
    resetConnectionSpecs();
    return localObject;
  }
  
  private Route nextPostponed()
  {
    return (Route)postponedRoutes.remove(0);
  }
  
  private Proxy nextProxy()
    throws IOException
  {
    if (!hasNextProxy()) {
      throw new SocketException("No route to " + address.getUriHost() + "; exhausted proxy configurations: " + proxies);
    }
    Object localObject = proxies;
    int i = nextProxyIndex;
    nextProxyIndex = (i + 1);
    localObject = (Proxy)((List)localObject).get(i);
    resetNextInetSocketAddress((Proxy)localObject);
    return localObject;
  }
  
  private void resetConnectionSpecs()
  {
    connectionSpecs = new ArrayList();
    Iterator localIterator = address.getConnectionSpecs().iterator();
    while (localIterator.hasNext())
    {
      ConnectionSpec localConnectionSpec = (ConnectionSpec)localIterator.next();
      if (request.isHttps() == localConnectionSpec.isTls()) {
        connectionSpecs.add(localConnectionSpec);
      }
    }
    nextSpecIndex = 0;
  }
  
  private void resetNextInetSocketAddress(Proxy paramProxy)
    throws UnknownHostException
  {
    inetSocketAddresses = new ArrayList();
    if (paramProxy.type() == Proxy.Type.DIRECT) {
      paramProxy = address.getUriHost();
    }
    Object localObject;
    for (int i = Util.getEffectivePort(uri);; i = ((InetSocketAddress)localObject).getPort())
    {
      paramProxy = network.resolveInetAddresses(paramProxy);
      int k = paramProxy.length;
      int j = 0;
      while (j < k)
      {
        localObject = paramProxy[j];
        inetSocketAddresses.add(new InetSocketAddress((InetAddress)localObject, i));
        j += 1;
      }
      paramProxy = paramProxy.address();
      if (!(paramProxy instanceof InetSocketAddress)) {
        throw new IllegalArgumentException("Proxy.address() is not an InetSocketAddress: " + paramProxy.getClass());
      }
      localObject = (InetSocketAddress)paramProxy;
      paramProxy = ((InetSocketAddress)localObject).getHostName();
    }
    nextInetSocketAddressIndex = 0;
  }
  
  private void resetNextProxy(URI paramURI, Proxy paramProxy)
  {
    if (paramProxy != null) {
      proxies = Collections.singletonList(paramProxy);
    }
    for (;;)
    {
      nextProxyIndex = 0;
      return;
      proxies = new ArrayList();
      paramURI = proxySelector.select(paramURI);
      if (paramURI != null) {
        proxies.addAll(paramURI);
      }
      proxies.removeAll(Collections.singleton(Proxy.NO_PROXY));
      proxies.add(Proxy.NO_PROXY);
    }
  }
  
  public void connectFailed(Connection paramConnection, IOException paramIOException)
  {
    if (Internal.instance.recycleCount(paramConnection) > 0) {}
    for (;;)
    {
      return;
      paramConnection = paramConnection.getRoute();
      if ((paramConnection.getProxy().type() != Proxy.Type.DIRECT) && (proxySelector != null)) {
        proxySelector.connectFailed(uri, paramConnection.getProxy().address(), paramIOException);
      }
      routeDatabase.failed(paramConnection);
      if ((!(paramIOException instanceof SSLHandshakeException)) && (!(paramIOException instanceof SSLProtocolException))) {
        while (nextSpecIndex < connectionSpecs.size())
        {
          paramConnection = address;
          paramIOException = lastProxy;
          InetSocketAddress localInetSocketAddress = lastInetSocketAddress;
          List localList = connectionSpecs;
          int i = nextSpecIndex;
          nextSpecIndex = (i + 1);
          paramConnection = new Route(paramConnection, paramIOException, localInetSocketAddress, (ConnectionSpec)localList.get(i));
          routeDatabase.failed(paramConnection);
        }
      }
    }
  }
  
  public boolean hasNext()
  {
    return (hasNextConnectionSpec()) || (hasNextInetSocketAddress()) || (hasNextProxy()) || (hasNextPostponed());
  }
  
  public Connection next(HttpEngine paramHttpEngine)
    throws IOException
  {
    Connection localConnection = nextUnconnected();
    Internal.instance.connectAndSetOwner(client, localConnection, paramHttpEngine, request);
    return localConnection;
  }
  
  Connection nextUnconnected()
    throws IOException
  {
    for (;;)
    {
      localObject = pool.get(address);
      if (localObject == null) {
        break;
      }
      if ((request.method().equals("GET")) || (Internal.instance.isReadable((Connection)localObject))) {
        return localObject;
      }
      ((Connection)localObject).getSocket().close();
    }
    if (!hasNextConnectionSpec())
    {
      if (!hasNextInetSocketAddress())
      {
        if (!hasNextProxy())
        {
          if (!hasNextPostponed()) {
            throw new NoSuchElementException();
          }
          return new Connection(pool, nextPostponed());
        }
        lastProxy = nextProxy();
      }
      lastInetSocketAddress = nextInetSocketAddress();
    }
    lastSpec = nextConnectionSpec();
    Object localObject = new Route(address, lastProxy, lastInetSocketAddress, lastSpec);
    if (routeDatabase.shouldPostpone((Route)localObject))
    {
      postponedRoutes.add(localObject);
      return nextUnconnected();
    }
    return new Connection(pool, (Route)localObject);
  }
}
