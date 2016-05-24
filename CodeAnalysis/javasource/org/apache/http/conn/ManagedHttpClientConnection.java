package org.apache.http.conn;

import java.io.IOException;
import java.net.Socket;
import javax.net.ssl.SSLSession;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpInetConnection;

public abstract interface ManagedHttpClientConnection
  extends HttpClientConnection, HttpInetConnection
{
  public abstract void bind(Socket paramSocket)
    throws IOException;
  
  public abstract String getId();
  
  public abstract SSLSession getSSLSession();
  
  public abstract Socket getSocket();
}
