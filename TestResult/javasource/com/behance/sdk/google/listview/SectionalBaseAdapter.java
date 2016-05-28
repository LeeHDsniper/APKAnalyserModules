package com.behance.sdk.google.listview;

import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.BaseAdapter;
import android.widget.SectionIndexer;

public abstract class SectionalBaseAdapter
  extends BaseAdapter
  implements AbsListView.OnScrollListener, SectionIndexer
{
  public static final String TAG = SectionalBaseAdapter.class.getSimpleName();
  boolean automaticNextPageLoading = false;
  HasMorePagesListener hasMorePagesListener;
  int initialPage = 1;
  int page = 1;
  
  public SectionalBaseAdapter() {}
  
  protected abstract void bindSectionHeader(View paramView, int paramInt, boolean paramBoolean);
  
  public abstract void configurePinnedHeader(View paramView, int paramInt1, int paramInt2);
  
  public abstract View getAmazingView(int paramInt, View paramView, ViewGroup paramViewGroup);
  
  public int getPinnedHeaderState(int paramInt)
  {
    if ((paramInt < 0) || (getCount() == 0)) {
      return 0;
    }
    int i = getPositionForSection(getSectionForPosition(paramInt) + 1);
    if ((i != -1) && (paramInt == i - 1)) {
      return 2;
    }
    return 1;
  }
  
  public abstract int getPositionForSection(int paramInt);
  
  public abstract int getSectionForPosition(int paramInt);
  
  public final View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    paramView = getAmazingView(paramInt, paramView, paramViewGroup);
    if ((paramInt == getCount() - 1) && (automaticNextPageLoading)) {
      onNextPageRequested(page + 1);
    }
    if (getPositionForSection(getSectionForPosition(paramInt)) == paramInt) {}
    for (boolean bool = true;; bool = false)
    {
      bindSectionHeader(paramView, paramInt, bool);
      return paramView;
    }
  }
  
  protected abstract void onNextPageRequested(int paramInt);
  
  public void onScroll(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3)
  {
    if ((paramAbsListView instanceof SectionalListView)) {
      ((SectionalListView)paramAbsListView).configureHeaderView(paramInt1);
    }
  }
  
  public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt) {}
  
  void setHasMorePagesListener(HasMorePagesListener paramHasMorePagesListener)
  {
    hasMorePagesListener = paramHasMorePagesListener;
  }
  
  public static abstract interface HasMorePagesListener {}
}
