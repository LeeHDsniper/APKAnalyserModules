package com.squareup.okhttp.internal;

import com.squareup.okhttp.Connection;
import com.squareup.okhttp.ConnectionPool;
import com.squareup.okhttp.Headers.Builder;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.internal.http.HttpEngine;
import com.squareup.okhttp.internal.http.Transport;
import java.io.IOException;
import java.util.logging.Logger;

public abstract class Internal
{
  public static Internal instance;
  public static final Logger logger = Logger.getLogger(OkHttpClient.class.getName());
  
  public Internal() {}
  
  public abstract void addLine(Headers.Builder paramBuilder, String paramString);
  
  public abstract boolean clearOwner(Connection paramConnection);
  
  public abstract void closeIfOwnedBy(Connection paramConnection, Object paramObject)
    throws IOException;
  
  public abstract void connectAndSetOwner(OkHttpClient paramOkHttpClient, Connection paramConnection, HttpEngine paramHttpEngine, Request paramRequest)
    throws IOException;
  
  public abstract InternalCache internalCache(OkHttpClient paramOkHttpClient);
  
  public abstract boolean isReadable(Connection paramConnection);
  
  public abstract Network network(OkHttpClient paramOkHttpClient);
  
  public abstract Transport newTransport(Connection paramConnection, HttpEngine paramHttpEngine)
    throws IOException;
  
  public abstract void recycle(ConnectionPool paramConnectionPool, Connection paramConnection);
  
  public abstract int recycleCount(Connection paramConnection);
  
  public abstract RouteDatabase routeDatabase(OkHttpClient paramOkHttpClient);
  
  public abstract void setOwner(Connection paramConnection, HttpEngine paramHttpEngine);
  
  public abstract void setProtocol(Connection paramConnection, Protocol paramProtocol);
}
