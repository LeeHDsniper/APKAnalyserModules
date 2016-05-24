package rx.subscriptions;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import rx.Subscription;

public final class MultipleAssignmentSubscription
  implements Subscription
{
  static final AtomicReferenceFieldUpdater<MultipleAssignmentSubscription, State> STATE_UPDATER = AtomicReferenceFieldUpdater.newUpdater(MultipleAssignmentSubscription.class, State.class, "state");
  volatile State state = new State(false, Subscriptions.empty());
  
  public MultipleAssignmentSubscription() {}
  
  public boolean isUnsubscribed()
  {
    return state.isUnsubscribed;
  }
  
  public void set(Subscription paramSubscription)
  {
    if (paramSubscription == null) {
      throw new IllegalArgumentException("Subscription can not be null");
    }
    State localState1;
    State localState2;
    do
    {
      localState1 = state;
      if (isUnsubscribed)
      {
        paramSubscription.unsubscribe();
        return;
      }
      localState2 = localState1.set(paramSubscription);
    } while (!STATE_UPDATER.compareAndSet(this, localState1, localState2));
  }
  
  public void unsubscribe()
  {
    State localState1;
    State localState2;
    do
    {
      localState1 = state;
      if (isUnsubscribed) {
        return;
      }
      localState2 = localState1.unsubscribe();
    } while (!STATE_UPDATER.compareAndSet(this, localState1, localState2));
    subscription.unsubscribe();
  }
  
  private static final class State
  {
    final boolean isUnsubscribed;
    final Subscription subscription;
    
    State(boolean paramBoolean, Subscription paramSubscription)
    {
      isUnsubscribed = paramBoolean;
      subscription = paramSubscription;
    }
    
    State set(Subscription paramSubscription)
    {
      return new State(isUnsubscribed, paramSubscription);
    }
    
    State unsubscribe()
    {
      return new State(true, subscription);
    }
  }
}
