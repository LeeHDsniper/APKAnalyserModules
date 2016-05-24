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
import android.widget.LinearLayout;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXIndexWrapper;
import com.adobe.creativesdk.foundation.assets.R.dimen;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.integer;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavToMobileCreationPackageCollectionData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapWorker;
import com.adobe.creativesdk.foundation.internal.storage.controllers.designlibrary.DesignLibrarySpacingItemDecoration;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileUtils;
import com.adobe.creativesdk.foundation.internal.utils.AdobeLocalizedMgr;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetCompFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDrawFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLineFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPSMixFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPackage;
import com.adobe.creativesdk.foundation.storage.AdobeAssetPackagePages;
import com.adobe.creativesdk.foundation.storage.AdobeAssetSketchbook;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import java.lang.ref.WeakReference;
import java.net.URI;
import java.util.ArrayList;
import java.util.Iterator;
import org.lucasr.twowayview.TwoWayLayoutManager.Orientation;
import org.lucasr.twowayview.widget.GridLayoutManager;
import org.lucasr.twowayview.widget.TwoWayView;

public class AdobeAssetsViewMobileCreationsPackageCollectionListViewController
  extends AdobeAssetsViewRecyclerListViewController
{
  AdobeAssetDataSource _assetDataSource;
  AdobeAssetDataSourceType _dataSourceType;
  int _numColumnsInTwoWay;
  MobileCreationPackageListViewAdapter _packageAdapter;
  ReusableImageBitmapWorker _reusableImageWorker;
  TwoWayView _twowayRecyclerView;
  DesignLibrarySpacingItemDecoration _uniformItemSpacingItemDecoration;
  
  public AdobeAssetsViewMobileCreationsPackageCollectionListViewController(Context paramContext, AdobeAssetDataSourceType paramAdobeAssetDataSourceType)
  {
    super(paramContext);
    _dataSourceType = paramAdobeAssetDataSourceType;
  }
  
  private void invalidateCollectionList()
  {
    _packageAdapter.invalidateMobilePackageDataSources();
    _packageAdapter.notifyDataSetChanged();
  }
  
  protected RecyclerView.Adapter<RecyclerView.ViewHolder> createRecyclerViewAdapter(Context paramContext, RecyclerView paramRecyclerView)
  {
    _packageAdapter = new MobileCreationPackageListViewAdapter(paramContext);
    return _packageAdapter;
  }
  
  protected AdobeAssetViewNavigateCommands.NavBaseCommandData getAssetPackageCollectionNavigationCommand(AdobeAssetPackagePages paramAdobeAssetPackagePages)
  {
    AdobeAssetViewNavigateCommands.NavToMobileCreationPackageCollectionData localNavToMobileCreationPackageCollectionData = new AdobeAssetViewNavigateCommands.NavToMobileCreationPackageCollectionData();
    collectionGUID = paramAdobeAssetPackagePages.getGUID();
    collectionName = paramAdobeAssetPackagePages.getName();
    collectionHref = paramAdobeAssetPackagePages.getHref().toString();
    parentHref = paramAdobeAssetPackagePages.getParentHref().toString();
    assetPackagePages = paramAdobeAssetPackagePages;
    if ((paramAdobeAssetPackagePages instanceof AdobeAssetDrawFile)) {
      dataSourceType = AdobeAssetDataSourceType.AdobeAssetDataSourceDraw;
    }
    do
    {
      return localNavToMobileCreationPackageCollectionData;
      if ((paramAdobeAssetPackagePages instanceof AdobeAssetLineFile))
      {
        dataSourceType = AdobeAssetDataSourceType.AdobeAssetDataSourceLine;
        return localNavToMobileCreationPackageCollectionData;
      }
    } while (!(paramAdobeAssetPackagePages instanceof AdobeAssetSketchbook));
    dataSourceType = AdobeAssetDataSourceType.AdobeAssetDataSourceSketches;
    return localNavToMobileCreationPackageCollectionData;
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
    paramView = _packageAdapter.getPackageAtPos(paramInt);
    if (paramView != null) {
      ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).navigateToCollection(getAssetPackageCollectionNavigationCommand(paramView));
    }
  }
  
  public void refreshDueToDataChange()
  {
    invalidateCollectionList();
  }
  
  public void refreshDueToNewItemsInsertion()
  {
    invalidateCollectionList();
  }
  
  public void setMobileCreationCollectionsDataSource(AdobeAssetDataSource paramAdobeAssetDataSource)
  {
    _assetDataSource = paramAdobeAssetDataSource;
  }
  
  public void setReusableImageWorker(ReusableImageBitmapWorker paramReusableImageBitmapWorker)
  {
    _reusableImageWorker = paramReusableImageBitmapWorker;
  }
  
  protected class MobileCreationPackageListViewAdapter
    extends RecyclerView.Adapter<RecyclerView.ViewHolder>
  {
    ArrayList<AdobeAssetPackagePages> _assetPackagePagesList;
    private final Context mContext;
    
    public MobileCreationPackageListViewAdapter(Context paramContext)
    {
      mContext = paramContext;
      _assetPackagePagesList = null;
    }
    
    public int getItemCount()
    {
      return getPackagePagesCount();
    }
    
    public AdobeAssetPackagePages getPackageAtPos(int paramInt)
    {
      ArrayList localArrayList = getPackagePagesList();
      if ((localArrayList != null) && (paramInt >= 0) && (paramInt < localArrayList.size())) {
        return (AdobeAssetPackagePages)localArrayList.get(paramInt);
      }
      return null;
    }
    
    protected int getPackagePagesCount()
    {
      int i = 0;
      if (getPackagePagesList() != null) {
        i = getPackagePagesList().size();
      }
      return i;
    }
    
    protected ArrayList<AdobeAssetPackagePages> getPackagePagesList()
    {
      if ((_assetPackagePagesList == null) && (_assetDataSource != null))
      {
        _assetPackagePagesList = new ArrayList();
        if (_assetDataSource.assetsToDisplay() != null)
        {
          Iterator localIterator = _assetDataSource.assetsToDisplay().iterator();
          while (localIterator.hasNext())
          {
            AdobeAsset localAdobeAsset = (AdobeAsset)localIterator.next();
            if ((localAdobeAsset instanceof AdobeAssetPackage)) {
              _assetPackagePagesList.add((AdobeAssetPackagePages)localAdobeAsset);
            }
          }
        }
      }
      return _assetPackagePagesList;
    }
    
    public void invalidateMobilePackageDataSources()
    {
      _assetPackagePagesList = null;
    }
    
    public void onBindViewHolder(final RecyclerView.ViewHolder paramViewHolder, int paramInt)
    {
      paramViewHolder = (PackageCollectionCellViewHolder)paramViewHolder;
      final AdobeAssetPackagePages localAdobeAssetPackagePages = getPackageAtPos(paramInt);
      paramViewHolder.setName(localAdobeAssetPackagePages.getName());
      paramViewHolder.setItemsCount(localAdobeAssetPackagePages);
      paramViewHolder.setPages(localAdobeAssetPackagePages);
      if (((localAdobeAssetPackagePages instanceof AdobeAssetPSMixFile)) || ((localAdobeAssetPackagePages instanceof AdobeAssetCompFile))) {
        _threeImagesLayout.setVisibility(8);
      }
      while ((localAdobeAssetPackagePages.getPages() == null) || (localAdobeAssetPackagePages.getPages().size() == 0))
      {
        paramViewHolder.setEmptyCell();
        return;
        _threeImagesLayout.setVisibility(0);
      }
      final ArrayList localArrayList = new ArrayList(localAdobeAssetPackagePages.getPages());
      AdobeDCXIndexWrapper localAdobeDCXIndexWrapper = new AdobeDCXIndexWrapper();
      index = 0L;
      Iterator localIterator = localArrayList.iterator();
      label120:
      final AdobeAssetFile localAdobeAssetFile;
      Object localObject;
      if (localIterator.hasNext())
      {
        localAdobeAssetFile = (AdobeAssetFile)localIterator.next();
        localObject = _reusableImageWorker.loadImage(localAdobeAssetFile.getGUID() + localAdobeAssetFile.getMd5Hash());
        if (localObject != null) {
          break label310;
        }
        localObject = AdobeAssetsViewBaseAbsListViewController.adjustRenditionSizeBasedOnDeviceScale(AdobeStorageAssetFileUtils.THUMBNAIL_SIZED_RENDITION);
        IAdobeGenericRequestCallback local1 = new IAdobeGenericRequestCallback()
        {
          public void onCancellation() {}
          
          public void onCompletion(byte[] paramAnonymousArrayOfByte)
          {
            _reusableImageWorker.loadImageWithData(localAdobeAssetFile.getGUID() + localAdobeAssetFile.getMd5Hash(), paramAnonymousArrayOfByte, new IAdobeGenericCompletionCallback()
            {
              public void onCompletion(BitmapDrawable paramAnonymous2BitmapDrawable)
              {
                if (val$packageCellViewHolder.getPages().equals(val$assetPackagePages))
                {
                  AdobeAssetsViewMobileCreationsPackageCollectionListViewController.MobileCreationPackageListViewAdapter.PackageCollectionCellViewHolder.access$000(val$packageCellViewHolder, val$pages.indexOf(val$page), paramAnonymous2BitmapDrawable);
                  return;
                }
                AdobeAssetsViewMobileCreationsPackageCollectionListViewController.MobileCreationPackageListViewAdapter.PackageCollectionCellViewHolder.access$000(val$packageCellViewHolder, val$pages.indexOf(val$page), (BitmapDrawable)null);
              }
            });
          }
          
          public void onError(AdobeAssetException paramAnonymousAdobeAssetException) {}
          
          public void onProgress(double paramAnonymousDouble) {}
        };
        localAdobeAssetFile.getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, (AdobeAssetImageDimensions)localObject, local1);
      }
      for (;;)
      {
        index += 1L;
        if (index <= 3L) {
          break label120;
        }
        if (localArrayList.size() >= 4) {
          break;
        }
        switch (localArrayList.size())
        {
        default: 
          return;
        case 1: 
          _secondThumbnailImage.setImageDrawable(null);
          _thirdThumbnailImage.setImageDrawable(null);
          _fourthThumbnailImage.setImageDrawable(null);
          return;
          label310:
          paramViewHolder.setImageAtIndex(localArrayList.indexOf(localAdobeAssetFile), (BitmapDrawable)localObject);
        }
      }
      _thirdThumbnailImage.setImageDrawable(null);
      _fourthThumbnailImage.setImageDrawable(null);
      return;
      _fourthThumbnailImage.setImageDrawable(null);
    }
    
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      return new PackageCollectionCellViewHolder(LayoutInflater.from(mContext).inflate(R.layout.adobe_mobilecreation_package_cell, paramViewGroup, false));
    }
    
    class PackageCollectionCellViewHolder
      extends RecyclerView.ViewHolder
    {
      TextView _countView;
      ImageView _fourthThumbnailImage;
      ImageView _mainThumbnailImage;
      AdobeAssetPackagePages _packagePages;
      ImageView _secondThumbnailImage;
      ImageView _thirdThumbnailImage;
      LinearLayout _threeImagesLayout;
      TextView _titleView;
      
      public PackageCollectionCellViewHolder(View paramView)
      {
        super();
        _mainThumbnailImage = ((ImageView)paramView.findViewById(R.id.mobilecreation_package_mainImage));
        _secondThumbnailImage = ((ImageView)paramView.findViewById(R.id.mobilecreation_package_secondImage));
        _thirdThumbnailImage = ((ImageView)paramView.findViewById(R.id.mobilecreation_package_thirdImage));
        _fourthThumbnailImage = ((ImageView)paramView.findViewById(R.id.mobilecreation_package_FourthImage));
        _titleView = ((TextView)paramView.findViewById(R.id.mobilecreation_package_cell_main_title));
        _countView = ((TextView)paramView.findViewById(R.id.mobilecreation_package_cell_count_text));
        _threeImagesLayout = ((LinearLayout)paramView.findViewById(R.id.mobilecreation_package_threeImages));
      }
      
      private void setImageAtIndex(long paramLong, BitmapDrawable paramBitmapDrawable)
      {
        if (paramLong == 0L)
        {
          _mainThumbnailImage.setVisibility(0);
          _mainThumbnailImage.setImageDrawable(paramBitmapDrawable);
        }
        do
        {
          return;
          if (paramLong == 1L)
          {
            _secondThumbnailImage.setVisibility(0);
            _secondThumbnailImage.setImageDrawable(paramBitmapDrawable);
            return;
          }
          if (paramLong == 2L)
          {
            _thirdThumbnailImage.setVisibility(0);
            _thirdThumbnailImage.setImageDrawable(paramBitmapDrawable);
            return;
          }
        } while (paramLong != 3L);
        _fourthThumbnailImage.setVisibility(0);
        _fourthThumbnailImage.setImageDrawable(paramBitmapDrawable);
      }
      
      public AdobeAssetPackagePages getPages()
      {
        return _packagePages;
      }
      
      public void setEmptyCell()
      {
        _mainThumbnailImage.setImageDrawable(null);
        _secondThumbnailImage.setImageDrawable(null);
        _thirdThumbnailImage.setImageDrawable(null);
        _fourthThumbnailImage.setImageDrawable(null);
      }
      
      public void setItemsCount(AdobeAssetPackagePages paramAdobeAssetPackagePages)
      {
        Object localObject = null;
        int i;
        AdobeAssetDataSourceType localAdobeAssetDataSourceType;
        if (paramAdobeAssetPackagePages.getPages() == null)
        {
          i = 0;
          localAdobeAssetDataSourceType = AdobeAssetsViewMobileCreationsPackageCollectionContainerFragment.getAssetDataSourceTypeFor(paramAdobeAssetPackagePages);
          if (i != 1) {
            break label212;
          }
          if (localAdobeAssetDataSourceType != AdobeAssetDataSourceType.AdobeAssetDataSourceDraw) {
            break label76;
          }
          paramAdobeAssetPackagePages = String.format("%s %s", new Object[] { Integer.toString(i), AdobeLocalizedMgr.getLocalizedString(R.string.adobe_lineordrawcollection_singular) });
        }
        for (;;)
        {
          _countView.setText(paramAdobeAssetPackagePages);
          return;
          i = paramAdobeAssetPackagePages.getPages().size();
          break;
          label76:
          if (localAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceSketches)
          {
            paramAdobeAssetPackagePages = String.format("%s %s", new Object[] { Integer.toString(i), AdobeLocalizedMgr.getLocalizedString(R.string.adobe_sketchCollection_singular) });
          }
          else if (localAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceLine)
          {
            paramAdobeAssetPackagePages = String.format("%s %s", new Object[] { Integer.toString(i), AdobeLocalizedMgr.getLocalizedString(R.string.adobe_lineordrawcollection_singular) });
          }
          else if (localAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourcePSMix)
          {
            paramAdobeAssetPackagePages = String.format("%s", new Object[] { AdobeLocalizedMgr.getLocalizedString(R.string.adobe_psmix_collection_singular) });
          }
          else
          {
            paramAdobeAssetPackagePages = localObject;
            if (localAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceCompositions)
            {
              paramAdobeAssetPackagePages = String.format("%s", new Object[] { AdobeLocalizedMgr.getLocalizedString(R.string.adobe_composition_collection_singular) });
              continue;
              label212:
              if (localAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceDraw)
              {
                paramAdobeAssetPackagePages = String.format("%s %s", new Object[] { Integer.toString(i), AdobeLocalizedMgr.getLocalizedString(R.string.adobe_lineordrawcollection_plural) });
              }
              else if (localAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceSketches)
              {
                paramAdobeAssetPackagePages = String.format("%s %s", new Object[] { Integer.toString(i), AdobeLocalizedMgr.getLocalizedString(R.string.adobe_sketchCollection_plural) });
              }
              else if (localAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceLine)
              {
                paramAdobeAssetPackagePages = String.format("%s %s", new Object[] { Integer.toString(i), AdobeLocalizedMgr.getLocalizedString(R.string.adobe_lineordrawcollection_plural) });
              }
              else if (localAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourcePSMix)
              {
                paramAdobeAssetPackagePages = String.format("%s", new Object[] { AdobeLocalizedMgr.getLocalizedString(R.string.adobe_psmix_collection_singular) });
              }
              else
              {
                paramAdobeAssetPackagePages = localObject;
                if (localAdobeAssetDataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceCompositions) {
                  paramAdobeAssetPackagePages = String.format("%s", new Object[] { AdobeLocalizedMgr.getLocalizedString(R.string.adobe_composition_collection_singular) });
                }
              }
            }
          }
        }
      }
      
      public void setName(String paramString)
      {
        _titleView.setText(paramString);
      }
      
      public void setPages(AdobeAssetPackagePages paramAdobeAssetPackagePages)
      {
        _packagePages = paramAdobeAssetPackagePages;
      }
    }
  }
}
