package mqq.os;

import android.os.Message;
import java.util.concurrent.atomic.AtomicInteger;

public class MqqMessage
{
  static boolean DEBUG_MESSAGE = true;
  private static final int MAX_POOL_SIZE = 10;
  private static AtomicInteger sIndex = new AtomicInteger(0);
  private static MqqMessage sPool;
  private static int sPoolSize;
  private static final Object sPoolSync = new Object();
  private int index;
  MqqMessage next;
  IMqqMessageCallback target;
  long when;
  Message wrappedMsg;
  
  static
  {
    sPoolSize = 0;
  }
  
  private MqqMessage()
  {
    if (DEBUG_MESSAGE) {
      index = sIndex.incrementAndGet();
    }
  }
  
  public static MqqMessage obtain()
  {
    synchronized (sPoolSync)
    {
      if (sPool != null)
      {
        MqqMessage localMqqMessage = sPool;
        sPool = next;
        next = null;
        if (DEBUG_MESSAGE) {
          index = sIndex.incrementAndGet();
        }
        sPoolSize -= 1;
        return localMqqMessage;
      }
      return new MqqMessage();
    }
  }
  
  public static MqqMessage obtain(Message paramMessage)
  {
    MqqMessage localMqqMessage = obtain();
    wrappedMsg = paramMessage;
    return localMqqMessage;
  }
  
  public void recycle()
  {
    if (wrappedMsg != null) {
      wrappedMsg.recycle();
    }
    when = 0L;
    wrappedMsg = null;
    target = null;
    synchronized (sPoolSync)
    {
      if (sPoolSize < 10)
      {
        next = sPool;
        sPool = this;
        sPoolSize += 1;
      }
      return;
    }
  }
  
  public String toString()
  {
    return "MqqMessage@" + index;
  }
}
