package org.apache.http.impl;

import java.util.Locale;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseFactory;
import org.apache.http.ProtocolVersion;
import org.apache.http.ReasonPhraseCatalog;
import org.apache.http.StatusLine;
import org.apache.http.annotation.Immutable;
import org.apache.http.message.BasicHttpResponse;
import org.apache.http.message.BasicStatusLine;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.Args;

@Immutable
public class DefaultHttpResponseFactory
  implements HttpResponseFactory
{
  public static final DefaultHttpResponseFactory INSTANCE = new DefaultHttpResponseFactory();
  protected final ReasonPhraseCatalog reasonCatalog;
  
  public DefaultHttpResponseFactory()
  {
    this(EnglishReasonPhraseCatalog.INSTANCE);
  }
  
  public DefaultHttpResponseFactory(ReasonPhraseCatalog paramReasonPhraseCatalog)
  {
    reasonCatalog = ((ReasonPhraseCatalog)Args.notNull(paramReasonPhraseCatalog, "Reason phrase catalog"));
  }
  
  protected Locale determineLocale(HttpContext paramHttpContext)
  {
    return Locale.getDefault();
  }
  
  public HttpResponse newHttpResponse(ProtocolVersion paramProtocolVersion, int paramInt, HttpContext paramHttpContext)
  {
    Args.notNull(paramProtocolVersion, "HTTP version");
    paramHttpContext = determineLocale(paramHttpContext);
    return new BasicHttpResponse(new BasicStatusLine(paramProtocolVersion, paramInt, reasonCatalog.getReason(paramInt, paramHttpContext)));
  }
  
  public HttpResponse newHttpResponse(StatusLine paramStatusLine, HttpContext paramHttpContext)
  {
    Args.notNull(paramStatusLine, "Status line");
    return new BasicHttpResponse(paramStatusLine);
  }
}
