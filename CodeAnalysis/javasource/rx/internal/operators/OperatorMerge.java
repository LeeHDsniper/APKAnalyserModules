package rx.internal.operators;

import java.util.Collection;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;
import rx.Subscription;
import rx.exceptions.CompositeException;
import rx.exceptions.MissingBackpressureException;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func1;
import rx.internal.util.RxRingBuffer;
import rx.internal.util.ScalarSynchronousObservable;
import rx.internal.util.SubscriptionIndexedRingBuffer;

public class OperatorMerge<T>
  implements Observable.Operator<T, Observable<? extends T>>
{
  private final boolean delayErrors;
  
  private OperatorMerge()
  {
    delayErrors = false;
  }
  
  private OperatorMerge(boolean paramBoolean)
  {
    delayErrors = paramBoolean;
  }
  
  public static <T> OperatorMerge<T> instance(boolean paramBoolean)
  {
    if (paramBoolean) {
      return HolderDelayErrors.INSTANCE;
    }
    return HolderNoDelay.INSTANCE;
  }
  
  public Subscriber<Observable<? extends T>> call(Subscriber<? super T> paramSubscriber)
  {
    return new MergeSubscriber(paramSubscriber, delayErrors);
  }
  
  private static final class HolderDelayErrors
  {
    static final OperatorMerge<Object> INSTANCE = new OperatorMerge(true, null);
  }
  
  private static final class HolderNoDelay
  {
    static final OperatorMerge<Object> INSTANCE = new OperatorMerge(false, null);
  }
  
  private static final class InnerSubscriber<T>
    extends Subscriber<T>
  {
    static final AtomicIntegerFieldUpdater<InnerSubscriber> ONCE_TERMINATED = AtomicIntegerFieldUpdater.newUpdater(InnerSubscriber.class, "terminated");
    final OperatorMerge.MergeSubscriber<T> parentSubscriber;
    final OperatorMerge.MergeProducer<T> producer;
    private final RxRingBuffer q = RxRingBuffer.getSpscInstance();
    public int sindex;
    volatile int terminated;
    
    public InnerSubscriber(OperatorMerge.MergeSubscriber<T> paramMergeSubscriber, OperatorMerge.MergeProducer<T> paramMergeProducer)
    {
      parentSubscriber = paramMergeSubscriber;
      producer = paramMergeProducer;
      add(q);
      request(q.capacity());
    }
    
    private int drainAll()
    {
      int i = 0;
      for (;;)
      {
        Object localObject = q.poll();
        if (localObject == null) {
          break;
        }
        if (q.isCompleted(localObject)) {
          parentSubscriber.completeInner(this);
        } else {
          try
          {
            boolean bool = q.accept(localObject, parentSubscriber.actual);
            if (!bool) {
              i += 1;
            }
          }
          catch (Throwable localThrowable)
          {
            onError(OnErrorThrowable.addValueAsLastCause(localThrowable, localObject));
          }
        }
      }
      return i;
    }
    
    private int drainQueue()
    {
      if (producer != null) {
        return drainRequested();
      }
      return drainAll();
    }
    
    private int drainRequested()
    {
      int j = 0;
      long l = OperatorMerge.MergeProducer.access$100(producer);
      int i = 0;
      Object localObject;
      if (i < l)
      {
        localObject = q.poll();
        if (localObject != null) {}
      }
      else
      {
        OperatorMerge.MergeProducer.REQUESTED.getAndAdd(producer, -j);
        return j;
      }
      int k;
      if (q.isCompleted(localObject))
      {
        parentSubscriber.completeInner(this);
        k = j;
      }
      for (;;)
      {
        i += 1;
        j = k;
        break;
        try
        {
          boolean bool = q.accept(localObject, parentSubscriber.actual);
          k = j;
          if (!bool) {
            k = j + 1;
          }
        }
        catch (Throwable localThrowable)
        {
          onError(OnErrorThrowable.addValueAsLastCause(localThrowable, localObject));
          k = j;
        }
      }
    }
    
    private void emit(T paramT, boolean paramBoolean)
    {
      int k = 0;
      int j = 1;
      int i;
      if (OperatorMerge.MergeSubscriber.access$1000(parentSubscriber)) {
        i = 0;
      }
      for (;;)
      {
        long l;
        try
        {
          l = 0L + drainQueue();
          if (producer == null)
          {
            if (paramBoolean)
            {
              parentSubscriber.completeInner(this);
              boolean bool = OperatorMerge.MergeSubscriber.access$1100(parentSubscriber);
              k = bool;
              j = i;
              if (l > 0L)
              {
                request(l);
                j = i;
                k = bool;
              }
              if (j != 0)
              {
                enqueue(paramT, paramBoolean);
                k = 1;
              }
              if (k != 0) {}
              return;
            }
            try
            {
              parentSubscriber.actual.onNext(paramT);
              l += 1L;
            }
            catch (Throwable localThrowable1)
            {
              onError(OnErrorThrowable.addValueAsLastCause(localThrowable1, paramT));
              continue;
            }
          }
          if (OperatorMerge.MergeProducer.access$100(producer) <= 0L) {
            break label239;
          }
        }
        finally
        {
          OperatorMerge.MergeSubscriber.access$1100(parentSubscriber);
        }
        if (q.count() == 0)
        {
          if (paramBoolean) {
            parentSubscriber.completeInner(this);
          } else {
            try
            {
              parentSubscriber.actual.onNext(paramT);
              l += 1L;
              OperatorMerge.MergeProducer.REQUESTED.decrementAndGet(producer);
            }
            catch (Throwable localThrowable2)
            {
              for (;;)
              {
                onError(OnErrorThrowable.addValueAsLastCause(localThrowable2, paramT));
              }
            }
          }
        }
        else {
          label239:
          i = 1;
        }
      }
    }
    
    private void enqueue(T paramT, boolean paramBoolean)
    {
      if (paramBoolean) {}
      try
      {
        q.onCompleted();
        return;
      }
      catch (MissingBackpressureException paramT)
      {
        onError(paramT);
      }
      q.onNext(paramT);
      return;
    }
    
    public void onCompleted()
    {
      if (ONCE_TERMINATED.compareAndSet(this, 0, 1)) {
        emit(null, true);
      }
    }
    
    public void onError(Throwable paramThrowable)
    {
      if (ONCE_TERMINATED.compareAndSet(this, 0, 1)) {
        OperatorMerge.MergeSubscriber.access$900(parentSubscriber, paramThrowable, false);
      }
    }
    
    public void onNext(T paramT)
    {
      emit(paramT, false);
    }
    
    public void requestMore(long paramLong)
    {
      request(paramLong);
    }
  }
  
  private static final class MergeProducer<T>
    implements Producer
  {
    static final AtomicLongFieldUpdater<MergeProducer> REQUESTED = AtomicLongFieldUpdater.newUpdater(MergeProducer.class, "requested");
    private final OperatorMerge.MergeSubscriber<T> ms;
    private volatile long requested = 0L;
    
    public MergeProducer(OperatorMerge.MergeSubscriber<T> paramMergeSubscriber)
    {
      ms = paramMergeSubscriber;
    }
    
    public void request(long paramLong)
    {
      if (requested == Long.MAX_VALUE) {}
      for (;;)
      {
        return;
        if (paramLong == Long.MAX_VALUE)
        {
          requested = Long.MAX_VALUE;
          return;
        }
        BackpressureUtils.getAndAddRequest(REQUESTED, this, paramLong);
        if (!OperatorMerge.MergeSubscriber.access$500(ms)) {
          continue;
        }
        int j = 0;
        OperatorMerge.MergeSubscriber localMergeSubscriber = ms;
        int i = j;
        try
        {
          if (OperatorMerge.MergeSubscriber.access$600(ms) == 0)
          {
            i = j;
            if (OperatorMerge.MergeSubscriber.access$700(ms) != null)
            {
              i = j;
              if (OperatorMerge.MergeSubscriber.access$700(ms).isEmpty()) {
                i = 1;
              }
            }
          }
          if (i == 0) {
            continue;
          }
          OperatorMerge.MergeSubscriber.access$800(ms);
          return;
        }
        finally {}
      }
    }
  }
  
  private static final class MergeSubscriber<T>
    extends Subscriber<Observable<? extends T>>
  {
    final Func1<OperatorMerge.InnerSubscriber<T>, Boolean> DRAIN_ACTION = new Func1()
    {
      public Boolean call(OperatorMerge.InnerSubscriber<T> paramAnonymousInnerSubscriber)
      {
        if (q != null)
        {
          long l = access$300requested;
          int i = paramAnonymousInnerSubscriber.drainQueue();
          if (i > 0) {
            paramAnonymousInnerSubscriber.requestMore(i);
          }
          if (i == l) {
            return Boolean.FALSE;
          }
        }
        return Boolean.TRUE;
      }
    };
    final Subscriber<? super T> actual;
    private volatile SubscriptionIndexedRingBuffer<OperatorMerge.InnerSubscriber<T>> childrenSubscribers;
    private boolean completed;
    private final boolean delayErrors;
    private boolean emitLock = false;
    private ConcurrentLinkedQueue<Throwable> exceptions;
    int lastDrainedIndex = 0;
    private final OperatorMerge.MergeProducer<T> mergeProducer;
    private int missedEmitting = 0;
    final NotificationLite<T> on = NotificationLite.instance();
    private volatile RxRingBuffer scalarValueQueue = null;
    private int wip;
    
    public MergeSubscriber(Subscriber<? super T> paramSubscriber, boolean paramBoolean)
    {
      super();
      actual = paramSubscriber;
      mergeProducer = new OperatorMerge.MergeProducer(this);
      delayErrors = paramBoolean;
      paramSubscriber.add(this);
      paramSubscriber.setProducer(mergeProducer);
    }
    
    private void drainAndComplete()
    {
      int i = 1;
      if (i != 0) {
        for (;;)
        {
          try
          {
            missedEmitting = 0;
            drainScalarValueQueue();
            drainChildrenQueues();
            try
            {
              if (missedEmitting > 0)
              {
                i = 1;
                break;
              }
            }
            finally {}
            i = 0;
          }
          finally {}
        }
      }
      Object localObject3 = scalarValueQueue;
      if ((localObject3 == null) || (((RxRingBuffer)localObject3).isEmpty()))
      {
        if (!delayErrors) {}
      }
      else
      {
        try
        {
          localObject3 = exceptions;
          if (localObject3 == null) {
            break label156;
          }
          if (((Queue)localObject3).isEmpty())
          {
            actual.onCompleted();
            return;
          }
        }
        finally {}
        if (localCollection.size() == 1)
        {
          actual.onError((Throwable)localCollection.poll());
          return;
        }
        actual.onError(new CompositeException(localCollection));
        return;
        label156:
        actual.onCompleted();
        return;
      }
      actual.onCompleted();
    }
    
    private void drainChildrenQueues()
    {
      if (childrenSubscribers != null) {
        lastDrainedIndex = childrenSubscribers.forEach(DRAIN_ACTION, lastDrainedIndex);
      }
    }
    
    private boolean drainQueuesIfNeeded()
    {
      while (getEmitLock()) {
        try
        {
          int i = drainScalarValueQueue();
          drainChildrenQueues();
          boolean bool = releaseEmitLock();
          if (i > 0) {
            request(i);
          }
          if (!bool) {
            return true;
          }
        }
        finally
        {
          releaseEmitLock();
        }
      }
      return false;
    }
    
    private int drainScalarValueQueue()
    {
      RxRingBuffer localRxRingBuffer = scalarValueQueue;
      if (localRxRingBuffer != null)
      {
        long l = mergeProducer.requested;
        int k = 0;
        int i = 0;
        int j = 0;
        Object localObject;
        if (l < 0L) {
          for (;;)
          {
            localObject = localRxRingBuffer.poll();
            i = j;
            if (localObject == null) {
              break;
            }
            on.accept(actual, localObject);
            j += 1;
          }
        }
        if (l > 0L)
        {
          j = 0;
          i = k;
        }
        for (;;)
        {
          if (j < l)
          {
            localObject = localRxRingBuffer.poll();
            if (localObject != null) {}
          }
          else
          {
            OperatorMerge.MergeProducer.REQUESTED.getAndAdd(mergeProducer, -i);
            return i;
          }
          on.accept(actual, localObject);
          i += 1;
          j += 1;
        }
      }
      return 0;
    }
    
    /* Error */
    private boolean getEmitLock()
    {
      // Byte code:
      //   0: iconst_0
      //   1: istore_1
      //   2: aload_0
      //   3: monitorenter
      //   4: aload_0
      //   5: getfield 57	rx/internal/operators/OperatorMerge$MergeSubscriber:emitLock	Z
      //   8: ifeq +17 -> 25
      //   11: aload_0
      //   12: aload_0
      //   13: getfield 55	rx/internal/operators/OperatorMerge$MergeSubscriber:missedEmitting	I
      //   16: iconst_1
      //   17: iadd
      //   18: putfield 55	rx/internal/operators/OperatorMerge$MergeSubscriber:missedEmitting	I
      //   21: aload_0
      //   22: monitorexit
      //   23: iload_1
      //   24: ireturn
      //   25: aload_0
      //   26: iconst_1
      //   27: putfield 57	rx/internal/operators/OperatorMerge$MergeSubscriber:emitLock	Z
      //   30: aload_0
      //   31: iconst_0
      //   32: putfield 55	rx/internal/operators/OperatorMerge$MergeSubscriber:missedEmitting	I
      //   35: iconst_1
      //   36: istore_1
      //   37: goto -16 -> 21
      //   40: astore_2
      //   41: aload_0
      //   42: monitorexit
      //   43: aload_2
      //   44: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	45	0	this	MergeSubscriber
      //   1	36	1	bool	boolean
      //   40	4	2	localObject	Object
      // Exception table:
      //   from	to	target	type
      //   4	21	40	finally
      //   25	35	40	finally
    }
    
    private RxRingBuffer getOrCreateScalarValueQueue()
    {
      RxRingBuffer localRxRingBuffer2 = scalarValueQueue;
      RxRingBuffer localRxRingBuffer1 = localRxRingBuffer2;
      if (localRxRingBuffer2 == null)
      {
        localRxRingBuffer1 = RxRingBuffer.getSpscInstance();
        scalarValueQueue = localRxRingBuffer1;
      }
      return localRxRingBuffer1;
    }
    
    private void handleNewSource(Observable<? extends T> paramObservable)
    {
      if (childrenSubscribers == null)
      {
        childrenSubscribers = new SubscriptionIndexedRingBuffer();
        add(childrenSubscribers);
      }
      Object localObject = null;
      if (mergeProducer.requested != Long.MAX_VALUE) {
        localObject = mergeProducer;
      }
      localObject = new OperatorMerge.InnerSubscriber(this, (OperatorMerge.MergeProducer)localObject);
      sindex = childrenSubscribers.add((Subscription)localObject);
      paramObservable.unsafeSubscribe((Subscriber)localObject);
      if (!isUnsubscribed()) {
        request(1L);
      }
    }
    
    private void handleScalarSynchronousObservable(ScalarSynchronousObservable<? extends T> paramScalarSynchronousObservable)
    {
      if (mergeProducer.requested == Long.MAX_VALUE)
      {
        handleScalarSynchronousObservableWithoutRequestLimits(paramScalarSynchronousObservable);
        return;
      }
      handleScalarSynchronousObservableWithRequestLimits(paramScalarSynchronousObservable);
    }
    
    private void handleScalarSynchronousObservableWithRequestLimits(ScalarSynchronousObservable<? extends T> paramScalarSynchronousObservable)
    {
      if (getEmitLock())
      {
        int i = 0;
        int j = 0;
        try
        {
          if (mergeProducer.requested > 0L)
          {
            i = 1;
            actual.onNext(paramScalarSynchronousObservable.get());
            OperatorMerge.MergeProducer.REQUESTED.decrementAndGet(mergeProducer);
            j = 1;
          }
          if (releaseEmitLock()) {
            drainQueuesIfNeeded();
          }
          if (i != 0) {
            request(1L);
          }
          if (j != 0) {
            return;
          }
        }
        finally
        {
          releaseEmitLock();
        }
      }
      try
      {
        getOrCreateScalarValueQueue().onNext(paramScalarSynchronousObservable.get());
        return;
      }
      catch (MissingBackpressureException paramScalarSynchronousObservable)
      {
        onError(paramScalarSynchronousObservable);
      }
    }
    
    private void handleScalarSynchronousObservableWithoutRequestLimits(ScalarSynchronousObservable<? extends T> paramScalarSynchronousObservable)
    {
      paramScalarSynchronousObservable = paramScalarSynchronousObservable.get();
      if (getEmitLock()) {
        try
        {
          actual.onNext(paramScalarSynchronousObservable);
          if (releaseEmitLock()) {
            drainQueuesIfNeeded();
          }
          request(1L);
          return;
        }
        finally
        {
          releaseEmitLock();
        }
      }
      try
      {
        getOrCreateScalarValueQueue().onNext(paramScalarSynchronousObservable);
        return;
      }
      catch (MissingBackpressureException paramScalarSynchronousObservable)
      {
        onError(paramScalarSynchronousObservable);
      }
    }
    
    private void innerError(Throwable paramThrowable, boolean paramBoolean)
    {
      if (delayErrors) {}
      for (;;)
      {
        try
        {
          if (exceptions == null) {
            exceptions = new ConcurrentLinkedQueue();
          }
          exceptions.add(paramThrowable);
          i = 0;
          if (!paramBoolean) {}
          actual.onError(paramThrowable);
        }
        finally
        {
          try
          {
            wip -= 1;
            if (((wip == 0) && (completed)) || (wip < 0)) {
              break label110;
            }
            if (i != 0) {
              drainAndComplete();
            }
            return;
          }
          finally {}
          paramThrowable = finally;
        }
        return;
        label110:
        int i = 1;
      }
    }
    
    /* Error */
    private boolean releaseEmitLock()
    {
      // Byte code:
      //   0: iconst_0
      //   1: istore_2
      //   2: aload_0
      //   3: monitorenter
      //   4: aload_0
      //   5: iconst_0
      //   6: putfield 57	rx/internal/operators/OperatorMerge$MergeSubscriber:emitLock	Z
      //   9: aload_0
      //   10: getfield 55	rx/internal/operators/OperatorMerge$MergeSubscriber:missedEmitting	I
      //   13: istore_1
      //   14: iload_1
      //   15: ifne +7 -> 22
      //   18: aload_0
      //   19: monitorexit
      //   20: iload_2
      //   21: ireturn
      //   22: iconst_1
      //   23: istore_2
      //   24: goto -6 -> 18
      //   27: astore_3
      //   28: aload_0
      //   29: monitorexit
      //   30: aload_3
      //   31: athrow
      // Local variable table:
      //   start	length	slot	name	signature
      //   0	32	0	this	MergeSubscriber
      //   13	2	1	i	int
      //   1	23	2	bool	boolean
      //   27	4	3	localObject	Object
      // Exception table:
      //   from	to	target	type
      //   4	14	27	finally
    }
    
    void completeInner(OperatorMerge.InnerSubscriber<T> paramInnerSubscriber)
    {
      int j = 0;
      try
      {
        wip -= 1;
        int i = j;
        if (wip == 0)
        {
          i = j;
          if (completed) {
            i = 1;
          }
        }
        childrenSubscribers.remove(sindex);
        if (i != 0) {
          drainAndComplete();
        }
        return;
      }
      finally {}
    }
    
    public void onCompleted()
    {
      int i = 0;
      try
      {
        completed = true;
        if (wip == 0) {
          i = 1;
        }
        if (i != 0) {
          drainAndComplete();
        }
        return;
      }
      finally {}
    }
    
    public void onError(Throwable paramThrowable)
    {
      if (!completed)
      {
        completed = true;
        innerError(paramThrowable, true);
      }
    }
    
    public void onNext(Observable<? extends T> paramObservable)
    {
      if ((paramObservable instanceof ScalarSynchronousObservable)) {
        handleScalarSynchronousObservable((ScalarSynchronousObservable)paramObservable);
      }
      while ((paramObservable == null) || (isUnsubscribed())) {
        return;
      }
      try
      {
        wip += 1;
        handleNewSource(paramObservable);
        return;
      }
      finally {}
    }
    
    public void onStart()
    {
      request(RxRingBuffer.SIZE);
    }
  }
}
