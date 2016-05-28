package org.apache.http.conn;

import org.apache.http.HttpConnection;
import org.apache.http.config.ConnectionConfig;

public abstract interface HttpConnectionFactory<T, C extends HttpConnection>
{
  public abstract C create(T paramT, ConnectionConfig paramConnectionConfig);
}
