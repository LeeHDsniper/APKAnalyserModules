package org.lucasr.twowayview.widget;

import android.graphics.Rect;
import org.lucasr.twowayview.TwoWayLayoutManager.Direction;
import org.lucasr.twowayview.TwoWayLayoutManager.Orientation;

class Lanes
{
  private Integer mInnerEnd;
  private Integer mInnerStart;
  private final boolean mIsVertical;
  private final int mLaneSize;
  private final Rect[] mLanes;
  private final BaseLayoutManager mLayout;
  private final Rect[] mSavedLanes;
  private final LaneInfo mTempLaneInfo = new LaneInfo();
  private final Rect mTempRect = new Rect();
  
  public Lanes(BaseLayoutManager paramBaseLayoutManager, int paramInt)
  {
    mLayout = paramBaseLayoutManager;
    mIsVertical = paramBaseLayoutManager.isVertical();
    mLanes = new Rect[paramInt];
    mSavedLanes = new Rect[paramInt];
    int i = 0;
    while (i < paramInt)
    {
      mLanes[i] = new Rect();
      mSavedLanes[i] = new Rect();
      i += 1;
    }
    mLaneSize = calculateLaneSize(paramBaseLayoutManager, paramInt);
    int i1 = paramBaseLayoutManager.getPaddingLeft();
    int i2 = paramBaseLayoutManager.getPaddingTop();
    i = 0;
    if (i < paramInt)
    {
      int j = i * mLaneSize;
      label142:
      int m;
      int n;
      if (mIsVertical)
      {
        k = j;
        m = i1 + k;
        if (mIsVertical) {
          j = 0;
        }
        n = i2 + j;
        if (!mIsVertical) {
          break label223;
        }
        j = m + mLaneSize;
        label182:
        if (!mIsVertical) {
          break label230;
        }
      }
      label223:
      label230:
      for (int k = n;; k = n + mLaneSize)
      {
        mLanes[i].set(m, n, j, k);
        i += 1;
        break;
        k = 0;
        break label142;
        j = m;
        break label182;
      }
    }
  }
  
  public Lanes(BaseLayoutManager paramBaseLayoutManager, TwoWayLayoutManager.Orientation paramOrientation, Rect[] paramArrayOfRect, int paramInt)
  {
    mLayout = paramBaseLayoutManager;
    if (paramOrientation == TwoWayLayoutManager.Orientation.VERTICAL) {}
    for (boolean bool = true;; bool = false)
    {
      mIsVertical = bool;
      mLanes = paramArrayOfRect;
      mLaneSize = paramInt;
      mSavedLanes = new Rect[mLanes.length];
      paramInt = 0;
      while (paramInt < mLanes.length)
      {
        mSavedLanes[paramInt] = new Rect();
        paramInt += 1;
      }
    }
  }
  
  public static int calculateLaneSize(BaseLayoutManager paramBaseLayoutManager, int paramInt)
  {
    if (paramBaseLayoutManager.isVertical())
    {
      i = paramBaseLayoutManager.getPaddingLeft();
      j = paramBaseLayoutManager.getPaddingRight();
      return (paramBaseLayoutManager.getWidth() - i - j) / paramInt;
    }
    int i = paramBaseLayoutManager.getPaddingTop();
    int j = paramBaseLayoutManager.getPaddingBottom();
    return (paramBaseLayoutManager.getHeight() - i - j) / paramInt;
  }
  
  private int findLaneThatFitsSpan(int paramInt1, int paramInt2, TwoWayLayoutManager.Direction paramDirection)
  {
    int i = Math.max(0, paramInt1 - paramInt2 + 1);
    int m = Math.min(i + paramInt2, mLanes.length - paramInt2 + 1);
    while (i < m)
    {
      mTempLaneInfo.set(i, paramInt1);
      Rect localRect = mTempRect;
      int j;
      if (mIsVertical)
      {
        j = paramInt2 * mLaneSize;
        if (!mIsVertical) {
          break label115;
        }
      }
      label115:
      for (int k = 1;; k = paramInt2 * mLaneSize)
      {
        getChildFrame(localRect, j, k, mTempLaneInfo, paramDirection);
        if (intersects(i, paramInt2, mTempRect)) {
          break label126;
        }
        return i;
        j = 1;
        break;
      }
      label126:
      i += 1;
    }
    return -1;
  }
  
