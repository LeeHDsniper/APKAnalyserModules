package org.apache.http.impl.io;

import org.apache.http.HttpRequest;
import org.apache.http.annotation.Immutable;
import org.apache.http.io.HttpMessageWriter;
import org.apache.http.io.HttpMessageWriterFactory;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.message.BasicLineFormatter;
import org.apache.http.message.LineFormatter;

@Immutable
public class DefaultHttpRequestWriterFactory
  implements HttpMessageWriterFactory<HttpRequest>
{
  public static final DefaultHttpRequestWriterFactory INSTANCE = new DefaultHttpRequestWriterFactory();
  private final LineFormatter lineFormatter;
  
  public DefaultHttpRequestWriterFactory()
  {
    this(null);
  }
  
  public DefaultHttpRequestWriterFactory(LineFormatter paramLineFormatter)
  {
    if (paramLineFormatter != null) {}
    for (;;)
    {
      lineFormatter = paramLineFormatter;
      return;
      paramLineFormatter = BasicLineFormatter.INSTANCE;
    }
  }
  
  public HttpMessageWriter<HttpRequest> create(SessionOutputBuffer paramSessionOutputBuffer)
  {
    return new DefaultHttpRequestWriter(paramSessionOutputBuffer, lineFormatter);
  }
}
