package org.apache.http.impl.entity;

import org.apache.http.HttpException;
import org.apache.http.HttpMessage;
import org.apache.http.ProtocolException;
import org.apache.http.annotation.Immutable;
import org.apache.http.entity.ContentLengthStrategy;

@Immutable
public class DisallowIdentityContentLengthStrategy
  implements ContentLengthStrategy
{
  public static final DisallowIdentityContentLengthStrategy INSTANCE = new DisallowIdentityContentLengthStrategy(new LaxContentLengthStrategy(0));
  private final ContentLengthStrategy contentLengthStrategy;
  
  public DisallowIdentityContentLengthStrategy(ContentLengthStrategy paramContentLengthStrategy)
  {
    contentLengthStrategy = paramContentLengthStrategy;
  }
  
  public long determineLength(HttpMessage paramHttpMessage)
    throws HttpException
  {
    long l = contentLengthStrategy.determineLength(paramHttpMessage);
    if (l == -1L) {
      throw new ProtocolException("Identity transfer encoding cannot be used");
    }
    return l;
  }
}
