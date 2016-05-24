package org.apache.http.impl.conn;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.conn.DnsResolver;
import org.apache.http.util.Args;

public class InMemoryDnsResolver
  implements DnsResolver
{
  private final Map<String, InetAddress[]> dnsMap = new ConcurrentHashMap();
  private final Log log = LogFactory.getLog(InMemoryDnsResolver.class);
  
  public InMemoryDnsResolver() {}
  
  public void add(String paramString, InetAddress... paramVarArgs)
  {
    Args.notNull(paramString, "Host name");
    Args.notNull(paramVarArgs, "Array of IP addresses");
    dnsMap.put(paramString, paramVarArgs);
  }
  
  public InetAddress[] resolve(String paramString)
    throws UnknownHostException
  {
    InetAddress[] arrayOfInetAddress = (InetAddress[])dnsMap.get(paramString);
    if (log.isInfoEnabled()) {
      log.info("Resolving " + paramString + " to " + Arrays.deepToString(arrayOfInetAddress));
    }
    if (arrayOfInetAddress == null) {
      throw new UnknownHostException(paramString + " cannot be resolved");
    }
    return arrayOfInetAddress;
  }
}
