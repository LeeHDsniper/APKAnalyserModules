package rx.internal.operators;

import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;

public final class BackpressureUtils
{
  public static long getAndAddRequest(AtomicLong paramAtomicLong, long paramLong)
  {
    long l3;
    long l1;
    do
    {
      l3 = paramAtomicLong.get();
      long l2 = l3 + paramLong;
      l1 = l2;
      if (l2 < 0L) {
        l1 = Long.MAX_VALUE;
      }
    } while (!paramAtomicLong.compareAndSet(l3, l1));
    return l3;
  }
  
  public static <T> long getAndAddRequest(AtomicLongFieldUpdater<T> paramAtomicLongFieldUpdater, T paramT, long paramLong)
  {
    long l3;
    long l1;
    do
    {
      l3 = paramAtomicLongFieldUpdater.get(paramT);
      long l2 = l3 + paramLong;
      l1 = l2;
      if (l2 < 0L) {
        l1 = Long.MAX_VALUE;
      }
    } while (!paramAtomicLongFieldUpdater.compareAndSet(paramT, l3, l1));
    return l3;
  }
}
