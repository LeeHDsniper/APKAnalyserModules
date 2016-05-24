package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.os.AsyncTask;
import android.os.Parcelable;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.adobeinternal.net.AdobeNetworkReachability;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.internal.common.AdobeCommonApplicationContextHolder;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetFileInternal;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileUtils;
import com.adobe.creativesdk.foundation.internal.utils.AdobeCSDKException;
import com.adobe.creativesdk.foundation.internal.utils.AdobeNetworkReachabilityUtil;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;
import org.lucasr.twowayview.ItemClickSupport;
import org.lucasr.twowayview.ItemClickSupport.OnItemClickListener;
import org.lucasr.twowayview.ItemClickSupport.OnItemLongClickListener;

public abstract class AdobeAssetsViewBaseRecyclerViewController
  extends AdobeAssetsViewBaseListViewController
  implements IAdobeAssetViewListCellDelegate
{
  protected AssetsListViewBaseAdapter _assetsItemsAdapter;
  protected RecyclerView.ItemDecoration _itemDecoration;
  protected RecyclerView.LayoutManager _layoutManager;
  protected View _mainRootView;
  private RecyclerView.OnScrollListener _onScrollListener = new RecyclerView.OnScrollListener()
  {
    public void onScrollStateChanged(RecyclerView paramAnonymousRecyclerView, int paramAnonymousInt)
    {
      if (paramAnonymousInt == 0) {
        handleScrollOffsetChange();
      }
    }
  };
  protected RecyclerView _recyclerView;
  private final HashMap<String, AdobeAssetsViewCellAssetData> _requestedThumbnails = new HashMap();
  protected SwipeRefreshLayout _swipeRefreshLayout;
  
  public AdobeAssetsViewBaseRecyclerViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  public static AdobeAssetImageDimensions adjustRenditionSizeBasedOnDeviceScale(AdobeAssetImageDimensions paramAdobeAssetImageDimensions)
  {
    return new AdobeAssetImageDimensions((float)getAdjustedDimension(width), (float)getAdjustedDimension(height));
  }
  
  public static double getAdjustedDimension(float paramFloat)
  {
    DisplayMetrics localDisplayMetrics = AdobeCommonApplicationContextHolder.getSharedApplicationContextHolder().getApplicationContext().getResources().getDisplayMetrics();
    double d = paramFloat;
    if (densityDpi >= 320) {
      d = 2.0F * paramFloat;
    }
    while (densityDpi <= 160) {
      return d;
    }
    return paramFloat * 1.5D;
  }
  
  protected void attachScrollListenerToListView()
  {
    _recyclerView.setOnScrollListener(_onScrollListener);
  }
  
  abstract void cancelThumbnailRenditionRequestOfAsset(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData);
  
  protected abstract AssetsListViewBaseAdapter createAssetItemsAdapter(Context paramContext);
  
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
  
  protected abstract void handleListItemClick(int paramInt);
  
  protected void handleListItemLongClick(int paramInt) {}
  
  void handleScrollOffsetChange()
  {
    int i = getFirstVisiblePosition();
    int j = getLastVisiblePosition();
    int k = _assetsItemsAdapter.getItemCount();
    if (k == 0) {}
    while (j / (k - (j - i)) <= 0.8D) {
      return;
    }
    ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).loadMoreItemsFromDataSource();
  }
  
  protected abstract boolean isAssetSelected(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData);
  
  void loadAndDisplayThumbnail(final AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, final int paramInt)
  {
    final boolean bool = shouldFilterOutAsset(paramAdobeAssetsViewCellAssetData);
    paramAdobeAssetViewListBaseCellView.setDisabled(bool);
    AdobeAssetsViewCellAssetData localAdobeAssetsViewCellAssetData = (AdobeAssetsViewCellAssetData)_requestedThumbnails.get(guid);
    if (localAdobeAssetsViewCellAssetData != null) {
      cancelThumbnailRenditionRequestOfAsset(localAdobeAssetsViewCellAssetData);
    }
    if ((_videoDuration != null) && (_videoIndicator != null))
    {
      _videoDuration.setVisibility(8);
      _videoIndicator.setVisibility(8);
    }
    loadThumbnail(paramAdobeAssetsViewCellAssetData, new IThumbnailLoadCompletionHandler()
    {
      public void onComplete(AdobeAssetsViewCellAssetData paramAnonymousAdobeAssetsViewCellAssetData, Bitmap paramAnonymousBitmap, boolean paramAnonymousBoolean)
      {
        if (paramAdobeAssetViewListBaseCellView.getPosition() == paramInt) {
          if (!bool) {
            break label205;
          }
        }
        label205:
        for (float f = 0.3F;; f = 1.0F)
        {
          paramAdobeAssetViewListBaseCellView.displayThumnail(paramAnonymousBitmap, f, true);
          if (((originalAsset instanceof AdobeAsset)) && (paramAdobeAssetViewListBaseCellView_videoDuration != null) && (paramAdobeAssetViewListBaseCellView_videoIndicator != null))
          {
            paramAnonymousAdobeAssetsViewCellAssetData = (AdobeAsset)originalAsset;
            if ((paramAnonymousAdobeAssetsViewCellAssetData instanceof AdobeAssetFileInternal))
            {
              paramAnonymousAdobeAssetsViewCellAssetData = (AdobeAssetFileInternal)paramAnonymousAdobeAssetsViewCellAssetData;
              if (paramAnonymousAdobeAssetsViewCellAssetData.canStreamVideo())
              {
                int i = paramAnonymousAdobeAssetsViewCellAssetData.getVideoDuration();
                paramAnonymousAdobeAssetsViewCellAssetData = String.format("%02d:%02d", new Object[] { Long.valueOf(TimeUnit.MILLISECONDS.toMinutes(i)), Long.valueOf(TimeUnit.MILLISECONDS.toSeconds(i) - TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(i))) });
                paramAdobeAssetViewListBaseCellView_videoDuration.setVisibility(0);
                paramAdobeAssetViewListBaseCellView_videoIndicator.setVisibility(0);
                paramAdobeAssetViewListBaseCellView_videoDuration.setText(paramAnonymousAdobeAssetsViewCellAssetData);
                paramAdobeAssetViewListBaseCellView_videoIndicator.setImageResource(R.drawable.video_indicator);
              }
            }
          }
          return;
        }
      }
    });
  }
  
  protected abstract boolean loadAssetRendition(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, AdobeAssetFileRenditionType paramAdobeAssetFileRenditionType, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, IAdobeGenericRequestCallback<byte[], AdobeCSDKException> paramIAdobeGenericRequestCallback);
  
  void loadThumbnail(final AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, final IThumbnailLoadCompletionHandler paramIThumbnailLoadCompletionHandler)
  {
    paramIThumbnailLoadCompletionHandler = new IAdobeGenericRequestCallback()
    {
      public void onCancellation()
      {
        _requestedThumbnails.remove(paramAdobeAssetsViewCellAssetDataguid);
      }
      
      public void onCompletion(byte[] paramAnonymousArrayOfByte)
      {
        _requestedThumbnails.remove(paramAdobeAssetsViewCellAssetDataguid);
        new AsyncTask()
        {
          protected Bitmap doInBackground(byte[]... paramAnonymous2VarArgs)
          {
            paramAnonymous2VarArgs = paramAnonymous2VarArgs[0];
            if (paramAnonymous2VarArgs != null) {
              return BitmapFactory.decodeByteArray(paramAnonymous2VarArgs, 0, paramAnonymous2VarArgs.length);
            }
            return null;
          }
          
          protected void onPostExecute(Bitmap paramAnonymous2Bitmap)
          {
            if (paramAnonymous2Bitmap != null)
            {
              val$completionHandler.onComplete(val$item, paramAnonymous2Bitmap, false);
              return;
            }
            val$completionHandler.onComplete(val$item, null, false);
          }
        }.execute(new byte[][] { paramAnonymousArrayOfByte });
      }
      
      public void onError(AdobeCSDKException paramAnonymousAdobeCSDKException)
      {
        _requestedThumbnails.remove(paramAdobeAssetsViewCellAssetDataguid);
        paramIThumbnailLoadCompletionHandler.onComplete(paramAdobeAssetsViewCellAssetData, null, false);
      }
      
      public void onProgress(double paramAnonymousDouble) {}
    };
    _requestedThumbnails.put(guid, paramAdobeAssetsViewCellAssetData);
    AdobeAssetImageDimensions localAdobeAssetImageDimensions = adjustRenditionSizeBasedOnDeviceScale(AdobeStorageAssetFileUtils.THUMBNAIL_SIZED_RENDITION);
    loadAssetRendition(paramAdobeAssetsViewCellAssetData, AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, localAdobeAssetImageDimensions, paramIThumbnailLoadCompletionHandler);
  }
  
  public void performInitialization(Context paramContext)
  {
    _mainRootView = getMainRootView(paramContext);
    _recyclerView = getConcreteRecyclerView(paramContext);
    _swipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener()
    {
      public void onRefresh()
      {
        if (_parentContainer.get() != null)
        {
          if (AdobeNetworkReachabilityUtil.getSharedInstance().isOnline())
          {
            startRefreshAnimation();
            ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).reloadAssetItemsFromDataSourceDueToSwipeRefresh();
          }
        }
        else {
          return;
        }
        stopRefreshAnimation();
      }
    });
    _layoutManager = getLayoutManager(paramContext);
    _recyclerView.setLayoutManager(_layoutManager);
    _assetsItemsAdapter = createAssetItemsAdapter(paramContext);
    _recyclerView.setAdapter(_assetsItemsAdapter.getRealAdapter());
    _itemDecoration = getItemDecoration(_recyclerView, getHostActivity());
    if (_itemDecoration != null) {
      _recyclerView.addItemDecoration(_itemDecoration);
    }
    int i = Color.parseColor("#2098f5");
    int j = Color.parseColor("#f5f9fa");
    _swipeRefreshLayout.setColorSchemeColors(new int[] { i, j, i, j });
    attachScrollListenerToListView();
    paramContext = ItemClickSupport.addTo(_recyclerView);
    paramContext.setOnItemClickListener(new ItemClickSupport.OnItemClickListener()
    {
      public void onItemClick(RecyclerView paramAnonymousRecyclerView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        handleListItemClick(paramAnonymousInt);
      }
    });
    paramContext.setOnItemLongClickListener(new ItemClickSupport.OnItemLongClickListener()
    {
      public boolean onItemLongClick(RecyclerView paramAnonymousRecyclerView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        handleListItemLongClick(paramAnonymousInt);
        return true;
      }
    });
  }
  
  public void refreshDueToDataChange()
  {
    _assetsItemsAdapter.invalidateAssetsList();
    _assetsItemsAdapter.markDataSetChanged();
  }
  
  public void refreshDueToNewItemsInsertion()
  {
    refreshDueToDataChange();
  }
  
  public void refreshLayoutDueToOrientationChange()
  {
    if (_itemDecoration != null) {
      _recyclerView.removeItemDecoration(_itemDecoration);
    }
    int i;
    if (_layoutManager == null) {
      i = -1;
    }
    for (;;)
    {
      _itemDecoration = getItemDecoration(_recyclerView, getHostActivity());
      if (_itemDecoration != null) {
        _recyclerView.addItemDecoration(_itemDecoration);
      }
      refreshDueToDataChange();
      if (i != -1) {
        _layoutManager.scrollToPosition(i);
      }
      return;
      if ((_layoutManager instanceof StaggeredGridLayoutManager))
      {
        int[] arrayOfInt;
        if (_layoutManager.getChildCount() > 0)
        {
          arrayOfInt = new int[((StaggeredGridLayoutManager)_layoutManager).getSpanCount()];
          ((StaggeredGridLayoutManager)_layoutManager).findFirstVisibleItemPositions(arrayOfInt);
        }
        for (i = arrayOfInt[0];; i = -1) {
          switch (getHostActivitygetResourcesgetConfigurationorientation)
          {
          default: 
            break;
          case 1: 
            ((StaggeredGridLayoutManager)_layoutManager).setSpanCount(2);
            break;
          }
        }
        ((StaggeredGridLayoutManager)_layoutManager).setSpanCount(3);
      }
      else if ((_layoutManager instanceof LinearLayoutManager))
      {
        i = ((LinearLayoutManager)_layoutManager).findFirstVisibleItemPosition();
      }
      else
      {
        i = -1;
      }
    }
  }
  
  public void refreshOnlyListView()
  {
    _recyclerView.getAdapter().notifyDataSetChanged();
  }
  
  public void restoreFromState(AdobeAssetsViewBaseListViewController.InstanceState paramInstanceState)
  {
    if ((paramInstanceState != null) && (_layoutManager != null)) {
      _layoutManager.onRestoreInstanceState(_layoutManagerState);
    }
  }
  
  protected boolean shouldFilterOutAsset(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
  {
    return false;
  }
  
  public void showLoadingFooter() {}
  
  public void startRefreshAnimation()
  {
    _swipeRefreshLayout.setRefreshing(true);
  }
  
  public void stopRefreshAnimation()
  {
    _swipeRefreshLayout.setRefreshing(false);
  }
  
  public abstract class AssetsListViewBaseAdapter
    extends RecyclerView.Adapter<AdobeAssetsViewBaseRecyclerViewController.CellViewHolder>
  {
    protected int IGNORE_ITEM_VIEW_TYPE = -1;
    
    public AssetsListViewBaseAdapter(Context paramContext) {}
    
    private void tryAspectRatioFromAssetData(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData)
    {
      paramAdobeAssetsViewCellAssetData = optionalMetadata;
      if ((paramAdobeAssetsViewCellAssetData != null) && (paramAdobeAssetsViewCellAssetData.has("height")) && (paramAdobeAssetsViewCellAssetData.has("width"))) {}
      try
      {
        int i = paramAdobeAssetsViewCellAssetData.getInt("height");
        int j = paramAdobeAssetsViewCellAssetData.getInt("width");
        if ((i > 0) && (j > 0)) {
          paramAdobeAssetViewListBaseCellView.setAssetImageAspectRatioHint(i / j);
        }
        return;
      }
      catch (JSONException paramAdobeAssetViewListBaseCellView) {}
    }
    
    protected void bindAssetCellViewToAsset(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, int paramInt)
    {
      paramAdobeAssetViewListBaseCellView.prepareForReuse();
      paramAdobeAssetViewListBaseCellView.setTitle(title);
      paramAdobeAssetViewListBaseCellView.setGuid(guid);
      paramAdobeAssetViewListBaseCellView.setPosition(paramInt);
      paramAdobeAssetViewListBaseCellView.setCellDelegate(AdobeAssetsViewBaseRecyclerViewController.this);
      paramAdobeAssetViewListBaseCellView.setImageMD5(imageMD5Hash);
      if (isAssetSelectable(paramAdobeAssetsViewCellAssetData)) {
        paramAdobeAssetViewListBaseCellView.markSelected(isAssetSelected(paramAdobeAssetsViewCellAssetData));
      }
      tryAspectRatioFromAssetData(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData);
      handlePostCellViewBinding(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData, paramInt);
    }
    
    protected abstract AdobeAssetViewListBaseCellView createNewAssetCellView(ViewGroup paramViewGroup, int paramInt);
    
    protected abstract AdobeAssetsViewCellAssetData getAssetItemData(int paramInt);
    
    protected abstract int getAssetsCount();
    
    public AdobeAssetsViewCellAssetData getItem(int paramInt)
    {
      return getAssetItemData(paramInt);
    }
    
    public int getItemCount()
    {
      return getAssetsCount();
    }
    
    public long getItemId(int paramInt)
    {
      return 0L;
    }
    
    public int getItemViewType(int paramInt)
    {
      AdobeAssetsViewCellAssetData localAdobeAssetsViewCellAssetData = getAssetItemData(paramInt);
      if ((originalAsset instanceof AdobeAssetFile)) {
        return 0;
      }
      if ((originalAsset instanceof AdobeAssetFolder)) {
        return 1;
      }
      return IGNORE_ITEM_VIEW_TYPE;
    }
    
    public RecyclerView.Adapter getRealAdapter()
    {
      return this;
    }
    
    protected void handlePostCellViewBinding(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, int paramInt)
    {
      if (isAssetHasThumbnail(paramAdobeAssetsViewCellAssetData)) {
        loadAndDisplayThumbnail(paramAdobeAssetViewListBaseCellView, paramAdobeAssetsViewCellAssetData, paramInt);
      }
    }
    
    protected abstract void invalidateAssetsList();
    
    protected abstract boolean isAssetCellViewAlreadyRepresentAsset(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData);
    
    protected abstract boolean isAssetHasThumbnail(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData);
    
    protected abstract boolean isAssetSelectable(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData);
    
    public void markDataSetChanged()
    {
      getRealAdapter().notifyDataSetChanged();
    }
    
    public void onBindViewHolder(AdobeAssetsViewBaseRecyclerViewController.CellViewHolder paramCellViewHolder, int paramInt)
    {
      AdobeAssetViewListBaseCellView localAdobeAssetViewListBaseCellView = null;
      AdobeAssetsViewCellAssetData localAdobeAssetsViewCellAssetData = getAssetItemData(paramInt);
      if (viewTypeId == getItemViewType(paramInt)) {
        localAdobeAssetViewListBaseCellView = mainBaseListCellView;
      }
      int i = 1;
      if (localAdobeAssetViewListBaseCellView == null) {
        i = 0;
      }
      int j = i;
      if (i != 0)
      {
        j = i;
        if (localAdobeAssetViewListBaseCellView.getPosition() == paramInt) {
          if (isAssetCellViewAlreadyRepresentAsset(localAdobeAssetViewListBaseCellView, localAdobeAssetsViewCellAssetData)) {
            break label85;
          }
        }
      }
      label85:
      for (j = 1;; j = 0)
      {
        if (j != 0) {
          bindAssetCellViewToAsset(localAdobeAssetViewListBaseCellView, localAdobeAssetsViewCellAssetData, paramInt);
        }
        return;
      }
    }
    
    public AdobeAssetsViewBaseRecyclerViewController.CellViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      paramViewGroup = createNewAssetCellView(paramViewGroup, paramInt);
      Object localObject = paramViewGroup.getRootView();
      localObject = new AdobeAssetsViewBaseRecyclerViewController.CellViewHolder(AdobeAssetsViewBaseRecyclerViewController.this, (View)localObject);
      viewTypeId = paramInt;
      mainBaseListCellView = paramViewGroup;
      return localObject;
    }
  }
  
  public class CellViewHolder
    extends RecyclerView.ViewHolder
  {
    AdobeAssetViewListBaseCellView mainBaseListCellView;
    public int viewTypeId;
    
    public CellViewHolder(View paramView)
    {
      super();
    }
  }
  
  static abstract interface IThumbnailLoadCompletionHandler
  {
    public abstract void onComplete(AdobeAssetsViewCellAssetData paramAdobeAssetsViewCellAssetData, Bitmap paramBitmap, boolean paramBoolean);
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
