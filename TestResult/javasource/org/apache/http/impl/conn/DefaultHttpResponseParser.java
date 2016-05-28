package org.apache.http.impl.conn;

import java.io.IOException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpException;
import org.apache.http.HttpResponse;
import org.apache.http.HttpResponseFactory;
import org.apache.http.NoHttpResponseException;
import org.apache.http.ProtocolException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.config.MessageConstraints;
import org.apache.http.impl.DefaultHttpResponseFactory;
import org.apache.http.impl.io.AbstractMessageParser;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.message.LineParser;
import org.apache.http.message.ParserCursor;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class DefaultHttpResponseParser
  extends AbstractMessageParser<HttpResponse>
{
  private final CharArrayBuffer lineBuf;
  private final Log log = LogFactory.getLog(getClass());
  private final HttpResponseFactory responseFactory;
  
  public DefaultHttpResponseParser(SessionInputBuffer paramSessionInputBuffer)
  {
    this(paramSessionInputBuffer, null, null, MessageConstraints.DEFAULT);
  }
  
  public DefaultHttpResponseParser(SessionInputBuffer paramSessionInputBuffer, MessageConstraints paramMessageConstraints)
  {
    this(paramSessionInputBuffer, null, null, paramMessageConstraints);
  }
  
  public DefaultHttpResponseParser(SessionInputBuffer paramSessionInputBuffer, LineParser paramLineParser, HttpResponseFactory paramHttpResponseFactory, MessageConstraints paramMessageConstraints)
  {
    super(paramSessionInputBuffer, paramLineParser, paramMessageConstraints);
    if (paramHttpResponseFactory != null) {}
    for (;;)
    {
      responseFactory = paramHttpResponseFactory;
      lineBuf = new CharArrayBuffer(128);
      return;
      paramHttpResponseFactory = DefaultHttpResponseFactory.INSTANCE;
    }
  }
  
  @Deprecated
  public DefaultHttpResponseParser(SessionInputBuffer paramSessionInputBuffer, LineParser paramLineParser, HttpResponseFactory paramHttpResponseFactory, HttpParams paramHttpParams)
  {
    super(paramSessionInputBuffer, paramLineParser, paramHttpParams);
    Args.notNull(paramHttpResponseFactory, "Response factory");
    responseFactory = paramHttpResponseFactory;
    lineBuf = new CharArrayBuffer(128);
  }
  
  protected HttpResponse parseHead(SessionInputBuffer paramSessionInputBuffer)
    throws IOException, HttpException
  {
    int i = 0;
    for (;;)
    {
      lineBuf.clear();
      int j = paramSessionInputBuffer.readLine(lineBuf);
      if ((j == -1) && (i == 0)) {
        throw new NoHttpResponseException("The target server failed to respond");
      }
      ParserCursor localParserCursor = new ParserCursor(0, lineBuf.length());
      if (lineParser.hasProtocolVersion(lineBuf, localParserCursor))
      {
        paramSessionInputBuffer = lineParser.parseStatusLine(lineBuf, localParserCursor);
        return responseFactory.newHttpResponse(paramSessionInputBuffer, null);
      }
      if ((j == -1) || (reject(lineBuf, i))) {
        throw new ProtocolException("The server failed to respond with a valid HTTP response");
      }
      if (log.isDebugEnabled()) {
        log.debug("Garbage in response: " + lineBuf.toString());
      }
      i += 1;
    }
  }
  
  protected boolean reject(CharArrayBuffer paramCharArrayBuffer, int paramInt)
  {
    return false;
  }
}
