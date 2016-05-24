package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeUXAssetOneUpViewerActivity;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapWorker;
import com.adobe.creativesdk.foundation.internal.storage.model.util.AdobeStorageUtils;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import java.lang.ref.WeakReference;
import org.json.JSONObject;

public class AdobeAssetAutoFitRecyclerViewController
{
  protected RecyclerView _absRecyclerView;
  protected boolean _areCellsVisible;
  protected AdobeAsset _asset;
  protected AdobeOneUpRecyclerViewBaseAdapter _assetsItemsAdapter;
  AdobeMultiPageFragmentController _fragmentController;
  protected LinearLayoutManager _layoutManager;
  protected View _mainRootView;
  protected TextView _multiPageSectionalTextView;
  protected View _mutiPageSectionalHeader;
  protected View _nointernet;
  protected Context _oneUpViewContext;
  private WeakReference<ReusableImageBitmapWorker> _reusableBitmapCacheWorker;
  protected View _spinner;
  private boolean isNetworkOnline = true;
  protected View no_network_banner;
  protected int num_pages = 1;
  
  public AdobeAssetAutoFitRecyclerViewController() {}
  
  private int checkPageCount(AdobeAsset paramAdobeAsset)
  {
    if ((paramAdobeAsset instanceof AdobeAssetFile))
    {
      paramAdobeAsset = (AdobeAssetFile)paramAdobeAsset;
      if (paramAdobeAsset.getOptionalMetadata() != null) {
        num_pages = paramAdobeAsset.getOptionalMetadata().optInt("pages", 1);
      }
      return num_pages;
    }
    return 0;
  }
  
  private void handleAssetImageData(byte[] paramArrayOfByte, final AdobeAssetAutoFitRecyclerCellView paramAdobeAssetAutoFitRecyclerCellView, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, final int paramInt)
  {
    if (_mainRootView == null) {}
    while (paramArrayOfByte == null) {
      return;
    }
    if (isReusableWorkerValid())
    {
      ((ReusableImageBitmapWorker)_reusableBitmapCacheWorker.get()).loadImageWithData(AdobeStorageUtils.cacheKeyForAsset(_asset, AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, paramAdobeAssetImageDimensions, paramInt), paramArrayOfByte, new IAdobeGenericCompletionCallback()
      {
        public void onCompletion(BitmapDrawable paramAnonymousBitmapDrawable)
        {
          if (_mainRootView == null) {}
          while (paramAnonymousBitmapDrawable == null) {
            return;
          }
          paramAdobeAssetAutoFitRecyclerCellView.displayThumbnail(paramAnonymousBitmapDrawable, paramInt);
          if (!_areCellsVisible)
          {
            _areCellsVisible = true;
            AdobeAssetAutoFitRecyclerViewController.this.handleImageCellVisibilty();
          }
          _areCellsVisible = true;
          _spinner.setVisibility(4);
        }
      });
      return;
    }
    paramAdobeAssetImageDimensions = null;
    if (paramArrayOfByte != null) {
      paramAdobeAssetImageDimensions = BitmapFactory.decodeByteArray(paramArrayOfByte, 0, paramArrayOfByte.length);
    }
    if (paramAdobeAssetImageDimensions == null) {}
    paramAdobeAssetAutoFitRecyclerCellView.displayThumbnail(paramAdobeAssetImageDimensions, paramInt);
    if (!_areCellsVisible)
    {
      _areCellsVisible = true;
      handleImageCellVisibilty();
    }
    _areCellsVisible = true;
    _spinner.setVisibility(4);
  }
  
  private void handleImageCellVisibilty()
  {
    if (!isNetworkOnline()) {
      _fragmentController.wentOffline();
    }
  }
  
  private boolean isNetworkOnline()
  {
    return isNetworkOnline;
  }
  
  private boolean isReusableWorkerValid()
  {
    return (_reusableBitmapCacheWorker != null) && (_reusableBitmapCacheWorker.get() != null);
  }
  
