package de.greenrobot.event;

import android.util.Log;
import java.util.concurrent.ExecutorService;

final class BackgroundPoster
  implements Runnable
{
  private final EventBus eventBus;
  private volatile boolean executorRunning;
  private final PendingPostQueue queue;
  
  BackgroundPoster(EventBus paramEventBus)
  {
    eventBus = paramEventBus;
    queue = new PendingPostQueue();
  }
  
  public void enqueue(Subscription paramSubscription, Object paramObject)
  {
    paramSubscription = PendingPost.obtainPendingPost(paramSubscription, paramObject);
    try
    {
      queue.enqueue(paramSubscription);
      if (!executorRunning)
      {
        executorRunning = true;
        eventBus.getExecutorService().execute(this);
      }
      return;
    }
    finally {}
  }
  
  public void run()
  {
    try
    {
      PendingPost localPendingPost2 = queue.poll(1000);
      localPendingPost1 = localPendingPost2;
      if (localPendingPost2 != null) {}
    }
    catch (InterruptedException localInterruptedException)
    {
      PendingPost localPendingPost1;
      localInterruptedException = localInterruptedException;
      Log.w("Event", Thread.currentThread().getName() + " was interruppted", localInterruptedException);
      return;
    }
    finally
    {
      executorRunning = false;
    }
  }
}
