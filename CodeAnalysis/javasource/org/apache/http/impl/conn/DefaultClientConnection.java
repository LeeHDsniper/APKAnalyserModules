package org.apache.http.impl.conn;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.Socket;
import java.util.HashMap;
import java.util.Map;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseFactory;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.conn.OperatedClientConnection;
import org.apache.http.impl.SocketHttpClientConnection;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Deprecated
@NotThreadSafe
public class DefaultClientConnection
  extends SocketHttpClientConnection
  implements ManagedHttpClientConnection, OperatedClientConnection, HttpContext
{
  private final Map<String, Object> attributes = new HashMap();
  private boolean connSecure;
  private final Log headerLog = LogFactory.getLog("org.apache.http.headers");
  private final Log log = LogFactory.getLog(getClass());
  private volatile boolean shutdown;
  private volatile Socket socket;
  private HttpHost targetHost;
  private final Log wireLog = LogFactory.getLog("org.apache.http.wire");
  
  public DefaultClientConnection() {}
  
  public void bind(Socket paramSocket)
    throws IOException
  {
    bind(paramSocket, new BasicHttpParams());
  }
  
  public void close()
    throws IOException
  {
    try
    {
      super.close();
      if (log.isDebugEnabled()) {
        log.debug("Connection " + this + " closed");
      }
      return;
    }
    catch (IOException localIOException)
    {
      log.debug("I/O error closing connection", localIOException);
    }
  }
  
  protected HttpMessageParser<HttpResponse> createResponseParser(SessionInputBuffer paramSessionInputBuffer, HttpResponseFactory paramHttpResponseFactory, HttpParams paramHttpParams)
  {
    return new DefaultHttpResponseParser(paramSessionInputBuffer, null, paramHttpResponseFactory, paramHttpParams);
  }
  
  protected SessionInputBuffer createSessionInputBuffer(Socket paramSocket, int paramInt, HttpParams paramHttpParams)
    throws IOException
  {
    if (paramInt > 0) {}
    for (;;)
    {
      SessionInputBuffer localSessionInputBuffer = super.createSessionInputBuffer(paramSocket, paramInt, paramHttpParams);
      paramSocket = localSessionInputBuffer;
      if (wireLog.isDebugEnabled()) {
        paramSocket = new LoggingSessionInputBuffer(localSessionInputBuffer, new Wire(wireLog), HttpProtocolParams.getHttpElementCharset(paramHttpParams));
      }
      return paramSocket;
      paramInt = 8192;
    }
  }
  
  protected SessionOutputBuffer createSessionOutputBuffer(Socket paramSocket, int paramInt, HttpParams paramHttpParams)
    throws IOException
  {
    if (paramInt > 0) {}
    for (;;)
    {
      SessionOutputBuffer localSessionOutputBuffer = super.createSessionOutputBuffer(paramSocket, paramInt, paramHttpParams);
      paramSocket = localSessionOutputBuffer;
      if (wireLog.isDebugEnabled()) {
        paramSocket = new LoggingSessionOutputBuffer(localSessionOutputBuffer, new Wire(wireLog), HttpProtocolParams.getHttpElementCharset(paramHttpParams));
      }
      return paramSocket;
      paramInt = 8192;
    }
  }
  
  public Object getAttribute(String paramString)
  {
    return attributes.get(paramString);
  }
  
  public String getId()
  {
    return null;
  }
  
  public SSLSession getSSLSession()
  {
    if ((socket instanceof SSLSocket)) {
      return ((SSLSocket)socket).getSession();
    }
    return null;
  }
  
  public final Socket getSocket()
  {
    return socket;
  }
  
  public final HttpHost getTargetHost()
  {
    return targetHost;
  }
  
  public final boolean isSecure()
  {
    return connSecure;
  }
  
  public void openCompleted(boolean paramBoolean, HttpParams paramHttpParams)
    throws IOException
  {
    Args.notNull(paramHttpParams, "Parameters");
    assertNotOpen();
    connSecure = paramBoolean;
    bind(socket, paramHttpParams);
  }
  
  public void opening(Socket paramSocket, HttpHost paramHttpHost)
    throws IOException
  {
    assertNotOpen();
    socket = paramSocket;
    targetHost = paramHttpHost;
    if (shutdown)
    {
      paramSocket.close();
      throw new InterruptedIOException("Connection already shutdown");
    }
  }
  
  public HttpResponse receiveResponseHeader()
    throws HttpException, IOException
  {
    HttpResponse localHttpResponse = super.receiveResponseHeader();
    if (log.isDebugEnabled()) {
      log.debug("Receiving response: " + localHttpResponse.getStatusLine());
    }
    if (headerLog.isDebugEnabled())
    {
      headerLog.debug("<< " + localHttpResponse.getStatusLine().toString());
      Header[] arrayOfHeader = localHttpResponse.getAllHeaders();
      int j = arrayOfHeader.length;
      int i = 0;
      while (i < j)
      {
        Header localHeader = arrayOfHeader[i];
        headerLog.debug("<< " + localHeader.toString());
        i += 1;
      }
    }
    return localHttpResponse;
  }
  
  public Object removeAttribute(String paramString)
  {
    return attributes.remove(paramString);
  }
  
  public void sendRequestHeader(HttpRequest paramHttpRequest)
    throws HttpException, IOException
  {
    if (log.isDebugEnabled()) {
      log.debug("Sending request: " + paramHttpRequest.getRequestLine());
    }
    super.sendRequestHeader(paramHttpRequest);
    if (headerLog.isDebugEnabled())
    {
      headerLog.debug(">> " + paramHttpRequest.getRequestLine().toString());
      paramHttpRequest = paramHttpRequest.getAllHeaders();
      int j = paramHttpRequest.length;
      int i = 0;
      while (i < j)
      {
        Object localObject = paramHttpRequest[i];
        headerLog.debug(">> " + localObject.toString());
        i += 1;
      }
    }
  }
  
  public void setAttribute(String paramString, Object paramObject)
  {
    attributes.put(paramString, paramObject);
  }
  
  public void shutdown()
    throws IOException
  {
    shutdown = true;
    try
    {
      super.shutdown();
      if (log.isDebugEnabled()) {
        log.debug("Connection " + this + " shut down");
      }
      Socket localSocket = socket;
      if (localSocket != null) {
        localSocket.close();
      }
      return;
    }
    catch (IOException localIOException)
    {
      log.debug("I/O error shutting down connection", localIOException);
    }
  }
  
  public void update(Socket paramSocket, HttpHost paramHttpHost, boolean paramBoolean, HttpParams paramHttpParams)
    throws IOException
  {
    assertOpen();
    Args.notNull(paramHttpHost, "Target host");
    Args.notNull(paramHttpParams, "Parameters");
    if (paramSocket != null)
    {
      socket = paramSocket;
      bind(paramSocket, paramHttpParams);
    }
    targetHost = paramHttpHost;
    connSecure = paramBoolean;
  }
}