  protected AdobeOneUpRecyclerViewBaseAdapter createRecyclerViewAdapter(Context paramContext)
  {
    return new AdobeOneUpRecyclerViewBaseAdapter();
  }
  
  protected View getMainRootView()
  {
    _absRecyclerView = ((RecyclerView)_mainRootView.findViewById(R.id.multipage_recyclerview));
    _mutiPageSectionalHeader = _mainRootView.findViewById(R.id.asset_one_up_multi_page_recycler_section_container);
    _multiPageSectionalTextView = ((TextView)_mainRootView.findViewById(R.id.asset_one_up_multi_page_recycler_section_textview));
    return _mainRootView;
  }
  
  public void performInitialization(Context paramContext)
  {
    getMainRootView();
    _oneUpViewContext = paramContext;
    _layoutManager = ((LinearLayoutManager)_absRecyclerView.getLayoutManager());
    _assetsItemsAdapter = createRecyclerViewAdapter(paramContext);
    _absRecyclerView.setAdapter(_assetsItemsAdapter);
    _mutiPageSectionalHeader.setVisibility(0);
    _mutiPageSectionalHeader.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        _fragmentController.displayListView();
      }
    });
    _absRecyclerView.addOnItemTouchListener(new RecyclerItemClickListener(paramContext, _absRecyclerView, new RecyclerItemClickListener.OnItemClickListener()
    {
      public void onItemClick(View paramAnonymousView, int paramAnonymousInt)
      {
        _fragmentController.setState(AdobeMultiPageViewState.AdobeMultiPageGridView);
        _fragmentController.displayViewPager(paramAnonymousInt);
      }
      
      public void onItemLongClick(View paramAnonymousView, int paramAnonymousInt) {}
    }));
    _multiPageSectionalTextView.setText(String.format(_oneUpViewContext.getResources().getString(R.string.adobe_asset_view_multi_page_count), new Object[] { Integer.valueOf(checkPageCount(_asset)) }));
    _absRecyclerView.addItemDecoration(new MarginDecoration(_oneUpViewContext));
    _spinner = _mainRootView.findViewById(R.id.asset_image_progressbar_new);
    _nointernet = _mainRootView.findViewById(R.id.asset_viewer_no_internet_connection);
    no_network_banner = _mainRootView.findViewById(R.id.gridview_container_no_network_notification_bar);
    if (!AdobeUXAssetOneUpViewerActivity.isNetworkAvailable())
    {
      _nointernet.setVisibility(0);
      isNetworkOnline = false;
    }
    for (;;)
    {
      _areCellsVisible = false;
      return;
      _spinner.setVisibility(0);
    }
  }
  
  public void requestRelayout()
  {
    _assetsItemsAdapter.notifyDataSetChanged();
  }
  
  public void setAsset(AdobeAsset paramAdobeAsset)
  {
    _asset = paramAdobeAsset;
  }
  
  public void setFragmentController(AdobeMultiPageFragmentController paramAdobeMultiPageFragmentController)
  {
    _fragmentController = paramAdobeMultiPageFragmentController;
  }
  
  public void setMainRootView(View paramView)
  {
    _mainRootView = paramView;
  }
  
  public void setReuseableBitmapCacheWorker(ReusableImageBitmapWorker paramReusableImageBitmapWorker)
  {
    if (paramReusableImageBitmapWorker == null) {
      return;
    }
    _reusableBitmapCacheWorker = new WeakReference(paramReusableImageBitmapWorker);
  }
  
  public void wentOffline()
  {
    isNetworkOnline = false;
    if (_areCellsVisible == true)
    {
      no_network_banner.setVisibility(0);
      _nointernet.setVisibility(8);
      return;
    }
    _nointernet.setVisibility(0);
    no_network_banner.setVisibility(4);
    _spinner.setVisibility(4);
  }
  
  public void wentOnline()
  {
    isNetworkOnline = true;
    no_network_banner.setVisibility(4);
    _nointernet.setVisibility(4);
    if (!_areCellsVisible)
    {
      _spinner.setVisibility(0);
      requestRelayout();
    }
  }
  
  protected class AdobeOneUpRecyclerViewBaseAdapter
    extends RecyclerView.Adapter<RecyclerView.ViewHolder>
  {
    protected AdobeOneUpRecyclerViewBaseAdapter() {}
    
    public int getItemCount()
    {
      if ((_asset instanceof AdobeAssetFile))
      {
        AdobeAssetFile localAdobeAssetFile = (AdobeAssetFile)_asset;
        if (localAdobeAssetFile.getOptionalMetadata() != null) {
          num_pages = localAdobeAssetFile.getOptionalMetadata().optInt("pages", 1);
        }
        return num_pages;
      }
      return -1;
    }
    
    public void onBindViewHolder(final RecyclerView.ViewHolder paramViewHolder, final int paramInt)
    {
      paramViewHolder = ((AdobeOneUpRecyclerCellViewHolder)paramViewHolder).getCellView();
      paramViewHolder.setCellPos(paramInt);
      paramViewHolder.prepareForReuse();
      paramViewHolder.getRootView().measure(0, 0);
      final AdobeAssetImageDimensions localAdobeAssetImageDimensions = new AdobeAssetImageDimensions(paramViewHolder.getRootView().getMeasuredWidth(), paramViewHolder.getRootView().getMeasuredHeight());
      if ((_asset instanceof AdobeAssetFile))
      {
        IAdobeGenericRequestCallback local1 = new IAdobeGenericRequestCallback()
        {
          public void onCancellation()
          {
            AdobeAssetAutoFitRecyclerViewController.this.handleAssetImageData(null, paramViewHolder, localAdobeAssetImageDimensions, paramInt);
          }
          
          public void onCompletion(byte[] paramAnonymousArrayOfByte)
          {
            AdobeAssetAutoFitRecyclerViewController.this.handleAssetImageData(paramAnonymousArrayOfByte, paramViewHolder, localAdobeAssetImageDimensions, paramInt);
          }
          
          public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
          {
            AdobeAssetAutoFitRecyclerViewController.this.handleAssetImageData(null, paramViewHolder, localAdobeAssetImageDimensions, paramInt);
          }
          
          public void onProgress(double paramAnonymousDouble) {}
        };
        int j = 1;
        int i = j;
        if (AdobeAssetAutoFitRecyclerViewController.this.isReusableWorkerValid())
        {
          BitmapDrawable localBitmapDrawable = ((ReusableImageBitmapWorker)_reusableBitmapCacheWorker.get()).loadImage(AdobeStorageUtils.cacheKeyForAsset(_asset, AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, localAdobeAssetImageDimensions, paramInt));
          i = j;
          if (localBitmapDrawable != null)
          {
            paramViewHolder.displayThumbnail(localBitmapDrawable, paramInt);
            i = 0;
            _areCellsVisible = true;
            _spinner.setVisibility(4);
          }
        }
        if (i != 0) {
          ((AdobeAssetFile)_asset).getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, localAdobeAssetImageDimensions, paramInt, local1);
        }
      }
    }
    
    public AdobeOneUpRecyclerCellViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      return new AdobeOneUpRecyclerCellViewHolder(LayoutInflater.from(paramViewGroup.getContext()).inflate(R.layout.adobe_multipage_autorecycler_cellview, paramViewGroup, false));
    }
    
    class AdobeOneUpRecyclerCellViewHolder
      extends RecyclerView.ViewHolder
      implements View.OnClickListener
    {
      AdobeAssetAutoFitRecyclerCellView imageCellView = new AdobeAssetAutoFitRecyclerCellView();
      
      public AdobeOneUpRecyclerCellViewHolder(View paramView)
      {
        super();
        imageCellView.setMainRootView(paramView);
        imageCellView.setDisplayMetrics(_oneUpViewContext.getResources().getDisplayMetrics());
        imageCellView.performInitialization(_oneUpViewContext);
      }
      
      public AdobeAssetAutoFitRecyclerCellView getCellView()
      {
        return imageCellView;
      }
      
      public void onClick(View paramView) {}
    }
  }
}
