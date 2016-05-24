package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Context;
import android.graphics.Color;
import android.os.Handler;
import android.os.Parcelable;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.View;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;
import java.lang.ref.WeakReference;
import org.lucasr.twowayview.ItemClickSupport;
import org.lucasr.twowayview.ItemClickSupport.OnItemClickListener;
import org.lucasr.twowayview.TwoWayLayoutManager;

public abstract class AdobeAssetsViewRecyclerListViewController
  extends AdobeAssetsViewBaseListViewController
{
  private RecyclerView.ItemDecoration _itemDecoration;
  protected RecyclerView.Adapter<RecyclerView.ViewHolder> _itemsAdapter;
  protected RecyclerView.LayoutManager _layoutManager;
  private View _mainRootView;
  private RecyclerView.OnScrollListener _onScrollListener = new RecyclerView.OnScrollListener()
  {
    public void onScrollStateChanged(RecyclerView paramAnonymousRecyclerView, int paramAnonymousInt)
    {
      if (paramAnonymousInt == 0) {
        handleScrollOffsetChange();
      }
    }
  };
  private RecyclerView _recyclerView;
  protected SwipeRefreshLayout _swipeRefreshLayout;
  
  public AdobeAssetsViewRecyclerListViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  protected void attachScrollListenerToListView()
  {
    _recyclerView.setOnScrollListener(_onScrollListener);
  }
  
  protected abstract RecyclerView.Adapter<RecyclerView.ViewHolder> createRecyclerViewAdapter(Context paramContext, RecyclerView paramRecyclerView);
  
  protected abstract RecyclerView getConcreteRecyclerView(Context paramContext);
  
  protected int getFirstVisiblePosition()
  {
    if (_recyclerView.getChildCount() == 0) {
      return 0;
    }
    return _recyclerView.getChildPosition(_recyclerView.getChildAt(0));
  }
  
  public AdobeAssetsViewBaseListViewController.InstanceState getInstanceState()
  {
    RecyclerViewInstanceState localRecyclerViewInstanceState = null;
    if (_layoutManager != null)
    {
      localRecyclerViewInstanceState = new RecyclerViewInstanceState();
      _layoutManagerState = _layoutManager.onSaveInstanceState();
    }
    return localRecyclerViewInstanceState;
  }
  
  protected abstract RecyclerView.ItemDecoration getItemDecoration(RecyclerView paramRecyclerView, Context paramContext);
  
  protected int getLastVisiblePosition()
  {
    int i = _recyclerView.getChildCount();
    if (i == 0) {
      return 0;
    }
    return _recyclerView.getChildPosition(_recyclerView.getChildAt(i - 1));
  }
  
  protected abstract RecyclerView.LayoutManager getLayoutManager(Context paramContext);
  
  protected abstract View getMainRootView(Context paramContext);
  
  public View getMainView()
  {
    return _mainRootView;
  }
  
  protected abstract SwipeRefreshLayout getSwipeRefreshLayout();
  
  protected abstract void handleItemClick(View paramView, int paramInt);
  
  void handleScrollOffsetChange()
  {
    int i = _itemsAdapter.getItemCount();
    if (i == 0) {}
    int j;
    int k;
    do
    {
      return;
      j = getFirstVisiblePosition();
      k = getLastVisiblePosition();
    } while (k / (i - (k - j)) <= 0.8D);
    ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).loadMoreItemsFromDataSource();
  }
  
  public void performInitialization(Context paramContext)
  {
    _mainRootView = getMainRootView(paramContext);
    _recyclerView = getConcreteRecyclerView(paramContext);
    _recyclerView.setHasFixedSize(recyclerViewHasFixedItemSize());
    _itemDecoration = getItemDecoration(_recyclerView, paramContext);
    _recyclerView.addItemDecoration(_itemDecoration);
    _layoutManager = getLayoutManager(paramContext);
    _recyclerView.setLayoutManager(_layoutManager);
    _swipeRefreshLayout = getSwipeRefreshLayout();
    _swipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener()
    {
      public void onRefresh()
      {
        if ((_parentContainer.get() != null) && (AdobeNetworkReachabilityUtil.getSharedInstance().isOnline()))
        {
          stopRefreshAnimation();
          ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).reloadAssetItemsFromDataSourceDueToSwipeRefresh();
        }
      }
    });
    int i = Color.parseColor("#2098f5");
    int j = Color.parseColor("#f5f9fa");
    _swipeRefreshLayout.setColorSchemeColors(new int[] { i, j, i, j });
    attachScrollListenerToListView();
    _itemsAdapter = createRecyclerViewAdapter(paramContext, _recyclerView);
    _recyclerView.setAdapter(_itemsAdapter);
    ItemClickSupport.addTo(_recyclerView).setOnItemClickListener(new ItemClickSupport.OnItemClickListener()
    {
      public void onItemClick(RecyclerView paramAnonymousRecyclerView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        handleItemClick(paramAnonymousView, paramAnonymousInt);
      }
    });
  }
  
  protected boolean recyclerViewHasFixedItemSize()
  {
    return true;
  }
  
  public void refreshDueToDataChange()
  {
    _itemsAdapter.notifyDataSetChanged();
  }
  
  public void refreshDueToNewItemsInsertion()
  {
    _itemsAdapter.notifyDataSetChanged();
  }
  
  public void refreshLayoutDueToOrientationChange()
  {
    if (_layoutManager != null) {}
    for (final int i = ((TwoWayLayoutManager)_layoutManager).getFirstVisiblePosition();; i = -1)
    {
      if (_itemDecoration != null) {
        _recyclerView.removeItemDecoration(_itemDecoration);
      }
      _layoutManager = getLayoutManager(getHostActivity());
      _recyclerView.setLayoutManager(_layoutManager);
      _itemDecoration = getItemDecoration(_recyclerView, null);
      _recyclerView.addItemDecoration(_itemDecoration);
      refreshDueToDataChange();
      if (i != -1) {
        new Handler().post(new Runnable()
        {
          public void run()
          {
            _layoutManager.scrollToPosition(i);
          }
        });
      }
      return;
    }
  }
  
  public void restoreFromState(AdobeAssetsViewBaseListViewController.InstanceState paramInstanceState)
  {
    if ((paramInstanceState != null) && (_layoutManager != null)) {
      _layoutManager.onRestoreInstanceState(_layoutManagerState);
    }
  }
  
  public void showLoadingFooter() {}
  
  public void stopRefreshAnimation()
  {
    _swipeRefreshLayout.setRefreshing(false);
  }
  
  protected class RecyclerViewInstanceState
    extends AdobeAssetsViewBaseListViewController.InstanceState
  {
    public Parcelable _layoutManagerState;
    
    protected RecyclerViewInstanceState()
    {
      super();
    }
  }
}
