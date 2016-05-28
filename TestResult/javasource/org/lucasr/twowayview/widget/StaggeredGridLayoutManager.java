package org.lucasr.twowayview.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.Recycler;
import android.support.v7.widget.RecyclerView.State;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import com.adobe.creativesdk.foundation.assets.R.styleable;
import org.lucasr.twowayview.TwoWayLayoutManager.Direction;
import org.lucasr.twowayview.TwoWayLayoutManager.Orientation;

public class StaggeredGridLayoutManager
  extends GridLayoutManager
{
  public StaggeredGridLayoutManager(TwoWayLayoutManager.Orientation paramOrientation, int paramInt1, int paramInt2)
  {
    super(paramOrientation, paramInt1, paramInt2);
  }
  
  BaseLayoutManager.ItemEntry cacheChildFrame(View paramView, Rect paramRect)
  {
    paramView = (StaggeredItemEntry)getItemEntryForPosition(getPosition(paramView));
    if (paramView == null) {
      throw new IllegalStateException("Tried to cache frame on undefined item");
    }
    cacheItemFrame(paramView, paramRect);
    return paramView;
  }
  
  BaseLayoutManager.ItemEntry cacheChildLaneAndSpan(View paramView, TwoWayLayoutManager.Direction paramDirection)
  {
    int i = getPosition(paramView);
    mTempLaneInfo.setUndefined();
    StaggeredItemEntry localStaggeredItemEntry = (StaggeredItemEntry)getItemEntryForPosition(i);
    if (localStaggeredItemEntry != null) {
      mTempLaneInfo.set(startLane, anchorLane);
    }
    if (mTempLaneInfo.isUndefined()) {
      getLaneForChild(mTempLaneInfo, paramView, paramDirection);
    }
    if (localStaggeredItemEntry == null)
    {
      paramView = new StaggeredItemEntry(mTempLaneInfo.startLane, mTempLaneInfo.anchorLane, getLaneSpanForChild(paramView));
      setItemEntryForPosition(i, paramView);
      return paramView;
    }
    localStaggeredItemEntry.setLane(mTempLaneInfo);
    return localStaggeredItemEntry;
  }
  
  void cacheItemFrame(StaggeredItemEntry paramStaggeredItemEntry, Rect paramRect)
  {
    StaggeredItemEntry.access$102(paramStaggeredItemEntry, right - left);
    StaggeredItemEntry.access$202(paramStaggeredItemEntry, bottom - top);
  }
  
  public boolean checkLayoutParams(RecyclerView.LayoutParams paramLayoutParams)
  {
    boolean bool1 = true;
    boolean bool3 = super.checkLayoutParams(paramLayoutParams);
    boolean bool2 = bool3;
    if ((paramLayoutParams instanceof LayoutParams))
    {
      paramLayoutParams = (LayoutParams)paramLayoutParams;
      if ((span < 1) || (span > getLaneCount())) {
        break label50;
      }
    }
    for (;;)
    {
      bool2 = bool3 & bool1;
      return bool2;
      label50:
      bool1 = false;
    }
  }
  
  public LayoutParams generateDefaultLayoutParams()
  {
    if (isVertical()) {
      return new LayoutParams(-1, -2);
    }
    return new LayoutParams(-2, -1);
  }
  
  public LayoutParams generateLayoutParams(Context paramContext, AttributeSet paramAttributeSet)
  {
    return new LayoutParams(paramContext, paramAttributeSet);
  }
  
  public LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    LayoutParams localLayoutParams = new LayoutParams((ViewGroup.MarginLayoutParams)paramLayoutParams);
    if (isVertical()) {
      width = -1;
    }
    for (height = height;; height = -1)
    {
      if ((paramLayoutParams instanceof LayoutParams)) {
        span = Math.max(1, Math.min(span, getLaneCount()));
      }
      return localLayoutParams;
      width = width;
    }
  }
  
  void getLaneForChild(Lanes.LaneInfo paramLaneInfo, View paramView, TwoWayLayoutManager.Direction paramDirection)
  {
    super.getLaneForChild(paramLaneInfo, paramView, paramDirection);
    if (paramLaneInfo.isUndefined()) {
      getLanes().findLane(paramLaneInfo, getLaneSpanForChild(paramView), paramDirection);
    }
  }
  
  void getLaneForPosition(Lanes.LaneInfo paramLaneInfo, int paramInt, TwoWayLayoutManager.Direction paramDirection)
  {
    paramDirection = (StaggeredItemEntry)getItemEntryForPosition(paramInt);
    if (paramDirection != null)
    {
      paramLaneInfo.set(startLane, anchorLane);
      return;
    }
    paramLaneInfo.setUndefined();
  }
  
  int getLaneSpanForChild(View paramView)
  {
    return getLayoutParamsspan;
  }
  
  int getLaneSpanForPosition(int paramInt)
  {
    StaggeredItemEntry localStaggeredItemEntry = (StaggeredItemEntry)getItemEntryForPosition(paramInt);
    if (localStaggeredItemEntry == null) {
      throw new IllegalStateException("Could not find span for position " + paramInt);
    }
    return span;
  }
  
  void moveLayoutToPosition(int paramInt1, int paramInt2, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    boolean bool = isVertical();
    Lanes localLanes = getLanes();
    localLanes.reset(0);
    int i = 0;
    if (i <= paramInt1)
    {
      paramState = (StaggeredItemEntry)getItemEntryForPosition(i);
      if (paramState != null)
      {
        mTempLaneInfo.set(startLane, anchorLane);
        if (mTempLaneInfo.isUndefined())
        {
          localLanes.findLane(mTempLaneInfo, getLaneSpanForPosition(i), TwoWayLayoutManager.Direction.END);
          paramState.setLane(mTempLaneInfo);
        }
        localLanes.getChildFrame(mTempRect, width, height, mTempLaneInfo, TwoWayLayoutManager.Direction.END);
      }
      for (;;)
      {
        if (i != paramInt1) {
          pushChildFrame(paramState, mTempRect, startLane, span, TwoWayLayoutManager.Direction.END);
        }
        i += 1;
        break;
        View localView = paramRecycler.getViewForPosition(i);
        measureChild(localView, TwoWayLayoutManager.Direction.END);
        paramState = (StaggeredItemEntry)getItemEntryForPosition(i);
        mTempLaneInfo.set(startLane, anchorLane);
        localLanes.getChildFrame(mTempRect, getDecoratedMeasuredWidth(localView), getDecoratedMeasuredHeight(localView), mTempLaneInfo, TwoWayLayoutManager.Direction.END);
        cacheItemFrame(paramState, mTempRect);
      }
    }
    localLanes.getLane(mTempLaneInfo.startLane, mTempRect);
    localLanes.reset(TwoWayLayoutManager.Direction.END);
    if (bool) {}
    for (paramInt1 = mTempRect.bottom;; paramInt1 = mTempRect.right)
    {
      localLanes.offset(paramInt2 - paramInt1);
      return;
    }
  }
  
  public static class LayoutParams
    extends RecyclerView.LayoutParams
  {
    public int span;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
      span = 1;
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.twowayview_StaggeredGridViewChild);
      span = Math.max(1, paramContext.getInt(R.styleable.twowayview_StaggeredGridViewChild_twowayview_span, -1));
      paramContext.recycle();
    }
    
    public LayoutParams(ViewGroup.MarginLayoutParams paramMarginLayoutParams)
    {
      super();
      init(paramMarginLayoutParams);
    }
    
    private void init(ViewGroup.LayoutParams paramLayoutParams)
    {
      if ((paramLayoutParams instanceof LayoutParams))
      {
        span = span;
        return;
      }
      span = 1;
    }
  }
  
  protected static class StaggeredItemEntry
    extends BaseLayoutManager.ItemEntry
  {
    public static final Parcelable.Creator<StaggeredItemEntry> CREATOR = new Parcelable.Creator()
    {
      public StaggeredGridLayoutManager.StaggeredItemEntry createFromParcel(Parcel paramAnonymousParcel)
      {
        return new StaggeredGridLayoutManager.StaggeredItemEntry(paramAnonymousParcel);
      }
      
      public StaggeredGridLayoutManager.StaggeredItemEntry[] newArray(int paramAnonymousInt)
      {
        return new StaggeredGridLayoutManager.StaggeredItemEntry[paramAnonymousInt];
      }
    };
    private int height;
    private final int span;
    private int width;
    
    public StaggeredItemEntry(int paramInt1, int paramInt2, int paramInt3)
    {
      super(paramInt2);
      span = paramInt3;
    }
    
    public StaggeredItemEntry(Parcel paramParcel)
    {
      super();
      span = paramParcel.readInt();
      width = paramParcel.readInt();
      height = paramParcel.readInt();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(span);
      paramParcel.writeInt(width);
      paramParcel.writeInt(height);
    }
  }
}
