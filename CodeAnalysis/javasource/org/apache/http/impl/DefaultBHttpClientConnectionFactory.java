package org.apache.http.impl;

import java.io.IOException;
import java.net.Socket;
import org.apache.http.HttpConnectionFactory;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.Immutable;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.entity.ContentLengthStrategy;
import org.apache.http.io.HttpMessageParserFactory;
import org.apache.http.io.HttpMessageWriterFactory;

@Immutable
public class DefaultBHttpClientConnectionFactory
  implements HttpConnectionFactory<DefaultBHttpClientConnection>
{
  public static final DefaultBHttpClientConnectionFactory INSTANCE = new DefaultBHttpClientConnectionFactory();
  private final ConnectionConfig cconfig;
  private final ContentLengthStrategy incomingContentStrategy;
  private final ContentLengthStrategy outgoingContentStrategy;
  private final HttpMessageWriterFactory<HttpRequest> requestWriterFactory;
  private final HttpMessageParserFactory<HttpResponse> responseParserFactory;
  
  public DefaultBHttpClientConnectionFactory()
  {
    this(null, null, null, null, null);
  }
  
  public DefaultBHttpClientConnectionFactory(ConnectionConfig paramConnectionConfig)
  {
    this(paramConnectionConfig, null, null, null, null);
  }
  
  public DefaultBHttpClientConnectionFactory(ConnectionConfig paramConnectionConfig, ContentLengthStrategy paramContentLengthStrategy1, ContentLengthStrategy paramContentLengthStrategy2, HttpMessageWriterFactory<HttpRequest> paramHttpMessageWriterFactory, HttpMessageParserFactory<HttpResponse> paramHttpMessageParserFactory)
  {
    if (paramConnectionConfig != null) {}
    for (;;)
    {
      cconfig = paramConnectionConfig;
      incomingContentStrategy = paramContentLengthStrategy1;
      outgoingContentStrategy = paramContentLengthStrategy2;
      requestWriterFactory = paramHttpMessageWriterFactory;
      responseParserFactory = paramHttpMessageParserFactory;
      return;
      paramConnectionConfig = ConnectionConfig.DEFAULT;
    }
  }
  
  public DefaultBHttpClientConnectionFactory(ConnectionConfig paramConnectionConfig, HttpMessageWriterFactory<HttpRequest> paramHttpMessageWriterFactory, HttpMessageParserFactory<HttpResponse> paramHttpMessageParserFactory)
  {
    this(paramConnectionConfig, null, null, paramHttpMessageWriterFactory, paramHttpMessageParserFactory);
  }
  
  public DefaultBHttpClientConnection createConnection(Socket paramSocket)
    throws IOException
  {
    DefaultBHttpClientConnection localDefaultBHttpClientConnection = new DefaultBHttpClientConnection(cconfig.getBufferSize(), cconfig.getFragmentSizeHint(), ConnSupport.createDecoder(cconfig), ConnSupport.createEncoder(cconfig), cconfig.getMessageConstraints(), incomingContentStrategy, outgoingContentStrategy, requestWriterFactory, responseParserFactory);
    localDefaultBHttpClientConnection.bind(paramSocket);
    return localDefaultBHttpClientConnection;
  }
}
