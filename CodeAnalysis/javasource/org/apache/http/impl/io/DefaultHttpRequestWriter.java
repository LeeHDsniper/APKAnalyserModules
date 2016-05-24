package org.apache.http.impl.io;

import java.io.IOException;
import org.apache.http.HttpRequest;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.SessionOutputBuffer;
import org.apache.http.message.LineFormatter;

@NotThreadSafe
public class DefaultHttpRequestWriter
  extends AbstractMessageWriter<HttpRequest>
{
  public DefaultHttpRequestWriter(SessionOutputBuffer paramSessionOutputBuffer)
  {
    this(paramSessionOutputBuffer, null);
  }
  
  public DefaultHttpRequestWriter(SessionOutputBuffer paramSessionOutputBuffer, LineFormatter paramLineFormatter)
  {
    super(paramSessionOutputBuffer, paramLineFormatter);
  }
  
  protected void writeHeadLine(HttpRequest paramHttpRequest)
    throws IOException
  {
    lineFormatter.formatRequestLine(lineBuf, paramHttpRequest.getRequestLine());
    sessionBuffer.writeLine(lineBuf);
  }
}
