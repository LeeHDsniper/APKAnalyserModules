package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.OnScrollListener;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.assets.R.string;
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

public class AdobeAssetOneUpRecyclerViewController
{
  protected static int height = -1;
  protected static int width = -1;
  protected RecyclerView _absRecyclerView;
  protected AdobeAsset _asset;
  protected AdobeOneUpRecyclerViewBaseAdapter _assetsItemsAdapter;
  AdobeMultiPageFragmentController _fragmentController;
  private int _imageHeight = -1;
  private int _imageWidth = -1;
  protected LinearLayoutManager _layoutManager;
  protected View _mainRootView;
  protected TextView _multiPageSectionalTextView;
  protected View _mutiPageSectionalHeader;
  protected View _noInternetConnectionBanner;
  protected Context _oneUpViewContext;
  private WeakReference<ReusableImageBitmapWorker> _reusableBitmapCacheWorker;
  protected int num_pages = 1;
  
  public AdobeAssetOneUpRecyclerViewController() {}
  
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
  
  private void handleAssetImageData(byte[] paramArrayOfByte, final AdobeAssetOneUpRecyclerCellView paramAdobeAssetOneUpRecyclerCellView, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, final int paramInt)
  {
    if (_mainRootView == null) {
      return;
    }
    if (paramArrayOfByte == null)
    {
      paramAdobeAssetOneUpRecyclerCellView.handleNoPreview();
      return;
    }
    if (isReusableWorkerValid())
    {
      ((ReusableImageBitmapWorker)_reusableBitmapCacheWorker.get()).loadImageWithData(AdobeStorageUtils.cacheKeyForAsset(_asset, AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, paramAdobeAssetImageDimensions, paramInt), paramArrayOfByte, new IAdobeGenericCompletionCallback()
      {
        public void onCompletion(BitmapDrawable paramAnonymousBitmapDrawable)
        {
          if (_mainRootView == null) {
            return;
          }
          if (paramAnonymousBitmapDrawable == null)
          {
            paramAdobeAssetOneUpRecyclerCellView.handleNoPreview();
            return;
          }
          paramAdobeAssetOneUpRecyclerCellView.displayThumbnail(paramAnonymousBitmapDrawable, paramInt);
        }
      });
      return;
    }
    paramAdobeAssetImageDimensions = null;
    if (paramArrayOfByte != null) {
      paramAdobeAssetImageDimensions = BitmapFactory.decodeByteArray(paramArrayOfByte, 0, paramArrayOfByte.length);
    }
    if (paramAdobeAssetImageDimensions == null) {
      paramAdobeAssetOneUpRecyclerCellView.handleNoPreview();
    }
    paramAdobeAssetOneUpRecyclerCellView.displayThumbnail(paramAdobeAssetImageDimensions, paramInt);
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
    _noInternetConnectionBanner = _mainRootView.findViewById(R.id.listview_container_no_network_notification_bar);
    _mutiPageSectionalHeader = _mainRootView.findViewById(R.id.asset_one_up_multi_page_recycler_section_container);
    _multiPageSectionalTextView = ((TextView)_mainRootView.findViewById(R.id.asset_one_up_multi_page_recycler_section_textview));
    return _mainRootView;
  }
  
