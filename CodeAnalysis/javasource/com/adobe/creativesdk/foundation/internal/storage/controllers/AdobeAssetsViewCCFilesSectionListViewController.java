package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.app.Activity;
import android.content.Context;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.AdapterDataObserver;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageDataSource;
import com.adobe.creativesdk.foundation.internal.storage.AdobeStorageSortIndexCollation;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeAssetViewListBaseUploadAssetCellView;
import com.adobe.creativesdk.foundation.internal.storage.controllers.upload.AdobeUploadAssetCellViews.AdobeUploadAssetListCellView;
import com.adobe.creativesdk.foundation.internal.storage.controllers.utils.DividerDecoration;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;
import com.timehop.stickyheadersrecyclerview.StickyRecyclerHeadersAdapter;
import com.timehop.stickyheadersrecyclerview.StickyRecyclerHeadersDecoration;
import java.util.ArrayList;

public class AdobeAssetsViewCCFilesSectionListViewController
  extends AdobeAssetsViewCCFilesBaseListViewController
{
  private RecyclerView _recyclerView;
  
  public AdobeAssetsViewCCFilesSectionListViewController(Context paramContext)
  {
    super(paramContext);
  }
  
  protected AdobeAssetsViewBaseRecyclerViewController.AssetsListViewBaseAdapter createAssetItemsAdapter(Context paramContext)
  {
    return new CCFilesAssetsSectionalListItemsAdapter(paramContext);
  }
  
  protected AdobeAssetsViewCCFilesBaseListViewController.LocalAssetsUploadCCAssetsCombinedAdapter createUploadCombinedAdapter()
  {
    return new LocalUploadAssetsCCFilesCombinedListAdapter(getHostActivity());
  }
  
  protected RecyclerView getConcreteRecyclerView(Context paramContext)
  {
    return _recyclerView;
  }
  
  protected RecyclerView.ItemDecoration getItemDecoration(RecyclerView paramRecyclerView, Context paramContext)
  {
    return new DividerDecoration(paramContext);
  }
  
  protected RecyclerView.LayoutManager getLayoutManager(Context paramContext)
  {
    return new LinearLayoutManager(paramContext);
  }
  
  protected View getMainRootView(Context paramContext)
  {
    paramContext = ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(R.layout.adobe_storage_assets_listview, new FrameLayout(paramContext));
    _swipeRefreshLayout = ((SwipeRefreshLayout)paramContext.findViewById(R.id.listview_swipe_refresh_layout));
    _recyclerView = ((RecyclerView)paramContext.findViewById(R.id.storage_assetbrowser_listView));
    return paramContext;
  }
  
  private class AssetListSectionalAdapter
    extends RecyclerView.Adapter<AdobeAssetsViewBaseRecyclerViewController.CellViewHolder>
    implements StickyRecyclerHeadersAdapter
  {
    AdobeAssetsViewCCFilesSectionListViewController.CCFilesAssetsSectionalListItemsAdapter _assetsListItemsAdapter = null;
    
    public AssetListSectionalAdapter(AdobeAssetsViewCCFilesSectionListViewController.CCFilesAssetsSectionalListItemsAdapter paramCCFilesAssetsSectionalListItemsAdapter)
    {
      _assetsListItemsAdapter = paramCCFilesAssetsSectionalListItemsAdapter;
    }
    
    public long getHeaderId(int paramInt)
    {
      return getSectionForPosition(paramInt);
    }
    
    public int getItemCount()
    {
      return _assetsListItemsAdapter.getItemCount();
    }
    
    public int getItemViewType(int paramInt)
    {
      return _assetsListItemsAdapter.getItemViewType(paramInt);
    }
    
    public int getSectionForPosition(int paramInt)
    {
      return _assetsListItemsAdapter.getSectionForPosition(paramInt);
    }
    
    public String[] getSections()
    {
      return _assetsListItemsAdapter.getSections();
    }
    
    public void onBindHeaderViewHolder(RecyclerView.ViewHolder paramViewHolder, int paramInt)
    {
      paramViewHolder = (TextView)itemView.findViewById(R.id.adobe_storage_assetslist_group_header_view);
      paramInt = getSectionForPosition(paramInt);
      paramViewHolder.setText(getSections()[paramInt]);
    }
    
    public void onBindViewHolder(AdobeAssetsViewBaseRecyclerViewController.CellViewHolder paramCellViewHolder, int paramInt)
    {
      _assetsListItemsAdapter.onBindViewHolder(paramCellViewHolder, paramInt);
    }
    
    public RecyclerView.ViewHolder onCreateHeaderViewHolder(ViewGroup paramViewGroup)
    {
      new RecyclerView.ViewHolder(LayoutInflater.from(paramViewGroup.getContext()).inflate(R.layout.adobe_storage_assetslist_headerview, paramViewGroup, false)) {};
    }
    
    public AdobeAssetsViewBaseRecyclerViewController.CellViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      return _assetsListItemsAdapter.onCreateViewHolder(paramViewGroup, paramInt);
    }
  }
  
  protected class CCFilesAssetsSectionalListItemsAdapter
    extends AdobeAssetsViewCCFilesBaseListViewController.CCFilesAssetsListViewBaseAdapter
  {
    AdobeAssetsViewCCFilesSectionListViewController.AssetListSectionalAdapter _sectionalAdapter = null;
    StickyRecyclerHeadersDecoration headersDecor = null;
    
    public CCFilesAssetsSectionalListItemsAdapter(Context paramContext)
    {
      super(paramContext);
    }
    
    protected AdobeAssetViewListBaseCellView createAssetFileCellView(ViewGroup paramViewGroup)
    {
      AdobeAssetViewSectionalListViewAssetViewCell localAdobeAssetViewSectionalListViewAssetViewCell = new AdobeAssetViewSectionalListViewAssetViewCell();
      localAdobeAssetViewSectionalListViewAssetViewCell.initializeFromLayout(getHostActivity().getLayoutInflater(), R.layout.adobe_assetview_list_assetviewcell, paramViewGroup);
      return localAdobeAssetViewSectionalListViewAssetViewCell;
    }
    
    protected AdobeAssetViewListBaseCellView createAssetFolderCellView(ViewGroup paramViewGroup)
    {
      AdobeAssetViewSectionalListFolderViewCell localAdobeAssetViewSectionalListFolderViewCell = new AdobeAssetViewSectionalListFolderViewCell();
      localAdobeAssetViewSectionalListFolderViewCell.initializeFromLayout(getHostActivity().getLayoutInflater(), R.layout.adobe_assetview_list_folderviewcell, paramViewGroup);
      return localAdobeAssetViewSectionalListFolderViewCell;
    }
    
    public RecyclerView.Adapter getRealAdapter()
    {
      if (headersDecor == null)
      {
        headersDecor = new StickyRecyclerHeadersDecoration(_sectionalAdapter);
        _recyclerView.addItemDecoration(headersDecor);
        _sectionalAdapter.registerAdapterDataObserver(new RecyclerView.AdapterDataObserver()
        {
          public void onChanged()
          {
            headersDecor.invalidateHeaders();
          }
        });
      }
      return _sectionalAdapter;
    }
    
    public int getSectionForPosition(int paramInt)
    {
      return _ccfilesDataSource.getAdobeStorageSortIndexCollation().getSectionForPosition(paramInt);
    }
    
    public String[] getSections()
    {
      ArrayList localArrayList = _ccfilesDataSource.getAdobeStorageSortIndexCollation().sectionTitles();
      return (String[])localArrayList.toArray(new String[localArrayList.size()]);
    }
    
    public void removeHeaders()
    {
      _recyclerView.removeItemDecoration(headersDecor);
      headersDecor = null;
    }
    
    protected void setCCFolderViewAsShared(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView, AdobeAssetFolder paramAdobeAssetFolder, boolean paramBoolean)
    {
      ((AdobeAssetViewSectionalListFolderViewCell)paramAdobeAssetViewListBaseCellView).setSharedFolder(paramBoolean);
    }
  }
  
  protected class LocalUploadAssetsCCFilesCombinedListAdapter
    extends AdobeAssetsViewCCFilesBaseListViewController.LocalAssetsUploadCCAssetsCombinedAdapter
  {
    private LocalAssetListSectionalAdapter _sectionalAdapter = null;
    
    public LocalUploadAssetsCCFilesCombinedListAdapter(Context paramContext)
    {
      super(paramContext);
    }
    
    protected AdobeAssetViewListBaseUploadAssetCellView createUploadAssetCellView(ViewGroup paramViewGroup)
    {
      AdobeUploadAssetCellViews.AdobeUploadAssetListCellView localAdobeUploadAssetListCellView = new AdobeUploadAssetCellViews.AdobeUploadAssetListCellView();
      localAdobeUploadAssetListCellView.initializeFromLayout(getHostActivity().getLayoutInflater(), R.layout.adobe_assetview_list_assetviewcell, paramViewGroup);
      return localAdobeUploadAssetListCellView;
    }
    
    public RecyclerView.Adapter getRealAdapter()
    {
      return _sectionalAdapter;
    }
    
    class LocalAssetListSectionalAdapter
      extends RecyclerView.Adapter<AdobeAssetsViewBaseRecyclerViewController.CellViewHolder>
    {
      private final AdobeAssetsViewCCFilesBaseListViewController.LocalAssetsUploadCCAssetsCombinedAdapter _baseCCAdapter;
      
      public LocalAssetListSectionalAdapter(AdobeAssetsViewCCFilesBaseListViewController.LocalAssetsUploadCCAssetsCombinedAdapter paramLocalAssetsUploadCCAssetsCombinedAdapter)
      {
        _baseCCAdapter = paramLocalAssetsUploadCCAssetsCombinedAdapter;
      }
      
      public int getItemCount()
      {
        return _baseCCAdapter.getItemCount();
      }
      
      public int getItemViewType(int paramInt)
      {
        return _baseCCAdapter.getItemViewType(paramInt);
      }
      
      public void onBindViewHolder(AdobeAssetsViewBaseRecyclerViewController.CellViewHolder paramCellViewHolder, int paramInt)
      {
        _baseCCAdapter.onBindViewHolder(paramCellViewHolder, paramInt);
      }
      
      public AdobeAssetsViewBaseRecyclerViewController.CellViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
      {
        return _baseCCAdapter.onCreateViewHolder(paramViewGroup, paramInt);
      }
    }
  }
}
