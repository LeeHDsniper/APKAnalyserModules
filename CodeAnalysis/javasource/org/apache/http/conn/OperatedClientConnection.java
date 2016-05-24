package org.apache.http.conn;

import java.io.IOException;
import java.net.Socket;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpHost;
import org.apache.http.HttpInetConnection;
import org.apache.http.params.HttpParams;

@Deprecated
public abstract interface OperatedClientConnection
  extends HttpClientConnection, HttpInetConnection
{
  public abstract Socket getSocket();
  
  public abstract HttpHost getTargetHost();
  
  public abstract boolean isSecure();
  
  public abstract void openCompleted(boolean paramBoolean, HttpParams paramHttpParams)
    throws IOException;
  
  public abstract void opening(Socket paramSocket, HttpHost paramHttpHost)
    throws IOException;
  
  public abstract void update(Socket paramSocket, HttpHost paramHttpHost, boolean paramBoolean, HttpParams paramHttpParams)
    throws IOException;
}
