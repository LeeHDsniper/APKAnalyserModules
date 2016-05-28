package org.apache.http.impl.conn;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.Socket;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.net.ssl.SSLSession;
import javax.net.ssl.SSLSocket;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.config.MessageConstraints;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.entity.ContentLengthStrategy;
import org.apache.http.impl.DefaultBHttpClientConnection;
import org.apache.http.io.HttpMessageParserFactory;
import org.apache.http.io.HttpMessageWriterFactory;
import org.apache.http.protocol.HttpContext;

@NotThreadSafe
public class DefaultManagedHttpClientConnection
  extends DefaultBHttpClientConnection
  implements ManagedHttpClientConnection, HttpContext
{
  private final Map<String, Object> attributes;
  private final String id;
  private volatile boolean shutdown;
  
  public DefaultManagedHttpClientConnection(String paramString, int paramInt)
  {
    this(paramString, paramInt, paramInt, null, null, null, null, null, null, null);
  }
  
  public DefaultManagedHttpClientConnection(String paramString, int paramInt1, int paramInt2, CharsetDecoder paramCharsetDecoder, CharsetEncoder paramCharsetEncoder, MessageConstraints paramMessageConstraints, ContentLengthStrategy paramContentLengthStrategy1, ContentLengthStrategy paramContentLengthStrategy2, HttpMessageWriterFactory<HttpRequest> paramHttpMessageWriterFactory, HttpMessageParserFactory<HttpResponse> paramHttpMessageParserFactory)
  {
    super(paramInt1, paramInt2, paramCharsetDecoder, paramCharsetEncoder, paramMessageConstraints, paramContentLengthStrategy1, paramContentLengthStrategy2, paramHttpMessageWriterFactory, paramHttpMessageParserFactory);
    id = paramString;
    attributes = new ConcurrentHashMap();
  }
  
  public void bind(Socket paramSocket)
    throws IOException
  {
    if (shutdown)
    {
      paramSocket.close();
      throw new InterruptedIOException("Connection already shutdown");
    }
    super.bind(paramSocket);
  }
  
  public Object getAttribute(String paramString)
  {
    return attributes.get(paramString);
  }
  
  public String getId()
  {
    return id;
  }
  
  public SSLSession getSSLSession()
  {
    Socket localSocket = super.getSocket();
    if ((localSocket instanceof SSLSocket)) {
      return ((SSLSocket)localSocket).getSession();
    }
    return null;
  }
  
  public Socket getSocket()
  {
    return super.getSocket();
  }
  
  public Object removeAttribute(String paramString)
  {
    return attributes.remove(paramString);
  }
  
  public void setAttribute(String paramString, Object paramObject)
  {
    attributes.put(paramString, paramObject);
  }
  
  public void shutdown()
    throws IOException
  {
    shutdown = true;
    super.shutdown();
  }
}
