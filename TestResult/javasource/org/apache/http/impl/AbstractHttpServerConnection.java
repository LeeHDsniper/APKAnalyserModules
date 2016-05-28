package org.apache.http.impl;

import java.io.IOException;
import org.apache.http.HttpConnectionMetrics;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestFactory;
import org.apache.http.HttpResponse;
import org.apache.http.HttpServerConnection;
import org.apache.http.StatusLine;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.impl.entity.DisallowIdentityContentLengthStrategy;
import org.apache.http.impl.entity.EntityDeserializer;
import org.apache.http.impl.entity.EntitySerializer;
import org.apache.http.impl.entity.LaxContentLengthStrategy;
import org.apache.http.impl.entity.StrictContentLengthStrategy;
import org.apache.http.impl.io.DefaultHttpRequestParser;
import org.apache.http.impl.io.HttpResponseWriter;
import org.apache.http.io.EofSensor;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.HttpMessageWriter;
import org.apache.http.io.HttpTransportMetrics;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;

@Deprecated
@NotThreadSafe
public abstract class AbstractHttpServerConnection
  implements HttpServerConnection
{
  private final EntityDeserializer entitydeserializer = createEntityDeserializer();
  private final EntitySerializer entityserializer = createEntitySerializer();
  private EofSensor eofSensor = null;
  private SessionInputBuffer inbuffer = null;
  private HttpConnectionMetricsImpl metrics = null;
  private SessionOutputBuffer outbuffer = null;
  private HttpMessageParser<HttpRequest> requestParser = null;
  private HttpMessageWriter<HttpResponse> responseWriter = null;
  
  public AbstractHttpServerConnection() {}
  
  protected abstract void assertOpen()
    throws IllegalStateException;
  
  protected HttpConnectionMetricsImpl createConnectionMetrics(HttpTransportMetrics paramHttpTransportMetrics1, HttpTransportMetrics paramHttpTransportMetrics2)
  {
    return new HttpConnectionMetricsImpl(paramHttpTransportMetrics1, paramHttpTransportMetrics2);
  }
  
  protected EntityDeserializer createEntityDeserializer()
  {
    return new EntityDeserializer(new DisallowIdentityContentLengthStrategy(new LaxContentLengthStrategy(0)));
  }
  
  protected EntitySerializer createEntitySerializer()
  {
    return new EntitySerializer(new StrictContentLengthStrategy());
  }
  
  protected HttpRequestFactory createHttpRequestFactory()
  {
    return DefaultHttpRequestFactory.INSTANCE;
  }
  
  protected HttpMessageParser<HttpRequest> createRequestParser(SessionInputBuffer paramSessionInputBuffer, HttpRequestFactory paramHttpRequestFactory, HttpParams paramHttpParams)
  {
    return new DefaultHttpRequestParser(paramSessionInputBuffer, null, paramHttpRequestFactory, paramHttpParams);
  }
  
  protected HttpMessageWriter<HttpResponse> createResponseWriter(SessionOutputBuffer paramSessionOutputBuffer, HttpParams paramHttpParams)
  {
    return new HttpResponseWriter(paramSessionOutputBuffer, null, paramHttpParams);
  }
  
  protected void doFlush()
    throws IOException
  {
    outbuffer.flush();
  }
  
  public void flush()
    throws IOException
  {
    assertOpen();
    doFlush();
  }
  
  public HttpConnectionMetrics getMetrics()
  {
    return metrics;
  }
  
  protected void init(SessionInputBuffer paramSessionInputBuffer, SessionOutputBuffer paramSessionOutputBuffer, HttpParams paramHttpParams)
  {
    inbuffer = ((SessionInputBuffer)Args.notNull(paramSessionInputBuffer, "Input session buffer"));
    outbuffer = ((SessionOutputBuffer)Args.notNull(paramSessionOutputBuffer, "Output session buffer"));
    if ((paramSessionInputBuffer instanceof EofSensor)) {
      eofSensor = ((EofSensor)paramSessionInputBuffer);
    }
    requestParser = createRequestParser(paramSessionInputBuffer, createHttpRequestFactory(), paramHttpParams);
    responseWriter = createResponseWriter(paramSessionOutputBuffer, paramHttpParams);
    metrics = createConnectionMetrics(paramSessionInputBuffer.getMetrics(), paramSessionOutputBuffer.getMetrics());
  }
  
  protected boolean isEof()
  {
    return (eofSensor != null) && (eofSensor.isEof());
  }
  
  public boolean isStale()
  {
    if (!isOpen()) {}
    while (isEof()) {
      return true;
    }
    try
    {
      inbuffer.isDataAvailable(1);
      boolean bool = isEof();
      return bool;
    }
    catch (IOException localIOException) {}
    return true;
  }
  
  public void receiveRequestEntity(HttpEntityEnclosingRequest paramHttpEntityEnclosingRequest)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpEntityEnclosingRequest, "HTTP request");
    assertOpen();
    paramHttpEntityEnclosingRequest.setEntity(entitydeserializer.deserialize(inbuffer, paramHttpEntityEnclosingRequest));
  }
  
  public HttpRequest receiveRequestHeader()
    throws HttpException, IOException
  {
    assertOpen();
    HttpRequest localHttpRequest = (HttpRequest)requestParser.parse();
    metrics.incrementRequestCount();
    return localHttpRequest;
  }
  
  public void sendResponseEntity(HttpResponse paramHttpResponse)
    throws HttpException, IOException
  {
    if (paramHttpResponse.getEntity() == null) {
      return;
    }
    entityserializer.serialize(outbuffer, paramHttpResponse, paramHttpResponse.getEntity());
  }
  
  public void sendResponseHeader(HttpResponse paramHttpResponse)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    assertOpen();
    responseWriter.write(paramHttpResponse);
    if (paramHttpResponse.getStatusLine().getStatusCode() >= 200) {
      metrics.incrementResponseCount();
    }
  }
}
