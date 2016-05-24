package android.support.v7.widget;

import android.view.View;
import android.view.ViewGroup.LayoutParams;
import java.util.ArrayList;
import java.util.List;

class ChildHelper
{
  final Bucket mBucket;
  final Callback mCallback;
  final List<View> mHiddenViews;
  
  ChildHelper(Callback paramCallback)
  {
    mCallback = paramCallback;
    mBucket = new Bucket();
    mHiddenViews = new ArrayList();
  }
  
  private int getOffset(int paramInt)
  {
    if (paramInt < 0)
    {
      paramInt = -1;
      return paramInt;
    }
    int j = mCallback.getChildCount();
    int i = paramInt;
    for (;;)
    {
      if (i >= j) {
        break label72;
      }
      int k = paramInt - (i - mBucket.countOnesBefore(i));
      if (k == 0) {
        for (;;)
        {
          paramInt = i;
          if (!mBucket.get(i)) {
            break;
          }
          i += 1;
        }
      }
      i += k;
    }
    label72:
    return -1;
  }
  
  void addView(View paramView, int paramInt, boolean paramBoolean)
  {
    if (paramInt < 0) {}
    for (paramInt = mCallback.getChildCount();; paramInt = getOffset(paramInt))
    {
      mBucket.insert(paramInt, paramBoolean);
      if (paramBoolean) {
        mHiddenViews.add(paramView);
      }
      mCallback.addView(paramView, paramInt);
      return;
    }
  }
  
  void addView(View paramView, boolean paramBoolean)
  {
    addView(paramView, -1, paramBoolean);
  }
  
  void attachViewToParent(View paramView, int paramInt, ViewGroup.LayoutParams paramLayoutParams, boolean paramBoolean)
  {
    if (paramInt < 0) {}
    for (paramInt = mCallback.getChildCount();; paramInt = getOffset(paramInt))
    {
      mBucket.insert(paramInt, paramBoolean);
      if (paramBoolean) {
        mHiddenViews.add(paramView);
      }
      mCallback.attachViewToParent(paramView, paramInt, paramLayoutParams);
      return;
    }
  }
  
  void detachViewFromParent(int paramInt)
  {
    paramInt = getOffset(paramInt);
    mBucket.remove(paramInt);
    mCallback.detachViewFromParent(paramInt);
  }
  
  View findHiddenNonRemovedView(int paramInt1, int paramInt2)
  {
    int j = mHiddenViews.size();
    int i = 0;
    while (i < j)
    {
      View localView = (View)mHiddenViews.get(i);
      RecyclerView.ViewHolder localViewHolder = mCallback.getChildViewHolder(localView);
      if ((localViewHolder.getLayoutPosition() == paramInt1) && (!localViewHolder.isInvalid()) && ((paramInt2 == -1) || (localViewHolder.getItemViewType() == paramInt2))) {
        return localView;
      }
      i += 1;
    }
    return null;
  }
  
  View getChildAt(int paramInt)
  {
    paramInt = getOffset(paramInt);
    return mCallback.getChildAt(paramInt);
  }
  
  int getChildCount()
  {
    return mCallback.getChildCount() - mHiddenViews.size();
  }
  
  View getUnfilteredChildAt(int paramInt)
  {
    return mCallback.getChildAt(paramInt);
  }
  
  int getUnfilteredChildCount()
  {
    return mCallback.getChildCount();
  }
  
  void hide(View paramView)
  {
    int i = mCallback.indexOfChild(paramView);
    if (i < 0) {
      throw new IllegalArgumentException("view is not a child, cannot hide " + paramView);
    }
    mBucket.set(i);
    mHiddenViews.add(paramView);
  }
  
  int indexOfChild(View paramView)
  {
    int i = mCallback.indexOfChild(paramView);
    if (i == -1) {}
    while (mBucket.get(i)) {
      return -1;
    }
    return i - mBucket.countOnesBefore(i);
  }
  
  boolean isHidden(View paramView)
  {
    return mHiddenViews.contains(paramView);
  }
  
  void removeAllViewsUnfiltered()
  {
    mBucket.reset();
    mHiddenViews.clear();
    mCallback.removeAllViews();
  }
  
  void removeView(View paramView)
  {
    int i = mCallback.indexOfChild(paramView);
    if (i < 0) {
      return;
    }
    if (mBucket.remove(i)) {
      mHiddenViews.remove(paramView);
    }
    mCallback.removeViewAt(i);
  }
  
