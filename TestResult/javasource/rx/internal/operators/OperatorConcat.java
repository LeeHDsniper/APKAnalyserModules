package rx.internal.operators;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;
import rx.functions.Action0;
import rx.internal.producers.ProducerArbiter;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.SerialSubscription;
import rx.subscriptions.Subscriptions;

public final class OperatorConcat<T>
  implements Observable.Operator<T, Observable<? extends T>>
{
  private OperatorConcat() {}
  
  public static <T> OperatorConcat<T> instance()
  {
    return Holder.INSTANCE;
  }
  
  public Subscriber<? super Observable<? extends T>> call(Subscriber<? super T> paramSubscriber)
  {
    Object localObject = new SerializedSubscriber(paramSubscriber);
    SerialSubscription localSerialSubscription = new SerialSubscription();
    paramSubscriber.add(localSerialSubscription);
    localObject = new ConcatSubscriber((Subscriber)localObject, localSerialSubscription);
    paramSubscriber.setProducer(new ConcatProducer((ConcatSubscriber)localObject));
    return localObject;
  }
  
  static class ConcatInnerSubscriber<T>
    extends Subscriber<T>
  {
    private static final AtomicIntegerFieldUpdater<ConcatInnerSubscriber> ONCE = AtomicIntegerFieldUpdater.newUpdater(ConcatInnerSubscriber.class, "once");
    private final ProducerArbiter arbiter;
    private final Subscriber<T> child;
    private volatile int once = 0;
    private final OperatorConcat.ConcatSubscriber<T> parent;
    
    public ConcatInnerSubscriber(OperatorConcat.ConcatSubscriber<T> paramConcatSubscriber, Subscriber<T> paramSubscriber, ProducerArbiter paramProducerArbiter)
    {
      parent = paramConcatSubscriber;
      child = paramSubscriber;
      arbiter = paramProducerArbiter;
    }
    
    public void onCompleted()
    {
      if (ONCE.compareAndSet(this, 0, 1)) {
        parent.completeInner();
      }
    }
    
    public void onError(Throwable paramThrowable)
    {
      if (ONCE.compareAndSet(this, 0, 1)) {
        parent.onError(paramThrowable);
      }
    }
    
    public void onNext(T paramT)
    {
      child.onNext(paramT);
      OperatorConcat.ConcatSubscriber.access$200(parent);
      arbiter.produced(1L);
    }
    
    public void setProducer(Producer paramProducer)
    {
      arbiter.setProducer(paramProducer);
    }
  }
  
  static final class ConcatProducer<T>
    implements Producer
  {
    final OperatorConcat.ConcatSubscriber<T> cs;
    
    ConcatProducer(OperatorConcat.ConcatSubscriber<T> paramConcatSubscriber)
    {
      cs = paramConcatSubscriber;
    }
    
    public void request(long paramLong)
    {
      OperatorConcat.ConcatSubscriber.access$100(cs, paramLong);
    }
  }
  
  static final class ConcatSubscriber<T>
    extends Subscriber<Observable<? extends T>>
  {
    private static final AtomicLongFieldUpdater<ConcatSubscriber> REQUESTED = AtomicLongFieldUpdater.newUpdater(ConcatSubscriber.class, "requested");
    static final AtomicIntegerFieldUpdater<ConcatSubscriber> WIP = AtomicIntegerFieldUpdater.newUpdater(ConcatSubscriber.class, "wip");
    private final ProducerArbiter arbiter;
    private final Subscriber<T> child;
    private final SerialSubscription current;
    volatile OperatorConcat.ConcatInnerSubscriber<T> currentSubscriber;
    final NotificationLite<Observable<? extends T>> nl = NotificationLite.instance();
    final ConcurrentLinkedQueue<Object> queue;
    private volatile long requested;
    volatile int wip;
    
    public ConcatSubscriber(Subscriber<T> paramSubscriber, SerialSubscription paramSerialSubscription)
    {
      super();
      child = paramSubscriber;
      current = paramSerialSubscription;
      arbiter = new ProducerArbiter();
      queue = new ConcurrentLinkedQueue();
      add(Subscriptions.create(new Action0()
      {
        public void call()
        {
          queue.clear();
        }
      }));
    }
    
    private void decrementRequested()
    {
      REQUESTED.decrementAndGet(this);
    }
    
    private void requestFromChild(long paramLong)
    {
      if (paramLong <= 0L) {}
      long l;
      do
      {
        return;
        l = BackpressureUtils.getAndAddRequest(REQUESTED, this, paramLong);
        arbiter.request(paramLong);
      } while ((l != 0L) || (currentSubscriber != null) || (wip <= 0));
      subscribeNext();
    }
    
    void completeInner()
    {
      currentSubscriber = null;
      if (WIP.decrementAndGet(this) > 0) {
        subscribeNext();
      }
      request(1L);
    }
    
    public void onCompleted()
    {
      queue.add(nl.completed());
      if (WIP.getAndIncrement(this) == 0) {
        subscribeNext();
      }
    }
    
    public void onError(Throwable paramThrowable)
    {
      child.onError(paramThrowable);
      unsubscribe();
    }
    
    public void onNext(Observable<? extends T> paramObservable)
    {
      queue.add(nl.next(paramObservable));
      if (WIP.getAndIncrement(this) == 0) {
        subscribeNext();
      }
    }
    
    public void onStart()
    {
      request(2L);
    }
    
    void subscribeNext()
    {
      Object localObject;
      if (requested > 0L)
      {
        localObject = queue.poll();
        if (nl.isCompleted(localObject)) {
          child.onCompleted();
        }
      }
      do
      {
        do
        {
          return;
        } while (localObject == null);
        localObject = (Observable)nl.getValue(localObject);
        currentSubscriber = new OperatorConcat.ConcatInnerSubscriber(this, child, arbiter);
        current.set(currentSubscriber);
        ((Observable)localObject).unsafeSubscribe(currentSubscriber);
        return;
        localObject = queue.peek();
      } while (!nl.isCompleted(localObject));
      child.onCompleted();
    }
  }
  
  private static final class Holder
  {
    static final OperatorConcat<Object> INSTANCE = new OperatorConcat(null);
  }
}
