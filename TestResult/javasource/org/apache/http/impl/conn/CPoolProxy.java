package org.apache.http.impl.conn;

import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpConnection;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.protocol.HttpContext;

@NotThreadSafe
class CPoolProxy
  implements InvocationHandler
{
  private static final Method CLOSE_METHOD;
  private static final Method IS_OPEN_METHOD;
  private static final Method IS_STALE_METHOD;
  private static final Method SHUTDOWN_METHOD;
  private volatile CPoolEntry poolEntry;
  
  static
  {
    try
    {
      CLOSE_METHOD = HttpConnection.class.getMethod("close", new Class[0]);
      SHUTDOWN_METHOD = HttpConnection.class.getMethod("shutdown", new Class[0]);
      IS_OPEN_METHOD = HttpConnection.class.getMethod("isOpen", new Class[0]);
      IS_STALE_METHOD = HttpConnection.class.getMethod("isStale", new Class[0]);
      return;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new Error(localNoSuchMethodException);
    }
  }
  
  CPoolProxy(CPoolEntry paramCPoolEntry)
  {
    poolEntry = paramCPoolEntry;
  }
  
  public static CPoolEntry detach(HttpClientConnection paramHttpClientConnection)
  {
    return getHandler(paramHttpClientConnection).detach();
  }
  
  private static CPoolProxy getHandler(HttpClientConnection paramHttpClientConnection)
  {
    paramHttpClientConnection = Proxy.getInvocationHandler(paramHttpClientConnection);
    if (!CPoolProxy.class.isInstance(paramHttpClientConnection)) {
      throw new IllegalStateException("Unexpected proxy handler class: " + paramHttpClientConnection);
    }
    return (CPoolProxy)CPoolProxy.class.cast(paramHttpClientConnection);
  }
  
  public static CPoolEntry getPoolEntry(HttpClientConnection paramHttpClientConnection)
  {
    paramHttpClientConnection = getHandler(paramHttpClientConnection).getPoolEntry();
    if (paramHttpClientConnection == null) {
      throw new ConnectionShutdownException();
    }
    return paramHttpClientConnection;
  }
  
  public static HttpClientConnection newProxy(CPoolEntry paramCPoolEntry)
  {
    ClassLoader localClassLoader = CPoolProxy.class.getClassLoader();
    paramCPoolEntry = new CPoolProxy(paramCPoolEntry);
    return (HttpClientConnection)Proxy.newProxyInstance(localClassLoader, new Class[] { ManagedHttpClientConnection.class, HttpContext.class }, paramCPoolEntry);
  }
  
  public void close()
    throws IOException
  {
    CPoolEntry localCPoolEntry = poolEntry;
    if (localCPoolEntry != null) {
      localCPoolEntry.closeConnection();
    }
  }
  
  CPoolEntry detach()
  {
    CPoolEntry localCPoolEntry = poolEntry;
    poolEntry = null;
    return localCPoolEntry;
  }
  
  HttpClientConnection getConnection()
  {
    CPoolEntry localCPoolEntry = poolEntry;
    if (localCPoolEntry == null) {
      return null;
    }
    return (HttpClientConnection)localCPoolEntry.getConnection();
  }
  
  CPoolEntry getPoolEntry()
  {
    return poolEntry;
  }
  
  public Object invoke(Object paramObject, Method paramMethod, Object[] paramArrayOfObject)
    throws Throwable
  {
    if (paramMethod.equals(CLOSE_METHOD))
    {
      close();
      return null;
    }
    if (paramMethod.equals(SHUTDOWN_METHOD))
    {
      shutdown();
      return null;
    }
    if (paramMethod.equals(IS_OPEN_METHOD)) {
      return Boolean.valueOf(isOpen());
    }
    if (paramMethod.equals(IS_STALE_METHOD)) {
      return Boolean.valueOf(isStale());
    }
    paramObject = getConnection();
    if (paramObject == null) {
      throw new ConnectionShutdownException();
    }
    try
    {
      paramObject = paramMethod.invoke(paramObject, paramArrayOfObject);
      return paramObject;
    }
    catch (InvocationTargetException paramObject)
    {
      paramMethod = paramObject.getCause();
      if (paramMethod != null) {
        throw paramMethod;
      }
      throw paramObject;
    }
  }
  
  public boolean isOpen()
  {
    boolean bool2 = false;
    CPoolEntry localCPoolEntry = poolEntry;
    boolean bool1 = bool2;
    if (localCPoolEntry != null)
    {
      bool1 = bool2;
      if (!localCPoolEntry.isClosed()) {
        bool1 = true;
      }
    }
    return bool1;
  }
  
  public boolean isStale()
  {
    HttpClientConnection localHttpClientConnection = getConnection();
    if (localHttpClientConnection != null) {
      return localHttpClientConnection.isStale();
    }
    return true;
  }
  
  public void shutdown()
    throws IOException
  {
    CPoolEntry localCPoolEntry = poolEntry;
    if (localCPoolEntry != null) {
      localCPoolEntry.shutdownConnection();
    }
  }
}
