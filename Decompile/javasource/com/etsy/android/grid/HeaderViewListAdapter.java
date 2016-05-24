package com.etsy.android.grid;

import android.database.DataSetObserver;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.ListAdapter;
import android.widget.WrapperListAdapter;
import java.util.ArrayList;
import java.util.Iterator;

public class HeaderViewListAdapter
  implements Filterable, WrapperListAdapter
{
  static final ArrayList<ExtendableListView.FixedViewInfo> EMPTY_INFO_LIST = new ArrayList();
  private final ListAdapter mAdapter;
  boolean mAreAllFixedViewsSelectable;
  ArrayList<ExtendableListView.FixedViewInfo> mFooterViewInfos;
  ArrayList<ExtendableListView.FixedViewInfo> mHeaderViewInfos;
  private final boolean mIsFilterable;
  
  public HeaderViewListAdapter(ArrayList<ExtendableListView.FixedViewInfo> paramArrayList1, ArrayList<ExtendableListView.FixedViewInfo> paramArrayList2, ListAdapter paramListAdapter)
  {
    mAdapter = paramListAdapter;
    mIsFilterable = (paramListAdapter instanceof Filterable);
    if (paramArrayList1 == null)
    {
      mHeaderViewInfos = EMPTY_INFO_LIST;
      if (paramArrayList2 != null) {
        break label79;
      }
      mFooterViewInfos = EMPTY_INFO_LIST;
      label39:
      if ((!areAllListInfosSelectable(mHeaderViewInfos)) || (!areAllListInfosSelectable(mFooterViewInfos))) {
        break label87;
      }
    }
    label79:
    label87:
    for (boolean bool = true;; bool = false)
    {
      mAreAllFixedViewsSelectable = bool;
      return;
      mHeaderViewInfos = paramArrayList1;
      break;
      mFooterViewInfos = paramArrayList2;
      break label39;
    }
  }
  
  private boolean areAllListInfosSelectable(ArrayList<ExtendableListView.FixedViewInfo> paramArrayList)
  {
    if (paramArrayList != null) {
      paramArrayList = paramArrayList.iterator();
    }
    do
    {
      if (!paramArrayList.hasNext()) {
        return true;
      }
    } while (nextisSelectable);
    return false;
  }
  
  public boolean areAllItemsEnabled()
  {
    return (mAdapter == null) || ((mAreAllFixedViewsSelectable) && (mAdapter.areAllItemsEnabled()));
  }
  
  public int getCount()
  {
    if (mAdapter != null) {
      return getFootersCount() + getHeadersCount() + mAdapter.getCount();
    }
    return getFootersCount() + getHeadersCount();
  }
  
  public Filter getFilter()
  {
    if (mIsFilterable) {
      return ((Filterable)mAdapter).getFilter();
    }
    return null;
  }
  
  public int getFootersCount()
  {
    return mFooterViewInfos.size();
  }
  
  public int getHeadersCount()
  {
    return mHeaderViewInfos.size();
  }
  
  public Object getItem(int paramInt)
  {
    int i = getHeadersCount();
    if (paramInt < i) {
      return mHeaderViewInfos.get(paramInt)).data;
    }
    int j = paramInt - i;
    paramInt = 0;
    if (mAdapter != null)
    {
      i = mAdapter.getCount();
      paramInt = i;
      if (j < i) {
        return mAdapter.getItem(j);
      }
    }
    return mFooterViewInfos.get(j - paramInt)).data;
  }
  
  public long getItemId(int paramInt)
  {
    int i = getHeadersCount();
    if ((mAdapter != null) && (paramInt >= i))
    {
      paramInt -= i;
      if (paramInt < mAdapter.getCount()) {
        return mAdapter.getItemId(paramInt);
      }
    }
    return -1L;
  }
  
  public int getItemViewType(int paramInt)
  {
    int i = getHeadersCount();
    if ((mAdapter != null) && (paramInt >= i))
    {
      paramInt -= i;
      if (paramInt < mAdapter.getCount()) {
        return mAdapter.getItemViewType(paramInt);
      }
    }
    return -2;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    int i = getHeadersCount();
    if (paramInt < i) {
      return mHeaderViewInfos.get(paramInt)).view;
    }
    int j = paramInt - i;
    paramInt = 0;
    if (mAdapter != null)
    {
      i = mAdapter.getCount();
      paramInt = i;
      if (j < i) {
        return mAdapter.getView(j, paramView, paramViewGroup);
      }
    }
    return mFooterViewInfos.get(j - paramInt)).view;
  }
  
  public int getViewTypeCount()
  {
    if (mAdapter != null) {
      return mAdapter.getViewTypeCount();
    }
    return 1;
  }
  
  public ListAdapter getWrappedAdapter()
  {
    return mAdapter;
  }
  
  public boolean hasStableIds()
  {
    if (mAdapter != null) {
      return mAdapter.hasStableIds();
    }
    return false;
  }
  
  public boolean isEmpty()
  {
    return (mAdapter == null) || (mAdapter.isEmpty());
  }
  
  public boolean isEnabled(int paramInt)
  {
    int i = getHeadersCount();
    if (paramInt < i) {
      return mHeaderViewInfos.get(paramInt)).isSelectable;
    }
    int j = paramInt - i;
    paramInt = 0;
    if (mAdapter != null)
    {
      i = mAdapter.getCount();
      paramInt = i;
      if (j < i) {
        return mAdapter.isEnabled(j);
      }
    }
    return mFooterViewInfos.get(j - paramInt)).isSelectable;
  }
  
  public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    if (mAdapter != null) {
      mAdapter.registerDataSetObserver(paramDataSetObserver);
    }
  }
  
  public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
  {
    if (mAdapter != null) {
      mAdapter.unregisterDataSetObserver(paramDataSetObserver);
    }
  }
}
