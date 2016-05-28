package org.apache.http.conn;

import java.net.InetAddress;
import java.net.UnknownHostException;

public abstract interface DnsResolver
{
  public abstract InetAddress[] resolve(String paramString)
    throws UnknownHostException;
}
