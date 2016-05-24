package org.apache.http.conn.scheme;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.params.HttpParams;

@Deprecated
public abstract interface SchemeSocketFactory
{
  public abstract Socket connectSocket(Socket paramSocket, InetSocketAddress paramInetSocketAddress1, InetSocketAddress paramInetSocketAddress2, HttpParams paramHttpParams)
    throws IOException, UnknownHostException, ConnectTimeoutException;
  
  public abstract Socket createSocket(HttpParams paramHttpParams)
    throws IOException;
  
  public abstract boolean isSecure(Socket paramSocket)
    throws IllegalArgumentException;
}
