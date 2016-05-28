package rx.internal.util;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Subscription;
import rx.functions.Func1;

public final class SubscriptionIndexedRingBuffer<T extends Subscription>
  implements Subscription
{
  private static final Func1<Subscription, Boolean> UNSUBSCRIBE = new Func1()
  {
    public Boolean call(Subscription paramAnonymousSubscription)
    {
      paramAnonymousSubscription.unsubscribe();
      return Boolean.TRUE;
    }
  };
  private static final AtomicIntegerFieldUpdater<SubscriptionIndexedRingBuffer> UNSUBSCRIBED = AtomicIntegerFieldUpdater.newUpdater(SubscriptionIndexedRingBuffer.class, "unsubscribed");
  private volatile IndexedRingBuffer<T> subscriptions = IndexedRingBuffer.getInstance();
  private volatile int unsubscribed = 0;
  
  public SubscriptionIndexedRingBuffer() {}
  
  private static void unsubscribeFromAll(IndexedRingBuffer<? extends Subscription> paramIndexedRingBuffer)
  {
    if (paramIndexedRingBuffer == null) {
      return;
    }
    paramIndexedRingBuffer.forEach(UNSUBSCRIBE);
  }
  
  /* Error */
  public int add(T paramT)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 48	rx/internal/util/SubscriptionIndexedRingBuffer:unsubscribed	I
    //   6: iconst_1
    //   7: if_icmpeq +10 -> 17
    //   10: aload_0
    //   11: getfield 46	rx/internal/util/SubscriptionIndexedRingBuffer:subscriptions	Lrx/internal/util/IndexedRingBuffer;
    //   14: ifnonnull +15 -> 29
    //   17: aload_1
    //   18: invokeinterface 61 1 0
    //   23: iconst_m1
    //   24: istore_2
    //   25: aload_0
    //   26: monitorexit
    //   27: iload_2
    //   28: ireturn
    //   29: aload_0
    //   30: getfield 46	rx/internal/util/SubscriptionIndexedRingBuffer:subscriptions	Lrx/internal/util/IndexedRingBuffer;
    //   33: aload_1
    //   34: invokevirtual 64	rx/internal/util/IndexedRingBuffer:add	(Ljava/lang/Object;)I
    //   37: istore_3
    //   38: iload_3
    //   39: istore_2
    //   40: aload_0
    //   41: getfield 48	rx/internal/util/SubscriptionIndexedRingBuffer:unsubscribed	I
    //   44: iconst_1
    //   45: if_icmpne -20 -> 25
    //   48: aload_1
    //   49: invokeinterface 61 1 0
    //   54: iload_3
    //   55: istore_2
    //   56: goto -31 -> 25
    //   59: astore_1
    //   60: aload_0
    //   61: monitorexit
    //   62: aload_1
    //   63: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	64	0	this	SubscriptionIndexedRingBuffer
    //   0	64	1	paramT	T
    //   24	32	2	i	int
    //   37	18	3	j	int
    // Exception table:
    //   from	to	target	type
    //   2	17	59	finally
    //   17	23	59	finally
    //   29	38	59	finally
    //   40	54	59	finally
  }
  
  /* Error */
  public int forEach(Func1<T, Boolean> paramFunc1, int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 48	rx/internal/util/SubscriptionIndexedRingBuffer:unsubscribed	I
    //   6: iconst_1
    //   7: if_icmpeq +12 -> 19
    //   10: aload_0
    //   11: getfield 46	rx/internal/util/SubscriptionIndexedRingBuffer:subscriptions	Lrx/internal/util/IndexedRingBuffer;
    //   14: astore_3
    //   15: aload_3
    //   16: ifnonnull +9 -> 25
    //   19: iconst_0
    //   20: istore_2
    //   21: aload_0
    //   22: monitorexit
    //   23: iload_2
    //   24: ireturn
    //   25: aload_0
    //   26: getfield 46	rx/internal/util/SubscriptionIndexedRingBuffer:subscriptions	Lrx/internal/util/IndexedRingBuffer;
    //   29: aload_1
    //   30: iload_2
    //   31: invokevirtual 68	rx/internal/util/IndexedRingBuffer:forEach	(Lrx/functions/Func1;I)I
    //   34: istore_2
    //   35: goto -14 -> 21
    //   38: astore_1
    //   39: aload_0
    //   40: monitorexit
    //   41: aload_1
    //   42: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	43	0	this	SubscriptionIndexedRingBuffer
    //   0	43	1	paramFunc1	Func1<T, Boolean>
    //   0	43	2	paramInt	int
    //   14	2	3	localIndexedRingBuffer	IndexedRingBuffer
    // Exception table:
    //   from	to	target	type
    //   2	15	38	finally
    //   25	35	38	finally
  }
  
  public boolean isUnsubscribed()
  {
    return unsubscribed == 1;
  }
  
  public void remove(int paramInt)
  {
    if ((unsubscribed == 1) || (subscriptions == null) || (paramInt < 0)) {}
    Subscription localSubscription;
    do
    {
      return;
      localSubscription = (Subscription)subscriptions.remove(paramInt);
    } while ((localSubscription == null) || (localSubscription == null));
    localSubscription.unsubscribe();
  }
  
  public void unsubscribe()
  {
    if ((UNSUBSCRIBED.compareAndSet(this, 0, 1)) && (subscriptions != null))
    {
      unsubscribeFromAll(subscriptions);
      IndexedRingBuffer localIndexedRingBuffer = subscriptions;
      subscriptions = null;
      localIndexedRingBuffer.unsubscribe();
    }
  }
}
