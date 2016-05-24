package android.support.design.widget;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import java.lang.ref.WeakReference;

class SnackbarManager
{
  private static SnackbarManager sSnackbarManager;
  private SnackbarRecord mCurrentSnackbar;
  private final Handler mHandler = new Handler(Looper.getMainLooper(), new Handler.Callback()
  {
    public boolean handleMessage(Message paramAnonymousMessage)
    {
      switch (what)
      {
      default: 
        return false;
      }
      SnackbarManager.this.handleTimeout((SnackbarManager.SnackbarRecord)obj);
      return true;
    }
  });
  private final Object mLock = new Object();
  private SnackbarRecord mNextSnackbar;
  
  private SnackbarManager() {}
  
  private boolean cancelSnackbarLocked(SnackbarRecord paramSnackbarRecord)
  {
    paramSnackbarRecord = (Callback)callback.get();
    if (paramSnackbarRecord != null)
    {
      paramSnackbarRecord.dismiss();
      return true;
    }
    return false;
  }
  
  static SnackbarManager getInstance()
  {
    if (sSnackbarManager == null) {
      sSnackbarManager = new SnackbarManager();
    }
    return sSnackbarManager;
  }
  
  private void handleTimeout(SnackbarRecord paramSnackbarRecord)
  {
    synchronized (mLock)
    {
      if ((mCurrentSnackbar == paramSnackbarRecord) || (mNextSnackbar == paramSnackbarRecord)) {
        cancelSnackbarLocked(paramSnackbarRecord);
      }
      return;
    }
  }
  
  private boolean isCurrentSnackbar(Callback paramCallback)
  {
    return (mCurrentSnackbar != null) && (mCurrentSnackbar.isSnackbar(paramCallback));
  }
  
  private boolean isNextSnackbar(Callback paramCallback)
  {
    return (mNextSnackbar != null) && (mNextSnackbar.isSnackbar(paramCallback));
  }
  
  private void scheduleTimeoutLocked(SnackbarRecord paramSnackbarRecord)
  {
    if (duration == -2) {
      return;
    }
    int i = 2750;
    if (duration > 0) {
      i = duration;
    }
    for (;;)
    {
      mHandler.removeCallbacksAndMessages(paramSnackbarRecord);
      mHandler.sendMessageDelayed(Message.obtain(mHandler, 0, paramSnackbarRecord), i);
      return;
      if (duration == -1) {
        i = 1500;
      }
    }
  }
  
  private void showNextSnackbarLocked()
  {
    if (mNextSnackbar != null)
    {
      mCurrentSnackbar = mNextSnackbar;
      mNextSnackbar = null;
      Callback localCallback = (Callback)mCurrentSnackbar.callback.get();
      if (localCallback != null) {
        localCallback.show();
      }
    }
    else
    {
      return;
    }
    mCurrentSnackbar = null;
  }
  
  public void cancelTimeout(Callback paramCallback)
  {
    synchronized (mLock)
    {
      if (isCurrentSnackbar(paramCallback)) {
        mHandler.removeCallbacksAndMessages(mCurrentSnackbar);
      }
      return;
    }
  }
  
  public void dismiss(Callback paramCallback)
  {
    synchronized (mLock)
    {
      if (isCurrentSnackbar(paramCallback)) {
        cancelSnackbarLocked(mCurrentSnackbar);
      }
      if (isNextSnackbar(paramCallback)) {
        cancelSnackbarLocked(mNextSnackbar);
      }
      return;
    }
  }
  
  public void onDismissed(Callback paramCallback)
  {
    synchronized (mLock)
    {
      if (isCurrentSnackbar(paramCallback))
      {
        mCurrentSnackbar = null;
        if (mNextSnackbar != null) {
          showNextSnackbarLocked();
        }
      }
      return;
    }
  }
  
  public void onShown(Callback paramCallback)
  {
    synchronized (mLock)
    {
      if (isCurrentSnackbar(paramCallback)) {
        scheduleTimeoutLocked(mCurrentSnackbar);
      }
      return;
    }
  }
  
  public void restoreTimeout(Callback paramCallback)
  {
    synchronized (mLock)
    {
      if (isCurrentSnackbar(paramCallback)) {
        scheduleTimeoutLocked(mCurrentSnackbar);
      }
      return;
    }
  }
  
  static abstract interface Callback
  {
    public abstract void dismiss();
    
    public abstract void show();
  }
  
  private static class SnackbarRecord
  {
    private final WeakReference<SnackbarManager.Callback> callback;
    private int duration;
    
    boolean isSnackbar(SnackbarManager.Callback paramCallback)
    {
      return (paramCallback != null) && (callback.get() == paramCallback);
    }
  }
}
