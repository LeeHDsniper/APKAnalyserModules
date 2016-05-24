package okio;

import java.io.IOException;

public abstract class ForwardingSink
  implements Sink
{
  private final Sink delegate;
  
  public ForwardingSink(Sink paramSink)
  {
    if (paramSink == null) {
      throw new IllegalArgumentException("delegate == null");
    }
    delegate = paramSink;
  }
  
  public void close()
    throws IOException
  {
    delegate.close();
  }
  
  public void flush()
    throws IOException
  {
    delegate.flush();
  }
  
  public Timeout timeout()
  {
    return delegate.timeout();
  }
  
  public String toString()
  {
    return getClass().getSimpleName() + "(" + delegate.toString() + ")";
  }
  
  public void write(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    delegate.write(paramBuffer, paramLong);
  }
}
