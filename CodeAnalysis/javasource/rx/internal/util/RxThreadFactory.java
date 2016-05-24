package rx.internal.util;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;

public final class RxThreadFactory
  implements ThreadFactory
{
  static final AtomicLongFieldUpdater<RxThreadFactory> COUNTER_UPDATER = AtomicLongFieldUpdater.newUpdater(RxThreadFactory.class, "counter");
  volatile long counter;
  final String prefix;
  
  public RxThreadFactory(String paramString)
  {
    prefix = paramString;
  }
  
  public Thread newThread(Runnable paramRunnable)
  {
    paramRunnable = new Thread(paramRunnable, prefix + COUNTER_UPDATER.incrementAndGet(this));
    paramRunnable.setDaemon(true);
    return paramRunnable;
  }
}
