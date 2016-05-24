package rx.internal.util;

import java.io.PrintStream;
import java.util.Queue;
import rx.Observer;
import rx.Subscription;
import rx.exceptions.MissingBackpressureException;
import rx.internal.operators.NotificationLite;
import rx.internal.util.unsafe.SpmcArrayQueue;
import rx.internal.util.unsafe.SpscArrayQueue;
import rx.internal.util.unsafe.UnsafeAccess;

public class RxRingBuffer
  implements Subscription
{
  public static final int SIZE;
  private static ObjectPool<Queue<Object>> SPMC_POOL;
  private static ObjectPool<Queue<Object>> SPSC_POOL;
  static int _size;
  private static final NotificationLite<Object> on = ;
  private final ObjectPool<Queue<Object>> pool;
  private Queue<Object> queue;
  private final int size;
  public volatile Object terminalState;
  
  static
  {
    _size = 128;
    if (PlatformDependent.isAndroid()) {
      _size = 16;
    }
    String str = System.getProperty("rx.ring-buffer.size");
    if (str != null) {}
    try
    {
      _size = Integer.parseInt(str);
      SIZE = _size;
      SPSC_POOL = new ObjectPool()
      {
        protected SpscArrayQueue<Object> createObject()
        {
          return new SpscArrayQueue(RxRingBuffer.SIZE);
        }
      };
      SPMC_POOL = new ObjectPool()
      {
        protected SpmcArrayQueue<Object> createObject()
        {
          return new SpmcArrayQueue(RxRingBuffer.SIZE);
        }
      };
      return;
    }
    catch (Exception localException)
    {
      for (;;)
      {
        System.err.println("Failed to set 'rx.buffer.size' with value " + str + " => " + localException.getMessage());
      }
    }
  }
  
  RxRingBuffer()
  {
    this(new SynchronizedQueue(SIZE), SIZE);
  }
  
  private RxRingBuffer(Queue<Object> paramQueue, int paramInt)
  {
    queue = paramQueue;
    pool = null;
    size = paramInt;
  }
  
  private RxRingBuffer(ObjectPool<Queue<Object>> paramObjectPool, int paramInt)
  {
    pool = paramObjectPool;
    queue = ((Queue)paramObjectPool.borrowObject());
    size = paramInt;
  }
  
  public static RxRingBuffer getSpmcInstance()
  {
    if (UnsafeAccess.isUnsafeAvailable()) {
      return new RxRingBuffer(SPMC_POOL, SIZE);
    }
    return new RxRingBuffer();
  }
  
  public static RxRingBuffer getSpscInstance()
  {
    if (UnsafeAccess.isUnsafeAvailable()) {
      return new RxRingBuffer(SPSC_POOL, SIZE);
    }
    return new RxRingBuffer();
  }
  
  public boolean accept(Object paramObject, Observer paramObserver)
  {
    return on.accept(paramObserver, paramObject);
  }
  
  public int capacity()
  {
    return size;
  }
  
  public int count()
  {
    Queue localQueue = queue;
    if (localQueue == null) {
      return 0;
    }
    return localQueue.size();
  }
  
  public Object getValue(Object paramObject)
  {
    return on.getValue(paramObject);
  }
  
  public boolean isCompleted(Object paramObject)
  {
    return on.isCompleted(paramObject);
  }
  
  public boolean isEmpty()
  {
    Queue localQueue = queue;
    if (localQueue == null) {
      return true;
    }
    return localQueue.isEmpty();
  }
  
  public boolean isUnsubscribed()
  {
    return queue == null;
  }
  
  public void onCompleted()
  {
    if (terminalState == null) {
      terminalState = on.completed();
    }
  }
  
  public void onNext(Object paramObject)
    throws MissingBackpressureException
  {
    int j = 0;
    int i = 0;
    try
    {
      Queue localQueue = queue;
      if (localQueue != null) {
        if (!localQueue.offer(on.next(paramObject))) {
          i = 1;
        }
      }
      for (;;)
      {
        if (j == 0) {
          break;
        }
        throw new IllegalStateException("This instance has been unsubscribed and the queue is no longer usable.");
        i = 0;
        continue;
        j = 1;
      }
      if (i == 0) {
        return;
      }
    }
    finally {}
    throw new MissingBackpressureException();
  }
  
  public Object peek()
  {
    try
    {
      Queue localQueue = queue;
      if (localQueue == null) {
        return null;
      }
      Object localObject3 = localQueue.peek();
      Object localObject4 = terminalState;
      Object localObject1 = localObject3;
      if (localObject3 == null)
      {
        localObject1 = localObject3;
        if (localObject4 != null)
        {
          localObject1 = localObject3;
          if (localQueue.peek() == null) {
            localObject1 = localObject4;
          }
        }
      }
      return localObject1;
    }
    finally {}
  }
  
  public Object poll()
  {
    try
    {
      Queue localQueue = queue;
      if (localQueue == null) {
        return null;
      }
      Object localObject3 = localQueue.poll();
      Object localObject4 = terminalState;
      Object localObject1 = localObject3;
      if (localObject3 == null)
      {
        localObject1 = localObject3;
        if (localObject4 != null)
        {
          localObject1 = localObject3;
          if (localQueue.peek() == null)
          {
            localObject1 = localObject4;
            terminalState = null;
          }
        }
      }
      return localObject1;
    }
    finally {}
  }
  
  public void release()
  {
    try
    {
      Queue localQueue = queue;
      ObjectPool localObjectPool = pool;
      if ((localObjectPool != null) && (localQueue != null))
      {
        localQueue.clear();
        queue = null;
        localObjectPool.returnObject(localQueue);
      }
      return;
    }
    finally {}
  }
  
  public void unsubscribe()
  {
    release();
  }
}