  public void performInitialization(Context paramContext)
  {
    getMainRootView();
    _oneUpViewContext = paramContext;
    _layoutManager = new LinearLayoutManager(paramContext);
    _layoutManager.setOrientation(1);
    _layoutManager.setSmoothScrollbarEnabled(false);
    _absRecyclerView.setLayoutManager(_layoutManager);
    _assetsItemsAdapter = createRecyclerViewAdapter(paramContext);
    _absRecyclerView.setAdapter(_assetsItemsAdapter);
    _absRecyclerView.setHasFixedSize(true);
    _mutiPageSectionalHeader.setVisibility(0);
    _multiPageSectionalTextView.setText(String.format(_oneUpViewContext.getResources().getString(R.string.adobe_asset_view_multi_page_numbering), new Object[] { Integer.valueOf(1), Integer.valueOf(checkPageCount(_asset)) }));
    _mutiPageSectionalHeader.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        _fragmentController.displayGridView();
      }
    });
    _absRecyclerView.addItemDecoration(new MarginDecoration(_oneUpViewContext));
    _absRecyclerView.setOnScrollListener(new RecyclerView.OnScrollListener()
    {
      public void onScrollStateChanged(RecyclerView paramAnonymousRecyclerView, int paramAnonymousInt) {}
      
      public void onScrolled(RecyclerView paramAnonymousRecyclerView, int paramAnonymousInt1, int paramAnonymousInt2)
      {
        int m;
        int i;
        View localView;
        label117:
        label128:
        int k;
        if (num_pages > 1)
        {
          m = _layoutManager.findFirstVisibleItemPosition();
          paramAnonymousInt2 = _layoutManager.findLastVisibleItemPosition();
          paramAnonymousInt1 = m;
          i = paramAnonymousInt1;
          if (m != -1)
          {
            i = paramAnonymousInt1;
            if (paramAnonymousInt2 != -1)
            {
              paramAnonymousRecyclerView = _layoutManager.findViewByPosition(m);
              localView = _layoutManager.findViewByPosition(m + 1);
              i = paramAnonymousInt1;
              if (paramAnonymousRecyclerView != null)
              {
                i = paramAnonymousInt1;
                if (localView != null)
                {
                  if (paramAnonymousRecyclerView.getTop() >= 0) {
                    break label236;
                  }
                  paramAnonymousInt2 = 0;
                  if (paramAnonymousRecyclerView.getBottom() >= 0) {
                    break label244;
                  }
                  j = 0;
                  if (localView.getTop() >= 0) {
                    break label253;
                  }
                  i = 0;
                  if (localView.getBottom() >= 0) {
                    break label263;
                  }
                  k = 0;
                  label139:
                  if (paramAnonymousInt2 <= j) {
                    break label273;
                  }
                  paramAnonymousInt2 -= j;
                  label150:
                  if (i <= k) {
                    break label281;
                  }
                }
              }
            }
          }
        }
        label236:
        label244:
        label253:
        label263:
        label273:
        label281:
        for (int j = i - k;; j = k - i)
        {
          i = paramAnonymousInt1;
          if (j > paramAnonymousInt2) {
            i = m + 1;
          }
          _multiPageSectionalTextView.setText(String.format(_oneUpViewContext.getResources().getString(R.string.adobe_asset_view_multi_page_numbering), new Object[] { Integer.valueOf(i + 1), Integer.valueOf(num_pages) }));
          return;
          paramAnonymousInt2 = paramAnonymousRecyclerView.getTop();
          break;
          j = paramAnonymousRecyclerView.getBottom();
          break label117;
          i = localView.getTop();
          break label128;
          k = localView.getBottom();
          break label139;
          paramAnonymousInt2 = j - paramAnonymousInt2;
          break label150;
        }
      }
    });
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
    if (_noInternetConnectionBanner != null) {
      _noInternetConnectionBanner.setVisibility(0);
    }
  }
  
  public void wentOnline()
  {
    if (_noInternetConnectionBanner != null) {
      _noInternetConnectionBanner.setVisibility(8);
    }
  }
  
  protected class AdobeOneUpRecyclerViewBaseAdapter
    extends RecyclerView.Adapter<RecyclerView.ViewHolder>
    implements IAdobeNoPreviewSizeHandler
  {
    protected AdobeOneUpRecyclerViewBaseAdapter() {}
    
    public int getHeight()
    {
      return AdobeAssetOneUpRecyclerViewController.height;
    }
    
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
    
    public int getWidth()
    {
      return AdobeAssetOneUpRecyclerViewController.width;
    }
    
    public void onBindViewHolder(final RecyclerView.ViewHolder paramViewHolder, final int paramInt)
    {
      paramViewHolder = ((AdobeOneUpRecyclerCellViewHolder)paramViewHolder).getCellView();
      paramViewHolder.setCellPos(paramInt);
      paramViewHolder.prepareForReuse();
      Object localObject = _oneUpViewContext.getResources().getDisplayMetrics();
      if ((_imageWidth == -1) || (_imageHeight == -1))
      {
        AdobeAssetOneUpRecyclerViewController.access$002(AdobeAssetOneUpRecyclerViewController.this, (int)(widthPixels * 0.7D));
        AdobeAssetOneUpRecyclerViewController.access$102(AdobeAssetOneUpRecyclerViewController.this, (int)(heightPixels * 0.7D));
      }
      localObject = new AdobeAssetImageDimensions(_imageWidth, _imageHeight);
      if ((_asset instanceof AdobeAssetFile))
      {
        IAdobeGenericRequestCallback local2 = new IAdobeGenericRequestCallback()
        {
          public void onCancellation()
          {
            AdobeAssetOneUpRecyclerViewController.this.handleAssetImageData(null, paramViewHolder, val$dimension, paramInt);
          }
          
          public void onCompletion(byte[] paramAnonymousArrayOfByte)
          {
            AdobeAssetOneUpRecyclerViewController.this.handleAssetImageData(paramAnonymousArrayOfByte, paramViewHolder, val$dimension, paramInt);
          }
          
          public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
          {
            AdobeAssetOneUpRecyclerViewController.this.handleAssetImageData(null, paramViewHolder, val$dimension, paramInt);
          }
          
          public void onProgress(double paramAnonymousDouble) {}
        };
        int j = 1;
        int i = j;
        if (AdobeAssetOneUpRecyclerViewController.this.isReusableWorkerValid())
        {
          BitmapDrawable localBitmapDrawable = ((ReusableImageBitmapWorker)_reusableBitmapCacheWorker.get()).loadImage(AdobeStorageUtils.cacheKeyForAsset(_asset, AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, (AdobeAssetImageDimensions)localObject, paramInt));
          i = j;
          if (localBitmapDrawable != null)
          {
            paramViewHolder.displayThumbnail(localBitmapDrawable, paramInt);
            i = 0;
          }
        }
        if (i != 0) {
          ((AdobeAssetFile)_asset).getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, (AdobeAssetImageDimensions)localObject, paramInt, local2);
        }
      }
    }
    
    public AdobeOneUpRecyclerCellViewHolder onCreateViewHolder(ViewGroup paramViewGroup, int paramInt)
    {
      paramViewGroup = LayoutInflater.from(paramViewGroup.getContext()).inflate(R.layout.adobe_multipage_recycler_cellview, paramViewGroup, false);
      final AdobeOneUpRecyclerCellViewHolder localAdobeOneUpRecyclerCellViewHolder = new AdobeOneUpRecyclerCellViewHolder(paramViewGroup);
      paramViewGroup.setOnTouchListener(new RecyclerListTouchListener(_oneUpViewContext, new RecyclerListTouchListener.OnTouchListener()
      {
        public void performAction()
        {
          _fragmentController.setState(AdobeMultiPageViewState.AdobeMultiPageListView);
          _fragmentController.displayViewPager(localAdobeOneUpRecyclerCellViewHolder.getPosition());
        }
      }));
      localAdobeOneUpRecyclerCellViewHolder.getCellView().setNoPreviewHandler(this);
      return localAdobeOneUpRecyclerCellViewHolder;
    }
    
    public void setMeasurements(int paramInt1, int paramInt2)
    {
      AdobeAssetOneUpRecyclerViewController.width = paramInt1;
      AdobeAssetOneUpRecyclerViewController.height = paramInt2;
    }
    
    class AdobeOneUpRecyclerCellViewHolder
      extends RecyclerView.ViewHolder
      implements View.OnClickListener
    {
      AdobeAssetOneUpRecyclerCellView imageCellView = new AdobeAssetOneUpRecyclerCellView();
      
      public AdobeOneUpRecyclerCellViewHolder(View paramView)
      {
        super();
        imageCellView.setMainRootView(paramView);
        imageCellView.setDisplayMetrics(_oneUpViewContext.getResources().getDisplayMetrics());
        imageCellView.performInitialization(_oneUpViewContext);
      }
      
      public AdobeAssetOneUpRecyclerCellView getCellView()
      {
        return imageCellView;
      }
      
      public void onClick(View paramView) {}
    }
  }
}
