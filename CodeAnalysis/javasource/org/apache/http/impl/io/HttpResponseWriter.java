package org.apache.http.impl.io;

import java.io.IOException;
import org.apache.http.HttpResponse;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.message.LineFormatter;
import org.apache.http.params.HttpParams;

@Deprecated
@NotThreadSafe
public class HttpResponseWriter
  extends AbstractMessageWriter<HttpResponse>
{
  public HttpResponseWriter(SessionOutputBuffer paramSessionOutputBuffer, LineFormatter paramLineFormatter, HttpParams paramHttpParams)
  {
    super(paramSessionOutputBuffer, paramLineFormatter, paramHttpParams);
  }
  
  protected void writeHeadLine(HttpResponse paramHttpResponse)
    throws IOException
  {
    lineFormatter.formatStatusLine(lineBuf, paramHttpResponse.getStatusLine());
    sessionBuffer.writeLine(lineBuf);
  }
}
