package org.lucasr.twowayview.widget;

import java.util.Arrays;

class ItemEntries
{
  private int mAdapterSize;
  private BaseLayoutManager.ItemEntry[] mItemEntries;
  private boolean mRestoringItem;
  
  ItemEntries() {}
  
  private void ensureSize(int paramInt)
  {
    if (mItemEntries == null)
    {
      mItemEntries = new BaseLayoutManager.ItemEntry[Math.max(paramInt, 10) + 1];
      Arrays.fill(mItemEntries, null);
    }
    while (paramInt < mItemEntries.length) {
      return;
    }
    BaseLayoutManager.ItemEntry[] arrayOfItemEntry = mItemEntries;
    mItemEntries = new BaseLayoutManager.ItemEntry[sizeForPosition(paramInt)];
    System.arraycopy(arrayOfItemEntry, 0, mItemEntries, 0, arrayOfItemEntry.length);
    Arrays.fill(mItemEntries, arrayOfItemEntry.length, mItemEntries.length, null);
  }
  
  private int sizeForPosition(int paramInt)
  {
    int i = mItemEntries.length;
    while (i <= paramInt) {
      i *= 2;
    }
    paramInt = i;
    if (!mRestoringItem)
    {
      paramInt = i;
      if (i > mAdapterSize) {
        paramInt = mAdapterSize;
      }
    }
    return paramInt;
  }
  
  public void clear()
  {
    if (mItemEntries != null) {
      Arrays.fill(mItemEntries, null);
    }
  }
  
  public BaseLayoutManager.ItemEntry getItemEntry(int paramInt)
  {
    if ((mItemEntries == null) || (paramInt >= mItemEntries.length)) {
      return null;
    }
    return mItemEntries[paramInt];
  }
  
  public void invalidateItemLanesAfter(int paramInt)
  {
    if ((mItemEntries == null) || (paramInt >= mItemEntries.length)) {}
    for (;;)
    {
      return;
      while (paramInt < mItemEntries.length)
      {
        BaseLayoutManager.ItemEntry localItemEntry = mItemEntries[paramInt];
        if (localItemEntry != null) {
          localItemEntry.invalidateLane();
        }
        paramInt += 1;
      }
    }
  }
  
  void offsetForAddition(int paramInt1, int paramInt2)
  {
    if ((mItemEntries == null) || (paramInt1 >= mItemEntries.length)) {
      return;
    }
    ensureSize(paramInt1 + paramInt2);
    System.arraycopy(mItemEntries, paramInt1, mItemEntries, paramInt1 + paramInt2, mItemEntries.length - paramInt1 - paramInt2);
    Arrays.fill(mItemEntries, paramInt1, paramInt1 + paramInt2, null);
  }
  
  void offsetForRemoval(int paramInt1, int paramInt2)
  {
    if ((mItemEntries == null) || (paramInt1 >= mItemEntries.length)) {
      return;
    }
    ensureSize(paramInt1 + paramInt2);
    System.arraycopy(mItemEntries, paramInt1 + paramInt2, mItemEntries, paramInt1, mItemEntries.length - paramInt1 - paramInt2);
    Arrays.fill(mItemEntries, mItemEntries.length - paramInt2, mItemEntries.length, null);
  }
  
  public void putItemEntry(int paramInt, BaseLayoutManager.ItemEntry paramItemEntry)
  {
    ensureSize(paramInt);
    mItemEntries[paramInt] = paramItemEntry;
  }
  
  public void restoreItemEntry(int paramInt, BaseLayoutManager.ItemEntry paramItemEntry)
  {
    mRestoringItem = true;
    putItemEntry(paramInt, paramItemEntry);
    mRestoringItem = false;
  }
  
  public void setAdapterSize(int paramInt)
  {
    mAdapterSize = paramInt;
  }
  
  public int size()
  {
    if (mItemEntries != null) {
      return mItemEntries.length;
    }
    return 0;
  }
}
