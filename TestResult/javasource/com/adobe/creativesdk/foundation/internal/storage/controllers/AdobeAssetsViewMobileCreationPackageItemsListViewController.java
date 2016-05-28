package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.BitmapDrawable;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.assets.R.dimen;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.integer;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapWorker;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.DesignLibrarySpacingItemDecoration;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.MobilePackageItemsOneUpData;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileUtils;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPackagePages;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import org.lucasr.twowayview.TwoWayLayoutManager.Orientation;
import org.lucasr.twowayview.widget.GridLayoutManager;
import org.lucasr.twowayview.widget.TwoWayView;

public class AdobeAssetsViewMobileCreationPackageItemsListViewController
  extends AdobeAssetsViewRecyclerListViewController
{
  private MobileCreationPackageItemsListViewAdapter _itemsAdapter;
  private int _numColumnsInTwoWay;
  ReusableImageBitmapWorker _reusableImageWorker;
  private AdobeAssetPackagePages _targetPackage;
  private TwoWayView _twowayRecyclerView;
  private DesignLibrarySpacingItemDecoration _uniformItemSpacingItemDecoration;
  
  public AdobeAssetsViewMobileCreationPackageItemsListViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  protected RecyclerView.Adapter<RecyclerView.ViewHolder> createRecyclerViewAdapter(Context paramContext, RecyclerView paramRecyclerView)
  {
    _itemsAdapter = new MobileCreationPackageItemsListViewAdapter(paramContext);
    return _itemsAdapter;
  }
  
  protected RecyclerView getConcreteRecyclerView(Context paramContext)
  {
    return _twowayRecyclerView;
  }
  
  protected RecyclerView.ItemDecoration getItemDecoration(RecyclerView paramRecyclerView, Context paramContext)
  {
    int i = getHostActivity().getResources().getDimensionPixelSize(R.dimen.adobe_library_items_spacing_size);
    _uniformItemSpacingItemDecoration = new DesignLibrarySpacingItemDecoration(i, i);
    _numColumnsInTwoWay = getHostActivity().getResources().getInteger(R.integer.adobe_library_collections_num_columns);
    _uniformItemSpacingItemDecoration.setFixedColumn(_numColumnsInTwoWay);
    return _uniformItemSpacingItemDecoration;
  }
  
  protected RecyclerView.LayoutManager getLayoutManager(Context paramContext)
  {
    _numColumnsInTwoWay = getHostActivity().getResources().getInteger(R.integer.adobe_library_collections_num_columns);
    return new GridLayoutManager(TwoWayLayoutManager.Orientation.VERTICAL, _numColumnsInTwoWay, 1);
  }
  
  protected View getMainRootView(Context paramContext)
  {
    paramContext = ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(R.layout.adobe_assets_mobilecreations_items_view, new FrameLayout(paramContext));
    _swipeRefreshLayout = ((SwipeRefreshLayout)paramContext.findViewById(R.id.adobe_asset_mobilecreations_itemsview_swipe_refresh_layout));
    _twowayRecyclerView = ((TwoWayView)paramContext.findViewById(R.id.adobe_asset_mobilecreations_items_twowayview));
    return paramContext;
  }
  
  protected SwipeRefreshLayout getSwipeRefreshLayout()
  {
    return _swipeRefreshLayout;
  }
  
  protected void handleItemClick(View paramView, int paramInt)
  {
    if (_itemsAdapter.getPageAtPosition(paramInt) == null) {
      return;
    }
    paramView = new MobilePackageItemsOneUpData();
    _packagePages = _targetPackage;
    _itemsList = _targetPackage.getPages();
    startIndex = paramInt;
    ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).handleAssetClickAction(paramView);
  }
  
  public void setReusableImageWorker(ReusableImageBitmapWorker paramReusableImageBitmapWorker)
  {
    _reusableImageWorker = paramReusableImageBitmapWorker;
  }
  
  public void setTargetPackage(AdobeAssetPackagePages paramAdobeAssetPackagePages)
  {
    _targetPackage = paramAdobeAssetPackagePages;
  }
  
  protected class MobileCreationPackageItemsListViewAdapter
    extends RecyclerView.Adapter<RecyclerView.ViewHolder>
  {
    private final Context mContext;
    
    public MobileCreationPackageItemsListViewAdapter(Context paramContext)
    {
      mContext = paramContext;
    }
    
    public int getItemCount()
    {
      return getPackagePagesCount();
    }
    
    protected int getPackagePagesCount()
    {
      int i = 0;
      if (getPages() != null) {
        i = getPages().size();
      }
      return i;
    }
    
    public AdobeAssetFile getPageAtPosition(int paramInt)
    {
      ArrayList localArrayList = getPages();
      if ((localArrayList != null) && (paramInt >= 0) && (paramInt < localArrayList.size())) {
        return (AdobeAssetFile)localArrayList.get(paramInt);
      }
      return null;
    }
    
    protected ArrayList<AdobeAssetFile> getPages()
    {
      return _targetPackage.getPages();
    }
    
    public void onBindViewHolder(final RecyclerView.ViewHolder paramViewHolder, int paramInt)
    {
      Object localObject1 = (PackageItemCellViewHolder)paramViewHolder;
      paramViewHolder = getPageAtPosition(paramInt);
      ((PackageItemCellViewHolder)localObject1).setPage(paramViewHolder);
      if (paramViewHolder == null) {
        return;
      }
      Object localObject2 = _reusableImageWorker.loadImage(paramViewHolder.getGUID() + paramViewHolder.getMd5Hash());
      if (localObject2 == null)
      {
        localObject2 = AdobeAssetsViewBaseAbsListViewController.adjustRenditionSizeBasedOnDeviceScale(AdobeStorageAssetFileUtils.THUMBNAIL_SIZED_RENDITION);
        localObject1 = new IAdobeGenericRequestCallback()
        {
          public void onCancellation() {}
          
          public void onCompletion(byte[] paramAnonymousArrayOfByte)
          {
            _reusableImageWorker.loadImageWithData(paramViewHolder.getGUID() + paramViewHolder.getMd5Hash(), paramAnonymousArrayOfByte, new IAdobeGenericCompletionCallback()
            {
              public void onCompletion(BitmapDrawable paramAnonymous2BitmapDrawable)
              {
                if (val$packageItemCellViewHolder.getPage().equals(val$file))
                {
                  AdobeAssetsViewMobileCreationPackageItemsListViewController.MobileCreationPackageItemsListViewAdapter.PackageItemCellViewHolder.access$100(val$packageItemCellViewHolder, paramAnonymous2BitmapDrawable);
                  return;
                }
                AdobeAssetsViewMobileCreationPackageItemsListViewController.MobileCreationPackageItemsListViewAdapter.PackageItemCellViewHolder.access$100(val$packageItemCellViewHolder, (BitmapDrawable)null);
              }
            });
          }
          
          public void onError(AdobeAssetException paramAnonymousAdobeAssetException) {}
          
          public void onProgress(double paramAnonymousDouble) {}
        };
        paramViewHolder.getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, (AdobeAssetImageDimensions)localObject2, (IAdobeGenericRequestCallback)localObject1);
        return;
      }
      ((PackageItemCellViewHolder)localObject1).setImage((BitmapDrawable)localObject2);
    }
    
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      return new PackageItemCellViewHolder(LayoutInflater.from(mContext).inflate(R.layout.adobe_mobilecreation_package_item_cell, paramViewGroup, false));
    }
    
    class PackageItemCellViewHolder
      extends RecyclerView.ViewHolder
    {
      ImageView _mainThumbnailImage;
      AdobeAssetFile _page;
      
      public PackageItemCellViewHolder(View paramView)
      {
        super();
        _mainThumbnailImage = ((ImageView)paramView.findViewById(R.id.mobilecreation_item_mainImage));
      }
      
      private void setImage(BitmapDrawable paramBitmapDrawable)
      {
        _mainThumbnailImage.setVisibility(0);
        _mainThumbnailImage.setImageDrawable(paramBitmapDrawable);
      }
      
      public AdobeAssetFile getPage()
      {
        return _page;
      }
      
      public void setPage(AdobeAssetFile paramAdobeAssetFile)
      {
        _page = paramAdobeAssetFile;
      }
    }
  }
}
