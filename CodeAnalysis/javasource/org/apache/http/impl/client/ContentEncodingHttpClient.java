package org.apache.http.impl.client;

import org.apache.http.annotation.ThreadSafe;
import org.apache.http.client.protocol.RequestAcceptEncoding;
import org.apache.http.client.protocol.ResponseContentEncoding;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.BasicHttpProcessor;

@Deprecated
@ThreadSafe
public class ContentEncodingHttpClient
  extends DefaultHttpClient
{
  public ContentEncodingHttpClient()
  {
    this(null);
  }
  
  public ContentEncodingHttpClient(ClientConnectionManager paramClientConnectionManager, HttpParams paramHttpParams)
  {
    super(paramClientConnectionManager, paramHttpParams);
  }
  
  public ContentEncodingHttpClient(HttpParams paramHttpParams)
  {
    this(null, paramHttpParams);
  }
  
  protected BasicHttpProcessor createHttpProcessor()
  {
    BasicHttpProcessor localBasicHttpProcessor = super.createHttpProcessor();
    localBasicHttpProcessor.addRequestInterceptor(new RequestAcceptEncoding());
    localBasicHttpProcessor.addResponseInterceptor(new ResponseContentEncoding());
    return localBasicHttpProcessor;
  }
}
