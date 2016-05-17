package android.support.v4.app;

import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;

final class BackStackRecord
  extends FragmentTransaction
  implements FragmentManager.BackStackEntry, Runnable
{
  static final int OP_ADD = 1;
  static final int OP_ATTACH = 7;
  static final int OP_DETACH = 6;
  static final int OP_HIDE = 4;
  static final int OP_NULL = 0;
  static final int OP_REMOVE = 3;
  static final int OP_REPLACE = 2;
  static final int OP_SHOW = 5;
  static final String TAG = "FragmentManager";
  boolean mAddToBackStack;
  boolean mAllowAddToBackStack = true;
  int mBreadCrumbShortTitleRes;
  CharSequence mBreadCrumbShortTitleText;
  int mBreadCrumbTitleRes;
  CharSequence mBreadCrumbTitleText;
  boolean mCommitted;
  int mEnterAnim;
  int mExitAnim;
  BackStackRecord.Op mHead;
  int mIndex = -1;
  final FragmentManagerImpl mManager;
  String mName;
  int mNumOp;
  int mPopEnterAnim;
  int mPopExitAnim;
  BackStackRecord.Op mTail;
  int mTransition;
  int mTransitionStyle;
  
  public BackStackRecord(FragmentManagerImpl paramFragmentManagerImpl)
  {
    mManager = paramFragmentManagerImpl;
  }
  
  private void doAddOp(int paramInt1, Fragment paramFragment, String paramString, int paramInt2)
  {
    mFragmentManager = mManager;
    if (paramString != null)
    {
      if ((mTag != null) && (!paramString.equals(mTag))) {
        throw new IllegalStateException("Can't change tag of fragment " + paramFragment + ": was " + mTag + " now " + paramString);
      }
      mTag = paramString;
    }
    if (paramInt1 != 0)
    {
      if ((mFragmentId != 0) && (mFragmentId != paramInt1)) {
        throw new IllegalStateException("Can't change container ID of fragment " + paramFragment + ": was " + mFragmentId + " now " + paramInt1);
      }
      mFragmentId = paramInt1;
      mContainerId = paramInt1;
    }
    paramString = new BackStackRecord.Op();
    cmd = paramInt2;
    fragment = paramFragment;
    addOp(paramString);
  }
  
  public FragmentTransaction add(int paramInt, Fragment paramFragment)
  {
    doAddOp(paramInt, paramFragment, null, 1);
    return this;
  }
  
  public FragmentTransaction add(int paramInt, Fragment paramFragment, String paramString)
  {
    doAddOp(paramInt, paramFragment, paramString, 1);
    return this;
  }
  
  public FragmentTransaction add(Fragment paramFragment, String paramString)
  {
    doAddOp(0, paramFragment, paramString, 1);
    return this;
  }
  
  void addOp(BackStackRecord.Op paramOp)
  {
    if (mHead == null)
    {
      mTail = paramOp;
      mHead = paramOp;
    }
    for (;;)
    {
      enterAnim = mEnterAnim;
      exitAnim = mExitAnim;
      popEnterAnim = mPopEnterAnim;
      popExitAnim = mPopExitAnim;
      mNumOp += 1;
      return;
      prev = mTail;
      mTail.next = paramOp;
      mTail = paramOp;
    }
  }
  
  public FragmentTransaction addToBackStack(String paramString)
  {
    if (!mAllowAddToBackStack) {
      throw new IllegalStateException("This FragmentTransaction is not allowed to be added to the back stack.");
    }
    mAddToBackStack = true;
    mName = paramString;
    return this;
  }
  
  public FragmentTransaction attach(Fragment paramFragment)
  {
    BackStackRecord.Op localOp = new BackStackRecord.Op();
    cmd = 7;
    fragment = paramFragment;
    addOp(localOp);
    return this;
  }
  
  void bumpBackStackNesting(int paramInt)
  {
    if (!mAddToBackStack) {}
    for (;;)
    {
      return;
      for (BackStackRecord.Op localOp = mHead; localOp != null; localOp = next)
      {
        Fragment localFragment;
        if (fragment != null)
        {
          localFragment = fragment;
          mBackStackNesting += paramInt;
        }
        if (removed != null)
        {
          int i = removed.size() - 1;
          while (i >= 0)
          {
            localFragment = (Fragment)removed.get(i);
            mBackStackNesting += paramInt;
            i -= 1;
          }
        }
      }
    }
  }
  
  public int commit()
  {
    return commitInternal(false);
  }
  
  public int commitAllowingStateLoss()
  {
    return commitInternal(true);
  }
  
  int commitInternal(boolean paramBoolean)
  {
    if (mCommitted) {
      throw new IllegalStateException("commit already called");
    }
    mCommitted = true;
    if (mAddToBackStack) {}
    for (mIndex = mManager.allocBackStackIndex(this);; mIndex = -1)
    {
      mManager.enqueueAction(this, paramBoolean);
      return mIndex;
    }
  }
  
  public FragmentTransaction detach(Fragment paramFragment)
  {
    BackStackRecord.Op localOp = new BackStackRecord.Op();
    cmd = 6;
    fragment = paramFragment;
    addOp(localOp);
    return this;
  }
  
  public FragmentTransaction disallowAddToBackStack()
  {
    if (mAddToBackStack) {
      throw new IllegalStateException("This transaction is already being added to the back stack");
    }
    mAllowAddToBackStack = false;
    return this;
  }
  
  public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
  {
    dump(paramString, paramPrintWriter, true);
  }
  
  public void dump(String paramString, PrintWriter paramPrintWriter, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.print("mName=");
      paramPrintWriter.print(mName);
      paramPrintWriter.print(" mIndex=");
      paramPrintWriter.print(mIndex);
      paramPrintWriter.print(" mCommitted=");
      paramPrintWriter.println(mCommitted);
      if (mTransition != 0)
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mTransition=#");
        paramPrintWriter.print(Integer.toHexString(mTransition));
        paramPrintWriter.print(" mTransitionStyle=#");
        paramPrintWriter.println(Integer.toHexString(mTransitionStyle));
      }
      if ((mEnterAnim != 0) || (mExitAnim != 0))
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mEnterAnim=#");
        paramPrintWriter.print(Integer.toHexString(mEnterAnim));
        paramPrintWriter.print(" mExitAnim=#");
        paramPrintWriter.println(Integer.toHexString(mExitAnim));
      }
      if ((mPopEnterAnim != 0) || (mPopExitAnim != 0))
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mPopEnterAnim=#");
        paramPrintWriter.print(Integer.toHexString(mPopEnterAnim));
        paramPrintWriter.print(" mPopExitAnim=#");
        paramPrintWriter.println(Integer.toHexString(mPopExitAnim));
      }
      if ((mBreadCrumbTitleRes != 0) || (mBreadCrumbTitleText != null))
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mBreadCrumbTitleRes=#");
        paramPrintWriter.print(Integer.toHexString(mBreadCrumbTitleRes));
        paramPrintWriter.print(" mBreadCrumbTitleText=");
        paramPrintWriter.println(mBreadCrumbTitleText);
      }
      if ((mBreadCrumbShortTitleRes != 0) || (mBreadCrumbShortTitleText != null))
      {
        paramPrintWriter.print(paramString);
        paramPrintWriter.print("mBreadCrumbShortTitleRes=#");
        paramPrintWriter.print(Integer.toHexString(mBreadCrumbShortTitleRes));
        paramPrintWriter.print(" mBreadCrumbShortTitleText=");
        paramPrintWriter.println(mBreadCrumbShortTitleText);
      }
    }
    if (mHead != null)
    {
      paramPrintWriter.print(paramString);
      paramPrintWriter.println("Operations:");
      String str2 = paramString + "    ";
      BackStackRecord.Op localOp = mHead;
      int i = 0;
      while (localOp != null)
      {
        String str1;
        int j;
        switch (cmd)
        {
        default: 
          str1 = "cmd=" + cmd;
          paramPrintWriter.print(paramString);
          paramPrintWriter.print("  Op #");
          paramPrintWriter.print(i);
          paramPrintWriter.print(": ");
          paramPrintWriter.print(str1);
          paramPrintWriter.print(" ");
          paramPrintWriter.println(fragment);
          if (paramBoolean)
          {
            if ((enterAnim != 0) || (exitAnim != 0))
            {
              paramPrintWriter.print(paramString);
              paramPrintWriter.print("enterAnim=#");
              paramPrintWriter.print(Integer.toHexString(enterAnim));
              paramPrintWriter.print(" exitAnim=#");
              paramPrintWriter.println(Integer.toHexString(exitAnim));
            }
            if ((popEnterAnim != 0) || (popExitAnim != 0))
            {
              paramPrintWriter.print(paramString);
              paramPrintWriter.print("popEnterAnim=#");
              paramPrintWriter.print(Integer.toHexString(popEnterAnim));
              paramPrintWriter.print(" popExitAnim=#");
              paramPrintWriter.println(Integer.toHexString(popExitAnim));
            }
          }
          if ((removed == null) || (removed.size() <= 0)) {
            break label803;
          }
          j = 0;
          label637:
          if (j >= removed.size()) {
            break label803;
          }
          paramPrintWriter.print(str2);
          if (removed.size() == 1) {
            paramPrintWriter.print("Removed: ");
          }
          break;
        }
        for (;;)
        {
          paramPrintWriter.println(removed.get(j));
          j += 1;
          break label637;
          str1 = "NULL";
          break;
          str1 = "ADD";
          break;
          str1 = "REPLACE";
          break;
          str1 = "REMOVE";
          break;
          str1 = "HIDE";
          break;
          str1 = "SHOW";
          break;
          str1 = "DETACH";
          break;
          str1 = "ATTACH";
          break;
          if (j == 0) {
            paramPrintWriter.println("Removed:");
          }
          paramPrintWriter.print(str2);
          paramPrintWriter.print("  #");
          paramPrintWriter.print(j);
          paramPrintWriter.print(": ");
        }
        label803:
        localOp = next;
        i += 1;
      }
    }
  }
  
  public CharSequence getBreadCrumbShortTitle()
  {
    if (mBreadCrumbShortTitleRes != 0) {
      return mManager.mActivity.getText(mBreadCrumbShortTitleRes);
    }
    return mBreadCrumbShortTitleText;
  }
  
  public int getBreadCrumbShortTitleRes()
  {
    return mBreadCrumbShortTitleRes;
  }
  
  public CharSequence getBreadCrumbTitle()
  {
    if (mBreadCrumbTitleRes != 0) {
      return mManager.mActivity.getText(mBreadCrumbTitleRes);
    }
    return mBreadCrumbTitleText;
  }
  
  public int getBreadCrumbTitleRes()
  {
    return mBreadCrumbTitleRes;
  }
  
  public int getId()
  {
    return mIndex;
  }
  
  public String getName()
  {
    return mName;
  }
  
  public int getTransition()
  {
    return mTransition;
  }
  
  public int getTransitionStyle()
  {
    return mTransitionStyle;
  }
  
  public FragmentTransaction hide(Fragment paramFragment)
  {
    BackStackRecord.Op localOp = new BackStackRecord.Op();
    cmd = 4;
    fragment = paramFragment;
    addOp(localOp);
    return this;
  }
  
  public boolean isAddToBackStackAllowed()
  {
    return mAllowAddToBackStack;
  }
  
  public boolean isEmpty()
  {
    return mNumOp == 0;
  }
  
  public void popFromBackStack(boolean paramBoolean)
  {
    bumpBackStackNesting(-1);
    BackStackRecord.Op localOp = mTail;
    if (localOp != null)
    {
      Fragment localFragment;
      switch (cmd)
      {
      default: 
        throw new IllegalArgumentException("Unknown cmd: " + cmd);
      case 1: 
        localFragment = fragment;
        mNextAnim = popExitAnim;
        mManager.removeFragment(localFragment, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
      }
      for (;;)
      {
        localOp = prev;
        break;
        localFragment = fragment;
        if (localFragment != null)
        {
          mNextAnim = popExitAnim;
          mManager.removeFragment(localFragment, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
        }
        if (removed != null)
        {
          int i = 0;
          while (i < removed.size())
          {
            localFragment = (Fragment)removed.get(i);
            mNextAnim = popEnterAnim;
            mManager.addFragment(localFragment, false);
            i += 1;
          }
          localFragment = fragment;
          mNextAnim = popEnterAnim;
          mManager.addFragment(localFragment, false);
          continue;
          localFragment = fragment;
          mNextAnim = popEnterAnim;
          mManager.showFragment(localFragment, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
          continue;
          localFragment = fragment;
          mNextAnim = popExitAnim;
          mManager.hideFragment(localFragment, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
          continue;
          localFragment = fragment;
          mNextAnim = popEnterAnim;
          mManager.attachFragment(localFragment, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
          continue;
          localFragment = fragment;
          mNextAnim = popEnterAnim;
          mManager.detachFragment(localFragment, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle);
        }
      }
    }
    if (paramBoolean) {
      mManager.moveToState(mManager.mCurState, FragmentManagerImpl.reverseTransit(mTransition), mTransitionStyle, true);
    }
    if (mIndex >= 0)
    {
      mManager.freeBackStackIndex(mIndex);
      mIndex = -1;
    }
  }
  
  public FragmentTransaction remove(Fragment paramFragment)
  {
    BackStackRecord.Op localOp = new BackStackRecord.Op();
    cmd = 3;
    fragment = paramFragment;
    addOp(localOp);
    return this;
  }
  
  public FragmentTransaction replace(int paramInt, Fragment paramFragment)
  {
    return replace(paramInt, paramFragment, null);
  }
  
  public FragmentTransaction replace(int paramInt, Fragment paramFragment, String paramString)
  {
    if (paramInt == 0) {
      throw new IllegalArgumentException("Must use non-zero containerViewId");
    }
    doAddOp(paramInt, paramFragment, paramString, 2);
    return this;
  }
  
  public void run()
  {
    if ((mAddToBackStack) && (mIndex < 0)) {
      throw new IllegalStateException("addToBackStack() called after commit()");
    }
    bumpBackStackNesting(1);
    BackStackRecord.Op localOp = mHead;
    while (localOp != null) {
      if (fragment == null)
      {
        localOp = next;
      }
      else
      {
        Object localObject1;
        switch (cmd)
        {
        default: 
          throw new IllegalArgumentException("Unknown cmd: " + cmd);
        case 1: 
          localObject1 = fragment;
          mNextAnim = enterAnim;
          mManager.addFragment((Fragment)localObject1, false);
        }
        for (;;)
        {
          localOp = next;
          break;
          localObject1 = fragment;
          Object localObject2;
          if (mManager.mAdded != null)
          {
            int i = 0;
            localObject2 = localObject1;
            if (i < mManager.mAdded.size())
            {
              Fragment localFragment = (Fragment)mManager.mAdded.get(i);
              if (localObject1 != null)
              {
                localObject2 = localObject1;
                if (mContainerId != mContainerId) {}
              }
              else
              {
                if (localFragment != localObject1) {
                  break label254;
                }
                localObject2 = null;
                fragment = null;
              }
              for (;;)
              {
                i += 1;
                localObject1 = localObject2;
                break;
                label254:
                if (removed == null) {
                  removed = new ArrayList();
                }
                removed.add(localFragment);
                mNextAnim = exitAnim;
                if (mAddToBackStack) {
                  mBackStackNesting += 1;
                }
                mManager.removeFragment(localFragment, mTransition, mTransitionStyle);
                localObject2 = localObject1;
              }
            }
          }
          else
          {
            localObject2 = localObject1;
          }
          if (localObject2 != null)
          {
            mNextAnim = enterAnim;
            mManager.addFragment(localObject2, false);
            continue;
            localObject1 = fragment;
            mNextAnim = exitAnim;
            mManager.removeFragment((Fragment)localObject1, mTransition, mTransitionStyle);
            continue;
            localObject1 = fragment;
            mNextAnim = exitAnim;
            mManager.hideFragment((Fragment)localObject1, mTransition, mTransitionStyle);
            continue;
            localObject1 = fragment;
            mNextAnim = enterAnim;
            mManager.showFragment((Fragment)localObject1, mTransition, mTransitionStyle);
            continue;
            localObject1 = fragment;
            mNextAnim = exitAnim;
            mManager.detachFragment((Fragment)localObject1, mTransition, mTransitionStyle);
            continue;
            localObject1 = fragment;
            mNextAnim = enterAnim;
            mManager.attachFragment((Fragment)localObject1, mTransition, mTransitionStyle);
          }
        }
      }
    }
    mManager.moveToState(mManager.mCurState, mTransition, mTransitionStyle, true);
    if (mAddToBackStack) {
      mManager.addBackStackState(this);
    }
  }
  
  public FragmentTransaction setBreadCrumbShortTitle(int paramInt)
  {
    mBreadCrumbShortTitleRes = paramInt;
    mBreadCrumbShortTitleText = null;
    return this;
  }
  
  public FragmentTransaction setBreadCrumbShortTitle(CharSequence paramCharSequence)
  {
    mBreadCrumbShortTitleRes = 0;
    mBreadCrumbShortTitleText = paramCharSequence;
    return this;
  }
  
  public FragmentTransaction setBreadCrumbTitle(int paramInt)
  {
    mBreadCrumbTitleRes = paramInt;
    mBreadCrumbTitleText = null;
    return this;
  }
  
  public FragmentTransaction setBreadCrumbTitle(CharSequence paramCharSequence)
  {
    mBreadCrumbTitleRes = 0;
    mBreadCrumbTitleText = paramCharSequence;
    return this;
  }
  
  public FragmentTransaction setCustomAnimations(int paramInt1, int paramInt2)
  {
    return setCustomAnimations(paramInt1, paramInt2, 0, 0);
  }
  
  public FragmentTransaction setCustomAnimations(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    mEnterAnim = paramInt1;
    mExitAnim = paramInt2;
    mPopEnterAnim = paramInt3;
    mPopExitAnim = paramInt4;
    return this;
  }
  
  public FragmentTransaction setTransition(int paramInt)
  {
    mTransition = paramInt;
    return this;
  }
  
  public FragmentTransaction setTransitionStyle(int paramInt)
  {
    mTransitionStyle = paramInt;
    return this;
  }
  
  public FragmentTransaction show(Fragment paramFragment)
  {
    BackStackRecord.Op localOp = new BackStackRecord.Op();
    cmd = 5;
    fragment = paramFragment;
    addOp(localOp);
    return this;
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(128);
    localStringBuilder.append("BackStackEntry{");
    localStringBuilder.append(Integer.toHexString(System.identityHashCode(this)));
    if (mIndex >= 0)
    {
      localStringBuilder.append(" #");
      localStringBuilder.append(mIndex);
    }
    if (mName != null)
    {
      localStringBuilder.append(" ");
      localStringBuilder.append(mName);
    }
    localStringBuilder.append("}");
    return localStringBuilder.toString();
  }
}
