package android.support.v4.app;

import android.os.Build.VERSION;
import android.support.v4.util.ArrayMap;
import android.support.v4.util.LogWriter;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnPreDrawListener;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

final class BackStackRecord
  extends FragmentTransaction
  implements Runnable
{
  static final boolean SUPPORTS_TRANSITIONS;
  boolean mAddToBackStack;
  boolean mAllowAddToBackStack = true;
  int mBreadCrumbShortTitleRes;
  CharSequence mBreadCrumbShortTitleText;
  int mBreadCrumbTitleRes;
  CharSequence mBreadCrumbTitleText;
  boolean mCommitted;
  int mEnterAnim;
  int mExitAnim;
  Op mHead;
  int mIndex = -1;
  final FragmentManagerImpl mManager;
  String mName;
  int mNumOp;
  int mPopEnterAnim;
  int mPopExitAnim;
  ArrayList<String> mSharedElementSourceNames;
  ArrayList<String> mSharedElementTargetNames;
  Op mTail;
  int mTransition;
  int mTransitionStyle;
  
  static
  {
    if (Build.VERSION.SDK_INT >= 21) {}
    for (boolean bool = true;; bool = false)
    {
      SUPPORTS_TRANSITIONS = bool;
      return;
    }
  }
  
  public BackStackRecord(FragmentManagerImpl paramFragmentManagerImpl)
  {
    mManager = paramFragmentManagerImpl;
  }
  
  private TransitionState beginTransition(SparseArray<Fragment> paramSparseArray1, SparseArray<Fragment> paramSparseArray2, boolean paramBoolean)
  {
    TransitionState localTransitionState = new TransitionState();
    nonExistentView = new View(mManager.mActivity);
    int i = 0;
    int j = 0;
    while (j < paramSparseArray1.size())
    {
      if (configureTransitions(paramSparseArray1.keyAt(j), localTransitionState, paramBoolean, paramSparseArray1, paramSparseArray2)) {
        i = 1;
      }
      j += 1;
    }
    j = 0;
    while (j < paramSparseArray2.size())
    {
      int m = paramSparseArray2.keyAt(j);
      int k = i;
      if (paramSparseArray1.get(m) == null)
      {
        k = i;
        if (configureTransitions(m, localTransitionState, paramBoolean, paramSparseArray1, paramSparseArray2)) {
          k = 1;
        }
      }
      j += 1;
      i = k;
    }
    paramSparseArray1 = localTransitionState;
    if (i == 0) {
      paramSparseArray1 = null;
    }
    return paramSparseArray1;
  }
  
  private void calculateFragments(SparseArray<Fragment> paramSparseArray1, SparseArray<Fragment> paramSparseArray2)
  {
    if (!mManager.mContainer.hasView()) {}
    Op localOp;
    do
    {
      return;
      localOp = mHead;
    } while (localOp == null);
    switch (cmd)
    {
    }
    for (;;)
    {
      localOp = next;
      break;
      setLastIn(paramSparseArray2, fragment);
      continue;
      Object localObject1 = fragment;
      Object localObject2 = localObject1;
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
              break label199;
            }
          }
          for (localObject2 = null;; localObject2 = localObject1)
          {
            i += 1;
            localObject1 = localObject2;
            break;
            label199:
            setFirstOut(paramSparseArray1, localFragment);
          }
        }
      }
      setLastIn(paramSparseArray2, localObject2);
      continue;
      setFirstOut(paramSparseArray1, fragment);
      continue;
      setFirstOut(paramSparseArray1, fragment);
      continue;
      setLastIn(paramSparseArray2, fragment);
      continue;
      setFirstOut(paramSparseArray1, fragment);
      continue;
      setLastIn(paramSparseArray2, fragment);
    }
  }
  
  private void callSharedElementEnd(TransitionState paramTransitionState, Fragment paramFragment1, Fragment paramFragment2, boolean paramBoolean, ArrayMap<String, View> paramArrayMap)
  {
    if (paramBoolean) {}
    for (paramTransitionState = mEnterTransitionCallback;; paramTransitionState = mEnterTransitionCallback)
    {
      if (paramTransitionState != null) {
        paramTransitionState.onSharedElementEnd(new ArrayList(paramArrayMap.keySet()), new ArrayList(paramArrayMap.values()), null);
      }
      return;
    }
  }
  
  private static Object captureExitingViews(Object paramObject, Fragment paramFragment, ArrayList<View> paramArrayList, ArrayMap<String, View> paramArrayMap, View paramView)
  {
    Object localObject = paramObject;
    if (paramObject != null) {
      localObject = FragmentTransitionCompat21.captureExitingViews(paramObject, paramFragment.getView(), paramArrayList, paramArrayMap, paramView);
    }
    return localObject;
  }
  
  private boolean configureTransitions(int paramInt, TransitionState paramTransitionState, boolean paramBoolean, SparseArray<Fragment> paramSparseArray1, SparseArray<Fragment> paramSparseArray2)
  {
    ViewGroup localViewGroup = (ViewGroup)mManager.mContainer.findViewById(paramInt);
    if (localViewGroup == null) {
      return false;
    }
    Object localObject2 = (Fragment)paramSparseArray2.get(paramInt);
    Object localObject5 = (Fragment)paramSparseArray1.get(paramInt);
    Object localObject3 = getEnterTransition((Fragment)localObject2, paramBoolean);
    Object localObject4 = getSharedElementTransition((Fragment)localObject2, (Fragment)localObject5, paramBoolean);
    Object localObject6 = getExitTransition((Fragment)localObject5, paramBoolean);
    if ((localObject3 == null) && (localObject4 == null) && (localObject6 == null)) {
      return false;
    }
    paramSparseArray1 = null;
    ArrayList localArrayList = new ArrayList();
    if (localObject4 != null)
    {
      localObject1 = remapSharedElements(paramTransitionState, (Fragment)localObject5, paramBoolean);
      localArrayList.add(nonExistentView);
      localArrayList.addAll(((ArrayMap)localObject1).values());
      if (!paramBoolean) {
        break label455;
      }
      paramSparseArray2 = mEnterTransitionCallback;
      paramSparseArray1 = (SparseArray<Fragment>)localObject1;
      if (paramSparseArray2 != null)
      {
        paramSparseArray2.onSharedElementStart(new ArrayList(((ArrayMap)localObject1).keySet()), new ArrayList(((ArrayMap)localObject1).values()), null);
        paramSparseArray1 = (SparseArray<Fragment>)localObject1;
      }
    }
    paramSparseArray2 = new ArrayList();
    Object localObject1 = captureExitingViews(localObject6, (Fragment)localObject5, paramSparseArray2, paramSparseArray1, nonExistentView);
    if ((mSharedElementTargetNames != null) && (paramSparseArray1 != null))
    {
      paramSparseArray1 = (View)paramSparseArray1.get(mSharedElementTargetNames.get(0));
      if (paramSparseArray1 != null)
      {
        if (localObject1 != null) {
          FragmentTransitionCompat21.setEpicenter(localObject1, paramSparseArray1);
        }
        if (localObject4 != null) {
          FragmentTransitionCompat21.setEpicenter(localObject4, paramSparseArray1);
        }
      }
    }
    paramSparseArray1 = new FragmentTransitionCompat21.ViewRetriever()
    {
      public View getView()
      {
        return val$inFragment.getView();
      }
    };
    if (localObject4 != null) {
      prepareSharedElementTransition(paramTransitionState, localViewGroup, localObject4, (Fragment)localObject2, (Fragment)localObject5, paramBoolean, localArrayList);
    }
    localObject5 = new ArrayList();
    localObject6 = new ArrayMap();
    if (paramBoolean) {}
    for (paramBoolean = ((Fragment)localObject2).getAllowReturnTransitionOverlap();; paramBoolean = ((Fragment)localObject2).getAllowEnterTransitionOverlap())
    {
      localObject2 = FragmentTransitionCompat21.mergeTransitions(localObject3, localObject1, localObject4, paramBoolean);
      if (localObject2 != null)
      {
        FragmentTransitionCompat21.addTransitionTargets(localObject3, localObject4, localViewGroup, paramSparseArray1, nonExistentView, enteringEpicenterView, nameOverrides, (ArrayList)localObject5, (Map)localObject6, localArrayList);
        excludeHiddenFragmentsAfterEnter(localViewGroup, paramTransitionState, paramInt, localObject2);
        FragmentTransitionCompat21.excludeTarget(localObject2, nonExistentView, true);
        excludeHiddenFragments(paramTransitionState, paramInt, localObject2);
        FragmentTransitionCompat21.beginDelayedTransition(localViewGroup, localObject2);
        FragmentTransitionCompat21.cleanupTransitions(localViewGroup, nonExistentView, localObject3, (ArrayList)localObject5, localObject1, paramSparseArray2, localObject4, localArrayList, localObject2, hiddenFragmentViews, (Map)localObject6);
      }
      if (localObject2 == null) {
        break label474;
      }
      return true;
      label455:
      paramSparseArray2 = mEnterTransitionCallback;
      break;
    }
    label474:
    return false;
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
    paramString = new Op();
    cmd = paramInt2;
    fragment = paramFragment;
    addOp(paramString);
  }
  
  private void excludeHiddenFragments(TransitionState paramTransitionState, int paramInt, Object paramObject)
  {
    if (mManager.mAdded != null)
    {
      int i = 0;
      if (i < mManager.mAdded.size())
      {
        Fragment localFragment = (Fragment)mManager.mAdded.get(i);
        if ((mView != null) && (mContainer != null) && (mContainerId == paramInt))
        {
          if (!mHidden) {
            break label125;
          }
          if (!hiddenFragmentViews.contains(mView))
          {
            FragmentTransitionCompat21.excludeTarget(paramObject, mView, true);
            hiddenFragmentViews.add(mView);
          }
        }
        for (;;)
        {
          i += 1;
          break;
          label125:
          FragmentTransitionCompat21.excludeTarget(paramObject, mView, false);
          hiddenFragmentViews.remove(mView);
        }
      }
    }
  }
  
  private void excludeHiddenFragmentsAfterEnter(final View paramView, final TransitionState paramTransitionState, final int paramInt, final Object paramObject)
  {
    paramView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener()
    {
      public boolean onPreDraw()
      {
        paramView.getViewTreeObserver().removeOnPreDrawListener(this);
        BackStackRecord.this.excludeHiddenFragments(paramTransitionState, paramInt, paramObject);
        return true;
      }
    });
  }
  
  private static Object getEnterTransition(Fragment paramFragment, boolean paramBoolean)
  {
    if (paramFragment == null) {
      return null;
    }
    if (paramBoolean) {}
    for (paramFragment = paramFragment.getReenterTransition();; paramFragment = paramFragment.getEnterTransition()) {
      return FragmentTransitionCompat21.cloneTransition(paramFragment);
    }
  }
  
  private static Object getExitTransition(Fragment paramFragment, boolean paramBoolean)
  {
    if (paramFragment == null) {
      return null;
    }
    if (paramBoolean) {}
    for (paramFragment = paramFragment.getReturnTransition();; paramFragment = paramFragment.getExitTransition()) {
      return FragmentTransitionCompat21.cloneTransition(paramFragment);
    }
  }
  
  private static Object getSharedElementTransition(Fragment paramFragment1, Fragment paramFragment2, boolean paramBoolean)
  {
    if ((paramFragment1 == null) || (paramFragment2 == null)) {
      return null;
    }
    if (paramBoolean) {}
    for (paramFragment1 = paramFragment2.getSharedElementReturnTransition();; paramFragment1 = paramFragment1.getSharedElementEnterTransition()) {
      return FragmentTransitionCompat21.cloneTransition(paramFragment1);
    }
  }
  
  private ArrayMap<String, View> mapEnteringSharedElements(TransitionState paramTransitionState, Fragment paramFragment, boolean paramBoolean)
  {
    ArrayMap localArrayMap = new ArrayMap();
    paramFragment = paramFragment.getView();
    paramTransitionState = localArrayMap;
    if (paramFragment != null)
    {
      paramTransitionState = localArrayMap;
      if (mSharedElementSourceNames != null)
      {
        FragmentTransitionCompat21.findNamedViews(localArrayMap, paramFragment);
        if (!paramBoolean) {
          break label57;
        }
        paramTransitionState = remapNames(mSharedElementSourceNames, mSharedElementTargetNames, localArrayMap);
      }
    }
    return paramTransitionState;
    label57:
    localArrayMap.retainAll(mSharedElementTargetNames);
    return localArrayMap;
  }
  
  private ArrayMap<String, View> mapSharedElementsIn(TransitionState paramTransitionState, boolean paramBoolean, Fragment paramFragment)
  {
    ArrayMap localArrayMap = mapEnteringSharedElements(paramTransitionState, paramFragment, paramBoolean);
    if (paramBoolean)
    {
      if (mExitTransitionCallback != null) {
        mExitTransitionCallback.onMapSharedElements(mSharedElementTargetNames, localArrayMap);
      }
      setBackNameOverrides(paramTransitionState, localArrayMap, true);
      return localArrayMap;
    }
    if (mEnterTransitionCallback != null) {
      mEnterTransitionCallback.onMapSharedElements(mSharedElementTargetNames, localArrayMap);
    }
    setNameOverrides(paramTransitionState, localArrayMap, true);
    return localArrayMap;
  }
  
  private void prepareSharedElementTransition(final TransitionState paramTransitionState, final View paramView, final Object paramObject, final Fragment paramFragment1, final Fragment paramFragment2, final boolean paramBoolean, final ArrayList<View> paramArrayList)
  {
    paramView.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener()
    {
      public boolean onPreDraw()
      {
        paramView.getViewTreeObserver().removeOnPreDrawListener(this);
        if (paramObject != null)
        {
          FragmentTransitionCompat21.removeTargets(paramObject, paramArrayList);
          paramArrayList.clear();
          ArrayMap localArrayMap = BackStackRecord.this.mapSharedElementsIn(paramTransitionState, paramBoolean, paramFragment1);
          paramArrayList.add(paramTransitionStatenonExistentView);
          paramArrayList.addAll(localArrayMap.values());
          FragmentTransitionCompat21.addTargets(paramObject, paramArrayList);
          BackStackRecord.this.setEpicenterIn(localArrayMap, paramTransitionState);
          BackStackRecord.this.callSharedElementEnd(paramTransitionState, paramFragment1, paramFragment2, paramBoolean, localArrayMap);
        }
        return true;
      }
    });
  }
  
  private static ArrayMap<String, View> remapNames(ArrayList<String> paramArrayList1, ArrayList<String> paramArrayList2, ArrayMap<String, View> paramArrayMap)
  {
    if (paramArrayMap.isEmpty()) {
      return paramArrayMap;
    }
    ArrayMap localArrayMap = new ArrayMap();
    int j = paramArrayList1.size();
    int i = 0;
    while (i < j)
    {
      View localView = (View)paramArrayMap.get(paramArrayList1.get(i));
      if (localView != null) {
        localArrayMap.put(paramArrayList2.get(i), localView);
      }
      i += 1;
    }
    return localArrayMap;
  }
  
  private ArrayMap<String, View> remapSharedElements(TransitionState paramTransitionState, Fragment paramFragment, boolean paramBoolean)
  {
    ArrayMap localArrayMap2 = new ArrayMap();
    ArrayMap localArrayMap1 = localArrayMap2;
    if (mSharedElementSourceNames != null)
    {
      FragmentTransitionCompat21.findNamedViews(localArrayMap2, paramFragment.getView());
      if (!paramBoolean) {
        break label82;
      }
      localArrayMap2.retainAll(mSharedElementTargetNames);
    }
    label82:
    for (localArrayMap1 = localArrayMap2; paramBoolean; localArrayMap1 = remapNames(mSharedElementSourceNames, mSharedElementTargetNames, localArrayMap2))
    {
      if (mEnterTransitionCallback != null) {
        mEnterTransitionCallback.onMapSharedElements(mSharedElementTargetNames, localArrayMap1);
      }
      setBackNameOverrides(paramTransitionState, localArrayMap1, false);
      return localArrayMap1;
    }
    if (mExitTransitionCallback != null) {
      mExitTransitionCallback.onMapSharedElements(mSharedElementTargetNames, localArrayMap1);
    }
    setNameOverrides(paramTransitionState, localArrayMap1, false);
    return localArrayMap1;
  }
  
  private void setBackNameOverrides(TransitionState paramTransitionState, ArrayMap<String, View> paramArrayMap, boolean paramBoolean)
  {
    int i;
    int j;
    label13:
    String str;
    Object localObject;
    if (mSharedElementTargetNames == null)
    {
      i = 0;
      j = 0;
      if (j >= i) {
        return;
      }
      str = (String)mSharedElementSourceNames.get(j);
      localObject = (View)paramArrayMap.get((String)mSharedElementTargetNames.get(j));
      if (localObject != null)
      {
        localObject = FragmentTransitionCompat21.getTransitionName((View)localObject);
        if (!paramBoolean) {
          break label103;
        }
        setNameOverride(nameOverrides, str, (String)localObject);
      }
    }
    for (;;)
    {
      j += 1;
      break label13;
      i = mSharedElementTargetNames.size();
      break;
      label103:
      setNameOverride(nameOverrides, (String)localObject, str);
    }
  }
  
  private void setEpicenterIn(ArrayMap<String, View> paramArrayMap, TransitionState paramTransitionState)
  {
    if ((mSharedElementTargetNames != null) && (!paramArrayMap.isEmpty()))
    {
      paramArrayMap = (View)paramArrayMap.get(mSharedElementTargetNames.get(0));
      if (paramArrayMap != null) {
        enteringEpicenterView.epicenter = paramArrayMap;
      }
    }
  }
  
  private static void setFirstOut(SparseArray<Fragment> paramSparseArray, Fragment paramFragment)
  {
    if (paramFragment != null)
    {
      int i = mContainerId;
      if ((i != 0) && (!paramFragment.isHidden()) && (paramFragment.isAdded()) && (paramFragment.getView() != null) && (paramSparseArray.get(i) == null)) {
        paramSparseArray.put(i, paramFragment);
      }
    }
  }
  
  private void setLastIn(SparseArray<Fragment> paramSparseArray, Fragment paramFragment)
  {
    if (paramFragment != null)
    {
      int i = mContainerId;
      if (i != 0) {
        paramSparseArray.put(i, paramFragment);
      }
    }
  }
  
  private static void setNameOverride(ArrayMap<String, String> paramArrayMap, String paramString1, String paramString2)
  {
    int i;
    if ((paramString1 != null) && (paramString2 != null) && (!paramString1.equals(paramString2))) {
      i = 0;
    }
    while (i < paramArrayMap.size())
    {
      if (paramString1.equals(paramArrayMap.valueAt(i)))
      {
        paramArrayMap.setValueAt(i, paramString2);
        return;
      }
      i += 1;
    }
    paramArrayMap.put(paramString1, paramString2);
  }
  
  private void setNameOverrides(TransitionState paramTransitionState, ArrayMap<String, View> paramArrayMap, boolean paramBoolean)
  {
    int j = paramArrayMap.size();
    int i = 0;
    if (i < j)
    {
      String str1 = (String)paramArrayMap.keyAt(i);
      String str2 = FragmentTransitionCompat21.getTransitionName((View)paramArrayMap.valueAt(i));
      if (paramBoolean) {
        setNameOverride(nameOverrides, str1, str2);
      }
      for (;;)
      {
        i += 1;
        break;
        setNameOverride(nameOverrides, str2, str1);
      }
    }
  }
  
  private static void setNameOverrides(TransitionState paramTransitionState, ArrayList<String> paramArrayList1, ArrayList<String> paramArrayList2)
  {
    if (paramArrayList1 != null)
    {
      int i = 0;
      while (i < paramArrayList1.size())
      {
        String str1 = (String)paramArrayList1.get(i);
        String str2 = (String)paramArrayList2.get(i);
        setNameOverride(nameOverrides, str1, str2);
        i += 1;
      }
    }
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
  
  void addOp(Op paramOp)
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
    Op localOp = new Op();
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
      if (FragmentManagerImpl.DEBUG) {
        Log.v("FragmentManager", "Bump nesting in " + this + " by " + paramInt);
      }
      for (Op localOp = mHead; localOp != null; localOp = next)
      {
        Fragment localFragment;
        if (fragment != null)
        {
          localFragment = fragment;
          mBackStackNesting += paramInt;
          if (FragmentManagerImpl.DEBUG) {
            Log.v("FragmentManager", "Bump nesting of " + fragment + " to " + fragment.mBackStackNesting);
          }
        }
        if (removed != null)
        {
          int i = removed.size() - 1;
          while (i >= 0)
          {
            localFragment = (Fragment)removed.get(i);
            mBackStackNesting += paramInt;
            if (FragmentManagerImpl.DEBUG) {
              Log.v("FragmentManager", "Bump nesting of " + localFragment + " to " + mBackStackNesting);
            }
            i -= 1;
          }
        }
      }
    }
  }
  
  public void calculateBackFragments(SparseArray<Fragment> paramSparseArray1, SparseArray<Fragment> paramSparseArray2)
  {
    if (!mManager.mContainer.hasView()) {}
    Op localOp;
    do
    {
      return;
      localOp = mHead;
    } while (localOp == null);
    switch (cmd)
    {
    }
    for (;;)
    {
      localOp = next;
      break;
      setFirstOut(paramSparseArray1, fragment);
      continue;
      if (removed != null)
      {
        int i = removed.size() - 1;
        while (i >= 0)
        {
          setLastIn(paramSparseArray2, (Fragment)removed.get(i));
          i -= 1;
        }
      }
      setFirstOut(paramSparseArray1, fragment);
      continue;
      setLastIn(paramSparseArray2, fragment);
      continue;
      setLastIn(paramSparseArray2, fragment);
      continue;
      setFirstOut(paramSparseArray1, fragment);
      continue;
      setLastIn(paramSparseArray2, fragment);
      continue;
      setFirstOut(paramSparseArray1, fragment);
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
    if (FragmentManagerImpl.DEBUG)
    {
      Log.v("FragmentManager", "Commit: " + this);
      dump("  ", null, new PrintWriter(new LogWriter("FragmentManager")), null);
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
    Op localOp = new Op();
    cmd = 6;
    fragment = paramFragment;
    addOp(localOp);
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
      Op localOp = mHead;
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
            break label807;
          }
          j = 0;
          label641:
          if (j >= removed.size()) {
            break label807;
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
          break label641;
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
        label807:
        localOp = next;
        i += 1;
      }
    }
  }
  
  public String getName()
  {
    return mName;
  }
  
  public TransitionState popFromBackStack(boolean paramBoolean, TransitionState paramTransitionState, SparseArray<Fragment> paramSparseArray1, SparseArray<Fragment> paramSparseArray2)
  {
    if (FragmentManagerImpl.DEBUG)
    {
      Log.v("FragmentManager", "popFromBackStack: " + this);
      dump("  ", null, new PrintWriter(new LogWriter("FragmentManager")), null);
    }
    TransitionState localTransitionState = paramTransitionState;
    if (SUPPORTS_TRANSITIONS)
    {
      if (paramTransitionState != null) {
        break label223;
      }
      if (paramSparseArray1.size() == 0)
      {
        localTransitionState = paramTransitionState;
        if (paramSparseArray2.size() == 0) {}
      }
      else
      {
        localTransitionState = beginTransition(paramSparseArray1, paramSparseArray2, true);
      }
    }
    label100:
    bumpBackStackNesting(-1);
    int i;
    label113:
    int j;
    label121:
    int k;
    if (localTransitionState != null)
    {
      i = 0;
      if (localTransitionState == null) {
        break label257;
      }
      j = 0;
      paramTransitionState = mTail;
      if (paramTransitionState == null) {
        break label546;
      }
      if (localTransitionState == null) {
        break label266;
      }
      k = 0;
      label138:
      if (localTransitionState == null) {
        break label275;
      }
    }
    label223:
    label257:
    label266:
    label275:
    for (int m = 0;; m = popExitAnim) {
      switch (cmd)
      {
      default: 
        throw new IllegalArgumentException("Unknown cmd: " + cmd);
        localTransitionState = paramTransitionState;
        if (paramBoolean) {
          break label100;
        }
        setNameOverrides(paramTransitionState, mSharedElementTargetNames, mSharedElementSourceNames);
        localTransitionState = paramTransitionState;
        break label100;
        i = mTransitionStyle;
        break label113;
        j = mTransition;
        break label121;
        k = popEnterAnim;
        break label138;
      }
    }
    paramSparseArray1 = fragment;
    mNextAnim = m;
    mManager.removeFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
    for (;;)
    {
      paramTransitionState = prev;
      break;
      paramSparseArray1 = fragment;
      if (paramSparseArray1 != null)
      {
        mNextAnim = m;
        mManager.removeFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
      }
      if (removed != null)
      {
        m = 0;
        while (m < removed.size())
        {
          paramSparseArray1 = (Fragment)removed.get(m);
          mNextAnim = k;
          mManager.addFragment(paramSparseArray1, false);
          m += 1;
        }
        paramSparseArray1 = fragment;
        mNextAnim = k;
        mManager.addFragment(paramSparseArray1, false);
        continue;
        paramSparseArray1 = fragment;
        mNextAnim = k;
        mManager.showFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
        continue;
        paramSparseArray1 = fragment;
        mNextAnim = m;
        mManager.hideFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
        continue;
        paramSparseArray1 = fragment;
        mNextAnim = k;
        mManager.attachFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
        continue;
        paramSparseArray1 = fragment;
        mNextAnim = k;
        mManager.detachFragment(paramSparseArray1, FragmentManagerImpl.reverseTransit(j), i);
      }
    }
    label546:
    if (paramBoolean)
    {
      mManager.moveToState(mManager.mCurState, FragmentManagerImpl.reverseTransit(j), i, true);
      localTransitionState = null;
    }
    if (mIndex >= 0)
    {
      mManager.freeBackStackIndex(mIndex);
      mIndex = -1;
    }
    return localTransitionState;
  }
  
  public FragmentTransaction remove(Fragment paramFragment)
  {
    Op localOp = new Op();
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
    if (FragmentManagerImpl.DEBUG) {
      Log.v("FragmentManager", "Run: " + this);
    }
    if ((mAddToBackStack) && (mIndex < 0)) {
      throw new IllegalStateException("addToBackStack() called after commit()");
    }
    bumpBackStackNesting(1);
    Object localObject2 = null;
    if (SUPPORTS_TRANSITIONS)
    {
      localObject1 = new SparseArray();
      localObject2 = new SparseArray();
      calculateFragments((SparseArray)localObject1, (SparseArray)localObject2);
      localObject2 = beginTransition((SparseArray)localObject1, (SparseArray)localObject2, false);
    }
    int i;
    label116:
    int j;
    label123:
    Op localOp;
    int k;
    if (localObject2 != null)
    {
      i = 0;
      if (localObject2 == null) {
        break label236;
      }
      j = 0;
      localOp = mHead;
      if (localOp == null) {
        break label737;
      }
      if (localObject2 == null) {
        break label244;
      }
      k = 0;
      label141:
      if (localObject2 == null) {
        break label253;
      }
    }
    label236:
    label244:
    label253:
    for (int m = 0;; m = exitAnim) {
      switch (cmd)
      {
      default: 
        throw new IllegalArgumentException("Unknown cmd: " + cmd);
        i = mTransitionStyle;
        break label116;
        j = mTransition;
        break label123;
        k = enterAnim;
        break label141;
      }
    }
    Object localObject1 = fragment;
    mNextAnim = k;
    mManager.addFragment((Fragment)localObject1, false);
    for (;;)
    {
      localOp = next;
      break;
      localObject1 = fragment;
      Object localObject3 = localObject1;
      if (mManager.mAdded != null)
      {
        int n = 0;
        localObject3 = localObject1;
        if (n < mManager.mAdded.size())
        {
          Fragment localFragment = (Fragment)mManager.mAdded.get(n);
          if (FragmentManagerImpl.DEBUG) {
            Log.v("FragmentManager", "OP_REPLACE: adding=" + localObject1 + " old=" + localFragment);
          }
          if (localObject1 != null)
          {
            localObject3 = localObject1;
            if (mContainerId != mContainerId) {}
          }
          else
          {
            if (localFragment != localObject1) {
              break label452;
            }
            localObject3 = null;
            fragment = null;
          }
          for (;;)
          {
            n += 1;
            localObject1 = localObject3;
            break;
            label452:
            if (removed == null) {
              removed = new ArrayList();
            }
            removed.add(localFragment);
            mNextAnim = m;
            if (mAddToBackStack)
            {
              mBackStackNesting += 1;
              if (FragmentManagerImpl.DEBUG) {
                Log.v("FragmentManager", "Bump nesting of " + localFragment + " to " + mBackStackNesting);
              }
            }
            mManager.removeFragment(localFragment, j, i);
            localObject3 = localObject1;
          }
        }
      }
      if (localObject3 != null)
      {
        mNextAnim = k;
        mManager.addFragment(localObject3, false);
        continue;
        localObject1 = fragment;
        mNextAnim = m;
        mManager.removeFragment((Fragment)localObject1, j, i);
        continue;
        localObject1 = fragment;
        mNextAnim = m;
        mManager.hideFragment((Fragment)localObject1, j, i);
        continue;
        localObject1 = fragment;
        mNextAnim = k;
        mManager.showFragment((Fragment)localObject1, j, i);
        continue;
        localObject1 = fragment;
        mNextAnim = m;
        mManager.detachFragment((Fragment)localObject1, j, i);
        continue;
        localObject1 = fragment;
        mNextAnim = k;
        mManager.attachFragment((Fragment)localObject1, j, i);
      }
    }
    label737:
    mManager.moveToState(mManager.mCurState, j, i, true);
    if (mAddToBackStack) {
      mManager.addBackStackState(this);
    }
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
  
  static final class Op
  {
    int cmd;
    int enterAnim;
    int exitAnim;
    Fragment fragment;
    Op next;
    int popEnterAnim;
    int popExitAnim;
    Op prev;
    ArrayList<Fragment> removed;
    
    Op() {}
  }
  
  public class TransitionState
  {
    public FragmentTransitionCompat21.EpicenterView enteringEpicenterView = new FragmentTransitionCompat21.EpicenterView();
    public ArrayList<View> hiddenFragmentViews = new ArrayList();
    public ArrayMap<String, String> nameOverrides = new ArrayMap();
    public View nonExistentView;
    
    public TransitionState() {}
  }
}
