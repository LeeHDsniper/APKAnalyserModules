package org.apache.http.impl.entity;

import org.apache.http.Header;
import org.apache.http.HeaderElement;
import org.apache.http.HttpException;
import org.apache.http.HttpMessage;
import org.apache.http.ParseException;
import org.apache.http.ProtocolException;
import org.apache.http.annotation.Immutable;
import org.apache.http.entity.ContentLengthStrategy;
import org.apache.http.util.Args;

@Immutable
public class LaxContentLengthStrategy
  implements ContentLengthStrategy
{
  public static final LaxContentLengthStrategy INSTANCE = new LaxContentLengthStrategy();
  private final int implicitLen;
  
  public LaxContentLengthStrategy()
  {
    this(-1);
  }
  
  public LaxContentLengthStrategy(int paramInt)
  {
    implicitLen = paramInt;
  }
  
  public long determineLength(HttpMessage paramHttpMessage)
    throws HttpException
  {
    Args.notNull(paramHttpMessage, "HTTP message");
    Header localHeader = paramHttpMessage.getFirstHeader("Transfer-Encoding");
    int i;
    long l2;
    if (localHeader != null)
    {
      try
      {
        paramHttpMessage = localHeader.getElements();
        i = paramHttpMessage.length;
        if ("identity".equalsIgnoreCase(localHeader.getValue()))
        {
          l2 = -1L;
          return l2;
        }
      }
      catch (ParseException paramHttpMessage)
      {
        throw new ProtocolException("Invalid Transfer-Encoding header value: " + localHeader, paramHttpMessage);
      }
      if ((i > 0) && ("chunked".equalsIgnoreCase(paramHttpMessage[(i - 1)].getName()))) {
        return -2L;
      }
      return -1L;
    }
    if (paramHttpMessage.getFirstHeader("Content-Length") != null)
    {
      l2 = -1L;
      paramHttpMessage = paramHttpMessage.getHeaders("Content-Length");
      i = paramHttpMessage.length - 1;
      for (;;)
      {
        long l1 = l2;
        if (i >= 0) {
          localHeader = paramHttpMessage[i];
        }
        try
        {
          l1 = Long.parseLong(localHeader.getValue());
          l2 = l1;
          if (l1 >= 0L) {
            break;
          }
          return -1L;
        }
        catch (NumberFormatException localNumberFormatException)
        {
          i -= 1;
        }
      }
    }
    return implicitLen;
  }
}
