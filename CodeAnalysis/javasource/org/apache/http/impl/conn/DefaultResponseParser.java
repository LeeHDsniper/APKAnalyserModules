package org.apache.http.impl.conn;

import java.io.IOException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpException;
import org.apache.http.HttpMessage;
import org.apache.http.HttpResponseFactory;
import org.apache.http.NoHttpResponseException;
import org.apache.http.ProtocolException;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.impl.io.AbstractMessageParser;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.message.LineParser;
import org.apache.http.message.ParserCursor;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Deprecated
@ThreadSafe
public class DefaultResponseParser
  extends AbstractMessageParser<HttpMessage>
{
  private final CharArrayBuffer lineBuf;
  private final Log log = LogFactory.getLog(getClass());
  private final int maxGarbageLines;
  private final HttpResponseFactory responseFactory;
  
  public DefaultResponseParser(SessionInputBuffer paramSessionInputBuffer, LineParser paramLineParser, HttpResponseFactory paramHttpResponseFactory, HttpParams paramHttpParams)
  {
    super(paramSessionInputBuffer, paramLineParser, paramHttpParams);
    Args.notNull(paramHttpResponseFactory, "Response factory");
    responseFactory = paramHttpResponseFactory;
    lineBuf = new CharArrayBuffer(128);
    maxGarbageLines = getMaxGarbageLines(paramHttpParams);
  }
  
  protected int getMaxGarbageLines(HttpParams paramHttpParams)
  {
    return paramHttpParams.getIntParameter("http.connection.max-status-line-garbage", Integer.MAX_VALUE);
  }
  
  protected HttpMessage parseHead(SessionInputBuffer paramSessionInputBuffer)
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
      if ((j == -1) || (i >= maxGarbageLines)) {
        throw new ProtocolException("The server failed to respond with a valid HTTP response");
      }
      if (log.isDebugEnabled()) {
        log.debug("Garbage in response: " + lineBuf.toString());
      }
      i += 1;
    }
  }
}
