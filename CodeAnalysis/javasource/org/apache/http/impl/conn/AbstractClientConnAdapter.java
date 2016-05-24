package org.apache.http.impl.conn;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.InetAddress;
import java.net.Socket;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import org.apache.http.HttpConnectionMetrics;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.protocol.HttpContext;

@Deprecated
@NotThreadSafe
public abstract class AbstractClientConnAdapter
  implements ManagedClientConnection, HttpContext
{
  private final ClientConnectionManager connManager;
  private volatile long duration;
  private volatile boolean markedReusable;
  private volatile boolean released;
  private volatile OperatedClientConnection wrappedConnection;
  
  protected AbstractClientConnAdapter(ClientConnectionManager paramClientConnectionManager, OperatedClientConnection paramOperatedClientConnection)
  {
    connManager = paramClientConnectionManager;
    wrappedConnection = paramOperatedClientConnection;
    markedReusable = false;
    released = false;
    duration = Long.MAX_VALUE;
  }
  
  /* Error */
  public void abortConnection()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 32	org/apache/http/impl/conn/AbstractClientConnAdapter:released	Z
    //   6: istore_1
    //   7: iload_1
    //   8: ifeq +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: iconst_1
    //   16: putfield 32	org/apache/http/impl/conn/AbstractClientConnAdapter:released	Z
    //   19: aload_0
    //   20: invokevirtual 43	org/apache/http/impl/conn/AbstractClientConnAdapter:unmarkReusable	()V
    //   23: aload_0
    //   24: invokevirtual 46	org/apache/http/impl/conn/AbstractClientConnAdapter:shutdown	()V
    //   27: aload_0
    //   28: getfield 26	org/apache/http/impl/conn/AbstractClientConnAdapter:connManager	Lorg/apache/http/conn/ClientConnectionManager;
    //   31: aload_0
    //   32: aload_0
    //   33: getfield 36	org/apache/http/impl/conn/AbstractClientConnAdapter:duration	J
    //   36: getstatic 52	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   39: invokeinterface 58 5 0
    //   44: goto -33 -> 11
    //   47: astore_2
    //   48: aload_0
    //   49: monitorexit
    //   50: aload_2
    //   51: athrow
    //   52: astore_2
    //   53: goto -26 -> 27
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	56	0	this	AbstractClientConnAdapter
    //   6	2	1	bool	boolean
    //   47	4	2	localObject	Object
    //   52	1	2	localIOException	IOException
    // Exception table:
    //   from	to	target	type
    //   2	7	47	finally
    //   14	23	47	finally
    //   23	27	47	finally
    //   27	44	47	finally
    //   23	27	52	java/io/IOException
  }
  
  @Deprecated
  protected final void assertNotAborted()
    throws InterruptedIOException
  {
    if (isReleased()) {
      throw new InterruptedIOException("Connection has been shut down");
    }
  }
  
  protected final void assertValid(OperatedClientConnection paramOperatedClientConnection)
    throws ConnectionShutdownException
  {
    if ((isReleased()) || (paramOperatedClientConnection == null)) {
      throw new ConnectionShutdownException();
    }
  }
  
  public void bind(Socket paramSocket)
    throws IOException
  {
    throw new UnsupportedOperationException();
  }
  
  protected void detach()
  {
    try
    {
      wrappedConnection = null;
      duration = Long.MAX_VALUE;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public void flush()
    throws IOException
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    localOperatedClientConnection.flush();
  }
  
  public Object getAttribute(String paramString)
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    if ((localOperatedClientConnection instanceof HttpContext)) {
      return ((HttpContext)localOperatedClientConnection).getAttribute(paramString);
    }
    return null;
  }
  
  public InetAddress getLocalAddress()
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    return localOperatedClientConnection.getLocalAddress();
  }
  
  public int getLocalPort()
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    return localOperatedClientConnection.getLocalPort();
  }
  
  protected ClientConnectionManager getManager()
  {
    return connManager;
  }
  
  public HttpConnectionMetrics getMetrics()
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    return localOperatedClientConnection.getMetrics();
  }
  
  public InetAddress getRemoteAddress()
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    return localOperatedClientConnection.getRemoteAddress();
  }
  
  public int getRemotePort()
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    return localOperatedClientConnection.getRemotePort();
  }
  
  public SSLSession getSSLSession()
  {
    Object localObject = getWrappedConnection();
    assertValid((OperatedClientConnection)localObject);
    if (!isOpen()) {}
    do
    {
      return null;
      localObject = ((OperatedClientConnection)localObject).getSocket();
    } while (!(localObject instanceof SSLSocket));
    return ((SSLSocket)localObject).getSession();
  }
  
  public Socket getSocket()
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    if (!isOpen()) {
      return null;
    }
    return localOperatedClientConnection.getSocket();
  }
  
  public int getSocketTimeout()
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    return localOperatedClientConnection.getSocketTimeout();
  }
  
  protected OperatedClientConnection getWrappedConnection()
  {
    return wrappedConnection;
  }
  
  public boolean isMarkedReusable()
  {
    return markedReusable;
  }
  
  public boolean isOpen()
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    if (localOperatedClientConnection == null) {
      return false;
    }
    return localOperatedClientConnection.isOpen();
  }
  
  protected boolean isReleased()
  {
    return released;
  }
  
  public boolean isResponseAvailable(int paramInt)
    throws IOException
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    return localOperatedClientConnection.isResponseAvailable(paramInt);
  }
  
  public boolean isSecure()
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    return localOperatedClientConnection.isSecure();
  }
  
  public boolean isStale()
  {
    if (isReleased()) {}
    OperatedClientConnection localOperatedClientConnection;
    do
    {
      return true;
      localOperatedClientConnection = getWrappedConnection();
    } while (localOperatedClientConnection == null);
    return localOperatedClientConnection.isStale();
  }
  
  public void markReusable()
  {
    markedReusable = true;
  }
  
  public void receiveResponseEntity(HttpResponse paramHttpResponse)
    throws HttpException, IOException
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    unmarkReusable();
    localOperatedClientConnection.receiveResponseEntity(paramHttpResponse);
  }
  
  public HttpResponse receiveResponseHeader()
    throws HttpException, IOException
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    unmarkReusable();
    return localOperatedClientConnection.receiveResponseHeader();
  }
  
  /* Error */
  public void releaseConnection()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 32	org/apache/http/impl/conn/AbstractClientConnAdapter:released	Z
    //   6: istore_1
    //   7: iload_1
    //   8: ifeq +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: aload_0
    //   15: iconst_1
    //   16: putfield 32	org/apache/http/impl/conn/AbstractClientConnAdapter:released	Z
    //   19: aload_0
    //   20: getfield 26	org/apache/http/impl/conn/AbstractClientConnAdapter:connManager	Lorg/apache/http/conn/ClientConnectionManager;
    //   23: aload_0
    //   24: aload_0
    //   25: getfield 36	org/apache/http/impl/conn/AbstractClientConnAdapter:duration	J
    //   28: getstatic 52	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   31: invokeinterface 58 5 0
    //   36: goto -25 -> 11
    //   39: astore_2
    //   40: aload_0
    //   41: monitorexit
    //   42: aload_2
    //   43: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	44	0	this	AbstractClientConnAdapter
    //   6	2	1	bool	boolean
    //   39	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	7	39	finally
    //   14	36	39	finally
  }
  
  public Object removeAttribute(String paramString)
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    if ((localOperatedClientConnection instanceof HttpContext)) {
      return ((HttpContext)localOperatedClientConnection).removeAttribute(paramString);
    }
    return null;
  }
  
  public void sendRequestEntity(HttpEntityEnclosingRequest paramHttpEntityEnclosingRequest)
    throws HttpException, IOException
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    unmarkReusable();
    localOperatedClientConnection.sendRequestEntity(paramHttpEntityEnclosingRequest);
  }
  
  public void sendRequestHeader(HttpRequest paramHttpRequest)
    throws HttpException, IOException
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    unmarkReusable();
    localOperatedClientConnection.sendRequestHeader(paramHttpRequest);
  }
  
  public void setAttribute(String paramString, Object paramObject)
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    if ((localOperatedClientConnection instanceof HttpContext)) {
      ((HttpContext)localOperatedClientConnection).setAttribute(paramString, paramObject);
    }
  }
  
  public void setIdleDuration(long paramLong, TimeUnit paramTimeUnit)
  {
    if (paramLong > 0L)
    {
      duration = paramTimeUnit.toMillis(paramLong);
      return;
    }
    duration = -1L;
  }
  
  public void setSocketTimeout(int paramInt)
  {
    OperatedClientConnection localOperatedClientConnection = getWrappedConnection();
    assertValid(localOperatedClientConnection);
    localOperatedClientConnection.setSocketTimeout(paramInt);
  }
  
  public void unmarkReusable()
  {
    markedReusable = false;
  }
}
