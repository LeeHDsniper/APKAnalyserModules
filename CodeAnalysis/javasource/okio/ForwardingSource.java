package okio;

import java.io.IOException;

public abstract class ForwardingSource
  implements Source
{
  private final Source delegate;
  
  public ForwardingSource(Source paramSource)
  {
    if (paramSource == null) {
      throw new IllegalArgumentException("delegate == null");
    }
    delegate = paramSource;
  }
  
  public void close()
    throws IOException
  {
    delegate.close();
  }
  
  public long read(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    return delegate.read(paramBuffer, paramLong);
  }
  
  public Timeout timeout()
  {
    return delegate.timeout();
  }
  
  public String toString()
  {
    return getClass().getSimpleName() + "(" + delegate.toString() + ")";
  }
}
