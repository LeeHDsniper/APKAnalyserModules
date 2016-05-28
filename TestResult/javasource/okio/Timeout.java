package okio;

import java.io.IOException;
import java.io.InterruptedIOException;
import java.util.concurrent.TimeUnit;

public class Timeout
{
  public static final Timeout NONE = new Timeout()
  {
    public void throwIfReached()
      throws IOException
    {}
    
    public Timeout timeout(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
    {
      return this;
    }
  };
  private long deadlineNanoTime;
  private boolean hasDeadline;
  private long timeoutNanos;
  
  public Timeout() {}
  
  public long deadlineNanoTime()
  {
    if (!hasDeadline) {
      throw new IllegalStateException("No deadline");
    }
    return deadlineNanoTime;
  }
  
  public boolean hasDeadline()
  {
    return hasDeadline;
  }
  
  public void throwIfReached()
    throws IOException
  {
    if (Thread.interrupted()) {
      throw new InterruptedIOException();
    }
    if ((hasDeadline) && (System.nanoTime() > deadlineNanoTime)) {
      throw new IOException("deadline reached");
    }
  }
  
  public Timeout timeout(long paramLong, TimeUnit paramTimeUnit)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("timeout < 0: " + paramLong);
    }
    if (paramTimeUnit == null) {
      throw new IllegalArgumentException("unit == null");
    }
    timeoutNanos = paramTimeUnit.toNanos(paramLong);
    return this;
  }
  
  public long timeoutNanos()
  {
    return timeoutNanos;
  }
}
