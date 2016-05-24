package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeAssetViewListBaseUploadAssetCellView;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeUploadAssetCellViews.AdobeUploadAssetGridCellView;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.GridSpacesItemDecoration;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;

public class AdobeAssetsViewCCFilesGridViewController
  extends AdobeAssetsViewCCFilesBaseListViewController
{
  private RecyclerView _staggeredGridView;
  
  public AdobeAssetsViewCCFilesGridViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  protected AdobeAssetsViewBaseRecyclerViewController.AssetsListViewBaseAdapter createAssetItemsAdapter(Context paramContext)
  {
    return new CCFilesAssetsStaggeredGridAdapter(paramContext);
  }
  
  protected AdobeAssetsViewCCFilesBaseListViewController.LocalAssetsUploadCCAssetsCombinedAdapter createUploadCombinedAdapter()
  {
    return new LocalUploadAssetsCCFilesCombinedGridAdapter(getHostActivity());
  }
  
  protected RecyclerView getConcreteRecyclerView(Context paramContext)
  {
    return _staggeredGridView;
  }
  
  protected RecyclerView.ItemDecoration getItemDecoration(RecyclerView paramRecyclerView, Context paramContext)
  {
    return new GridSpacesItemDecoration(5, getHostActivity());
  }
  
  protected RecyclerView.LayoutManager getLayoutManager(Context paramContext)
  {
    switch (getResourcesgetConfigurationorientation)
    {
    }
    for (paramContext = new StaggeredGridLayoutManager(2, 1);; paramContext = new StaggeredGridLayoutManager(3, 1))
    {
      paramContext.setGapStrategy(2);
      return paramContext;
    }
  }
  
  protected View getMainRootView(Context paramContext)
  {
    paramContext = ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(R.layout.adobe_storage_assets_gridview, new FrameLayout(paramContext));
    _swipeRefreshLayout = ((SwipeRefreshLayout)paramContext.findViewById(R.id.gridview_swipe_refresh_layout));
    _staggeredGridView = ((RecyclerView)paramContext.findViewById(R.id.storage_assetbrowser_StaggeredGridView));
    return paramContext;
  }
  
  public void performInitialization(Context paramContext)
  {
    super.performInitialization(paramContext);
  }
  
  protected class CCFilesAssetsStaggeredGridAdapter
    extends AdobeAssetsViewCCFilesBaseListViewController.CCFilesAssetsListViewBaseAdapter
  {
    public CCFilesAssetsStaggeredGridAdapter(Context paramContext)
    {
      super(paramContext);
    }
    
    protected AdobeAssetViewListBaseCellView createAssetFileCellView(ViewGroup paramViewGroup)
    {
      AdobeAssetGenericStaggeredCellView localAdobeAssetGenericStaggeredCellView = new AdobeAssetGenericStaggeredCellView();
      localAdobeAssetGenericStaggeredCellView.initializeFromLayout(getHostActivity().getLayoutInflater(), R.layout.adobe_generic_staggered_assetviewcell, paramViewGroup);
      return localAdobeAssetGenericStaggeredCellView;
    }
    
    protected AdobeAssetViewListBaseCellView createAssetFolderCellView(ViewGroup paramViewGroup)
    {
      AdobeAssetViewGridFolderCellView localAdobeAssetViewGridFolderCellView = new AdobeAssetViewGridFolderCellView();
      localAdobeAssetViewGridFolderCellView.initializeFromLayout(getHostActivity().getLayoutInflater(), R.layout.adobe_assetview_assetsgrid_folderviewcell, paramViewGroup);
      return localAdobeAssetViewGridFolderCellView;
    }
    
    protected void setCCFolderViewAsShared(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetFolder paramAdobeAssetFolder, boolean paramBoolean)
    {
      ((AdobeAssetViewGridFolderCellView)paramAdobeAssetViewListBaseCellView).setSharedFolder(paramBoolean);
    }
  }
  
  protected class LocalUploadAssetsCCFilesCombinedGridAdapter
    extends AdobeAssetsViewCCFilesBaseListViewController.LocalAssetsUploadCCAssetsCombinedAdapter
  {
    public LocalUploadAssetsCCFilesCombinedGridAdapter(Context paramContext)
    {
      super(paramContext);
    }
    
    protected AdobeAssetViewListBaseUploadAssetCellView createUploadAssetCellView(ViewGroup paramViewGroup)
    {
      AdobeUploadAssetCellViews.AdobeUploadAssetGridCellView localAdobeUploadAssetGridCellView = new AdobeUploadAssetCellViews.AdobeUploadAssetGridCellView();
      localAdobeUploadAssetGridCellView.initializeFromLayout(getHostActivity().getLayoutInflater(), R.layout.adobe_generic_staggered_assetviewcell, paramViewGroup);
      return localAdobeUploadAssetGridCellView;
    }
  }
}
