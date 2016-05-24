package org.apache.http.impl.io;

import java.io.IOException;
import org.apache.http.ConnectionClosedException;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestFactory;
import org.apache.http.ParseException;
import org.apache.http.annotation.NotThreadSafe;
import org.apache.http.config.MessageConstraints;
import org.apache.http.impl.DefaultHttpRequestFactory;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.message.LineParser;
import org.apache.http.message.ParserCursor;
import org.apache.http.params.HttpParams;
import org.apache.http.util.Args;
import org.apache.http.util.CharArrayBuffer;

@NotThreadSafe
public class DefaultHttpRequestParser
  extends AbstractMessageParser<HttpRequest>
{
  private final CharArrayBuffer lineBuf;
  private final HttpRequestFactory requestFactory;
  
  public DefaultHttpRequestParser(SessionInputBuffer paramSessionInputBuffer)
  {
    this(paramSessionInputBuffer, null, null, MessageConstraints.DEFAULT);
  }
  
  public DefaultHttpRequestParser(SessionInputBuffer paramSessionInputBuffer, MessageConstraints paramMessageConstraints)
  {
    this(paramSessionInputBuffer, null, null, paramMessageConstraints);
  }
  
  public DefaultHttpRequestParser(SessionInputBuffer paramSessionInputBuffer, LineParser paramLineParser, HttpRequestFactory paramHttpRequestFactory, MessageConstraints paramMessageConstraints)
  {
    super(paramSessionInputBuffer, paramLineParser, paramMessageConstraints);
    if (paramHttpRequestFactory != null) {}
    for (;;)
    {
      requestFactory = paramHttpRequestFactory;
      lineBuf = new CharArrayBuffer(128);
      return;
      paramHttpRequestFactory = DefaultHttpRequestFactory.INSTANCE;
    }
  }
  
  @Deprecated
  public DefaultHttpRequestParser(SessionInputBuffer paramSessionInputBuffer, LineParser paramLineParser, HttpRequestFactory paramHttpRequestFactory, HttpParams paramHttpParams)
  {
    super(paramSessionInputBuffer, paramLineParser, paramHttpParams);
    requestFactory = ((HttpRequestFactory)Args.notNull(paramHttpRequestFactory, "Request factory"));
    lineBuf = new CharArrayBuffer(128);
  }
  
  protected HttpRequest parseHead(SessionInputBuffer paramSessionInputBuffer)
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
