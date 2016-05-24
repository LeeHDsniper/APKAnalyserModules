package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.BitmapDrawable;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.adobeinternal.storage.dcx.AdobeDCXIndexWrapper;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.integer;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.AdobeAssetDataSource;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavBaseCommandData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.commands.AdobeAssetViewNavigateCommands.NavToMobileCreationPackageCollectionData;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapWorker;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.MobilePackageItemsOneUpData;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageAssetFileUtils;
import com.adobe.creativesdk.foundation.internal.utils.AdobeLocalizedMgr;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDataSourceType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetDrawFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.AdobeAssetLineFile;
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

public class AdobeAssetsViewCompositionsListViewController
  extends AdobeAssetsViewMobileCreationsPackageCollectionListViewController
{
  public AdobeAssetsViewCompositionsListViewController(Context paramContext, AdobeAssetDataSourceType paramAdobeAssetDataSourceType)
  {
    super(paramContext, paramAdobeAssetDataSourceType);
    _dataSourceType = paramAdobeAssetDataSourceType;
  }
  
  protected RecyclerView.Adapter<RecyclerView.ViewHolder> createRecyclerViewAdapter(Context paramContext, RecyclerView paramRecyclerView)
  {
    _packageAdapter = new CompositionsListViewAdapter(paramContext);
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
  
  protected RecyclerView.LayoutManager getLayoutManager(Context paramContext)
  {
    _numColumnsInTwoWay = getHostActivity().getResources().getInteger(R.integer.adobe_library_collections_num_columns);
    return new GridLayoutManager(TwoWayLayoutManager.Orientation.VERTICAL, _numColumnsInTwoWay, 1);
  }
  
  protected void handleItemClick(View paramView, int paramInt)
  {
    paramView = _packageAdapter.getPackageAtPos(paramInt);
    if (paramView == null) {
      return;
    }
    MobilePackageItemsOneUpData localMobilePackageItemsOneUpData = new MobilePackageItemsOneUpData();
    _packagePages = paramView;
    _itemsList = paramView.getPages();
    startIndex = paramInt;
    ((IAdobeAssetContainerListViewDelegate)_parentContainer.get()).handleAssetClickAction(localMobilePackageItemsOneUpData);
  }
  
  protected class CompositionsListViewAdapter
    extends AdobeAssetsViewMobileCreationsPackageCollectionListViewController.MobileCreationPackageListViewAdapter
  {
    ArrayList<AdobeAssetPackagePages> _assetPackagePagesList;
    private final Context mContext;
    
    public CompositionsListViewAdapter(Context paramContext)
    {
      super(paramContext);
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
      paramViewHolder = (CompositionCellViewHolder)paramViewHolder;
      final AdobeAssetPackagePages localAdobeAssetPackagePages = getPackageAtPos(paramInt);
      paramViewHolder.setName(localAdobeAssetPackagePages.getName());
      paramViewHolder.setItemsCount(localAdobeAssetPackagePages);
      paramViewHolder.setPages(localAdobeAssetPackagePages);
      if ((localAdobeAssetPackagePages.getPages() == null) || (localAdobeAssetPackagePages.getPages().size() == 0))
      {
        paramViewHolder.setEmptyCell();
        return;
      }
      final ArrayList localArrayList;
      AdobeDCXIndexWrapper localAdobeDCXIndexWrapper;
      Iterator localIterator;
      while (!localIterator.hasNext())
      {
        localArrayList = new ArrayList(localAdobeAssetPackagePages.getPages());
        localAdobeDCXIndexWrapper = new AdobeDCXIndexWrapper();
        index = 0L;
        localIterator = localArrayList.iterator();
      }
      final AdobeAssetFile localAdobeAssetFile = (AdobeAssetFile)localIterator.next();
      Object localObject = _reusableImageWorker.loadImage(localAdobeAssetFile.getGUID() + localAdobeAssetFile.getMd5Hash());
      if (localObject == null)
      {
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
                  AdobeAssetsViewCompositionsListViewController.CompositionsListViewAdapter.CompositionCellViewHolder.access$000(val$packageCellViewHolder, val$pages.indexOf(val$page), paramAnonymous2BitmapDrawable);
                  return;
                }
                AdobeAssetsViewCompositionsListViewController.CompositionsListViewAdapter.CompositionCellViewHolder.access$000(val$packageCellViewHolder, val$pages.indexOf(val$page), (BitmapDrawable)null);
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
          break;
        }
        return;
        paramViewHolder.setImageAtIndex(localArrayList.indexOf(localAdobeAssetFile), (BitmapDrawable)localObject);
      }
    }
    
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      return new CompositionCellViewHolder(LayoutInflater.from(mContext).inflate(R.layout.adobe_composition_cell, paramViewGroup, false));
    }
    
    class CompositionCellViewHolder
      extends RecyclerView.ViewHolder
    {
      TextView _countView;
      ImageView _mainThumbnailImage;
      AdobeAssetPackagePages _packagePages;
      TextView _titleView;
      
      public CompositionCellViewHolder(View paramView)
      {
        super();
        _mainThumbnailImage = ((ImageView)paramView.findViewById(R.id.composition_cell_mainImage));
        _titleView = ((TextView)paramView.findViewById(R.id.compositio_cell_main_title));
        _countView = ((TextView)paramView.findViewById(R.id.composition_cell_count_text));
      }
      
      private void setImageAtIndex(long paramLong, BitmapDrawable paramBitmapDrawable)
      {
        if (paramLong == 0L)
        {
          _mainThumbnailImage.setVisibility(0);
          _mainThumbnailImage.setImageDrawable(paramBitmapDrawable);
        }
      }
      
      public AdobeAssetPackagePages getPages()
      {
        return _packagePages;
      }
      
      public void setEmptyCell()
      {
        _mainThumbnailImage.setImageDrawable(null);
      }
      
      public void setItemsCount(AdobeAssetPackagePages paramAdobeAssetPackagePages)
      {
        paramAdobeAssetPackagePages = null;
        if (_dataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourcePSMix) {
          paramAdobeAssetPackagePages = String.format("%s", new Object[] { AdobeLocalizedMgr.getLocalizedString(R.string.adobe_psmix_collection_singular) });
        }
        for (;;)
        {
          _countView.setText(paramAdobeAssetPackagePages);
          return;
          if (_dataSourceType == AdobeAssetDataSourceType.AdobeAssetDataSourceCompositions) {
            paramAdobeAssetPackagePages = String.format("%s", new Object[] { AdobeLocalizedMgr.getLocalizedString(R.string.adobe_composition_collection_singular) });
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
