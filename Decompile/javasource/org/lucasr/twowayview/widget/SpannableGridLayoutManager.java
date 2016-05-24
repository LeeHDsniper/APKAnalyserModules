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

public class SpannableGridLayoutManager
  extends GridLayoutManager
{
  private boolean mMeasuring;
  
  private int getChildHeight(int paramInt)
  {
    return getLanes().getLaneSize() * paramInt;
  }
  
  private int getChildWidth(int paramInt)
  {
    return getLanes().getLaneSize() * paramInt;
  }
  
  private int getHeightUsed(View paramView)
  {
    paramView = (LayoutParams)paramView.getLayoutParams();
    return getHeight() - getPaddingTop() - getPaddingBottom() - getChildHeight(rowSpan);
  }
  
  private static int getLaneSpan(LayoutParams paramLayoutParams, boolean paramBoolean)
  {
    if (paramBoolean) {
      return colSpan;
    }
    return rowSpan;
  }
  
  private static int getLaneSpan(SpannableItemEntry paramSpannableItemEntry, boolean paramBoolean)
  {
    if (paramBoolean) {
      return colSpan;
    }
    return rowSpan;
  }
  
  private int getWidthUsed(View paramView)
  {
    paramView = (LayoutParams)paramView.getLayoutParams();
    return getWidth() - getPaddingLeft() - getPaddingRight() - getChildWidth(colSpan);
  }
  
  BaseLayoutManager.ItemEntry cacheChildLaneAndSpan(View paramView, TwoWayLayoutManager.Direction paramDirection)
  {
    int i = getPosition(paramView);
    mTempLaneInfo.setUndefined();
    SpannableItemEntry localSpannableItemEntry = (SpannableItemEntry)getItemEntryForPosition(i);
    if (localSpannableItemEntry != null) {
      mTempLaneInfo.set(startLane, anchorLane);
    }
    if (mTempLaneInfo.isUndefined()) {
      getLaneForChild(mTempLaneInfo, paramView, paramDirection);
    }
    if (localSpannableItemEntry == null)
    {
      paramView = (LayoutParams)paramView.getLayoutParams();
      paramView = new SpannableItemEntry(mTempLaneInfo.startLane, mTempLaneInfo.anchorLane, colSpan, rowSpan);
      setItemEntryForPosition(i, paramView);
      return paramView;
    }
    localSpannableItemEntry.setLane(mTempLaneInfo);
    return localSpannableItemEntry;
  }
  
  public boolean canScrollHorizontally()
  {
    return (super.canScrollHorizontally()) && (!mMeasuring);
  }
  
  public boolean canScrollVertically()
  {
    return (super.canScrollVertically()) && (!mMeasuring);
  }
  
  public boolean checkLayoutParams(RecyclerView.LayoutParams paramLayoutParams)
  {
    boolean bool = true;
    if ((width != -1) || (height != -1)) {
      bool = false;
    }
    do
    {
      do
      {
        return bool;
        if (!(paramLayoutParams instanceof LayoutParams)) {
          break label99;
        }
        paramLayoutParams = (LayoutParams)paramLayoutParams;
        if (!isVertical()) {
          break;
        }
      } while ((rowSpan >= 1) && (colSpan >= 1) && (colSpan <= getLaneCount()));
      return false;
    } while ((colSpan >= 1) && (rowSpan >= 1) && (rowSpan <= getLaneCount()));
    return false;
    label99:
    return false;
  }
  
  public LayoutParams generateDefaultLayoutParams()
  {
    return new LayoutParams(-1, -1);
  }
  
  public LayoutParams generateLayoutParams(Context paramContext, AttributeSet paramAttributeSet)
  {
    return new LayoutParams(paramContext, paramAttributeSet);
  }
  
  public LayoutParams generateLayoutParams(ViewGroup.LayoutParams paramLayoutParams)
  {
    LayoutParams localLayoutParams = new LayoutParams((ViewGroup.MarginLayoutParams)paramLayoutParams);
    width = -1;
    height = -1;
    if ((paramLayoutParams instanceof LayoutParams))
    {
      paramLayoutParams = (LayoutParams)paramLayoutParams;
      if (isVertical())
      {
        colSpan = Math.max(1, Math.min(colSpan, getLaneCount()));
        rowSpan = Math.max(1, rowSpan);
      }
    }
    else
    {
      return localLayoutParams;
    }
    colSpan = Math.max(1, colSpan);
    rowSpan = Math.max(1, Math.min(rowSpan, getLaneCount()));
    return localLayoutParams;
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
    paramDirection = (SpannableItemEntry)getItemEntryForPosition(paramInt);
    if (paramDirection != null)
    {
      paramLaneInfo.set(startLane, anchorLane);
      return;
    }
    paramLaneInfo.setUndefined();
  }
  
  int getLaneSpanForChild(View paramView)
  {
    return getLaneSpan((LayoutParams)paramView.getLayoutParams(), isVertical());
  }
  
  int getLaneSpanForPosition(int paramInt)
  {
    SpannableItemEntry localSpannableItemEntry = (SpannableItemEntry)getItemEntryForPosition(paramInt);
    if (localSpannableItemEntry == null) {
      throw new IllegalStateException("Could not find span for position " + paramInt);
    }
    return getLaneSpan(localSpannableItemEntry, isVertical());
  }
  
  void measureChildWithMargins(View paramView)
  {
    mMeasuring = true;
    measureChildWithMargins(paramView, getWidthUsed(paramView), getHeightUsed(paramView));
    mMeasuring = false;
  }
  
  protected void moveLayoutToPosition(int paramInt1, int paramInt2, RecyclerView.Recycler paramRecycler, RecyclerView.State paramState)
  {
    boolean bool = isVertical();
    Lanes localLanes = getLanes();
    localLanes.reset(0);
    int i = 0;
    while (i <= paramInt1)
    {
      SpannableItemEntry localSpannableItemEntry = (SpannableItemEntry)getItemEntryForPosition(i);
      paramState = localSpannableItemEntry;
      if (localSpannableItemEntry == null) {
        paramState = (SpannableItemEntry)cacheChildLaneAndSpan(paramRecycler.getViewForPosition(i), TwoWayLayoutManager.Direction.END);
      }
      mTempLaneInfo.set(startLane, anchorLane);
      if (mTempLaneInfo.isUndefined())
      {
        localLanes.findLane(mTempLaneInfo, getLaneSpanForPosition(i), TwoWayLayoutManager.Direction.END);
        paramState.setLane(mTempLaneInfo);
      }
      localLanes.getChildFrame(mTempRect, getChildWidth(colSpan), getChildHeight(rowSpan), mTempLaneInfo, TwoWayLayoutManager.Direction.END);
      if (i != paramInt1) {
        pushChildFrame(paramState, mTempRect, startLane, getLaneSpan(paramState, bool), TwoWayLayoutManager.Direction.END);
      }
      i += 1;
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
    public int colSpan;
    public int rowSpan;
    
    public LayoutParams(int paramInt1, int paramInt2)
    {
      super(paramInt2);
      rowSpan = 1;
      colSpan = 1;
    }
    
    public LayoutParams(Context paramContext, AttributeSet paramAttributeSet)
    {
      super(paramAttributeSet);
      paramContext = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.twowayview_SpannableGridViewChild);
      colSpan = Math.max(1, paramContext.getInt(R.styleable.twowayview_SpannableGridViewChild_twowayview_colSpan, -1));
      rowSpan = Math.max(1, paramContext.getInt(R.styleable.twowayview_SpannableGridViewChild_twowayview_rowSpan, -1));
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
        paramLayoutParams = (LayoutParams)paramLayoutParams;
        rowSpan = rowSpan;
        colSpan = colSpan;
        return;
      }
      rowSpan = 1;
      colSpan = 1;
    }
  }
  
  protected static class SpannableItemEntry
    extends BaseLayoutManager.ItemEntry
  {
    public static final Parcelable.Creator<SpannableItemEntry> CREATOR = new Parcelable.Creator()
    {
      public SpannableGridLayoutManager.SpannableItemEntry createFromParcel(Parcel paramAnonymousParcel)
      {
        return new SpannableGridLayoutManager.SpannableItemEntry(paramAnonymousParcel);
      }
      
      public SpannableGridLayoutManager.SpannableItemEntry[] newArray(int paramAnonymousInt)
      {
        return new SpannableGridLayoutManager.SpannableItemEntry[paramAnonymousInt];
      }
    };
    private final int colSpan;
    private final int rowSpan;
    
    public SpannableItemEntry(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      super(paramInt2);
      colSpan = paramInt3;
      rowSpan = paramInt4;
    }
    
    public SpannableItemEntry(Parcel paramParcel)
    {
      super();
      colSpan = paramParcel.readInt();
      rowSpan = paramParcel.readInt();
    }
    
    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      super.writeToParcel(paramParcel, paramInt);
      paramParcel.writeInt(colSpan);
      paramParcel.writeInt(rowSpan);
    }
  }
}
