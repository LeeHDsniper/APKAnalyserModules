package com.behance.sdk.google.listview;

import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ListAdapter;
import android.widget.ListView;

public class SectionalListView
  extends ListView
  implements SectionalBaseAdapter.HasMorePagesListener
{
  public static final String TAG = SectionalListView.class.getSimpleName();
  private SectionalBaseAdapter adapter;
  boolean footerViewAttached = false;
  View listFooter;
  private View mHeaderView;
  private int mHeaderViewHeight;
  private boolean mHeaderViewVisible;
  private int mHeaderViewWidth;
  
  public SectionalListView(Context paramContext)
  {
    super(paramContext);
  }
  
  public SectionalListView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public SectionalListView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  public void configureHeaderView(int paramInt)
  {
    if (mHeaderView == null) {}
    View localView;
    do
    {
      return;
      switch (adapter.getPinnedHeaderState(paramInt))
      {
      default: 
        return;
      case 0: 
        mHeaderViewVisible = false;
        return;
      case 1: 
        adapter.configurePinnedHeader(mHeaderView, paramInt, 255);
        if (mHeaderView.getTop() != 0) {
          mHeaderView.layout(0, 0, mHeaderViewWidth, mHeaderViewHeight);
        }
        mHeaderViewVisible = true;
        return;
      }
      localView = getChildAt(0);
    } while (localView == null);
    int j = localView.getBottom();
    int i = mHeaderView.getHeight();
    if (j < i) {
      j -= i;
    }
    for (i = (i + j) * 255 / i;; i = 255)
    {
      adapter.configurePinnedHeader(mHeaderView, paramInt, i);
      if (mHeaderView.getTop() != j) {
        mHeaderView.layout(0, j, mHeaderViewWidth, mHeaderViewHeight + j);
      }
      mHeaderViewVisible = true;
      return;
      j = 0;
    }
  }
  
  protected void dispatchDraw(Canvas paramCanvas)
  {
    super.dispatchDraw(paramCanvas);
    if (mHeaderViewVisible) {
      drawChild(paramCanvas, mHeaderView, getDrawingTime());
    }
  }
  
  public SectionalBaseAdapter getAdapter()
  {
    return adapter;
  }
  
  public View getLoadingView()
  {
    return listFooter;
  }
  
  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayout(paramBoolean, paramInt1, paramInt2, paramInt3, paramInt4);
    if (mHeaderView != null)
    {
      mHeaderView.layout(0, 0, mHeaderViewWidth, mHeaderViewHeight);
      configureHeaderView(getFirstVisiblePosition());
    }
  }
  
  protected void onMeasure(int paramInt1, int paramInt2)
  {
    super.onMeasure(paramInt1, paramInt2);
    if (mHeaderView != null)
    {
      measureChild(mHeaderView, paramInt1, paramInt2);
      mHeaderViewWidth = getMeasuredWidth();
      mHeaderViewHeight = mHeaderView.getMeasuredHeight();
    }
  }
  
  public void setAdapter(ListAdapter paramListAdapter)
  {
    if (!(paramListAdapter instanceof SectionalBaseAdapter)) {
      throw new IllegalArgumentException(SectionalListView.class.getSimpleName() + " must use adapter of type " + SectionalBaseAdapter.class.getSimpleName());
    }
    if (adapter != null)
    {
      adapter.setHasMorePagesListener(null);
      setOnScrollListener(null);
    }
    adapter = ((SectionalBaseAdapter)paramListAdapter);
    ((SectionalBaseAdapter)paramListAdapter).setHasMorePagesListener(this);
    setOnScrollListener((SectionalBaseAdapter)paramListAdapter);
    View localView = new View(getContext());
    super.addFooterView(localView);
    super.setAdapter(paramListAdapter);
    super.removeFooterView(localView);
  }
  
  public void setLoadingView(View paramView)
  {
    listFooter = paramView;
  }
  
  public void setPinnedHeaderView(View paramView)
  {
    mHeaderView = paramView;
    if (mHeaderView != null) {
      setFadingEdgeLength(0);
    }
    requestLayout();
  }
}
