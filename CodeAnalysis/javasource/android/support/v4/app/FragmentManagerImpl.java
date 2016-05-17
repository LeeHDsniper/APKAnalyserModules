package android.support.v4.app;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.support.v4.util.DebugUtils;
import android.support.v4.util.LogWriter;
import android.util.SparseArray;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import com.tencent.qphone.base.util.QLog;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

final class FragmentManagerImpl
  extends FragmentManager
{
  static final Interpolator ACCELERATE_CUBIC;
  static final Interpolator ACCELERATE_QUINT;
  static final int ANIM_DUR = 220;
  public static final int ANIM_STYLE_CLOSE_ENTER = 3;
  public static final int ANIM_STYLE_CLOSE_EXIT = 4;
  public static final int ANIM_STYLE_FADE_ENTER = 5;
  public static final int ANIM_STYLE_FADE_EXIT = 6;
  public static final int ANIM_STYLE_OPEN_ENTER = 1;
  public static final int ANIM_STYLE_OPEN_EXIT = 2;
  static final boolean DEBUG = false;
  static final Interpolator DECELERATE_CUBIC;
  static final Interpolator DECELERATE_QUINT;
  static final boolean HONEYCOMB;
  static final String TAG = "FragmentManager";
  static final String TARGET_REQUEST_CODE_STATE_TAG = "android:target_req_state";
  static final String TARGET_STATE_TAG = "android:target_state";
  static final String USER_VISIBLE_HINT_TAG = "android:user_visible_hint";
  static final String VIEW_STATE_TAG = "android:view_state";
  ArrayList mActive;
  FragmentActivity mActivity;
  ArrayList mAdded;
  ArrayList mAvailBackStackIndices;
  ArrayList mAvailIndices;
  ArrayList mBackStack;
  ArrayList mBackStackChangeListeners;
  ArrayList mBackStackIndices;
  FragmentContainer mContainer;
  ArrayList mCreatedMenus;
  int mCurState = 0;
  boolean mDestroyed;
  Runnable mExecCommit = new FragmentManagerImpl.1(this);
  boolean mExecutingActions;
  boolean mHavePendingDeferredStart;
  boolean mNeedMenuInvalidate;
  String mNoTransactionsBecause;
  Fragment mParent;
  ArrayList mPendingActions;
  SparseArray mStateArray = null;
  Bundle mStateBundle = null;
  boolean mStateSaved;
  Runnable[] mTmpActions;
  
  static
  {
    if (Build.VERSION.SDK_INT >= 11) {}
    for (boolean bool = true;; bool = false)
    {
      HONEYCOMB = bool;
      DECELERATE_QUINT = new DecelerateInterpolator(2.5F);
      DECELERATE_CUBIC = new DecelerateInterpolator(1.5F);
      ACCELERATE_QUINT = new AccelerateInterpolator(2.5F);
      ACCELERATE_CUBIC = new AccelerateInterpolator(1.5F);
      return;
    }
  }
  
  FragmentManagerImpl() {}
  
  private void checkStateLoss()
  {
    if (mStateSaved) {
      throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
    }
    if (mNoTransactionsBecause != null) {
      throw new IllegalStateException("Can not perform this action inside of " + mNoTransactionsBecause);
    }
  }
  
  static Animation makeFadeAnimation(Context paramContext, float paramFloat1, float paramFloat2)
  {
    paramContext = new AlphaAnimation(paramFloat1, paramFloat2);
    paramContext.setInterpolator(DECELERATE_CUBIC);
    paramContext.setDuration(220L);
    return paramContext;
  }
  
  static Animation makeOpenCloseAnimation(Context paramContext, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    paramContext = new AnimationSet(false);
    Object localObject = new ScaleAnimation(paramFloat1, paramFloat2, paramFloat1, paramFloat2, 1, 0.5F, 1, 0.5F);
    ((ScaleAnimation)localObject).setInterpolator(DECELERATE_QUINT);
    ((ScaleAnimation)localObject).setDuration(220L);
    paramContext.addAnimation((Animation)localObject);
    localObject = new AlphaAnimation(paramFloat3, paramFloat4);
    ((AlphaAnimation)localObject).setInterpolator(DECELERATE_CUBIC);
    ((AlphaAnimation)localObject).setDuration(220L);
    paramContext.addAnimation((Animation)localObject);
    return paramContext;
  }
  
  public static int reverseTransit(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      return 0;
    case 4097: 
      return 8194;
    case 8194: 
      return 4097;
    }
    return 4099;
  }
  
  private void throwException(RuntimeException paramRuntimeException)
  {
    if (QLog.isDevelopLevel()) {
      QLog.e("FragmentManager", 4, paramRuntimeException.getMessage());
    }
    if (QLog.isDevelopLevel()) {
      QLog.e("FragmentManager", 4, "Activity state:");
    }
    PrintWriter localPrintWriter = new PrintWriter(new LogWriter("FragmentManager"));
    if (mActivity != null) {}
    for (;;)
    {
      try
      {
        mActivity.dump("  ", null, localPrintWriter, new String[0]);
        throw paramRuntimeException;
      }
      catch (Exception localException1)
      {
        if (!QLog.isDevelopLevel()) {
          continue;
        }
        QLog.e("FragmentManager", 4, "Failed dumping state", localException1);
        continue;
      }
      try
      {
        dump("  ", null, localException1, new String[0]);
      }
      catch (Exception localException2) {}
      if (QLog.isDevelopLevel()) {
        QLog.e("FragmentManager", 4, "Failed dumping state", localException2);
      }
    }
  }
  
  public static int transitToStyleIndex(int paramInt, boolean paramBoolean)
  {
    switch (paramInt)
    {
    default: 
      return -1;
    case 4097: 
      if (paramBoolean) {
        return 1;
      }
      return 2;
    case 8194: 
      if (paramBoolean) {
        return 3;
      }
      return 4;
    }
    if (paramBoolean) {
      return 5;
    }
    return 6;
  }
  
  void addBackStackState(BackStackRecord paramBackStackRecord)
  {
    if (mBackStack == null) {
      mBackStack = new ArrayList();
    }
    mBackStack.add(paramBackStackRecord);
    reportBackStackChanged();
  }
  
  public void addFragment(Fragment paramFragment, boolean paramBoolean)
  {
    if (mAdded == null) {
      mAdded = new ArrayList();
    }
    makeActive(paramFragment);
    if (!mDetached)
    {
      if (mAdded.contains(paramFragment)) {
        throw new IllegalStateException("Fragment already added: " + paramFragment);
      }
      mAdded.add(paramFragment);
      mAdded = true;
      mRemoving = false;
      if ((mHasMenu) && (mMenuVisible)) {
        mNeedMenuInvalidate = true;
      }
      if (paramBoolean) {
        moveToState(paramFragment);
      }
    }
  }
  
  public void addOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener paramOnBackStackChangedListener)
  {
    if (mBackStackChangeListeners == null) {
      mBackStackChangeListeners = new ArrayList();
    }
    mBackStackChangeListeners.add(paramOnBackStackChangedListener);
  }
  
  public int allocBackStackIndex(BackStackRecord paramBackStackRecord)
  {
    try
    {
      if ((mAvailBackStackIndices == null) || (mAvailBackStackIndices.size() <= 0))
      {
        if (mBackStackIndices == null) {
          mBackStackIndices = new ArrayList();
        }
        i = mBackStackIndices.size();
        mBackStackIndices.add(paramBackStackRecord);
        return i;
      }
      int i = ((Integer)mAvailBackStackIndices.remove(mAvailBackStackIndices.size() - 1)).intValue();
      mBackStackIndices.set(i, paramBackStackRecord);
      return i;
    }
    finally {}
  }
  
  public void attachActivity(FragmentActivity paramFragmentActivity, FragmentContainer paramFragmentContainer, Fragment paramFragment)
  {
    if (mActivity != null) {
      throw new IllegalStateException("Already attached");
    }
    mActivity = paramFragmentActivity;
    mContainer = paramFragmentContainer;
    mParent = paramFragment;
  }
  
  public void attachFragment(Fragment paramFragment, int paramInt1, int paramInt2)
  {
    if (mDetached)
    {
      mDetached = false;
      if (!mAdded)
      {
        if (mAdded == null) {
          mAdded = new ArrayList();
        }
        if (mAdded.contains(paramFragment)) {
          throw new IllegalStateException("Fragment already added: " + paramFragment);
        }
        mAdded.add(paramFragment);
        mAdded = true;
        if ((mHasMenu) && (mMenuVisible)) {
          mNeedMenuInvalidate = true;
        }
        moveToState(paramFragment, mCurState, paramInt1, paramInt2, false);
      }
    }
  }
  
  public FragmentTransaction beginTransaction()
  {
    return new BackStackRecord(this);
  }
  
  public void detachFragment(Fragment paramFragment, int paramInt1, int paramInt2)
  {
    if (!mDetached)
    {
      mDetached = true;
      if (mAdded)
      {
        if (mAdded != null) {
          mAdded.remove(paramFragment);
        }
        if ((mHasMenu) && (mMenuVisible)) {
          mNeedMenuInvalidate = true;
        }
        mAdded = false;
        moveToState(paramFragment, 1, paramInt1, paramInt2, false);
      }
    }
  }
  
  public void dispatchActivityCreated()
  {
    mStateSaved = false;
    moveToState(2, false);
  }
  
  public void dispatchConfigurationChanged(Configuration paramConfiguration)
  {
    if (mAdded != null)
    {
      int i = 0;
      while (i < mAdded.size())
      {
        Fragment localFragment = (Fragment)mAdded.get(i);
        if (localFragment != null) {
          localFragment.performConfigurationChanged(paramConfiguration);
        }
        i += 1;
      }
    }
  }
  
  public boolean dispatchContextItemSelected(MenuItem paramMenuItem)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    int i;
    if (mAdded != null) {
      i = 0;
    }
    for (;;)
    {
      bool1 = bool2;
      if (i < mAdded.size())
      {
        Fragment localFragment = (Fragment)mAdded.get(i);
        if ((localFragment != null) && (localFragment.performContextItemSelected(paramMenuItem))) {
          bool1 = true;
        }
      }
      else
      {
        return bool1;
      }
      i += 1;
    }
  }
  
  public void dispatchCreate()
  {
    mStateSaved = false;
    moveToState(1, false);
  }
  
  public boolean dispatchCreateOptionsMenu(Menu paramMenu, MenuInflater paramMenuInflater)
  {
    int j = 0;
    Object localObject2 = null;
    Object localObject1 = null;
    int i;
    if (mAdded != null)
    {
      i = 0;
      boolean bool1 = false;
      for (;;)
      {
        localObject2 = localObject1;
        bool2 = bool1;
        if (i >= mAdded.size()) {
          break;
        }
        Fragment localFragment = (Fragment)mAdded.get(i);
        localObject2 = localObject1;
        bool2 = bool1;
        if (localFragment != null)
        {
          localObject2 = localObject1;
          bool2 = bool1;
          if (localFragment.performCreateOptionsMenu(paramMenu, paramMenuInflater))
          {
            bool2 = true;
            localObject2 = localObject1;
            if (localObject1 == null) {
              localObject2 = new ArrayList();
            }
            ((ArrayList)localObject2).add(localFragment);
          }
        }
        i += 1;
        bool1 = bool2;
        localObject1 = localObject2;
      }
    }
    boolean bool2 = false;
    if (mCreatedMenus != null)
    {
      i = j;
      while (i < mCreatedMenus.size())
      {
        paramMenu = (Fragment)mCreatedMenus.get(i);
        if ((localObject2 == null) || (!((ArrayList)localObject2).contains(paramMenu))) {
          paramMenu.onDestroyOptionsMenu();
        }
        i += 1;
      }
    }
    mCreatedMenus = ((ArrayList)localObject2);
    return bool2;
  }
  
  public void dispatchDestroy()
  {
    mDestroyed = true;
    execPendingActions();
    moveToState(0, false);
    mActivity = null;
    mContainer = null;
    mParent = null;
  }
  
  public void dispatchDestroyView()
  {
    moveToState(1, false);
  }
  
  public void dispatchLowMemory()
  {
    if (mAdded != null)
    {
      int i = 0;
      while (i < mAdded.size())
      {
        Fragment localFragment = (Fragment)mAdded.get(i);
        if (localFragment != null) {
          localFragment.performLowMemory();
        }
        i += 1;
      }
    }
  }
  
  public boolean dispatchOptionsItemSelected(MenuItem paramMenuItem)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    int i;
    if (mAdded != null) {
      i = 0;
    }
    for (;;)
    {
      bool1 = bool2;
      if (i < mAdded.size())
      {
        Fragment localFragment = (Fragment)mAdded.get(i);
        if ((localFragment != null) && (localFragment.performOptionsItemSelected(paramMenuItem))) {
          bool1 = true;
        }
      }
      else
      {
        return bool1;
      }
      i += 1;
    }
  }
  
  public void dispatchOptionsMenuClosed(Menu paramMenu)
  {
    if (mAdded != null)
    {
      int i = 0;
      while (i < mAdded.size())
      {
        Fragment localFragment = (Fragment)mAdded.get(i);
        if (localFragment != null) {
          localFragment.performOptionsMenuClosed(paramMenu);
        }
        i += 1;
      }
    }
  }
  
  public void dispatchPause()
  {
    moveToState(4, false);
  }
  
  public boolean dispatchPrepareOptionsMenu(Menu paramMenu)
  {
    if (mAdded != null)
    {
      int i = 0;
      for (boolean bool1 = false;; bool1 = bool2)
      {
        bool2 = bool1;
        if (i >= mAdded.size()) {
          break;
        }
        Fragment localFragment = (Fragment)mAdded.get(i);
        bool2 = bool1;
        if (localFragment != null)
        {
          bool2 = bool1;
          if (localFragment.performPrepareOptionsMenu(paramMenu)) {
            bool2 = true;
          }
        }
        i += 1;
      }
    }
    boolean bool2 = false;
    return bool2;
  }
  
  public void dispatchReallyStop()
  {
    moveToState(2, false);
  }
  
  public void dispatchResume()
  {
    mStateSaved = false;
    moveToState(5, false);
  }
  
  public void dispatchStart()
  {
    mStateSaved = false;
    moveToState(4, false);
  }
  
  public void dispatchStop()
  {
    mStateSaved = true;
    moveToState(3, false);
  }
  
  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    int j = 0;
    String str = paramString + "    ";
    int k;
    int i;
    Object localObject;
    if (mActive != null)
    {
      k = mActive.size();
      if (k > 0)
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("Active Fragments in ");
        paramPrintWriter.print(Integer.toHexString(System.identityHashCode(this)));
        paramPrintWriter.println(":");
        i = 0;
        while (i < k)
        {
          localObject = (Fragment)mActive.get(i);
          paramPrintWriter.print(paramString);
          paramPrintWriter.print("  #");
          paramPrintWriter.print(i);
          paramPrintWriter.print(": ");
          paramPrintWriter.println(localObject);
          if (localObject != null) {
            ((Fragment)localObject).dump(str, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
          }
          i += 1;
        }
      }
    }
    if (mAdded != null)
    {
      k = mAdded.size();
      if (k > 0)
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.println("Added Fragments:");
        i = 0;
        while (i < k)
        {
          localObject = (Fragment)mAdded.get(i);
          paramPrintWriter.print(paramString);
          paramPrintWriter.print("  #");
          paramPrintWriter.print(i);
          paramPrintWriter.print(": ");
          paramPrintWriter.println(((Fragment)localObject).toString());
          i += 1;
        }
      }
    }
    if (mCreatedMenus != null)
    {
      k = mCreatedMenus.size();
      if (k > 0)
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.println("Fragments Created Menus:");
        i = 0;
        while (i < k)
        {
          localObject = (Fragment)mCreatedMenus.get(i);
          paramPrintWriter.print(paramString);
          paramPrintWriter.print("  #");
          paramPrintWriter.print(i);
          paramPrintWriter.print(": ");
          paramPrintWriter.println(((Fragment)localObject).toString());
          i += 1;
        }
      }
    }
    if (mBackStack != null)
    {
      k = mBackStack.size();
      if (k > 0)
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.println("Back Stack:");
        i = 0;
        while (i < k)
        {
          localObject = (BackStackRecord)mBackStack.get(i);
          paramPrintWriter.print(paramString);
          paramPrintWriter.print("  #");
          paramPrintWriter.print(i);
          paramPrintWriter.print(": ");
          paramPrintWriter.println(((BackStackRecord)localObject).toString());
          ((BackStackRecord)localObject).dump(str, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
          i += 1;
        }
      }
    }
    try
    {
      if (mBackStackIndices != null)
      {
        k = mBackStackIndices.size();
        if (k > 0)
        {
          paramPrintWriter.print(paramString);
          paramPrintWriter.println("Back Stack Indices:");
          i = 0;
          while (i < k)
          {
            paramFileDescriptor = (BackStackRecord)mBackStackIndices.get(i);
            paramPrintWriter.print(paramString);
            paramPrintWriter.print("  #");
            paramPrintWriter.print(i);
            paramPrintWriter.print(": ");
            paramPrintWriter.println(paramFileDescriptor);
            i += 1;
          }
        }
      }
      if ((mAvailBackStackIndices != null) && (mAvailBackStackIndices.size() > 0))
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mAvailBackStackIndices: ");
        paramPrintWriter.println(Arrays.toString(mAvailBackStackIndices.toArray()));
      }
      if (mPendingActions != null)
      {
        k = mPendingActions.size();
        if (k > 0)
        {
          paramPrintWriter.print(paramString);
          paramPrintWriter.println("Pending Actions:");
          i = j;
          while (i < k)
          {
            paramFileDescriptor = (Runnable)mPendingActions.get(i);
            paramPrintWriter.print(paramString);
            paramPrintWriter.print("  #");
            paramPrintWriter.print(i);
            paramPrintWriter.print(": ");
            paramPrintWriter.println(paramFileDescriptor);
            i += 1;
          }
        }
      }
      paramPrintWriter.print(paramString);
    }
    finally {}
    paramPrintWriter.println("FragmentManager misc state:");
    paramPrintWriter.print(paramString);
    paramPrintWriter.print("  mActivity=");
    paramPrintWriter.println(mActivity);
    paramPrintWriter.print(paramString);
    paramPrintWriter.print("  mContainer=");
    paramPrintWriter.println(mContainer);
    if (mParent != null)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("  mParent=");
      paramPrintWriter.println(mParent);
    }
    paramPrintWriter.print(paramString);
    paramPrintWriter.print("  mCurState=");
    paramPrintWriter.print(mCurState);
    paramPrintWriter.print(" mStateSaved=");
    paramPrintWriter.print(mStateSaved);
    paramPrintWriter.print(" mDestroyed=");
    paramPrintWriter.println(mDestroyed);
    if (mNeedMenuInvalidate)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("  mNeedMenuInvalidate=");
      paramPrintWriter.println(mNeedMenuInvalidate);
    }
    if (mNoTransactionsBecause != null)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("  mNoTransactionsBecause=");
      paramPrintWriter.println(mNoTransactionsBecause);
    }
    if ((mAvailIndices != null) && (mAvailIndices.size() > 0))
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("  mAvailIndices: ");
      paramPrintWriter.println(Arrays.toString(mAvailIndices.toArray()));
    }
  }
  
  public void enqueueAction(Runnable paramRunnable, boolean paramBoolean)
  {
    if (!paramBoolean) {
      checkStateLoss();
    }
    try
    {
      if ((mDestroyed) || (mActivity == null)) {
        throw new IllegalStateException("Activity has been destroyed");
      }
    }
    finally
    {
      throw paramRunnable;
      if (mPendingActions == null) {
        mPendingActions = new ArrayList();
      }
      mPendingActions.add(paramRunnable);
      if (mPendingActions.size() == 1) {
        mActivity.mHandler.removeCallbacks(mExecCommit);
      }
    }
  }
  
  public boolean execPendingActions()
  {
    if (mExecutingActions) {
      throw new IllegalStateException("Recursive entry to executePendingTransactions");
    }
    if (Looper.myLooper() != mActivity.mHandler.getLooper()) {
      throw new IllegalStateException("Must be called from main thread of process");
    }
    int j;
    for (boolean bool = false;; bool = true) {
      try
      {
        if ((mPendingActions == null) || (mPendingActions.size() == 0))
        {
          if (!mHavePendingDeferredStart) {
            break label276;
          }
          i = 0;
          int m;
          for (j = 0; i < mActive.size(); j = m)
          {
            Fragment localFragment = (Fragment)mActive.get(i);
            int k = j;
            if (localFragment != null)
            {
              k = j;
              if (mLoaderManager != null) {
                m = j | mLoaderManager.hasRunningLoaders();
              }
            }
            i += 1;
          }
        }
        j = mPendingActions.size();
        if ((mTmpActions == null) || (mTmpActions.length < j)) {
          mTmpActions = new Runnable[j];
        }
        mPendingActions.toArray(mTmpActions);
        mPendingActions.clear();
        mActivity.mHandler.removeCallbacks(mExecCommit);
        mExecutingActions = true;
        int i = 0;
        while (i < j)
        {
          mTmpActions[i].run();
          mTmpActions[i] = null;
          i += 1;
        }
        mExecutingActions = false;
      }
      finally {}
    }
    if (j == 0)
    {
      mHavePendingDeferredStart = false;
      startPendingDeferredFragments();
    }
    label276:
    return bool;
  }
  
  public boolean executePendingTransactions()
  {
    return execPendingActions();
  }
  
  public Fragment findFragmentById(int paramInt)
  {
    int i;
    Object localObject;
    if (mAdded != null)
    {
      i = mAdded.size() - 1;
      while (i >= 0)
      {
        localObject = (Fragment)mAdded.get(i);
        if ((localObject != null) && (mFragmentId == paramInt)) {
          return localObject;
        }
        i -= 1;
      }
    }
    if (mActive != null)
    {
      i = mActive.size() - 1;
      for (;;)
      {
        if (i < 0) {
          break label112;
        }
        Fragment localFragment = (Fragment)mActive.get(i);
        if (localFragment != null)
        {
          localObject = localFragment;
          if (mFragmentId == paramInt) {
            break;
          }
        }
        i -= 1;
      }
    }
    label112:
    return null;
  }
  
  public Fragment findFragmentByTag(String paramString)
  {
    int i;
    Object localObject;
    if ((mAdded != null) && (paramString != null))
    {
      i = mAdded.size() - 1;
      while (i >= 0)
      {
        localObject = (Fragment)mAdded.get(i);
        if ((localObject != null) && (paramString.equals(mTag))) {
          return localObject;
        }
        i -= 1;
      }
    }
    if ((mActive != null) && (paramString != null))
    {
      i = mActive.size() - 1;
      for (;;)
      {
        if (i < 0) {
          break label126;
        }
        Fragment localFragment = (Fragment)mActive.get(i);
        if (localFragment != null)
        {
          localObject = localFragment;
          if (paramString.equals(mTag)) {
            break;
          }
        }
        i -= 1;
      }
    }
    label126:
    return null;
  }
  
  public Fragment findFragmentByWho(String paramString)
  {
    if ((mActive != null) && (paramString != null))
    {
      int i = mActive.size() - 1;
      while (i >= 0)
      {
        Fragment localFragment = (Fragment)mActive.get(i);
        if (localFragment != null)
        {
          localFragment = localFragment.findFragmentByWho(paramString);
          if (localFragment != null) {
            return localFragment;
          }
        }
        i -= 1;
      }
    }
    return null;
  }
  
  public void freeBackStackIndex(int paramInt)
  {
    try
    {
      mBackStackIndices.set(paramInt, null);
      if (mAvailBackStackIndices == null) {
        mAvailBackStackIndices = new ArrayList();
      }
      mAvailBackStackIndices.add(Integer.valueOf(paramInt));
      return;
    }
    finally {}
  }
  
  public FragmentManager.BackStackEntry getBackStackEntryAt(int paramInt)
  {
    return (FragmentManager.BackStackEntry)mBackStack.get(paramInt);
  }
  
  public int getBackStackEntryCount()
  {
    if (mBackStack != null) {
      return mBackStack.size();
    }
    return 0;
  }
  
  public Fragment getFragment(Bundle paramBundle, String paramString)
  {
    int i = paramBundle.getInt(paramString, -1);
    if (i == -1) {
      paramBundle = null;
    }
    Fragment localFragment;
    do
    {
      return paramBundle;
      if (i >= mActive.size()) {
        throwException(new IllegalStateException("Fragement no longer exists for key " + paramString + ": index " + i));
      }
      localFragment = (Fragment)mActive.get(i);
      paramBundle = localFragment;
    } while (localFragment != null);
    throwException(new IllegalStateException("Fragement no longer exists for key " + paramString + ": index " + i));
    return localFragment;
  }
  
  public List getFragments()
  {
    return mActive;
  }
  
  public void hideFragment(Fragment paramFragment, int paramInt1, int paramInt2)
  {
    if (!mHidden)
    {
      mHidden = true;
      if (mView != null)
      {
        Animation localAnimation = loadAnimation(paramFragment, paramInt1, false, paramInt2);
        if (localAnimation != null) {
          mView.startAnimation(localAnimation);
        }
        mView.setVisibility(8);
      }
      if ((mAdded) && (mHasMenu) && (mMenuVisible)) {
        mNeedMenuInvalidate = true;
      }
      paramFragment.onHiddenChanged(true);
    }
  }
  
  Animation loadAnimation(Fragment paramFragment, int paramInt1, boolean paramBoolean, int paramInt2)
  {
    Animation localAnimation = paramFragment.onCreateAnimation(paramInt1, paramBoolean, mNextAnim);
    if (localAnimation != null) {
      paramFragment = localAnimation;
    }
    do
    {
      return paramFragment;
      if (mNextAnim == 0) {
        break;
      }
      localAnimation = AnimationUtils.loadAnimation(mActivity, mNextAnim);
      paramFragment = localAnimation;
    } while (localAnimation != null);
    if (paramInt1 == 0) {
      return null;
    }
    paramInt1 = transitToStyleIndex(paramInt1, paramBoolean);
    if (paramInt1 < 0) {
      return null;
    }
    switch (paramInt1)
    {
    default: 
      paramInt1 = paramInt2;
      if (paramInt2 == 0)
      {
        paramInt1 = paramInt2;
        if (mActivity.getWindow() != null) {
          paramInt1 = mActivity.getWindow().getAttributes().windowAnimations;
        }
      }
      if (paramInt1 == 0) {
        return null;
      }
      break;
    case 1: 
      return makeOpenCloseAnimation(mActivity, 1.125F, 1.0F, 0.0F, 1.0F);
    case 2: 
      return makeOpenCloseAnimation(mActivity, 1.0F, 0.975F, 1.0F, 0.0F);
    case 3: 
      return makeOpenCloseAnimation(mActivity, 0.975F, 1.0F, 0.0F, 1.0F);
    case 4: 
      return makeOpenCloseAnimation(mActivity, 1.0F, 1.075F, 1.0F, 0.0F);
    case 5: 
      return makeFadeAnimation(mActivity, 0.0F, 1.0F);
    case 6: 
      return makeFadeAnimation(mActivity, 1.0F, 0.0F);
    }
    return null;
  }
  
  void makeActive(Fragment paramFragment)
  {
    if (mIndex >= 0) {
      return;
    }
    if ((mAvailIndices == null) || (mAvailIndices.size() <= 0))
    {
      if (mActive == null) {
        mActive = new ArrayList();
      }
      paramFragment.setIndex(mActive.size(), mParent);
      mActive.add(paramFragment);
      return;
    }
    paramFragment.setIndex(((Integer)mAvailIndices.remove(mAvailIndices.size() - 1)).intValue(), mParent);
    mActive.set(mIndex, paramFragment);
  }
  
  void makeInactive(Fragment paramFragment)
  {
    if (mIndex < 0) {
      return;
    }
    mActive.set(mIndex, null);
    if (mAvailIndices == null) {
      mAvailIndices = new ArrayList();
    }
    mAvailIndices.add(Integer.valueOf(mIndex));
    mActivity.invalidateSupportFragment(mWho);
    paramFragment.initState();
  }
  
  void moveToState(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    if ((mActivity == null) && (paramInt1 != 0)) {
      throw new IllegalStateException("No activity");
    }
    if ((!paramBoolean) && (mCurState == paramInt1)) {}
    do
    {
      return;
      mCurState = paramInt1;
    } while (mActive == null);
    int i = 0;
    boolean bool = false;
    label54:
    if (i < mActive.size())
    {
      Fragment localFragment = (Fragment)mActive.get(i);
      if (localFragment == null) {
        break label169;
      }
      moveToState(localFragment, paramInt1, paramInt2, paramInt3, false);
      if (mLoaderManager == null) {
        break label169;
      }
      bool |= mLoaderManager.hasRunningLoaders();
    }
    label169:
    for (;;)
    {
      i += 1;
      break label54;
      if (!bool) {
        startPendingDeferredFragments();
      }
      if ((!mNeedMenuInvalidate) || (mActivity == null) || (mCurState != 5)) {
        break;
      }
      mActivity.supportInvalidateOptionsMenu();
      mNeedMenuInvalidate = false;
      return;
    }
  }
  
  void moveToState(int paramInt, boolean paramBoolean)
  {
    moveToState(paramInt, 0, 0, paramBoolean);
  }
  
  void moveToState(Fragment paramFragment)
  {
    moveToState(paramFragment, mCurState, 0, 0, false);
  }
  
  void moveToState(Fragment paramFragment, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    int i;
    if (mAdded)
    {
      i = paramInt1;
      if (!mDetached) {}
    }
    else
    {
      i = paramInt1;
      if (paramInt1 > 1) {
        i = 1;
      }
    }
    int j = i;
    if (mRemoving)
    {
      j = i;
      if (i > mState) {
        j = mState;
      }
    }
    paramInt1 = j;
    if (mDeferStart)
    {
      paramInt1 = j;
      if (mState < 4)
      {
        paramInt1 = j;
        if (j > 3) {
          paramInt1 = 3;
        }
      }
    }
    int k;
    label521:
    Object localObject2;
    if (mState < paramInt1)
    {
      if ((mFromLayout) && (!mInLayout)) {
        return;
      }
      if (mAnimatingAway != null)
      {
        mAnimatingAway = null;
        moveToState(paramFragment, mStateAfterAnimating, 0, 0, true);
      }
      i = paramInt1;
      k = paramInt1;
      j = paramInt1;
      switch (mState)
      {
      default: 
        i = paramInt1;
        mState = i;
        return;
      case 0: 
        j = paramInt1;
        if (mSavedFragmentState != null)
        {
          mSavedViewState = mSavedFragmentState.getSparseParcelableArray("android:view_state");
          mTarget = getFragment(mSavedFragmentState, "android:target_state");
          if (mTarget != null) {
            mTargetRequestCode = mSavedFragmentState.getInt("android:target_req_state", 0);
          }
          mUserVisibleHint = mSavedFragmentState.getBoolean("android:user_visible_hint", true);
          j = paramInt1;
          if (!mUserVisibleHint)
          {
            mDeferStart = true;
            j = paramInt1;
            if (paramInt1 > 3) {
              j = 3;
            }
          }
        }
        mActivity = mActivity;
        mParentFragment = mParent;
        if (mParent != null) {}
        for (localObject1 = mParent.mChildFragmentManager;; localObject1 = mActivity.mFragments)
        {
          mFragmentManager = ((FragmentManagerImpl)localObject1);
          mCalled = false;
          paramFragment.onAttach(mActivity);
          if (mCalled) {
            break;
          }
          throw new SuperNotCalledException("Fragment " + paramFragment + " did not call through to super.onAttach()");
        }
        if (mParentFragment == null) {
          mActivity.onAttachFragment(paramFragment);
        }
        if (!mRetaining) {
          paramFragment.performCreate(mSavedFragmentState);
        }
        mRetaining = false;
        i = j;
        if (mFromLayout)
        {
          mView = paramFragment.performCreateView(paramFragment.getLayoutInflater(mSavedFragmentState), null, mSavedFragmentState);
          if (mView == null) {
            break label861;
          }
          mInnerView = mView;
          mView = NoSaveStateFrameLayout.wrap(mView);
          if (mHidden) {
            mView.setVisibility(8);
          }
          paramFragment.onViewCreated(mView, mSavedFragmentState);
          i = j;
        }
      case 1: 
        k = i;
        if (i > 1) {
          if (!mFromLayout)
          {
            if (mContainerId == 0) {
              break label1282;
            }
            localObject2 = (ViewGroup)mContainer.findViewById(mContainerId);
            localObject1 = localObject2;
            if (localObject2 == null)
            {
              localObject1 = localObject2;
              if (!mRestored) {
                throwException(new IllegalArgumentException("No view found for id 0x" + Integer.toHexString(mContainerId) + " (" + paramFragment.getResources().getResourceName(mContainerId) + ") for fragment " + paramFragment));
              }
            }
          }
        }
        break;
      }
    }
    label861:
    label938:
    label1173:
    label1276:
    label1282:
    for (Object localObject1 = localObject2;; localObject1 = null)
    {
      mContainer = ((ViewGroup)localObject1);
      mView = paramFragment.performCreateView(paramFragment.getLayoutInflater(mSavedFragmentState), (ViewGroup)localObject1, mSavedFragmentState);
      if (mView != null)
      {
        mInnerView = mView;
        mView = NoSaveStateFrameLayout.wrap(mView);
        if (localObject1 != null)
        {
          localObject2 = loadAnimation(paramFragment, paramInt2, true, paramInt3);
          if (localObject2 != null) {
            mView.startAnimation((Animation)localObject2);
          }
          ((ViewGroup)localObject1).addView(mView);
        }
        if (mHidden) {
          mView.setVisibility(8);
        }
        paramFragment.onViewCreated(mView, mSavedFragmentState);
      }
      for (;;)
      {
        paramFragment.performActivityCreated(mSavedFragmentState);
        if (mView != null) {
          paramFragment.restoreViewState(mSavedFragmentState);
        }
        mSavedFragmentState = null;
        k = i;
        j = k;
        if (k > 3)
        {
          paramFragment.performStart();
          j = k;
        }
        i = j;
        if (j <= 4) {
          break;
        }
        mResumed = true;
        paramFragment.performResume();
        mSavedFragmentState = null;
        mSavedViewState = null;
        i = j;
        break;
        mInnerView = null;
        i = j;
        break label521;
        mInnerView = null;
      }
      i = paramInt1;
      if (mState <= paramInt1) {
        break;
      }
      switch (mState)
      {
      default: 
        i = paramInt1;
        break;
      case 1: 
      case 5: 
      case 4: 
      case 3: 
      case 2: 
        do
        {
          i = paramInt1;
          if (paramInt1 >= 1) {
            break;
          }
          if ((mDestroyed) && (mAnimatingAway != null))
          {
            localObject1 = mAnimatingAway;
            mAnimatingAway = null;
            ((View)localObject1).clearAnimation();
          }
          if (mAnimatingAway == null) {
            break label1173;
          }
          mStateAfterAnimating = paramInt1;
          i = 1;
          break;
          if (paramInt1 < 5)
          {
            paramFragment.performPause();
            mResumed = false;
          }
          if (paramInt1 < 4) {
            paramFragment.performStop();
          }
          if (paramInt1 < 3) {
            paramFragment.performReallyStop();
          }
        } while (paramInt1 >= 2);
        if ((mView != null) && (!mActivity.isFinishing()) && (mSavedViewState == null)) {
          saveFragmentViewState(paramFragment);
        }
        paramFragment.performDestroyView();
        if ((mView != null) && (mContainer != null)) {
          if ((mCurState <= 0) || (mDestroyed)) {
            break label1276;
          }
        }
        for (localObject1 = loadAnimation(paramFragment, paramInt2, false, paramInt3);; localObject1 = null)
        {
          if (localObject1 != null)
          {
            mAnimatingAway = mView;
            mStateAfterAnimating = paramInt1;
            ((Animation)localObject1).setAnimationListener(new FragmentManagerImpl.5(this, paramFragment));
            mView.startAnimation((Animation)localObject1);
          }
          mContainer.removeView(mView);
          mContainer = null;
          mView = null;
          mInnerView = null;
          break label938;
          if (!mRetaining) {
            paramFragment.performDestroy();
          }
          mCalled = false;
          paramFragment.onDetach();
          if (!mCalled) {
            throw new SuperNotCalledException("Fragment " + paramFragment + " did not call through to super.onDetach()");
          }
          i = paramInt1;
          if (paramBoolean) {
            break;
          }
          if (!mRetaining)
          {
            makeInactive(paramFragment);
            i = paramInt1;
            break;
          }
          mActivity = null;
          mFragmentManager = null;
          i = paramInt1;
          break;
        }
      }
    }
  }
  
  public void noteStateNotSaved()
  {
    mStateSaved = false;
  }
  
  public void performPendingDeferredStart(Fragment paramFragment)
  {
    if (mDeferStart)
    {
      if (mExecutingActions) {
        mHavePendingDeferredStart = true;
      }
    }
    else {
      return;
    }
    mDeferStart = false;
    moveToState(paramFragment, mCurState, 0, 0, false);
  }
  
  public void popBackStack()
  {
    enqueueAction(new FragmentManagerImpl.2(this), false);
  }
  
  public void popBackStack(int paramInt1, int paramInt2)
  {
    if (paramInt1 < 0) {
      throw new IllegalArgumentException("Bad id: " + paramInt1);
    }
    enqueueAction(new FragmentManagerImpl.4(this, paramInt1, paramInt2), false);
  }
  
  public void popBackStack(String paramString, int paramInt)
  {
    enqueueAction(new FragmentManagerImpl.3(this, paramString, paramInt), false);
  }
  
  public boolean popBackStackImmediate()
  {
    checkStateLoss();
    executePendingTransactions();
    return popBackStackState(mActivity.mHandler, null, -1, 0);
  }
  
  public boolean popBackStackImmediate(int paramInt1, int paramInt2)
  {
    checkStateLoss();
    executePendingTransactions();
    if (paramInt1 < 0) {
      throw new IllegalArgumentException("Bad id: " + paramInt1);
    }
    return popBackStackState(mActivity.mHandler, null, paramInt1, paramInt2);
  }
  
  public boolean popBackStackImmediate(String paramString, int paramInt)
  {
    checkStateLoss();
    executePendingTransactions();
    return popBackStackState(mActivity.mHandler, paramString, -1, paramInt);
  }
  
  boolean popBackStackState(Handler paramHandler, String paramString, int paramInt1, int paramInt2)
  {
    if (mBackStack == null) {
      break label114;
    }
    label7:
    do
    {
      return false;
      if ((paramString != null) || (paramInt1 >= 0) || ((paramInt2 & 0x1) != 0)) {
        break;
      }
      paramInt1 = mBackStack.size() - 1;
    } while (paramInt1 < 0);
    ((BackStackRecord)mBackStack.remove(paramInt1)).popFromBackStack(true);
    reportBackStackChanged();
    for (;;)
    {
      return true;
      int i = -1;
      if ((paramString != null) || (paramInt1 >= 0))
      {
        int j = mBackStack.size() - 1;
        for (;;)
        {
          if (j >= 0)
          {
            paramHandler = (BackStackRecord)mBackStack.get(j);
            if ((paramString == null) || (!paramString.equals(paramHandler.getName()))) {}
          }
          else
          {
            label114:
            if (j < 0) {
              break label7;
            }
            i = j;
            if ((paramInt2 & 0x1) == 0) {
              break label223;
            }
            paramInt2 = j - 1;
            for (;;)
            {
              i = paramInt2;
              if (paramInt2 < 0) {
                break;
              }
              paramHandler = (BackStackRecord)mBackStack.get(paramInt2);
              if ((paramString == null) || (!paramString.equals(paramHandler.getName())))
              {
                i = paramInt2;
                if (paramInt1 < 0) {
                  break;
                }
                i = paramInt2;
                if (paramInt1 != mIndex) {
                  break;
                }
              }
              paramInt2 -= 1;
            }
          }
          if ((paramInt1 >= 0) && (paramInt1 == mIndex)) {
            break;
          }
          j -= 1;
        }
      }
      label223:
      if (i == mBackStack.size() - 1) {
        break label7;
      }
      paramHandler = new ArrayList();
      paramInt1 = mBackStack.size() - 1;
      while (paramInt1 > i)
      {
        paramHandler.add(mBackStack.remove(paramInt1));
        paramInt1 -= 1;
      }
      paramInt2 = paramHandler.size() - 1;
      paramInt1 = 0;
      if (paramInt1 <= paramInt2)
      {
        paramString = (BackStackRecord)paramHandler.get(paramInt1);
        if (paramInt1 == paramInt2) {}
        for (boolean bool = true;; bool = false)
        {
          paramString.popFromBackStack(bool);
          paramInt1 += 1;
          break;
        }
      }
      reportBackStackChanged();
    }
  }
  
  public void putFragment(Bundle paramBundle, String paramString, Fragment paramFragment)
  {
    if (mIndex < 0) {
      throwException(new IllegalStateException("Fragment " + paramFragment + " is not currently in the FragmentManager"));
    }
    paramBundle.putInt(paramString, mIndex);
  }
  
  public void removeFragment(Fragment paramFragment, int paramInt1, int paramInt2)
  {
    if (!paramFragment.isInBackStack())
    {
      i = 1;
      if ((!mDetached) || (i != 0))
      {
        if (mAdded != null) {
          mAdded.remove(paramFragment);
        }
        if ((mHasMenu) && (mMenuVisible)) {
          mNeedMenuInvalidate = true;
        }
        mAdded = false;
        mRemoving = true;
        if (i == 0) {
          break label92;
        }
      }
    }
    label92:
    for (int i = 0;; i = 1)
    {
      moveToState(paramFragment, i, paramInt1, paramInt2, false);
      return;
      i = 0;
      break;
    }
  }
  
  public void removeOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener paramOnBackStackChangedListener)
  {
    if (mBackStackChangeListeners != null) {
      mBackStackChangeListeners.remove(paramOnBackStackChangedListener);
    }
  }
  
  void reportBackStackChanged()
  {
    if (mBackStackChangeListeners != null)
    {
      int i = 0;
      while (i < mBackStackChangeListeners.size())
      {
        ((FragmentManager.OnBackStackChangedListener)mBackStackChangeListeners.get(i)).onBackStackChanged();
        i += 1;
      }
    }
  }
  
  void restoreAllState(Parcelable paramParcelable, ArrayList paramArrayList)
  {
    int j = 0;
    if (paramParcelable == null) {}
    for (;;)
    {
      return;
      paramParcelable = (FragmentManagerState)paramParcelable;
      if (mActive != null)
      {
        int i = 0;
        Object localObject1;
        for (;;)
        {
          if (i >= mActive.length) {
            break label75;
          }
          localObject1 = mActive[i];
          if (localObject1 != null)
          {
            localObject1 = mArguments;
            if ((localObject1 != null) && (!((Bundle)localObject1).getBoolean("should_restore_from_kill", true))) {
              break;
            }
          }
          i += 1;
        }
        label75:
        Object localObject2;
        if (paramArrayList != null)
        {
          i = 0;
          while (i < paramArrayList.size())
          {
            localObject1 = (Fragment)paramArrayList.get(i);
            localObject2 = mActive[mIndex];
            mInstance = ((Fragment)localObject1);
            mSavedViewState = null;
            mBackStackNesting = 0;
            mInLayout = false;
            mAdded = false;
            mTarget = null;
            if (mSavedFragmentState != null)
            {
              mSavedFragmentState.setClassLoader(mActivity.getClassLoader());
              mSavedViewState = mSavedFragmentState.getSparseParcelableArray("android:view_state");
            }
            i += 1;
          }
        }
        mActive = new ArrayList(mActive.length);
        if (mAvailIndices != null) {
          mAvailIndices.clear();
        }
        i = 0;
        if (i < mActive.length)
        {
          localObject1 = mActive[i];
          if (localObject1 != null)
          {
            localObject2 = ((FragmentState)localObject1).instantiate(mActivity, mParent);
            mActive.add(localObject2);
            mInstance = null;
          }
          for (;;)
          {
            i += 1;
            break;
            mActive.add(null);
            if (mAvailIndices == null) {
              mAvailIndices = new ArrayList();
            }
            mAvailIndices.add(Integer.valueOf(i));
          }
        }
        if (paramArrayList != null)
        {
          i = 0;
          if (i < paramArrayList.size())
          {
            localObject1 = (Fragment)paramArrayList.get(i);
            if (mTargetIndex >= 0) {
              if (mTargetIndex >= mActive.size()) {
                break label401;
              }
            }
            for (mTarget = ((Fragment)mActive.get(mTargetIndex));; mTarget = null)
            {
              i += 1;
              break;
              label401:
              if (QLog.isDevelopLevel()) {
                QLog.w("FragmentManager", 4, "Re-attaching retained fragment " + localObject1 + " target no longer exists: " + mTargetIndex);
              }
            }
          }
        }
        if (mAdded != null)
        {
          mAdded = new ArrayList(mAdded.length);
          i = 0;
          while (i < mAdded.length)
          {
            paramArrayList = (Fragment)mActive.get(mAdded[i]);
            if (paramArrayList == null) {
              throwException(new IllegalStateException("No instantiated fragment for index #" + mAdded[i]));
            }
            mAdded = true;
            if (mAdded.contains(paramArrayList)) {
              throw new IllegalStateException("Already added!");
            }
            mAdded.add(paramArrayList);
            i += 1;
          }
        }
        mAdded = null;
        if (mBackStack == null) {
          break;
        }
        mBackStack = new ArrayList(mBackStack.length);
        i = j;
        while (i < mBackStack.length)
        {
          paramArrayList = mBackStack[i].instantiate(this);
          mBackStack.add(paramArrayList);
          if (mIndex >= 0) {
            setBackStackIndex(mIndex, paramArrayList);
          }
          i += 1;
        }
      }
    }
    mBackStack = null;
  }
  
  ArrayList retainNonConfig()
  {
    Object localObject2 = null;
    Object localObject1 = null;
    if (mActive != null)
    {
      int i = 0;
      localObject2 = localObject1;
      if (i < mActive.size())
      {
        Fragment localFragment = (Fragment)mActive.get(i);
        localObject2 = localObject1;
        if (localFragment != null)
        {
          localObject2 = localObject1;
          if (mRetainInstance)
          {
            localObject2 = localObject1;
            if (localObject1 == null) {
              localObject2 = new ArrayList();
            }
            ((ArrayList)localObject2).add(localFragment);
            mRetaining = true;
            if (mTarget == null) {
              break label123;
            }
          }
        }
        label123:
        for (int j = mTarget.mIndex;; j = -1)
        {
          mTargetIndex = j;
          i += 1;
          localObject1 = localObject2;
          break;
        }
      }
    }
    return localObject2;
  }
  
  Parcelable saveAllState()
  {
    Object localObject3 = null;
    execPendingActions();
    if (HONEYCOMB) {
      mStateSaved = true;
    }
    if ((mActive == null) || (mActive.size() <= 0)) {
      return null;
    }
    int k = mActive.size();
    FragmentState[] arrayOfFragmentState = new FragmentState[k];
    int j = 0;
    int i = 0;
    label56:
    Object localObject1;
    Object localObject2;
    if (j < k)
    {
      localObject1 = (Fragment)mActive.get(j);
      if (localObject1 == null) {
        break label557;
      }
      if (mIndex < 0) {
        throwException(new IllegalStateException("Failure saving state: active " + localObject1 + " has cleared index: " + mIndex));
      }
      localObject2 = new FragmentState((Fragment)localObject1);
      arrayOfFragmentState[j] = localObject2;
      if ((mState > 0) && (mSavedFragmentState == null))
      {
        mSavedFragmentState = saveFragmentBasicState((Fragment)localObject1);
        if (mTarget == null) {
          break label320;
        }
        if (mTarget.mIndex < 0) {
          throwException(new IllegalStateException("Failure saving state: " + localObject1 + " has target not in fragment manager: " + mTarget));
        }
        if (mSavedFragmentState == null) {
          mSavedFragmentState = new Bundle();
        }
        putFragment(mSavedFragmentState, "android:target_state", mTarget);
        if (mTargetRequestCode == 0) {
          break label320;
        }
        mSavedFragmentState.putInt("android:target_req_state", mTargetRequestCode);
        i = 1;
      }
    }
    label320:
    label557:
    for (;;)
    {
      j += 1;
      break label56;
      mSavedFragmentState = mSavedFragmentState;
      i = 1;
      continue;
      if (i == 0) {
        break;
      }
      if (mAdded != null)
      {
        j = mAdded.size();
        if (j > 0)
        {
          localObject2 = new int[j];
          i = 0;
          for (;;)
          {
            localObject1 = localObject2;
            if (i >= j) {
              break;
            }
            localObject2[i] = mAdded.get(i)).mIndex;
            if (localObject2[i] < 0) {
              throwException(new IllegalStateException("Failure saving state: active " + mAdded.get(i) + " has cleared index: " + localObject2[i]));
            }
            i += 1;
          }
        }
      }
      localObject1 = null;
      localObject2 = localObject3;
      if (mBackStack != null)
      {
        j = mBackStack.size();
        localObject2 = localObject3;
        if (j > 0)
        {
          localObject3 = new BackStackState[j];
          i = 0;
          for (;;)
          {
            localObject2 = localObject3;
            if (i >= j) {
              break;
            }
            localObject3[i] = new BackStackState(this, (BackStackRecord)mBackStack.get(i));
            i += 1;
          }
        }
      }
      localObject3 = new FragmentManagerState();
      mActive = arrayOfFragmentState;
      mAdded = ((int[])localObject1);
      mBackStack = ((BackStackState[])localObject2);
      return localObject3;
    }
  }
  
  Bundle saveFragmentBasicState(Fragment paramFragment)
  {
    if (mStateBundle == null) {
      mStateBundle = new Bundle();
    }
    paramFragment.performSaveInstanceState(mStateBundle);
    Object localObject2;
    if (!mStateBundle.isEmpty())
    {
      localObject2 = mStateBundle;
      mStateBundle = null;
    }
    for (;;)
    {
      if (mView != null) {
        saveFragmentViewState(paramFragment);
      }
      Object localObject1 = localObject2;
      if (mSavedViewState != null)
      {
        localObject1 = localObject2;
        if (localObject2 == null) {
          localObject1 = new Bundle();
        }
        ((Bundle)localObject1).putSparseParcelableArray("android:view_state", mSavedViewState);
      }
      localObject2 = localObject1;
      if (!mUserVisibleHint)
      {
        localObject2 = localObject1;
        if (localObject1 == null) {
          localObject2 = new Bundle();
        }
        ((Bundle)localObject2).putBoolean("android:user_visible_hint", mUserVisibleHint);
      }
      return localObject2;
      localObject2 = null;
    }
  }
  
  public Fragment.SavedState saveFragmentInstanceState(Fragment paramFragment)
  {
    Object localObject2 = null;
    if (mIndex < 0) {
      throwException(new IllegalStateException("Fragment " + paramFragment + " is not currently in the FragmentManager"));
    }
    Object localObject1 = localObject2;
    if (mState > 0)
    {
      paramFragment = saveFragmentBasicState(paramFragment);
      localObject1 = localObject2;
      if (paramFragment != null) {
        localObject1 = new Fragment.SavedState(paramFragment);
      }
    }
    return localObject1;
  }
  
  void saveFragmentViewState(Fragment paramFragment)
  {
    if (mInnerView == null) {
      return;
    }
    if (mStateArray == null) {
      mStateArray = new SparseArray();
    }
    for (;;)
    {
      mInnerView.saveHierarchyState(mStateArray);
      if (mStateArray.size() <= 0) {
        break;
      }
      mSavedViewState = mStateArray;
      mStateArray = null;
      return;
      mStateArray.clear();
    }
  }
  
  /* Error */
  public void setBackStackIndex(int paramInt, BackStackRecord paramBackStackRecord)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 296	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   6: ifnonnull +14 -> 20
    //   9: aload_0
    //   10: new 237	java/util/ArrayList
    //   13: dup
    //   14: invokespecial 238	java/util/ArrayList:<init>	()V
    //   17: putfield 296	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   20: aload_0
    //   21: getfield 296	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   24: invokevirtual 294	java/util/ArrayList:size	()I
    //   27: istore 4
    //   29: iload 4
    //   31: istore_3
    //   32: iload_1
    //   33: iload 4
    //   35: if_icmpge +16 -> 51
    //   38: aload_0
    //   39: getfield 296	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   42: iload_1
    //   43: aload_2
    //   44: invokevirtual 309	java/util/ArrayList:set	(ILjava/lang/Object;)Ljava/lang/Object;
    //   47: pop
    //   48: aload_0
    //   49: monitorexit
    //   50: return
    //   51: iload_3
    //   52: iload_1
    //   53: if_icmpge +49 -> 102
    //   56: aload_0
    //   57: getfield 296	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   60: aconst_null
    //   61: invokevirtual 242	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   64: pop
    //   65: aload_0
    //   66: getfield 290	android/support/v4/app/FragmentManagerImpl:mAvailBackStackIndices	Ljava/util/ArrayList;
    //   69: ifnonnull +14 -> 83
    //   72: aload_0
    //   73: new 237	java/util/ArrayList
    //   76: dup
    //   77: invokespecial 238	java/util/ArrayList:<init>	()V
    //   80: putfield 290	android/support/v4/app/FragmentManagerImpl:mAvailBackStackIndices	Ljava/util/ArrayList;
    //   83: aload_0
    //   84: getfield 290	android/support/v4/app/FragmentManagerImpl:mAvailBackStackIndices	Ljava/util/ArrayList;
    //   87: iload_3
    //   88: invokestatic 559	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   91: invokevirtual 242	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   94: pop
    //   95: iload_3
    //   96: iconst_1
    //   97: iadd
    //   98: istore_3
    //   99: goto -48 -> 51
    //   102: aload_0
    //   103: getfield 296	android/support/v4/app/FragmentManagerImpl:mBackStackIndices	Ljava/util/ArrayList;
    //   106: aload_2
    //   107: invokevirtual 242	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   110: pop
    //   111: goto -63 -> 48
    //   114: astore_2
    //   115: aload_0
    //   116: monitorexit
    //   117: aload_2
    //   118: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	119	0	this	FragmentManagerImpl
    //   0	119	1	paramInt	int
    //   0	119	2	paramBackStackRecord	BackStackRecord
    //   31	68	3	i	int
    //   27	9	4	j	int
    // Exception table:
    //   from	to	target	type
    //   2	20	114	finally
    //   20	29	114	finally
    //   38	48	114	finally
    //   48	50	114	finally
    //   56	83	114	finally
    //   83	95	114	finally
    //   102	111	114	finally
    //   115	117	114	finally
  }
  
  public void showFragment(Fragment paramFragment, int paramInt1, int paramInt2)
  {
    if (mHidden)
    {
      mHidden = false;
      if (mView != null)
      {
        Animation localAnimation = loadAnimation(paramFragment, paramInt1, true, paramInt2);
        if (localAnimation != null) {
          mView.startAnimation(localAnimation);
        }
        mView.setVisibility(0);
      }
      if ((mAdded) && (mHasMenu) && (mMenuVisible)) {
        mNeedMenuInvalidate = true;
      }
      paramFragment.onHiddenChanged(false);
    }
  }
  
  void startPendingDeferredFragments()
  {
    if (mActive == null) {}
    for (;;)
    {
      return;
      int i = 0;
      while (i < mActive.size())
      {
        Fragment localFragment = (Fragment)mActive.get(i);
        if (localFragment != null) {
          performPendingDeferredStart(localFragment);
        }
        i += 1;
      }
    }
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(128);
    localStringBuilder.append("FragmentManager{");
    localStringBuilder.append(Integer.toHexString(System.identityHashCode(this)));
    localStringBuilder.append(" in ");
    if (mParent != null) {
      DebugUtils.buildShortClassTag(mParent, localStringBuilder);
    }
    for (;;)
    {
      localStringBuilder.append("}}");
      return localStringBuilder.toString();
      DebugUtils.buildShortClassTag(mActivity, localStringBuilder);
    }
  }
}
