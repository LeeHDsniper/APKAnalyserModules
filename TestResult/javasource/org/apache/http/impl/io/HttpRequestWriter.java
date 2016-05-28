package org.apache.http.impl.io;

import java.io.IOException;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.message.LineFormatter;
import org.apache.http.params.HttpParams;

@Deprecated
@NotThreadSafe
public class HttpRequestWriter
  extends AbstractMessageWriter<HttpRequest>
{
  public HttpRequestWriter(SessionOutputBuffer paramSessionOutputBuffer, LineFormatter paramLineFormatter, HttpParams paramHttpParams)
  {
    super(paramSessionOutputBuffer, paramLineFormatter, paramHttpParams);
  }
  
  protected void writeHeadLine(HttpRequest paramHttpRequest)
    throws IOException
  {
    lineFormatter.formatRequestLine(lineBuf, paramHttpRequest.getRequestLine());
    sessionBuffer.writeLine(lineBuf);
  }
}
