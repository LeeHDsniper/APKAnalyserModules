package org.apache.http.params;

import org.apache.http.util.Args;

@Deprecated
public final class HttpConnectionParams
  implements CoreConnectionPNames
{
  private HttpConnectionParams() {}
  
  public static int getConnectionTimeout(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return paramHttpParams.getIntParameter("http.connection.timeout", 0);
  }
  
  public static int getLinger(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return paramHttpParams.getIntParameter("http.socket.linger", -1);
  }
  
  public static boolean getSoKeepalive(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return paramHttpParams.getBooleanParameter("http.socket.keepalive", false);
  }
  
  public static boolean getSoReuseaddr(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return paramHttpParams.getBooleanParameter("http.socket.reuseaddr", false);
  }
  
  public static int getSoTimeout(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return paramHttpParams.getIntParameter("http.socket.timeout", 0);
  }
  
  public static int getSocketBufferSize(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return paramHttpParams.getIntParameter("http.socket.buffer-size", -1);
  }
  
  public static boolean getTcpNoDelay(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return paramHttpParams.getBooleanParameter("http.tcp.nodelay", true);
  }
  
  public static boolean isStaleCheckingEnabled(HttpParams paramHttpParams)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    return paramHttpParams.getBooleanParameter("http.connection.stalecheck", true);
  }
  
  public static void setConnectionTimeout(HttpParams paramHttpParams, int paramInt)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setIntParameter("http.connection.timeout", paramInt);
  }
  
  public static void setLinger(HttpParams paramHttpParams, int paramInt)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setIntParameter("http.socket.linger", paramInt);
  }
  
  public static void setSoKeepalive(HttpParams paramHttpParams, boolean paramBoolean)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setBooleanParameter("http.socket.keepalive", paramBoolean);
  }
  
  public static void setSoReuseaddr(HttpParams paramHttpParams, boolean paramBoolean)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setBooleanParameter("http.socket.reuseaddr", paramBoolean);
  }
  
  public static void setSoTimeout(HttpParams paramHttpParams, int paramInt)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setIntParameter("http.socket.timeout", paramInt);
  }
  
  public static void setSocketBufferSize(HttpParams paramHttpParams, int paramInt)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setIntParameter("http.socket.buffer-size", paramInt);
  }
  
  public static void setStaleCheckingEnabled(HttpParams paramHttpParams, boolean paramBoolean)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setBooleanParameter("http.connection.stalecheck", paramBoolean);
  }
  
  public static void setTcpNoDelay(HttpParams paramHttpParams, boolean paramBoolean)
  {
    Args.notNull(paramHttpParams, "HTTP parameters");
    paramHttpParams.setBooleanParameter("http.tcp.nodelay", paramBoolean);
  }
}
