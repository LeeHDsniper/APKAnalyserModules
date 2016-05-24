package org.apache.http;

import java.io.IOException;
import java.net.Socket;

public abstract interface HttpConnectionFactory<T extends HttpConnection>
{
  public abstract T createConnection(Socket paramSocket)
    throws IOException;
}