  private boolean intersects(int paramInt1, int paramInt2, Rect paramRect)
  {
    int i = paramInt1;
    while (i < paramInt1 + paramInt2)
    {
      if (Rect.intersects(mLanes[i], paramRect)) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  private void invalidateEdges()
  {
    mInnerStart = null;
    mInnerEnd = null;
  }
  
  private void offsetLane(int paramInt1, int paramInt2)
  {
    Rect localRect = mLanes[paramInt1];
    if (mIsVertical)
    {
      paramInt1 = 0;
      if (!mIsVertical) {
        break label35;
      }
    }
    for (;;)
    {
      localRect.offset(paramInt1, paramInt2);
      return;
      paramInt1 = paramInt2;
      break;
      label35:
      paramInt2 = 0;
    }
  }
  
  public void findLane(LaneInfo paramLaneInfo, int paramInt, TwoWayLayoutManager.Direction paramDirection)
  {
    paramLaneInfo.setUndefined();
    int j;
    int k;
    if (paramDirection == TwoWayLayoutManager.Direction.END)
    {
      i = Integer.MAX_VALUE;
      j = 0;
      k = i;
      label22:
      if (j >= mLanes.length) {
        return;
      }
      if (!mIsVertical) {
        break label161;
      }
      if (paramDirection != TwoWayLayoutManager.Direction.END) {
        break label146;
      }
    }
    label146:
    for (int i = mLanes[j].bottom;; i = mLanes[j].top)
    {
      int m;
      if ((paramDirection != TwoWayLayoutManager.Direction.END) || (i >= k))
      {
        m = k;
        if (paramDirection == TwoWayLayoutManager.Direction.START)
        {
          m = k;
          if (i <= k) {}
        }
      }
      else
      {
        int n = findLaneThatFitsSpan(j, paramInt, paramDirection);
        m = k;
        if (n != -1)
        {
          paramLaneInfo.set(n, j);
          m = i;
        }
      }
      j += 1;
      k = m;
      break label22;
      i = Integer.MIN_VALUE;
      break;
    }
    label161:
    if (paramDirection == TwoWayLayoutManager.Direction.END) {}
    for (i = mLanes[j].right;; i = mLanes[j].left) {
      break;
    }
  }
  
  public void getChildFrame(Rect paramRect, int paramInt1, int paramInt2, LaneInfo paramLaneInfo, TwoWayLayoutManager.Direction paramDirection)
  {
    Rect localRect = mLanes[startLane];
    if (paramDirection == TwoWayLayoutManager.Direction.END)
    {
      i = anchorLane;
      paramLaneInfo = mLanes[i];
      if (!mIsVertical) {
        break label116;
      }
      left = left;
      if (paramDirection != TwoWayLayoutManager.Direction.END) {
        break label104;
      }
    }
    label104:
    for (int i = bottom;; i = top - paramInt2)
    {
      top = i;
      right = (left + paramInt1);
      bottom = (top + paramInt2);
      return;
      i = startLane;
      break;
    }
    label116:
    top = top;
    if (paramDirection == TwoWayLayoutManager.Direction.END) {}
    for (i = right;; i = left - paramInt1)
    {
      left = i;
      break;
    }
  }
  
  public int getCount()
  {
    return mLanes.length;
  }
  
  public int getInnerEnd()
  {
    if (mInnerEnd != null) {
      return mInnerEnd.intValue();
    }
    mInnerEnd = Integer.valueOf(Integer.MAX_VALUE);
    int i = 0;
    if (i < mLanes.length)
    {
      Rect localRect = mLanes[i];
      int k = mInnerEnd.intValue();
      if (mIsVertical) {}
      for (int j = bottom;; j = right)
      {
        mInnerEnd = Integer.valueOf(Math.min(k, j));
        i += 1;
        break;
      }
    }
    return mInnerEnd.intValue();
  }
  
  public int getInnerStart()
  {
    if (mInnerStart != null) {
      return mInnerStart.intValue();
    }
    mInnerStart = Integer.valueOf(Integer.MIN_VALUE);
    int i = 0;
    if (i < mLanes.length)
    {
      Rect localRect = mLanes[i];
      int k = mInnerStart.intValue();
      if (mIsVertical) {}
      for (int j = top;; j = left)
      {
        mInnerStart = Integer.valueOf(Math.max(k, j));
        i += 1;
        break;
      }
    }
    return mInnerStart.intValue();
  }
  
  public void getLane(int paramInt, Rect paramRect)
  {
    paramRect.set(mLanes[paramInt]);
  }
  
  public int getLaneSize()
  {
    return mLaneSize;
  }
  
  public TwoWayLayoutManager.Orientation getOrientation()
  {
    if (mIsVertical) {
      return TwoWayLayoutManager.Orientation.VERTICAL;
    }
    return TwoWayLayoutManager.Orientation.HORIZONTAL;
  }
  
  public void offset(int paramInt)
  {
    int i = 0;
    while (i < mLanes.length)
    {
      offset(i, paramInt);
      i += 1;
    }
    invalidateEdges();
  }
  
  public void offset(int paramInt1, int paramInt2)
  {
    offsetLane(paramInt1, paramInt2);
    invalidateEdges();
  }
  
  public void popChildFrame(Rect paramRect, int paramInt1, int paramInt2, TwoWayLayoutManager.Direction paramDirection)
  {
    Rect localRect = mLanes[paramInt1];
    if (mIsVertical) {
      if (paramDirection == TwoWayLayoutManager.Direction.END) {
        top = (bottom - paramInt2);
      }
    }
    for (;;)
    {
      invalidateEdges();
      return;
      bottom = (top + paramInt2);
      continue;
      if (paramDirection == TwoWayLayoutManager.Direction.END) {
        left = (right - paramInt2);
      } else {
        right = (left + paramInt2);
      }
    }
  }
  
  public int pushChildFrame(Rect paramRect, int paramInt1, int paramInt2, TwoWayLayoutManager.Direction paramDirection)
  {
    Rect localRect = mLanes[paramInt1];
    if (mIsVertical) {
      if (paramDirection == TwoWayLayoutManager.Direction.END)
      {
        paramInt1 = top - bottom;
        bottom += paramInt2;
      }
    }
    for (;;)
    {
      invalidateEdges();
      return paramInt1;
      paramInt1 = bottom - top;
      top -= paramInt2;
      continue;
      if (paramDirection == TwoWayLayoutManager.Direction.END)
      {
        paramInt1 = left - right;
        right += paramInt2;
      }
      else
      {
        paramInt1 = right - left;
        left -= paramInt2;
      }
    }
  }
  
  public void reset(int paramInt)
  {
    int i = 0;
    if (i < mLanes.length)
    {
      Rect localRect = mLanes[i];
      int j;
      label32:
      int k;
      if (mIsVertical)
      {
        j = left;
        if (!mIsVertical) {
          break label79;
        }
        k = paramInt;
        label42:
        localRect.offsetTo(j, k);
        if (!mIsVertical) {
          break label89;
        }
        bottom = top;
      }
      for (;;)
      {
        i += 1;
        break;
        j = paramInt;
        break label32;
        label79:
        k = top;
        break label42;
        label89:
        right = left;
      }
    }
    invalidateEdges();
  }
  
  public void reset(TwoWayLayoutManager.Direction paramDirection)
  {
    int i = 0;
    if (i < mLanes.length)
    {
      Rect localRect = mLanes[i];
      if (mIsVertical) {
        if (paramDirection == TwoWayLayoutManager.Direction.START) {
          bottom = top;
        }
      }
      for (;;)
      {
        i += 1;
        break;
        top = bottom;
        continue;
        if (paramDirection == TwoWayLayoutManager.Direction.START) {
          right = left;
        } else {
          left = right;
        }
      }
    }
    invalidateEdges();
  }
  
  public void restore()
  {
    int i = 0;
    while (i < mLanes.length)
    {
      mLanes[i].set(mSavedLanes[i]);
      i += 1;
    }
  }
  
  public void save()
  {
    int i = 0;
    while (i < mLanes.length)
    {
      mSavedLanes[i].set(mLanes[i]);
      i += 1;
    }
  }
  
  public static class LaneInfo
  {
    public int anchorLane;
    public int startLane;
    
    public LaneInfo() {}
    
    public boolean isUndefined()
    {
      return (startLane == -1) || (anchorLane == -1);
    }
    
    public void set(int paramInt1, int paramInt2)
    {
      startLane = paramInt1;
      anchorLane = paramInt2;
    }
    
    public void setUndefined()
    {
      startLane = -1;
      anchorLane = -1;
    }
  }
}
