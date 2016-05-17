package android.support.v4.app;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.content.res.TypedArray;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.os.Parcelable;
import android.support.v4.util.SimpleArrayMap;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import com.tencent.mobileqq.activity.ChatFragment;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.qphone.base.util.QLog;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;

public class FragmentActivity
  extends BaseActivity
{
  static final String FRAGMENTS_TAG = "android:support:fragments";
  private static final int HONEYCOMB = 11;
  static final int MSG_REALLY_STOPPED = 1;
  static final int MSG_RESUME_PENDING = 2;
  private static final String TAG = "FragmentActivity";
  SimpleArrayMap mAllLoaderManagers;
  boolean mCheckedForLoaderManager;
  final FragmentContainer mContainer = new FragmentActivity.2(this);
  boolean mCreated;
  final FragmentManagerImpl mFragments = new FragmentManagerImpl();
  final Handler mHandler = new FragmentActivity.1(this);
  Fragment.IFragmentAttachCallback mIFragmentAttachCallback;
  LoaderManagerImpl mLoaderManager;
  boolean mLoadersStarted;
  boolean mOptionsMenuInvalidated;
  boolean mReallyStopped;
  boolean mResumed;
  boolean mRetaining;
  boolean mStopped;
  
  public FragmentActivity() {}
  
  private void dumpViewHierarchy(String paramString, PrintWriter paramPrintWriter, View paramView)
  {
    paramPrintWriter.print(paramString);
    if (paramView == null) {
      paramPrintWriter.println("null");
    }
    for (;;)
    {
      return;
      paramPrintWriter.println(viewToString(paramView));
      if ((paramView instanceof ViewGroup))
      {
        paramView = (ViewGroup)paramView;
        int j = paramView.getChildCount();
        if (j > 0)
        {
          paramString = paramString + "  ";
          int i = 0;
          while (i < j)
          {
            dumpViewHierarchy(paramString, paramPrintWriter, paramView.getChildAt(i));
            i += 1;
          }
        }
      }
    }
  }
  
  private static String viewToString(View paramView)
  {
    char c3 = 'F';
    char c2 = '.';
    StringBuilder localStringBuilder = new StringBuilder(128);
    localStringBuilder.append(paramView.getClass().getName());
    localStringBuilder.append('{');
    localStringBuilder.append(Integer.toHexString(System.identityHashCode(paramView)));
    localStringBuilder.append(' ');
    char c1;
    label118:
    label135:
    label152:
    label169:
    label186:
    label203:
    label220:
    label244:
    label261:
    int i;
    Object localObject;
    switch (paramView.getVisibility())
    {
    default: 
      localStringBuilder.append('.');
      if (paramView.isFocusable())
      {
        c1 = 'F';
        localStringBuilder.append(c1);
        if (!paramView.isEnabled()) {
          break label562;
        }
        c1 = 'E';
        localStringBuilder.append(c1);
        if (!paramView.willNotDraw()) {
          break label568;
        }
        c1 = '.';
        localStringBuilder.append(c1);
        if (!paramView.isHorizontalScrollBarEnabled()) {
          break label574;
        }
        c1 = 'H';
        localStringBuilder.append(c1);
        if (!paramView.isVerticalScrollBarEnabled()) {
          break label580;
        }
        c1 = 'V';
        localStringBuilder.append(c1);
        if (!paramView.isClickable()) {
          break label586;
        }
        c1 = 'C';
        localStringBuilder.append(c1);
        if (!paramView.isLongClickable()) {
          break label592;
        }
        c1 = 'L';
        localStringBuilder.append(c1);
        localStringBuilder.append(' ');
        if (!paramView.isFocused()) {
          break label598;
        }
        c1 = c3;
        localStringBuilder.append(c1);
        if (!paramView.isSelected()) {
          break label604;
        }
        c1 = 'S';
        localStringBuilder.append(c1);
        c1 = c2;
        if (paramView.isPressed()) {
          c1 = 'P';
        }
        localStringBuilder.append(c1);
        localStringBuilder.append(' ');
        localStringBuilder.append(paramView.getLeft());
        localStringBuilder.append(',');
        localStringBuilder.append(paramView.getTop());
        localStringBuilder.append('-');
        localStringBuilder.append(paramView.getRight());
        localStringBuilder.append(',');
        localStringBuilder.append(paramView.getBottom());
        i = paramView.getId();
        if (i != -1)
        {
          localStringBuilder.append(" #");
          localStringBuilder.append(Integer.toHexString(i));
          localObject = paramView.getResources();
          if ((i != 0) && (localObject != null)) {
            switch (0xFF000000 & i)
            {
            }
          }
        }
      }
      break;
    }
    for (;;)
    {
      try
      {
        paramView = ((Resources)localObject).getResourcePackageName(i);
        String str = ((Resources)localObject).getResourceTypeName(i);
        localObject = ((Resources)localObject).getResourceEntryName(i);
        localStringBuilder.append(" ");
        localStringBuilder.append(paramView);
        localStringBuilder.append(":");
        localStringBuilder.append(str);
        localStringBuilder.append("/");
        localStringBuilder.append((String)localObject);
      }
      catch (Resources.NotFoundException paramView)
      {
        label562:
        label568:
        label574:
        label580:
        label586:
        label592:
        label598:
        label604:
        continue;
      }
      localStringBuilder.append("}");
      return localStringBuilder.toString();
      localStringBuilder.append('V');
      break;
      localStringBuilder.append('I');
      break;
      localStringBuilder.append('G');
      break;
      c1 = '.';
      break label118;
      c1 = '.';
      break label135;
      c1 = 'D';
      break label152;
      c1 = '.';
      break label169;
      c1 = '.';
      break label186;
      c1 = '.';
      break label203;
      c1 = '.';
      break label220;
      c1 = '.';
      break label244;
      c1 = '.';
      break label261;
      paramView = "app";
      continue;
      paramView = "android";
    }
  }
  
  public void doOnActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    mFragments.noteStateNotSaved();
    int i = paramInt1 >> 16;
    if (i != 0)
    {
      i -= 1;
      if ((mFragments.mActive == null) || (i < 0) || (i >= mFragments.mActive.size())) {
        if (QLog.isDevelopLevel()) {
          QLog.w("FragmentActivity", 4, "Activity result fragment index out of range: 0x" + Integer.toHexString(paramInt1));
        }
      }
      Fragment localFragment;
      do
      {
        return;
        localFragment = (Fragment)mFragments.mActive.get(i);
        if (localFragment != null) {
          break;
        }
      } while (!QLog.isDevelopLevel());
      QLog.w("FragmentActivity", 4, "Activity result no fragment exists for index: 0x" + Integer.toHexString(paramInt1));
      return;
      localFragment.onActivityResult(0xFFFF & paramInt1, paramInt2, paramIntent);
      return;
    }
    super.doOnActivityResult(paramInt1, paramInt2, paramIntent);
  }
  
  public void doOnConfigurationChanged(Configuration paramConfiguration)
  {
    super.doOnConfigurationChanged(paramConfiguration);
    mFragments.dispatchConfigurationChanged(paramConfiguration);
  }
  
  public boolean doOnCreate(Bundle paramBundle)
  {
    mFragments.attachActivity(this, mContainer, null);
    if (getLayoutInflater().getFactory() == null) {
      getLayoutInflater().setFactory(this);
    }
    super.doOnCreate(paramBundle);
    FragmentActivity.NonConfigurationInstances localNonConfigurationInstances = (FragmentActivity.NonConfigurationInstances)getLastNonConfigurationInstance();
    if (localNonConfigurationInstances != null) {
      mAllLoaderManagers = loaders;
    }
    Parcelable localParcelable;
    FragmentManagerImpl localFragmentManagerImpl;
    if (paramBundle != null)
    {
      localParcelable = paramBundle.getParcelable("android:support:fragments");
      localFragmentManagerImpl = mFragments;
      if (localNonConfigurationInstances == null) {
        break label102;
      }
    }
    label102:
    for (paramBundle = fragments;; paramBundle = null)
    {
      localFragmentManagerImpl.restoreAllState(localParcelable, paramBundle);
      mFragments.dispatchCreate();
      return false;
    }
  }
  
  public void doOnDestroy()
  {
    super.doOnDestroy();
    doReallyStop(false);
    mFragments.dispatchDestroy();
    if (mLoaderManager != null) {
      mLoaderManager.doDestroy();
    }
  }
  
  public boolean doOnKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((Build.VERSION.SDK_INT < 5) && (paramInt == 4) && (paramKeyEvent.getRepeatCount() == 0))
    {
      onBackPressed();
      return true;
    }
    return super.doOnKeyDown(paramInt, paramKeyEvent);
  }
  
  public void doOnNewIntent(Intent paramIntent)
  {
    super.doOnNewIntent(paramIntent);
    mFragments.noteStateNotSaved();
  }
  
  public void doOnPause()
  {
    super.doOnPause();
    mResumed = false;
    if (mHandler.hasMessages(2))
    {
      mHandler.removeMessages(2);
      onResumeFragments();
    }
    mFragments.dispatchPause();
  }
  
  public void doOnPostResume()
  {
    super.doOnPostResume();
    mHandler.removeMessages(2);
    onResumeFragments();
    mFragments.execPendingActions();
  }
  
  public void doOnResume()
  {
    super.doOnResume();
    mHandler.sendEmptyMessage(2);
    mResumed = true;
    mFragments.execPendingActions();
  }
  
  public void doOnSaveInstanceState(Bundle paramBundle)
  {
    super.doOnSaveInstanceState(paramBundle);
    Parcelable localParcelable = mFragments.saveAllState();
    if (localParcelable != null) {
      paramBundle.putParcelable("android:support:fragments", localParcelable);
    }
  }
  
  public void doOnStart()
  {
    super.doOnStart();
    mStopped = false;
    mReallyStopped = false;
    mHandler.removeMessages(1);
    if (!mCreated)
    {
      mCreated = true;
      mFragments.dispatchActivityCreated();
    }
    mFragments.noteStateNotSaved();
    mFragments.execPendingActions();
    if (!mLoadersStarted)
    {
      mLoadersStarted = true;
      if (mLoaderManager == null) {
        break label143;
      }
      mLoaderManager.doStart();
    }
    int j;
    LoaderManagerImpl[] arrayOfLoaderManagerImpl;
    for (;;)
    {
      mCheckedForLoaderManager = true;
      mFragments.dispatchStart();
      if (mAllLoaderManagers == null) {
        return;
      }
      j = mAllLoaderManagers.size();
      arrayOfLoaderManagerImpl = new LoaderManagerImpl[j];
      i = j - 1;
      while (i >= 0)
      {
        arrayOfLoaderManagerImpl[i] = ((LoaderManagerImpl)mAllLoaderManagers.valueAt(i));
        i -= 1;
      }
      label143:
      if (!mCheckedForLoaderManager)
      {
        mLoaderManager = getLoaderManager("(root)", mLoadersStarted, false);
        if ((mLoaderManager != null) && (!mLoaderManager.mStarted)) {
          mLoaderManager.doStart();
        }
      }
    }
    int i = 0;
    while (i < j)
    {
      LoaderManagerImpl localLoaderManagerImpl = arrayOfLoaderManagerImpl[i];
      localLoaderManagerImpl.finishRetain();
      localLoaderManagerImpl.doReportStart();
      i += 1;
    }
  }
  
  public void doOnStop()
  {
    super.doOnStop();
    mStopped = true;
    mHandler.sendEmptyMessage(1);
    mFragments.dispatchStop();
  }
  
  void doReallyStop(boolean paramBoolean)
  {
    if (!mReallyStopped)
    {
      mReallyStopped = true;
      mRetaining = paramBoolean;
      mHandler.removeMessages(1);
      onReallyStop();
    }
  }
  
  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    if (Build.VERSION.SDK_INT >= 11) {}
    paramPrintWriter.print(paramString);
    paramPrintWriter.print("Local FragmentActivity ");
    paramPrintWriter.print(Integer.toHexString(System.identityHashCode(this)));
    paramPrintWriter.println(" State:");
    String str = paramString + "  ";
    paramPrintWriter.print(str);
    paramPrintWriter.print("mCreated=");
    paramPrintWriter.print(mCreated);
    paramPrintWriter.print("mResumed=");
    paramPrintWriter.print(mResumed);
    paramPrintWriter.print(" mStopped=");
    paramPrintWriter.print(mStopped);
    paramPrintWriter.print(" mReallyStopped=");
    paramPrintWriter.println(mReallyStopped);
    paramPrintWriter.print(str);
    paramPrintWriter.print("mLoadersStarted=");
    paramPrintWriter.println(mLoadersStarted);
    if (mLoaderManager != null)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("Loader Manager ");
      paramPrintWriter.print(Integer.toHexString(System.identityHashCode(mLoaderManager)));
      paramPrintWriter.println(":");
      mLoaderManager.dump(paramString + "  ", paramFileDescriptor, paramPrintWriter, paramArrayOfString);
    }
    mFragments.dump(paramString, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
    paramPrintWriter.print(paramString);
    paramPrintWriter.println("View Hierarchy:");
    dumpViewHierarchy(paramString + "  ", paramPrintWriter, getWindow().getDecorView());
  }
  
  public ChatFragment getChatFragment()
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag(ChatFragment.class.getName());
    if (localFragment != null) {
      return (ChatFragment)localFragment;
    }
    return null;
  }
  
  public Object getLastCustomNonConfigurationInstance()
  {
    FragmentActivity.NonConfigurationInstances localNonConfigurationInstances = (FragmentActivity.NonConfigurationInstances)getLastNonConfigurationInstance();
    if (localNonConfigurationInstances != null) {
      return custom;
    }
    return null;
  }
  
  LoaderManagerImpl getLoaderManager(String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (mAllLoaderManagers == null) {
      mAllLoaderManagers = new SimpleArrayMap();
    }
    LoaderManagerImpl localLoaderManagerImpl = (LoaderManagerImpl)mAllLoaderManagers.get(paramString);
    if (localLoaderManagerImpl == null)
    {
      if (paramBoolean2)
      {
        localLoaderManagerImpl = new LoaderManagerImpl(paramString, this, paramBoolean1);
        mAllLoaderManagers.put(paramString, localLoaderManagerImpl);
      }
      return localLoaderManagerImpl;
    }
    localLoaderManagerImpl.updateActivity(this);
    return localLoaderManagerImpl;
  }
  
  public FragmentManager getSupportFragmentManager()
  {
    return mFragments;
  }
  
  public LoaderManager getSupportLoaderManager()
  {
    if (mLoaderManager != null) {
      return mLoaderManager;
    }
    mCheckedForLoaderManager = true;
    mLoaderManager = getLoaderManager("(root)", mLoadersStarted, true);
    return mLoaderManager;
  }
  
  public FragmentManager getThisFragmentManager()
  {
    return mFragments;
  }
  
  void invalidateSupportFragment(String paramString)
  {
    if (mAllLoaderManagers != null)
    {
      LoaderManagerImpl localLoaderManagerImpl = (LoaderManagerImpl)mAllLoaderManagers.get(paramString);
      if ((localLoaderManagerImpl != null) && (!mRetaining))
      {
        localLoaderManagerImpl.doDestroy();
        mAllLoaderManagers.remove(paramString);
      }
    }
  }
  
  public void onAttachFragment(Fragment paramFragment)
  {
    if (mIFragmentAttachCallback != null) {
      mIFragmentAttachCallback.onFragmentAttached(paramFragment);
    }
  }
  
  public boolean onCreatePanelMenu(int paramInt, Menu paramMenu)
  {
    if (paramInt == 0)
    {
      boolean bool1 = super.onCreatePanelMenu(paramInt, paramMenu);
      boolean bool2 = mFragments.dispatchCreateOptionsMenu(paramMenu, getMenuInflater());
      if (Build.VERSION.SDK_INT >= 11) {
        return bool1 | bool2;
      }
      return true;
    }
    return super.onCreatePanelMenu(paramInt, paramMenu);
  }
  
  public View onCreateView(String paramString, Context paramContext, AttributeSet paramAttributeSet)
  {
    Object localObject = null;
    if (!"fragment".equals(paramString)) {
      return super.onCreateView(paramString, paramContext, paramAttributeSet);
    }
    String str2 = paramAttributeSet.getAttributeValue(null, "class");
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, FragmentActivity.FragmentTag.Fragment);
    String str1 = str2;
    if (str2 == null) {
      str1 = localTypedArray.getString(0);
    }
    int j = localTypedArray.getResourceId(1, -1);
    str2 = localTypedArray.getString(2);
    localTypedArray.recycle();
    if (!Fragment.isSupportFragmentClass(this, str1)) {
      return super.onCreateView(paramString, paramContext, paramAttributeSet);
    }
    if (0 != 0) {
      throw new NullPointerException();
    }
    if ((-1 == 0) && (j == -1) && (str2 == null)) {
      throw new IllegalArgumentException(paramAttributeSet.getPositionDescription() + ": Must specify unique android:id, android:tag, or have a parent with an id for " + str1);
    }
    paramContext = localObject;
    if (j != -1) {
      paramContext = mFragments.findFragmentById(j);
    }
    paramString = paramContext;
    if (paramContext == null)
    {
      paramString = paramContext;
      if (str2 != null) {
        paramString = mFragments.findFragmentByTag(str2);
      }
    }
    paramContext = paramString;
    if (paramString == null)
    {
      paramContext = paramString;
      if (-1 != 0) {
        paramContext = mFragments.findFragmentById(0);
      }
    }
    int i;
    if (paramContext == null)
    {
      paramContext = Fragment.instantiate(this, str1);
      mFromLayout = true;
      if (j != 0)
      {
        i = j;
        mFragmentId = i;
        mContainerId = 0;
        mTag = str2;
        mInLayout = true;
        mFragmentManager = mFragments;
        paramContext.onInflate(this, paramAttributeSet, mSavedFragmentState);
        mFragments.addFragment(paramContext, true);
      }
    }
    for (;;)
    {
      if (mView != null) {
        break label465;
      }
      throw new IllegalStateException("Fragment " + str1 + " did not create a view.");
      i = 0;
      break;
      if (mInLayout) {
        throw new IllegalArgumentException(paramAttributeSet.getPositionDescription() + ": Duplicate id 0x" + Integer.toHexString(j) + ", tag " + str2 + ", or parent id 0x" + Integer.toHexString(0) + " with another fragment for " + str1);
      }
      mInLayout = true;
      if (!mRetaining) {
        paramContext.onInflate(this, paramAttributeSet, mSavedFragmentState);
      }
      mFragments.moveToState(paramContext);
    }
    label465:
    if (j != 0) {
      mView.setId(j);
    }
    if (mView.getTag() == null) {
      mView.setTag(str2);
    }
    return mView;
  }
  
  public void onLowMemory()
  {
    super.onLowMemory();
    mFragments.dispatchLowMemory();
  }
  
  public boolean onMenuItemSelected(int paramInt, MenuItem paramMenuItem)
  {
    if (super.onMenuItemSelected(paramInt, paramMenuItem)) {
      return true;
    }
    switch (paramInt)
    {
    default: 
      return false;
    case 0: 
      return mFragments.dispatchOptionsItemSelected(paramMenuItem);
    }
    return mFragments.dispatchContextItemSelected(paramMenuItem);
  }
  
  public void onPanelClosed(int paramInt, Menu paramMenu)
  {
    switch (paramInt)
    {
    }
    for (;;)
    {
      super.onPanelClosed(paramInt, paramMenu);
      return;
      mFragments.dispatchOptionsMenuClosed(paramMenu);
    }
  }
  
  protected boolean onPrepareOptionsPanel(View paramView, Menu paramMenu)
  {
    return super.onPreparePanel(0, paramView, paramMenu);
  }
  
  public boolean onPreparePanel(int paramInt, View paramView, Menu paramMenu)
  {
    if ((paramInt == 0) && (paramMenu != null))
    {
      if (mOptionsMenuInvalidated)
      {
        mOptionsMenuInvalidated = false;
        paramMenu.clear();
        onCreatePanelMenu(paramInt, paramMenu);
      }
      return onPrepareOptionsPanel(paramView, paramMenu) | mFragments.dispatchPrepareOptionsMenu(paramMenu);
    }
    return super.onPreparePanel(paramInt, paramView, paramMenu);
  }
  
  void onReallyStop()
  {
    if (mLoadersStarted)
    {
      mLoadersStarted = false;
      if (mLoaderManager != null)
      {
        if (mRetaining) {
          break label41;
        }
        mLoaderManager.doStop();
      }
    }
    for (;;)
    {
      mFragments.dispatchReallyStop();
      return;
      label41:
      mLoaderManager.doRetain();
    }
  }
  
  protected void onResumeFragments()
  {
    mFragments.dispatchResume();
  }
  
  public Object onRetainCustomNonConfigurationInstance()
  {
    return null;
  }
  
  public final Object onRetainNonConfigurationInstance()
  {
    int j = 0;
    if (mStopped) {
      doReallyStop(true);
    }
    Object localObject1 = onRetainCustomNonConfigurationInstance();
    ArrayList localArrayList = mFragments.retainNonConfig();
    int k;
    if (mAllLoaderManagers != null)
    {
      int m = mAllLoaderManagers.size();
      localObject2 = new LoaderManagerImpl[m];
      int i = m - 1;
      while (i >= 0)
      {
        localObject2[i] = ((LoaderManagerImpl)mAllLoaderManagers.valueAt(i));
        i -= 1;
      }
      i = 0;
      k = i;
      if (j < m)
      {
        Object localObject3 = localObject2[j];
        if (mRetaining) {
          i = 1;
        }
        for (;;)
        {
          j += 1;
          break;
          localObject3.doDestroy();
          mAllLoaderManagers.remove(mWho);
        }
      }
    }
    else
    {
      k = 0;
    }
    if ((localArrayList == null) && (k == 0) && (localObject1 == null)) {
      return null;
    }
    Object localObject2 = new FragmentActivity.NonConfigurationInstances();
    activity = null;
    custom = localObject1;
    children = null;
    fragments = localArrayList;
    loaders = mAllLoaderManagers;
    return localObject2;
  }
  
  public void setFragmentAttachListener(Fragment.IFragmentAttachCallback paramIFragmentAttachCallback)
  {
    mIFragmentAttachCallback = paramIFragmentAttachCallback;
  }
  
  public String setLastActivityName()
  {
    return super.setLastActivityName();
  }
  
  public void startActivityForResult(Intent paramIntent, int paramInt)
  {
    super.startActivityForResult(paramIntent, paramInt);
  }
  
  public void startActivityFromFragment(Fragment paramFragment, Intent paramIntent, int paramInt)
  {
    if (paramInt == -1)
    {
      super.startActivityForResult(paramIntent, -1);
      return;
    }
    if ((0xFFFF0000 & paramInt) != 0) {
      throw new IllegalArgumentException("Can only use lower 16 bits for requestCode");
    }
    super.startActivityForResult(paramIntent, (mIndex + 1 << 16) + (0xFFFF & paramInt));
  }
  
  public void supportInvalidateOptionsMenu()
  {
    if (Build.VERSION.SDK_INT >= 11)
    {
      ActivityCompatHoneycomb.invalidateOptionsMenu(this);
      return;
    }
    mOptionsMenuInvalidated = true;
  }
}
