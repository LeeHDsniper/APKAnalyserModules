package org.apache.http.impl.io;

import java.io.IOException;
import org.apache.http.HttpException;
import org.apache.http.HttpMessage;
import org.apache.http.HttpResponseFactory;
import org.apache.http.NoHttpResponseException;
import org.apache.http.ParseException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.message.LineParser;
import org.apache.http.message.ParserCursor;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@Deprecated
@NotThreadSafe
public class HttpResponseParser
  extends AbstractMessageParser<HttpMessage>
{
  private final CharArrayBuffer lineBuf;
  private final HttpResponseFactory responseFactory;
  
  public HttpResponseParser(SessionInputBuffer paramSessionInputBuffer, LineParser paramLineParser, HttpResponseFactory paramHttpResponseFactory, HttpParams paramHttpParams)
  {
    super(paramSessionInputBuffer, paramLineParser, paramHttpParams);
    responseFactory = ((HttpResponseFactory)Args.notNull(paramHttpResponseFactory, "Response factory"));
    lineBuf = new CharArrayBuffer(128);
  }
  
  protected HttpMessage parseHead(SessionInputBuffer paramSessionInputBuffer)
    throws IOException, HttpException, ParseException
  {
    lineBuf.clear();
    if (paramSessionInputBuffer.readLine(lineBuf) == -1) {
      throw new NoHttpResponseException("The target server failed to respond");
    }
    paramSessionInputBuffer = new ParserCursor(0, lineBuf.length());
    paramSessionInputBuffer = lineParser.parseStatusLine(lineBuf, paramSessionInputBuffer);
    return responseFactory.newHttpResponse(paramSessionInputBuffer, null);
  }
}
