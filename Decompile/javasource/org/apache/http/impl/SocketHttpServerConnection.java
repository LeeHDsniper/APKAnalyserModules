package org.apache.http.impl;

import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;
import org.apache.http.HttpInetConnection;
import org.apache.http.impl.io.SocketInputBuffer;
import org.apache.http.impl.io.SocketOutputBuffer;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@Deprecated
public class SocketHttpServerConnection
  extends AbstractHttpServerConnection
  implements HttpInetConnection
{
  private volatile boolean open;
  private volatile Socket socket = null;
  
  public SocketHttpServerConnection() {}
  
  private static void formatAddress(StringBuilder paramStringBuilder, SocketAddress paramSocketAddress)
  {
    if ((paramSocketAddress instanceof InetSocketAddress))
    {
      InetSocketAddress localInetSocketAddress = (InetSocketAddress)paramSocketAddress;
      if (localInetSocketAddress.getAddress() != null) {}
      for (paramSocketAddress = localInetSocketAddress.getAddress().getHostAddress();; paramSocketAddress = localInetSocketAddress.getAddress())
      {
        paramStringBuilder.append(paramSocketAddress).append(':').append(localInetSocketAddress.getPort());
        return;
      }
    }
    paramStringBuilder.append(paramSocketAddress);
  }
  
  protected void assertNotOpen()
  {
    if (!open) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "Connection is already open");
      return;
    }
  }
  
  protected void assertOpen()
  {
    Asserts.check(open, "Connection is not open");
  }
  
  protected void bind(Socket paramSocket, HttpParams paramHttpParams)
    throws IOException
  {
    Args.notNull(paramSocket, "Socket");
    Args.notNull(paramHttpParams, "HTTP parameters");
    socket = paramSocket;
    int i = paramHttpParams.getIntParameter("http.socket.buffer-size", -1);
    init(createSessionInputBuffer(paramSocket, i, paramHttpParams), createSessionOutputBuffer(paramSocket, i, paramHttpParams), paramHttpParams);
    open = true;
  }
  
  /* Error */
  public void close()
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 51	org/apache/http/impl/SocketHttpServerConnection:open	Z
    //   4: ifne +4 -> 8
    //   7: return
    //   8: aload_0
    //   9: iconst_0
    //   10: putfield 51	org/apache/http/impl/SocketHttpServerConnection:open	Z
    //   13: aload_0
    //   14: iconst_0
    //   15: putfield 51	org/apache/http/impl/SocketHttpServerConnection:open	Z
    //   18: aload_0
    //   19: getfield 17	org/apache/http/impl/SocketHttpServerConnection:socket	Ljava/net/Socket;
    //   22: astore_1
    //   23: aload_0
    //   24: invokevirtual 103	org/apache/http/impl/SocketHttpServerConnection:doFlush	()V
    //   27: aload_1
    //   28: invokevirtual 108	java/net/Socket:shutdownOutput	()V
    //   31: aload_1
    //   32: invokevirtual 111	java/net/Socket:shutdownInput	()V
    //   35: aload_1
    //   36: invokevirtual 113	java/net/Socket:close	()V
    //   39: return
    //   40: astore_2
    //   41: aload_1
    //   42: invokevirtual 113	java/net/Socket:close	()V
    //   45: aload_2
    //   46: athrow
    //   47: astore_2
    //   48: goto -17 -> 31
    //   51: astore_2
    //   52: goto -17 -> 35
    //   55: astore_2
    //   56: goto -21 -> 35
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	59	0	this	SocketHttpServerConnection
    //   22	20	1	localSocket	Socket
    //   40	6	2	localObject	Object
    //   47	1	2	localIOException1	IOException
    //   51	1	2	localIOException2	IOException
    //   55	1	2	localUnsupportedOperationException	UnsupportedOperationException
    // Exception table:
    //   from	to	target	type
    //   23	27	40	finally
    //   27	31	40	finally
    //   31	35	40	finally
    //   27	31	47	java/io/IOException
    //   31	35	51	java/io/IOException
    //   27	31	55	java/lang/UnsupportedOperationException
    //   31	35	55	java/lang/UnsupportedOperationException
  }
  
  protected SessionInputBuffer createSessionInputBuffer(Socket paramSocket, int paramInt, HttpParams paramHttpParams)
    throws IOException
  {
    return new SocketInputBuffer(paramSocket, paramInt, paramHttpParams);
  }
  
  protected SessionOutputBuffer createSessionOutputBuffer(Socket paramSocket, int paramInt, HttpParams paramHttpParams)
    throws IOException
  {
    return new SocketOutputBuffer(paramSocket, paramInt, paramHttpParams);
  }
  
  public InetAddress getLocalAddress()
  {
    if (socket != null) {
      return socket.getLocalAddress();
    }
    return null;
  }
  
  public int getLocalPort()
  {
    if (socket != null) {
      return socket.getLocalPort();
    }
    return -1;
  }
  
  public InetAddress getRemoteAddress()
  {
    if (socket != null) {
      return socket.getInetAddress();
    }
    return null;
  }
  
  public int getRemotePort()
  {
    if (socket != null) {
      return socket.getPort();
    }
    return -1;
  }
  
  protected Socket getSocket()
  {
    return socket;
  }
  
  public int getSocketTimeout()
  {
    int i = -1;
    if (socket != null) {}
    try
    {
      i = socket.getSoTimeout();
      return i;
    }
    catch (SocketException localSocketException) {}
    return -1;
  }
  
  public boolean isOpen()
  {
    return open;
  }
  
  public void setSocketTimeout(int paramInt)
  {
    assertOpen();
    if (socket != null) {}
    try
    {
      socket.setSoTimeout(paramInt);
      return;
    }
    catch (SocketException localSocketException) {}
  }
  
  public void shutdown()
    throws IOException
  {
    open = false;
    Socket localSocket = socket;
    if (localSocket != null) {
      localSocket.close();
    }
  }
  
  public String toString()
  {
    if (socket != null)
    {
      StringBuilder localStringBuilder = new StringBuilder();
      SocketAddress localSocketAddress1 = socket.getRemoteSocketAddress();
      SocketAddress localSocketAddress2 = socket.getLocalSocketAddress();
      if ((localSocketAddress1 != null) && (localSocketAddress2 != null))
      {
        formatAddress(localStringBuilder, localSocketAddress2);
        localStringBuilder.append("<->");
        formatAddress(localStringBuilder, localSocketAddress1);
      }
      return localStringBuilder.toString();
    }
    return super.toString();
  }
}
