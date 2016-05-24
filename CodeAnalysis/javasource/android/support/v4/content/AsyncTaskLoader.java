package android.support.v4.content;

import android.content.Context;
import android.os.Handler;
import android.os.SystemClock;
import android.support.v4.util.TimeUtils;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.concurrent.CountDownLatch;

public abstract class AsyncTaskLoader<D>
  extends Loader<D>
{
  volatile AsyncTaskLoader<D>.android.support.v4.content.AsyncTaskLoader.android.support.v4.content.AsyncTaskLoader.LoadTask mCancellingTask;
  Handler mHandler;
  long mLastLoadCompleteTime = -10000L;
  volatile AsyncTaskLoader<D>.android.support.v4.content.AsyncTaskLoader.android.support.v4.content.AsyncTaskLoader.LoadTask mTask;
  long mUpdateThrottle;
  
  public AsyncTaskLoader(Context paramContext)
  {
    super(paramContext);
  }
  
  public boolean cancelLoad()
  {
    if (mTask != null)
    {
      if (mCancellingTask != null)
      {
        if (mTask.waiting)
        {
          mTask.waiting = false;
          mHandler.removeCallbacks(mTask);
        }
        mTask = null;
      }
    }
    else {
      return false;
    }
    if (mTask.waiting)
    {
      mTask.waiting = false;
      mHandler.removeCallbacks(mTask);
      mTask = null;
      return false;
    }
    boolean bool = mTask.cancel(false);
    if (bool) {
      mCancellingTask = mTask;
    }
    mTask = null;
    return bool;
  }
  
  void dispatchOnCancelled(AsyncTaskLoader<D>.android.support.v4.content.AsyncTaskLoader.android.support.v4.content.AsyncTaskLoader.LoadTask paramAsyncTaskLoader, D paramD)
  {
    onCanceled(paramD);
    if (mCancellingTask == paramAsyncTaskLoader)
    {
      rollbackContentChanged();
      mLastLoadCompleteTime = SystemClock.uptimeMillis();
      mCancellingTask = null;
      executePendingTask();
    }
  }
  
  void dispatchOnLoadComplete(AsyncTaskLoader<D>.android.support.v4.content.AsyncTaskLoader.android.support.v4.content.AsyncTaskLoader.LoadTask paramAsyncTaskLoader, D paramD)
  {
    if (mTask != paramAsyncTaskLoader)
    {
      dispatchOnCancelled(paramAsyncTaskLoader, paramD);
      return;
    }
    if (isAbandoned())
    {
      onCanceled(paramD);
      return;
    }
    commitContentChanged();
    mLastLoadCompleteTime = SystemClock.uptimeMillis();
    mTask = null;
    deliverResult(paramD);
  }
  
  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    super.dump(paramString, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
    if (mTask != null)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("mTask=");
      paramPrintWriter.print(mTask);
      paramPrintWriter.print(" waiting=");
      paramPrintWriter.println(mTask.waiting);
    }
    if (mCancellingTask != null)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("mCancellingTask=");
      paramPrintWriter.print(mCancellingTask);
      paramPrintWriter.print(" waiting=");
      paramPrintWriter.println(mCancellingTask.waiting);
    }
    if (mUpdateThrottle != 0L)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("mUpdateThrottle=");
      TimeUtils.formatDuration(mUpdateThrottle, paramPrintWriter);
      paramPrintWriter.print(" mLastLoadCompleteTime=");
      TimeUtils.formatDuration(mLastLoadCompleteTime, SystemClock.uptimeMillis(), paramPrintWriter);
      paramPrintWriter.println();
    }
  }
  
  void executePendingTask()
  {
    if ((mCancellingTask == null) && (mTask != null))
    {
      if (mTask.waiting)
      {
        mTask.waiting = false;
        mHandler.removeCallbacks(mTask);
      }
      if ((mUpdateThrottle > 0L) && (SystemClock.uptimeMillis() < mLastLoadCompleteTime + mUpdateThrottle))
      {
        mTask.waiting = true;
        mHandler.postAtTime(mTask, mLastLoadCompleteTime + mUpdateThrottle);
      }
    }
    else
    {
      return;
    }
    mTask.executeOnExecutor(ModernAsyncTask.THREAD_POOL_EXECUTOR, (Void[])null);
  }
  
  public abstract D loadInBackground();
  
  public void onCanceled(D paramD) {}
  
  protected void onForceLoad()
  {
    super.onForceLoad();
    cancelLoad();
    mTask = new LoadTask();
    executePendingTask();
  }
  
  protected D onLoadInBackground()
  {
    return loadInBackground();
  }
  
  final class LoadTask
    extends ModernAsyncTask<Void, Void, D>
    implements Runnable
  {
    private CountDownLatch done = new CountDownLatch(1);
    D result;
    boolean waiting;
    
    LoadTask() {}
    
    protected D doInBackground(Void... paramVarArgs)
    {
      result = onLoadInBackground();
      return result;
    }
    
    protected void onCancelled()
    {
      try
      {
        dispatchOnCancelled(this, result);
        return;
      }
      finally
      {
        done.countDown();
      }
    }
    
    protected void onPostExecute(D paramD)
    {
      try
      {
        dispatchOnLoadComplete(this, paramD);
        return;
      }
      finally
      {
        done.countDown();
      }
    }
    
    public void run()
    {
      waiting = false;
      executePendingTask();
    }
  }
}
