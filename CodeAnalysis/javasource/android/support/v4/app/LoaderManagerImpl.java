package android.support.v4.app;

import android.os.Bundle;
import android.support.v4.content.Loader;
import android.support.v4.util.DebugUtils;
import android.support.v4.util.SparseArrayCompat;
import com.tencent.qphone.base.util.QLog;
import java.io.FileDescriptor;
import java.io.PrintWriter;

class LoaderManagerImpl
  extends LoaderManager
{
  static boolean DEBUG = false;
  static final String TAG = "LoaderManager";
  FragmentActivity mActivity;
  boolean mCreatingLoader;
  final SparseArrayCompat mInactiveLoaders = new SparseArrayCompat();
  final SparseArrayCompat mLoaders = new SparseArrayCompat();
  boolean mRetaining;
  boolean mRetainingStarted;
  boolean mStarted;
  final String mWho;
  
  LoaderManagerImpl(String paramString, FragmentActivity paramFragmentActivity, boolean paramBoolean)
  {
    mWho = paramString;
    mActivity = paramFragmentActivity;
    mStarted = paramBoolean;
  }
  
  private LoaderManagerImpl.LoaderInfo createAndInstallLoader(int paramInt, Bundle paramBundle, LoaderManager.LoaderCallbacks paramLoaderCallbacks)
  {
    try
    {
      mCreatingLoader = true;
      paramBundle = createLoader(paramInt, paramBundle, paramLoaderCallbacks);
      installLoader(paramBundle);
      return paramBundle;
    }
    finally
    {
      mCreatingLoader = false;
    }
  }
  
  private LoaderManagerImpl.LoaderInfo createLoader(int paramInt, Bundle paramBundle, LoaderManager.LoaderCallbacks paramLoaderCallbacks)
  {
    LoaderManagerImpl.LoaderInfo localLoaderInfo = new LoaderManagerImpl.LoaderInfo(this, paramInt, paramBundle, paramLoaderCallbacks);
    mLoader = paramLoaderCallbacks.onCreateLoader(paramInt, paramBundle);
    return localLoaderInfo;
  }
  
  public void destroyLoader(int paramInt)
  {
    if (mCreatingLoader) {
      throw new IllegalStateException("Called while creating a loader");
    }
    if ((DEBUG) && (QLog.isDevelopLevel())) {
      QLog.d("LoaderManager", 4, "destroyLoader in " + this + " of " + paramInt);
    }
    int i = mLoaders.indexOfKey(paramInt);
    LoaderManagerImpl.LoaderInfo localLoaderInfo;
    if (i >= 0)
    {
      localLoaderInfo = (LoaderManagerImpl.LoaderInfo)mLoaders.valueAt(i);
      mLoaders.removeAt(i);
      localLoaderInfo.destroy();
    }
    paramInt = mInactiveLoaders.indexOfKey(paramInt);
    if (paramInt >= 0)
    {
      localLoaderInfo = (LoaderManagerImpl.LoaderInfo)mInactiveLoaders.valueAt(paramInt);
      mInactiveLoaders.removeAt(paramInt);
      localLoaderInfo.destroy();
    }
    if ((mActivity != null) && (!hasRunningLoaders())) {
      mActivity.mFragments.startPendingDeferredFragments();
    }
  }
  
  void doDestroy()
  {
    if (!mRetaining)
    {
      if ((DEBUG) && (QLog.isDevelopLevel())) {
        QLog.d("LoaderManager", 4, "Destroying Active in " + this);
      }
      i = mLoaders.size() - 1;
      while (i >= 0)
      {
        ((LoaderManagerImpl.LoaderInfo)mLoaders.valueAt(i)).destroy();
        i -= 1;
      }
      mLoaders.clear();
    }
    if ((DEBUG) && (QLog.isDevelopLevel())) {
      QLog.d("LoaderManager", 4, "Destroying Inactive in " + this);
    }
    int i = mInactiveLoaders.size() - 1;
    while (i >= 0)
    {
      ((LoaderManagerImpl.LoaderInfo)mInactiveLoaders.valueAt(i)).destroy();
      i -= 1;
    }
    mInactiveLoaders.clear();
  }
  
  void doReportNextStart()
  {
    int i = mLoaders.size() - 1;
    while (i >= 0)
    {
      mLoaders.valueAt(i)).mReportNextStart = true;
      i -= 1;
    }
  }
  
  void doReportStart()
  {
    int i = mLoaders.size() - 1;
    while (i >= 0)
    {
      ((LoaderManagerImpl.LoaderInfo)mLoaders.valueAt(i)).reportStart();
      i -= 1;
    }
  }
  
  void doRetain()
  {
    if ((DEBUG) && (QLog.isDevelopLevel())) {
      QLog.d("LoaderManager", 4, "Retaining in " + this);
    }
    if (!mStarted)
    {
      RuntimeException localRuntimeException = new RuntimeException("here");
      localRuntimeException.fillInStackTrace();
      if (QLog.isDevelopLevel()) {
        QLog.w("LoaderManager", 4, "Called doRetain when not started: " + this, localRuntimeException);
      }
    }
    for (;;)
    {
      return;
      mRetaining = true;
      mStarted = false;
      int i = mLoaders.size() - 1;
      while (i >= 0)
      {
        ((LoaderManagerImpl.LoaderInfo)mLoaders.valueAt(i)).retain();
        i -= 1;
      }
    }
  }
  
  void doStart()
  {
    if ((DEBUG) && (QLog.isDevelopLevel())) {
      QLog.d("LoaderManager", 4, "Starting in " + this);
    }
    if (mStarted)
    {
      RuntimeException localRuntimeException = new RuntimeException("here");
      localRuntimeException.fillInStackTrace();
      if (QLog.isDevelopLevel()) {
        QLog.w("LoaderManager", 4, "Called doStart when already started: " + this, localRuntimeException);
      }
    }
    for (;;)
    {
      return;
      mStarted = true;
      int i = mLoaders.size() - 1;
      while (i >= 0)
      {
        ((LoaderManagerImpl.LoaderInfo)mLoaders.valueAt(i)).start();
        i -= 1;
      }
    }
  }
  
  void doStop()
  {
    if ((DEBUG) && (QLog.isDevelopLevel())) {
      QLog.d("LoaderManager", 4, "Stopping in " + this);
    }
    if (!mStarted)
    {
      RuntimeException localRuntimeException = new RuntimeException("here");
      localRuntimeException.fillInStackTrace();
      if (QLog.isDevelopLevel()) {
        QLog.w("LoaderManager", 4, "Called doStop when not started: " + this, localRuntimeException);
      }
      return;
    }
    int i = mLoaders.size() - 1;
    while (i >= 0)
    {
      ((LoaderManagerImpl.LoaderInfo)mLoaders.valueAt(i)).stop();
      i -= 1;
    }
    mStarted = false;
  }
  
  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    int j = 0;
    String str;
    int i;
    LoaderManagerImpl.LoaderInfo localLoaderInfo;
    if (mLoaders.size() > 0)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.println("Active Loaders:");
      str = paramString + "    ";
      i = 0;
      while (i < mLoaders.size())
      {
        localLoaderInfo = (LoaderManagerImpl.LoaderInfo)mLoaders.valueAt(i);
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("  #");
        paramPrintWriter.print(mLoaders.keyAt(i));
        paramPrintWriter.print(": ");
        paramPrintWriter.println(localLoaderInfo.toString());
        localLoaderInfo.dump(str, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
        i += 1;
      }
    }
    if (mInactiveLoaders.size() > 0)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.println("Inactive Loaders:");
      str = paramString + "    ";
      i = j;
      while (i < mInactiveLoaders.size())
      {
        localLoaderInfo = (LoaderManagerImpl.LoaderInfo)mInactiveLoaders.valueAt(i);
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("  #");
        paramPrintWriter.print(mInactiveLoaders.keyAt(i));
        paramPrintWriter.print(": ");
        paramPrintWriter.println(localLoaderInfo.toString());
        localLoaderInfo.dump(str, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
        i += 1;
      }
    }
  }
  
  void finishRetain()
  {
    if (mRetaining)
    {
      if ((DEBUG) && (QLog.isDevelopLevel())) {
        QLog.d("LoaderManager", 4, "Finished Retaining in " + this);
      }
      mRetaining = false;
      int i = mLoaders.size() - 1;
      while (i >= 0)
      {
        ((LoaderManagerImpl.LoaderInfo)mLoaders.valueAt(i)).finishRetain();
        i -= 1;
      }
    }
  }
  
  public Loader getLoader(int paramInt)
  {
    if (mCreatingLoader) {
      throw new IllegalStateException("Called while creating a loader");
    }
    LoaderManagerImpl.LoaderInfo localLoaderInfo = (LoaderManagerImpl.LoaderInfo)mLoaders.get(paramInt);
    if (localLoaderInfo != null)
    {
      if (mPendingLoader != null) {
        return mPendingLoader.mLoader;
      }
      return mLoader;
    }
    return null;
  }
  
  public boolean hasRunningLoaders()
  {
    int j = mLoaders.size();
    int i = 0;
    boolean bool2 = false;
    if (i < j)
    {
      LoaderManagerImpl.LoaderInfo localLoaderInfo = (LoaderManagerImpl.LoaderInfo)mLoaders.valueAt(i);
      if ((mStarted) && (!mDeliveredData)) {}
      for (boolean bool1 = true;; bool1 = false)
      {
        bool2 |= bool1;
        i += 1;
        break;
      }
    }
    return bool2;
  }
  
  public Loader initLoader(int paramInt, Bundle paramBundle, LoaderManager.LoaderCallbacks paramLoaderCallbacks)
  {
    if (mCreatingLoader) {
      throw new IllegalStateException("Called while creating a loader");
    }
    LoaderManagerImpl.LoaderInfo localLoaderInfo = (LoaderManagerImpl.LoaderInfo)mLoaders.get(paramInt);
    if ((DEBUG) && (QLog.isDevelopLevel())) {
      QLog.d("LoaderManager", 4, "initLoader in " + this + ": args=" + paramBundle);
    }
    if (localLoaderInfo == null)
    {
      paramLoaderCallbacks = createAndInstallLoader(paramInt, paramBundle, paramLoaderCallbacks);
      paramBundle = paramLoaderCallbacks;
      if (DEBUG)
      {
        paramBundle = paramLoaderCallbacks;
        if (QLog.isDevelopLevel()) {
          QLog.d("LoaderManager", 4, "  Created new loader " + paramLoaderCallbacks);
        }
      }
    }
    for (paramBundle = paramLoaderCallbacks;; paramBundle = localLoaderInfo)
    {
      if ((mHaveData) && (mStarted)) {
        paramBundle.callOnLoadFinished(mLoader, mData);
      }
      return mLoader;
      if ((DEBUG) && (QLog.isDevelopLevel())) {
        QLog.d("LoaderManager", 4, "  Re-using existing loader " + localLoaderInfo);
      }
      mCallbacks = paramLoaderCallbacks;
    }
  }
  
  void installLoader(LoaderManagerImpl.LoaderInfo paramLoaderInfo)
  {
    mLoaders.put(mId, paramLoaderInfo);
    if (mStarted) {
      paramLoaderInfo.start();
    }
  }
  
  public Loader restartLoader(int paramInt, Bundle paramBundle, LoaderManager.LoaderCallbacks paramLoaderCallbacks)
  {
    if (mCreatingLoader) {
      throw new IllegalStateException("Called while creating a loader");
    }
    LoaderManagerImpl.LoaderInfo localLoaderInfo1 = (LoaderManagerImpl.LoaderInfo)mLoaders.get(paramInt);
    if ((DEBUG) && (QLog.isDevelopLevel())) {
      QLog.d("LoaderManager", 4, "restartLoader in " + this + ": args=" + paramBundle);
    }
    if (localLoaderInfo1 != null)
    {
      LoaderManagerImpl.LoaderInfo localLoaderInfo2 = (LoaderManagerImpl.LoaderInfo)mInactiveLoaders.get(paramInt);
      if (localLoaderInfo2 == null) {
        break label339;
      }
      if (!mHaveData) {
        break label187;
      }
      if ((DEBUG) && (QLog.isDevelopLevel())) {
        QLog.d("LoaderManager", 4, "  Removing last inactive loader: " + localLoaderInfo1);
      }
      mDeliveredData = false;
      localLoaderInfo2.destroy();
      mLoader.abandon();
      mInactiveLoaders.put(paramInt, localLoaderInfo1);
    }
    for (;;)
    {
      return createAndInstallLoadermLoader;
      label187:
      if (!mStarted)
      {
        if ((DEBUG) && (QLog.isDevelopLevel())) {
          QLog.d("LoaderManager", 4, "  Current loader is stopped; replacing");
        }
        mLoaders.put(paramInt, null);
        localLoaderInfo1.destroy();
      }
      else
      {
        if (mPendingLoader != null)
        {
          if ((DEBUG) && (QLog.isDevelopLevel())) {
            QLog.d("LoaderManager", 4, "  Removing pending loader: " + mPendingLoader);
          }
          mPendingLoader.destroy();
          mPendingLoader = null;
        }
        if ((DEBUG) && (QLog.isDevelopLevel())) {
          QLog.d("LoaderManager", 4, "  Enqueuing as new pending loader");
        }
        mPendingLoader = createLoader(paramInt, paramBundle, paramLoaderCallbacks);
        return mPendingLoader.mLoader;
        label339:
        if ((DEBUG) && (QLog.isDevelopLevel())) {
          QLog.d("LoaderManager", 4, "  Making last loader inactive: " + localLoaderInfo1);
        }
        mLoader.abandon();
        mInactiveLoaders.put(paramInt, localLoaderInfo1);
      }
    }
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(128);
    localStringBuilder.append("LoaderManager{");
    localStringBuilder.append(Integer.toHexString(System.identityHashCode(this)));
    localStringBuilder.append(" in ");
    DebugUtils.buildShortClassTag(mActivity, localStringBuilder);
    localStringBuilder.append("}}");
    return localStringBuilder.toString();
  }
  
  void updateActivity(FragmentActivity paramFragmentActivity)
  {
    mActivity = paramFragmentActivity;
  }
}
