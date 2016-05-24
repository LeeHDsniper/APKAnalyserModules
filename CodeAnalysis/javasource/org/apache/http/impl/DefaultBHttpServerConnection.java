package org.apache.http.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.net.Socket;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.HttpServerConnection;
import org.apache.http.StatusLine;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.config.MessageConstraints;
import org.apache.http.entity.ContentLengthStrategy;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.HttpMessageParserFactory;
import org.apache.http.io.HttpMessageWriter;
import org.apache.http.io.HttpMessageWriterFactory;
import org.apache.http.util.Args;

@NotThreadSafe
public class DefaultBHttpServerConnection
  extends BHttpConnectionBase
  implements HttpServerConnection
{
  private final HttpMessageParser<HttpRequest> requestParser;
  private final HttpMessageWriter<HttpResponse> responseWriter;
  
  public DefaultBHttpServerConnection(int paramInt)
  {
    this(paramInt, paramInt, null, null, null, null, null, null, null);
  }
  
  public DefaultBHttpServerConnection(int paramInt1, int paramInt2, CharsetDecoder paramCharsetDecoder, CharsetEncoder paramCharsetEncoder, MessageConstraints paramMessageConstraints, ContentLengthStrategy paramContentLengthStrategy1, ContentLengthStrategy paramContentLengthStrategy2, HttpMessageParserFactory<HttpRequest> paramHttpMessageParserFactory, HttpMessageWriterFactory<HttpResponse> paramHttpMessageWriterFactory) {}
  
  public DefaultBHttpServerConnection(int paramInt, CharsetDecoder paramCharsetDecoder, CharsetEncoder paramCharsetEncoder, MessageConstraints paramMessageConstraints)
  {
    this(paramInt, paramInt, paramCharsetDecoder, paramCharsetEncoder, paramMessageConstraints, null, null, null, null);
  }
  
  public void bind(Socket paramSocket)
    throws IOException
  {
    super.bind(paramSocket);
  }
  
  public void flush()
    throws IOException
  {
    ensureOpen();
    doFlush();
  }
  
  protected void onRequestReceived(HttpRequest paramHttpRequest) {}
  
  protected void onResponseSubmitted(HttpResponse paramHttpResponse) {}
  
  public void receiveRequestEntity(HttpEntityEnclosingRequest paramHttpEntityEnclosingRequest)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpEntityEnclosingRequest, "HTTP request");
    ensureOpen();
    paramHttpEntityEnclosingRequest.setEntity(prepareInput(paramHttpEntityEnclosingRequest));
  }
  
  public HttpRequest receiveRequestHeader()
    throws HttpException, IOException
  {
    ensureOpen();
    HttpRequest localHttpRequest = (HttpRequest)requestParser.parse();
    onRequestReceived(localHttpRequest);
    incrementRequestCount();
    return localHttpRequest;
  }
  
  public void sendResponseEntity(HttpResponse paramHttpResponse)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    ensureOpen();
    HttpEntity localHttpEntity = paramHttpResponse.getEntity();
    if (localHttpEntity == null) {
      return;
    }
    paramHttpResponse = prepareOutput(paramHttpResponse);
    localHttpEntity.writeTo(paramHttpResponse);
    paramHttpResponse.close();
  }
  
  public void sendResponseHeader(HttpResponse paramHttpResponse)
    throws HttpException, IOException
  {
    Args.notNull(paramHttpResponse, "HTTP response");
    ensureOpen();
    responseWriter.write(paramHttpResponse);
    onResponseSubmitted(paramHttpResponse);
    if (paramHttpResponse.getStatusLine().getStatusCode() >= 200) {
      incrementResponseCount();
    }
  }
}
