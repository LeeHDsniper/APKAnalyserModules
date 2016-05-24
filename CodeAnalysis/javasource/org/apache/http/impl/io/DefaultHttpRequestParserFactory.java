package org.apache.http.impl.io;

import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestFactory;
import org.apache.http.annotation.Immutable;
import org.apache.http.config.MessageConstraints;
import org.apache.http.impl.DefaultHttpRequestFactory;
import org.apache.http.io.HttpMessageParser;
import org.apache.http.io.HttpMessageParserFactory;
import org.apache.http.io.SessionInputBuffer;
import org.apache.http.message.BasicLineParser;
import org.apache.http.message.LineParser;

@Immutable
public class DefaultHttpRequestParserFactory
  implements HttpMessageParserFactory<HttpRequest>
{
  public static final DefaultHttpRequestParserFactory INSTANCE = new DefaultHttpRequestParserFactory();
  private final LineParser lineParser;
  private final HttpRequestFactory requestFactory;
  
  public DefaultHttpRequestParserFactory()
  {
    this(null, null);
  }
  
  public DefaultHttpRequestParserFactory(LineParser paramLineParser, HttpRequestFactory paramHttpRequestFactory)
  {
    if (paramLineParser != null)
    {
      lineParser = paramLineParser;
      if (paramHttpRequestFactory == null) {
        break label30;
      }
    }
    for (;;)
    {
      requestFactory = paramHttpRequestFactory;
      return;
      paramLineParser = BasicLineParser.INSTANCE;
      break;
      label30:
      paramHttpRequestFactory = DefaultHttpRequestFactory.INSTANCE;
    }
  }
  
  public HttpMessageParser<HttpRequest> create(SessionInputBuffer paramSessionInputBuffer, MessageConstraints paramMessageConstraints)
  {
    return new DefaultHttpRequestParser(paramSessionInputBuffer, lineParser, requestFactory, paramMessageConstraints);
  }
}
