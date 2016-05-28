package org.apache.http.impl.entity;

import org.apache.http.Header;
import org.apache.http.HttpException;
import org.apache.http.HttpMessage;
import org.apache.http.HttpVersion;
import org.apache.http.ProtocolException;
import org.apache.http.ProtocolVersion;
import org.apache.http.annotation.Immutable;
import org.apache.http.entity.ContentLengthStrategy;
import org.apache.http.util.Args;

@Immutable
public class StrictContentLengthStrategy
  implements ContentLengthStrategy
{
  public static final StrictContentLengthStrategy INSTANCE = new StrictContentLengthStrategy();
  private final int implicitLen;
  
  public StrictContentLengthStrategy()
  {
    this(-1);
  }
  
  public StrictContentLengthStrategy(int paramInt)
  {
    implicitLen = paramInt;
  }
  
  public long determineLength(HttpMessage paramHttpMessage)
    throws HttpException
  {
    Args.notNull(paramHttpMessage, "HTTP message");
    Object localObject = paramHttpMessage.getFirstHeader("Transfer-Encoding");
    long l1;
    if (localObject != null)
    {
      localObject = ((Header)localObject).getValue();
      if ("chunked".equalsIgnoreCase((String)localObject))
      {
        if (paramHttpMessage.getProtocolVersion().lessEquals(HttpVersion.HTTP_1_0)) {
          throw new ProtocolException("Chunked transfer encoding not allowed for " + paramHttpMessage.getProtocolVersion());
        }
        l1 = -2L;
      }
    }
    for (;;)
    {
      return l1;
      if ("identity".equalsIgnoreCase((String)localObject)) {
        return -1L;
      }
      throw new ProtocolException("Unsupported transfer encoding: " + (String)localObject);
      paramHttpMessage = paramHttpMessage.getFirstHeader("Content-Length");
      if (paramHttpMessage != null)
      {
        paramHttpMessage = paramHttpMessage.getValue();
        try
        {
          long l2 = Long.parseLong(paramHttpMessage);
          l1 = l2;
          if (l2 < 0L) {
            throw new ProtocolException("Negative content length: " + paramHttpMessage);
          }
        }
        catch (NumberFormatException localNumberFormatException)
        {
          throw new ProtocolException("Invalid content length: " + paramHttpMessage);
        }
      }
    }
    return implicitLen;
  }
}
