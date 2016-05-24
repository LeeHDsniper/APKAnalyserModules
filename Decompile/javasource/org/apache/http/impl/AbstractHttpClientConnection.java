package org.apache.http.impl;

import java.io.IOException;
import java.net.SocketTimeoutException;
import org.apache.http.HttpClientConnection;
import org.apache.http.HttpConnectionMetrics;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseFactory;
import org.apache.http.StatusLine;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.impl.entity.EntityDeserializer;
import org.apache.http.impl.entity.EntitySerializer;
import org.apache.http.impl.entity.LaxContentLengthStrategy;
import org.apache.http.impl.entity.StrictContentLengthStrategy;
import org.apache.http.impl.io.DefaultHttpResponseParser;
import org.apache.http.impl.io.HttpRequestWriter;
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
public abstract class AbstractHttpClientConnection
  implements HttpClientConnection
{
  private final EntityDeserializer entitydeserializer = createEntityDeserializer();
  private final EntitySerializer entityserializer = createEntitySerializer();
  private EofSensor eofSensor = null;
  private SessionInputBuffer inbuffer = null;
  private HttpConnectionMetricsImpl metrics = null;
  private SessionOutputBuffer outbuffer = null;
  private HttpMessageWriter<HttpRequest> requestWriter = null;
  private HttpMessageParser<HttpResponse> responseParser = null;
  
  public AbstractHttpClientConnection() {}
  
  protected abstract void assertOpen()
    throws IllegalStateException;
  
  protected HttpConnectionMetricsImpl createConnectionMetrics(HttpTransportMetrics paramHttpTransportMetrics1, HttpTransportMetrics paramHttpTransportMetrics2)
  {
    return new HttpConnectionMetricsImpl(paramHttpTransportMetrics1, paramHttpTransportMetrics2);
  }
  
  protected EntityDeserializer createEntityDeserializer()
  {
    return new EntityDeserializer(new LaxContentLengthStrategy());
  }
  
  protected EntitySerializer createEntitySerializer()
  {
    return new EntitySerializer(new StrictContentLengthStrategy());
  }
  
  protected HttpResponseFactory createHttpResponseFactory()
  {
    return DefaultHttpResponseFactory.INSTANCE;
  }
  
  protected HttpMessageWriter<HttpRequest> createRequestWriter(SessionOutputBuffer paramSessionOutputBuffer, HttpParams paramHttpParams)
  {
    return new HttpRequestWriter(paramSessionOutputBuffer, null, paramHttpParams);
  }
  
  protected HttpMessageParser<HttpResponse> createResponseParser(SessionInputBuffer paramSessionInputBuffer, HttpResponseFactory paramHttpResponseFactory, HttpParams paramHttpParams)
  {
    return new DefaultHttpResponseParser(paramSessionInputBuffer, null, paramHttpResponseFactory, paramHttpParams);
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
    responseParser = createResponseParser(paramSessionInputBuffer, createHttpResponseFactory(), paramHttpParams);
    requestWriter = createRequestWriter(paramSessionOutputBuffer, paramHttpParams);
    metrics = createConnectionMetrics(paramSessionInputBuffer.getMetrics(), paramSessionOutputBuffer.getMetrics());
  }
  
  protected boolean isEof()
  {
    return (eofSensor != null) && (eofSensor.isEof());
  }
  
  public boolean isResponseAvailable(int paramInt)
    throws IOException
  {
    assertOpen();
    try
    {
      boolean bool = inbuffer.isDataAvailable(paramInt);
      return bool;
    }
    catch (SocketTimeoutException localSocketTimeoutException) {}
    return false;
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
    catch (SocketTimeoutException localSocketTimeoutException)
    {
      return false;
    }
    catch (IOException localIOException) {}
    return true;
  }
  
  public void receiveResponseEntity(HttpResponse paramHttpResponse)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    assertOpen();
    paramHttpResponse.setEntity(entitydeserializer.deserialize(inbuffer, paramHttpResponse));
  }
  
  public HttpResponse receiveResponseHeader()
    throws HttpException, IOException
  {
    assertOpen();
    HttpResponse localHttpResponse = (HttpResponse)responseParser.parse();
    if (localHttpResponse.getStatusLine().getStatusCode() >= 200) {
      metrics.incrementResponseCount();
    }
    return localHttpResponse;
  }
  
  public void sendRequestEntity(HttpEntityEnclosingRequest paramHttpEntityEnclosingRequest)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpEntityEnclosingRequest, "HTTP request");
    assertOpen();
    if (paramHttpEntityEnclosingRequest.getEntity() == null) {
      return;
    }
    entityserializer.serialize(outbuffer, paramHttpEntityEnclosingRequest, paramHttpEntityEnclosingRequest.getEntity());
  }
  
  public void sendRequestHeader(HttpRequest paramHttpRequest)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpRequest, "HTTP request");
    assertOpen();
    requestWriter.write(paramHttpRequest);
    metrics.incrementRequestCount();
  }
}
