package com.adobe.creativesdk.aviary.internal.threading;

import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import com.adobe.creativesdk.aviary.log.LoggerFactory;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.log.LoggerFactory.LoggerType;
import java.util.Locale;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicInteger;

public class ThreadPool
{
  private static final LoggerFactory.Logger LOGGER = LoggerFactory.getLogger(ThreadPool.class.getSimpleName(), LoggerFactory.LoggerType.ConsoleLoggerType);
  private final ThreadPoolExecutor mExecutor;
  private final Handler mListenerHandler;
  
  public ThreadPool(int paramInt1, int paramInt2)
  {
    mExecutor = new ThreadPoolExecutor(paramInt1, paramInt1 * 2, 5L, TimeUnit.SECONDS, new LinkedBlockingQueue(), new LowPriorityThreadFactory("thread-pool-service", paramInt2));
    mListenerHandler = new Handler(Looper.getMainLooper());
  }
  
  public void dispose()
  {
    mExecutor.shutdown();
  }
  
  public <I, O> Future<O> submit(final Job<I, O> paramJob, FutureListener<O> paramFutureListener, final I... paramVarArgs)
  {
    paramJob = new Worker(paramJob, paramFutureListener, paramVarArgs, paramJob)
    {
      public O get(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
        throws InterruptedException, ExecutionException, TimeoutException
      {
        return null;
      }
      
      public void run()
      {
        localObject4 = null;
        Object localObject5 = null;
        localObject1 = localObject5;
        localObject3 = localObject4;
        if (!mIsCancelled) {}
        try
        {
          localObject3 = paramJob.run(this, paramVarArgs);
          localObject1 = localObject5;
        }
        catch (Exception localException1)
        {
          for (;;)
          {
            try
            {
              setException(localObject1);
              setResult(localObject3);
              setIsDone();
              notifyAll();
              fireOnDoneEvent();
              return;
            }
            finally {}
            localException1 = localException1;
            localException1.printStackTrace();
            Exception localException2 = new Exception(localException1);
            localObject3 = localObject4;
          }
        }
        if (localObject1 == null) {}
      }
    };
    mExecutor.execute(paramJob);
    return paramJob;
  }
  
  public String toString()
  {
    return String.format(Locale.US, "ThreadPool(pool: %d, corePool: %d, largestPool: %d, maxPool: %d, tasks: %d, active: %d, completed: %d)", new Object[] { Integer.valueOf(mExecutor.getPoolSize()), Integer.valueOf(mExecutor.getCorePoolSize()), Integer.valueOf(mExecutor.getLargestPoolSize()), Integer.valueOf(mExecutor.getMaximumPoolSize()), Long.valueOf(mExecutor.getTaskCount()), Integer.valueOf(mExecutor.getActiveCount()), Long.valueOf(mExecutor.getCompletedTaskCount()) });
  }
  
  public static abstract interface CancelListener
  {
    public abstract void onCancel();
  }
  
  public static abstract interface Job<I, O>
  {
    public abstract O run(ThreadPool.Worker<I, O> paramWorker, I... paramVarArgs)
      throws Exception;
  }
  
  class LowPriorityThreadFactory
    implements ThreadFactory
  {
    private final String mName;
    private final AtomicInteger mNumber = new AtomicInteger();
    private final int mPriority;
    
    public LowPriorityThreadFactory(String paramString, int paramInt)
    {
      mName = paramString;
      mPriority = paramInt;
    }
    
    public Thread newThread(Runnable paramRunnable)
    {
      new Thread(paramRunnable, mName + '-' + mNumber.getAndIncrement())
      {
        public void run()
        {
          Process.setThreadPriority(mPriority);
          super.run();
        }
      };
    }
  }
  
  public abstract class Worker<I, O>
    implements Future<O>, Runnable
  {
    ThreadPool.CancelListener mCancelListener;
    Exception mError;
    boolean mIsCancelled;
    boolean mIsDone;
    FutureListener<O> mListener;
    O mResult;
    
    public Worker(FutureListener<O> paramFutureListener, I... paramVarArgs)
    {
      mListener = paramVarArgs;
    }
    
    public boolean cancel(boolean paramBoolean)
    {
      try
      {
        if (mIsCancelled) {
          return false;
        }
        mIsCancelled = true;
        fireOnCancelEvent();
        return false;
      }
      finally {}
    }
    
    protected void fireOnCancelEvent()
    {
      if (mCancelListener != null) {
        mListenerHandler.post(new Runnable()
        {
          public void run()
          {
            mCancelListener.onCancel();
          }
        });
      }
    }
    
    protected void fireOnDoneEvent()
    {
      if (mListener != null) {
        mListenerHandler.post(new Runnable()
        {
          public void run()
          {
            mListener.onFutureDone(jdField_this);
          }
        });
      }
    }
    
    public O get()
    {
      try
      {
        for (;;)
        {
          boolean bool = mIsDone;
          if (bool) {
            break;
          }
          try
          {
            wait();
          }
          catch (Throwable localThrowable)
          {
            ThreadPool.LOGGER.error(localThrowable.getMessage());
            localThrowable.printStackTrace();
          }
        }
        localObject2 = mResult;
      }
      finally {}
      Object localObject2;
      return localObject2;
    }
    
    public O get(long paramLong, TimeUnit paramTimeUnit)
      throws InterruptedException, ExecutionException, TimeoutException
    {
      throw new TimeoutException("non implemented");
    }
    
    public boolean isCancelled()
    {
      return mIsCancelled;
    }
    
    public boolean isDone()
    {
      return mIsDone;
    }
    
    protected void setException(Exception paramException)
    {
      mError = paramException;
    }
    
    protected void setIsDone()
    {
      mIsDone = true;
    }
    
    protected void setResult(O paramO)
    {
      mResult = paramO;
    }
  }
}
