package org.apache.http.conn.scheme;

import java.io.IOException;
import java.net.InetAddress;

@Deprecated
public abstract interface HostNameResolver
{
  public abstract InetAddress resolve(String paramString)
    throws IOException;
}
