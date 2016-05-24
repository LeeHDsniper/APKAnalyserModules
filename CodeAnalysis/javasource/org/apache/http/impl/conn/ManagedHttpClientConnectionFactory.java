package org.apache.http.impl.conn;

import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CodingErrorAction;
import java.util.concurrent.atomic.AtomicLong;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.Immutable;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.conn.HttpConnectionFactory;
import org.apache.http.conn.ManagedHttpClientConnection;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.impl.io.DefaultHttpRequestWriterFactory;
import org.apache.http.io.HttpMessageParserFactory;
import org.apache.http.io.HttpMessageWriterFactory;

@Immutable
public class ManagedHttpClientConnectionFactory
  implements HttpConnectionFactory<HttpRoute, ManagedHttpClientConnection>
{
  private static final AtomicLong COUNTER = new AtomicLong();
  public static final ManagedHttpClientConnectionFactory INSTANCE = new ManagedHttpClientConnectionFactory();
  private final Log headerlog = LogFactory.getLog("org.apache.http.headers");
  private final Log log = LogFactory.getLog(DefaultManagedHttpClientConnection.class);
  private final HttpMessageWriterFactory<HttpRequest> requestWriterFactory;
  private final HttpMessageParserFactory<HttpResponse> responseParserFactory;
  private final Log wirelog = LogFactory.getLog("org.apache.http.wire");
  
  public ManagedHttpClientConnectionFactory()
  {
    this(null, null);
  }
  
  public ManagedHttpClientConnectionFactory(HttpMessageParserFactory<HttpResponse> paramHttpMessageParserFactory)
  {
    this(null, paramHttpMessageParserFactory);
  }
  
  public ManagedHttpClientConnectionFactory(HttpMessageWriterFactory<HttpRequest> paramHttpMessageWriterFactory, HttpMessageParserFactory<HttpResponse> paramHttpMessageParserFactory)
  {
    if (paramHttpMessageWriterFactory != null)
    {
      requestWriterFactory = paramHttpMessageWriterFactory;
      if (paramHttpMessageParserFactory == null) {
        break label57;
      }
    }
    for (;;)
    {
      responseParserFactory = paramHttpMessageParserFactory;
      return;
      paramHttpMessageWriterFactory = DefaultHttpRequestWriterFactory.INSTANCE;
      break;
      label57:
      paramHttpMessageParserFactory = DefaultHttpResponseParserFactory.INSTANCE;
    }
  }
  
  public ManagedHttpClientConnection create(HttpRoute paramHttpRoute, ConnectionConfig paramConnectionConfig)
  {
    CharsetDecoder localCharsetDecoder;
    CharsetEncoder localCharsetEncoder;
    Charset localCharset;
    if (paramConnectionConfig != null)
    {
      paramHttpRoute = paramConnectionConfig;
      localCharsetDecoder = null;
      localCharsetEncoder = null;
      localCharset = paramHttpRoute.getCharset();
      if (paramHttpRoute.getMalformedInputAction() == null) {
        break label169;
      }
      paramConnectionConfig = paramHttpRoute.getMalformedInputAction();
      label30:
      if (paramHttpRoute.getUnmappableInputAction() == null) {
        break label176;
      }
    }
    label169:
    label176:
    for (CodingErrorAction localCodingErrorAction = paramHttpRoute.getUnmappableInputAction();; localCodingErrorAction = CodingErrorAction.REPORT)
    {
      if (localCharset != null)
      {
        localCharsetDecoder = localCharset.newDecoder();
        localCharsetDecoder.onMalformedInput(paramConnectionConfig);
        localCharsetDecoder.onUnmappableCharacter(localCodingErrorAction);
        localCharsetEncoder = localCharset.newEncoder();
        localCharsetEncoder.onMalformedInput(paramConnectionConfig);
        localCharsetEncoder.onUnmappableCharacter(localCodingErrorAction);
      }
      return new LoggingManagedHttpClientConnection("http-outgoing-" + Long.toString(COUNTER.getAndIncrement()), log, headerlog, wirelog, paramHttpRoute.getBufferSize(), paramHttpRoute.getFragmentSizeHint(), localCharsetDecoder, localCharsetEncoder, paramHttpRoute.getMessageConstraints(), null, null, requestWriterFactory, responseParserFactory);
      paramHttpRoute = ConnectionConfig.DEFAULT;
      break;
      paramConnectionConfig = CodingErrorAction.REPORT;
      break label30;
    }
  }
}
