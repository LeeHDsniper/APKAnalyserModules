package it.sephiroth.android.library.picasso;

import android.net.NetworkInfo;
import android.util.Log;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

class PicassoExecutorService
  extends ThreadPoolExecutor
{
  private static final int DEFAULT_THREAD_COUNT = Math.max(Math.min(Runtime.getRuntime().availableProcessors() * 2, 8), 4);
  
  PicassoExecutorService()
  {
    super(DEFAULT_THREAD_COUNT, DEFAULT_THREAD_COUNT, 0L, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new Utils.PicassoThreadFactory());
    Log.d("Picasso", "default thread count: " + DEFAULT_THREAD_COUNT);
  }
  
  private void setThreadCount(int paramInt)
  {
    setCorePoolSize(paramInt);
    setMaximumPoolSize(paramInt);
    Log.v("Picasso", "setThreadCount: " + paramInt);
  }
  
  void adjustThreadCount(NetworkInfo paramNetworkInfo)
  {
    if ((paramNetworkInfo == null) || (!paramNetworkInfo.isConnectedOrConnecting()))
    {
      setThreadCount(DEFAULT_THREAD_COUNT);
      return;
    }
    switch (paramNetworkInfo.getType())
    {
    default: 
      setThreadCount(DEFAULT_THREAD_COUNT);
      return;
    case 1: 
    case 6: 
    case 9: 
      setThreadCount(DEFAULT_THREAD_COUNT);
      return;
    }
    switch (paramNetworkInfo.getSubtype())
    {
    case 7: 
    case 8: 
    case 9: 
    case 10: 
    case 11: 
    default: 
      setThreadCount(DEFAULT_THREAD_COUNT);
      return;
    case 13: 
    case 14: 
    case 15: 
      setThreadCount(3);
      return;
    case 3: 
    case 4: 
    case 5: 
    case 6: 
    case 12: 
      setThreadCount(2);
      return;
    }
    setThreadCount(1);
  }
  
  public Future<?> submit(Runnable paramRunnable)
  {
    paramRunnable = new PicassoFutureTask((BitmapHunter)paramRunnable);
    execute(paramRunnable);
    return paramRunnable;
  }
  
  private static final class PicassoFutureTask
    extends FutureTask<BitmapHunter>
    implements Comparable<PicassoFutureTask>
  {
    private final BitmapHunter hunter;
    
    public PicassoFutureTask(BitmapHunter paramBitmapHunter)
    {
      super(null);
      hunter = paramBitmapHunter;
    }
    
    public int compareTo(PicassoFutureTask paramPicassoFutureTask)
    {
      Picasso.Priority localPriority1 = hunter.getPriority();
      Picasso.Priority localPriority2 = hunter.getPriority();
      if (localPriority1 == localPriority2) {
        return hunter.sequence - hunter.sequence;
      }
      return localPriority2.ordinal() - localPriority1.ordinal();
    }
  }
}