  void removeViewAt(int paramInt)
  {
    paramInt = getOffset(paramInt);
    View localView = mCallback.getChildAt(paramInt);
    if (localView == null) {
      return;
    }
    if (mBucket.remove(paramInt)) {
      mHiddenViews.remove(localView);
    }
    mCallback.removeViewAt(paramInt);
  }
  
  boolean removeViewIfHidden(View paramView)
  {
    int i = mCallback.indexOfChild(paramView);
    if (i == -1)
    {
      if (mHiddenViews.remove(paramView)) {}
      return true;
    }
    if (mBucket.get(i))
    {
      mBucket.remove(i);
      if (!mHiddenViews.remove(paramView)) {}
      mCallback.removeViewAt(i);
      return true;
    }
    return false;
  }
  
  public String toString()
  {
    return mBucket.toString() + ", hidden list:" + mHiddenViews.size();
  }
  
  static class Bucket
  {
    long mData = 0L;
    Bucket next;
    
    Bucket() {}
    
    private void ensureNext()
    {
      if (next == null) {
        next = new Bucket();
      }
    }
    
    void clear(int paramInt)
    {
      if (paramInt >= 64)
      {
        if (next != null) {
          next.clear(paramInt - 64);
        }
        return;
      }
      mData &= (1L << paramInt ^ 0xFFFFFFFFFFFFFFFF);
    }
    
    int countOnesBefore(int paramInt)
    {
      if (next == null)
      {
        if (paramInt >= 64) {
          return Long.bitCount(mData);
        }
        return Long.bitCount(mData & (1L << paramInt) - 1L);
      }
      if (paramInt < 64) {
        return Long.bitCount(mData & (1L << paramInt) - 1L);
      }
      return next.countOnesBefore(paramInt - 64) + Long.bitCount(mData);
    }
    
    boolean get(int paramInt)
    {
      if (paramInt >= 64)
      {
        ensureNext();
        return next.get(paramInt - 64);
      }
      return (mData & 1L << paramInt) != 0L;
    }
    
    void insert(int paramInt, boolean paramBoolean)
    {
      if (paramInt >= 64)
      {
        ensureNext();
        next.insert(paramInt - 64, paramBoolean);
      }
      label109:
      label115:
      for (;;)
      {
        return;
        boolean bool;
        if ((mData & 0x8000000000000000) != 0L)
        {
          bool = true;
          long l = (1L << paramInt) - 1L;
          mData = (mData & l | (mData & (0xFFFFFFFFFFFFFFFF ^ l)) << 1);
          if (!paramBoolean) {
            break label109;
          }
          set(paramInt);
        }
        for (;;)
        {
          if ((!bool) && (next == null)) {
            break label115;
          }
          ensureNext();
          next.insert(0, bool);
          return;
          bool = false;
          break;
          clear(paramInt);
        }
      }
    }
    
    boolean remove(int paramInt)
    {
      boolean bool2;
      if (paramInt >= 64)
      {
        ensureNext();
        bool2 = next.remove(paramInt - 64);
        return bool2;
      }
      long l = 1L << paramInt;
      if ((mData & l) != 0L) {}
      for (boolean bool1 = true;; bool1 = false)
      {
        mData &= (0xFFFFFFFFFFFFFFFF ^ l);
        l -= 1L;
        mData = (mData & l | Long.rotateRight(mData & (0xFFFFFFFFFFFFFFFF ^ l), 1));
        bool2 = bool1;
        if (next == null) {
          break;
        }
        if (next.get(0)) {
          set(63);
        }
        next.remove(0);
        return bool1;
      }
    }
    
    void reset()
    {
      mData = 0L;
      if (next != null) {
        next.reset();
      }
    }
    
    void set(int paramInt)
    {
      if (paramInt >= 64)
      {
        ensureNext();
        next.set(paramInt - 64);
        return;
      }
      mData |= 1L << paramInt;
    }
    
    public String toString()
    {
      if (next == null) {
        return Long.toBinaryString(mData);
      }
      return next.toString() + "xx" + Long.toBinaryString(mData);
    }
  }
  
  static abstract interface Callback
  {
    public abstract void addView(View paramView, int paramInt);
    
    public abstract void attachViewToParent(View paramView, int paramInt, ViewGroup.LayoutParams paramLayoutParams);
    
    public abstract void detachViewFromParent(int paramInt);
    
    public abstract View getChildAt(int paramInt);
    
    public abstract int getChildCount();
    
    public abstract RecyclerView.ViewHolder getChildViewHolder(View paramView);
    
    public abstract int indexOfChild(View paramView);
    
    public abstract void removeAllViews();
    
    public abstract void removeViewAt(int paramInt);
  }
}
