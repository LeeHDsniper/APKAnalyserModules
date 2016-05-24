package org.apache.http.impl.io;

import java.io.IOException;
import org.apache.http.ConnectionClosedException;
import org.apache.http.HttpException;
import org.apache.http.HttpMessage;
import org.apache.http.HttpRequestFactory;
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
public class HttpRequestParser
  extends AbstractMessageParser<HttpMessage>
{
  private final CharArrayBuffer lineBuf;
  private final HttpRequestFactory requestFactory;
  
  public HttpRequestParser(SessionInputBuffer paramSessionInputBuffer, LineParser paramLineParser, HttpRequestFactory paramHttpRequestFactory, HttpParams paramHttpParams)
  {
    super(paramSessionInputBuffer, paramLineParser, paramHttpParams);
    requestFactory = ((HttpRequestFactory)Args.notNull(paramHttpRequestFactory, "Request factory"));
    lineBuf = new CharArrayBuffer(128);
  }
  
  protected HttpMessage parseHead(SessionInputBuffer paramSessionInputBuffer)
    throws IOException, HttpException, ParseException
  {
    lineBuf.clear();
    if (paramSessionInputBuffer.readLine(lineBuf) == -1) {
      throw new ConnectionClosedException("Client closed connection");
    }
    paramSessionInputBuffer = new ParserCursor(0, lineBuf.length());
    paramSessionInputBuffer = lineParser.parseRequestLine(lineBuf, paramSessionInputBuffer);
    return requestFactory.newHttpRequest(paramSessionInputBuffer);
  }
}
