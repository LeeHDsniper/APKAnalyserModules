package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.support.v4.view.PagerAdapter;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.layout;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetOneUpBaseCellView;
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
import uk.co.senab.photoview.IPhotoViewZoomDelegate;
import uk.co.senab.photoview.PhotoView;
import uk.co.senab.photoview.PhotoViewAttacher;

public class AdobeOneUpMultiPageViewPagerController
{
  private AdobeAsset _asset;
  private AdobeMultiPageFragmentController _fragmentController;
  private View _mainRootView;
  private Context _oneUpViewContext;
  private WeakReference<ReusableImageBitmapWorker> _reusableBitmapCacheWorker;
  private AdobeHackyViewPager mPager;
  private AdobeOneUpMultiPageAdapter mPagerAdapter;
  private int num_pages;
  private float zoom_focusX = 0.0F;
  private float zoom_focusY = 0.0F;
  private float zoom_scale = 1.0F;
  
  public AdobeOneUpMultiPageViewPagerController() {}
  
  private void handleAssetImageData(byte[] paramArrayOfByte, final AdobeAssetOneUpBaseCellView paramAdobeAssetOneUpBaseCellView, AdobeAssetImageDimensions paramAdobeAssetImageDimensions, int paramInt)
  {
    if (_mainRootView == null) {
      return;
    }
    if (paramArrayOfByte == null)
    {
      paramAdobeAssetOneUpBaseCellView.handleNoPreview();
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
            paramAdobeAssetOneUpBaseCellView.handleNoPreview();
            return;
          }
          paramAdobeAssetOneUpBaseCellView.displayThumbnail(paramAnonymousBitmapDrawable);
        }
      });
      return;
    }
    paramAdobeAssetImageDimensions = null;
    if (paramArrayOfByte != null) {
      paramAdobeAssetImageDimensions = BitmapFactory.decodeByteArray(paramArrayOfByte, 0, paramArrayOfByte.length);
    }
    if (paramAdobeAssetImageDimensions == null) {}
    paramAdobeAssetOneUpBaseCellView.displayThumbnail(paramAdobeAssetImageDimensions);
  }
  
  private boolean isReusableWorkerValid()
  {
    return (_reusableBitmapCacheWorker != null) && (_reusableBitmapCacheWorker.get() != null);
  }
  
  public void handleOrientationChange()
  {
    zoom_scale = 1.0F;
    int i = 0;
    while (i < mPager.getChildCount())
    {
      View localView = mPager.getChildAt(i);
      if (localView != null) {
        ((PhotoView)((RelativeLayout)localView).getChildAt(0)).getAttacher().setScale(zoom_scale);
      }
      i += 1;
    }
  }
  
  public void performInitiallization(Context paramContext)
  {
    _oneUpViewContext = paramContext;
    mPager = ((AdobeHackyViewPager)_mainRootView.findViewById(R.id.multipage_vertical_pager));
    mPagerAdapter = new AdobeOneUpMultiPageAdapter(_oneUpViewContext);
    mPager.setOffscreenPageLimit(1);
    mPager.setPageMargin(15);
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
  
  public void startViewPager(int paramInt)
  {
    zoom_scale = 1.0F;
    zoom_focusX = 0.0F;
    zoom_focusY = 0.0F;
    mPager.setAdapter(mPagerAdapter);
    mPager.setCurrentItem(paramInt);
  }
  
  public class AdobeOneUpMultiPageAdapter
    extends PagerAdapter
  {
    Context mContext;
    LayoutInflater mLayoutInflater;
    
    public AdobeOneUpMultiPageAdapter(Context paramContext)
    {
      mContext = paramContext;
      mLayoutInflater = ((LayoutInflater)mContext.getSystemService("layout_inflater"));
    }
    
    public void destroyItem(ViewGroup paramViewGroup, int paramInt, Object paramObject)
    {
      paramViewGroup.removeView((RelativeLayout)paramObject);
    }
    
    public int getCount()
    {
      if ((_asset instanceof AdobeAssetFile))
      {
        AdobeAssetFile localAdobeAssetFile = (AdobeAssetFile)_asset;
        if (localAdobeAssetFile.getOptionalMetadata() != null) {
          AdobeOneUpMultiPageViewPagerController.access$202(AdobeOneUpMultiPageViewPagerController.this, localAdobeAssetFile.getOptionalMetadata().optInt("pages", 1));
        }
        return num_pages;
      }
      return -1;
    }
    
    public Object instantiateItem(ViewGroup paramViewGroup, final int paramInt)
    {
      View localView = mLayoutInflater.inflate(R.layout.fragment_vertical_pager, paramViewGroup, false);
      Object localObject = mContext.getResources().getDisplayMetrics();
      final AdobeAssetImageDimensions localAdobeAssetImageDimensions = new AdobeAssetImageDimensions((int)(widthPixels * 0.7D), (int)(heightPixels * 0.7D));
      final AdobeAssetOneUpBaseCellView localAdobeAssetOneUpBaseCellView = new AdobeAssetOneUpBaseCellView();
      localAdobeAssetOneUpBaseCellView.setMainRootView(localView);
      localAdobeAssetOneUpBaseCellView.setDisplayMetrics((DisplayMetrics)localObject);
      localAdobeAssetOneUpBaseCellView.performInitialization(mContext);
      localAdobeAssetOneUpBaseCellView.createPhotoTapListenenr();
      localAdobeAssetOneUpBaseCellView.getAttacher().setScale(zoom_scale);
      localAdobeAssetOneUpBaseCellView.getAttacher().setZoomFocusX(zoom_focusX);
      localAdobeAssetOneUpBaseCellView.getAttacher().setZoomFocusY(zoom_focusY);
      localAdobeAssetOneUpBaseCellView.getAttacher().setZoomDelegate(new IPhotoViewZoomDelegate()
      {
        public void signalDragDetected(float paramAnonymousFloat1, float paramAnonymousFloat2)
        {
          View localView1 = mPager.findViewById(paramInt - 1);
          View localView2 = mPager.findViewById(paramInt + 1);
          if (paramAnonymousFloat1 > 0.0F)
          {
            AdobeOneUpMultiPageViewPagerController.access$402(AdobeOneUpMultiPageViewPagerController.this, _oneUpViewContext.getResources().getDisplayMetrics().widthPixels);
            if (localView1 != null)
            {
              ((PhotoView)((RelativeLayout)localView1).getChildAt(0)).getAttacher().setZoomFocusX(zoom_focusX);
              ((PhotoView)((RelativeLayout)localView1).getChildAt(0)).getAttacher().setZoomFocusY(zoom_focusY);
            }
          }
          do
          {
            do
            {
              return;
            } while (paramAnonymousFloat1 >= 0.0F);
            AdobeOneUpMultiPageViewPagerController.access$402(AdobeOneUpMultiPageViewPagerController.this, 0.0F);
          } while (localView2 == null);
          ((PhotoView)((RelativeLayout)localView2).getChildAt(0)).getAttacher().setZoomFocusX(zoom_focusX);
          ((PhotoView)((RelativeLayout)localView2).getChildAt(0)).getAttacher().setZoomFocusY(zoom_focusY);
        }
        
        public void signalZoomHandled(float paramAnonymousFloat1, float paramAnonymousFloat2, float paramAnonymousFloat3)
        {
          View localView1 = mPager.findViewById(paramInt - 1);
          View localView2 = mPager.findViewById(paramInt + 1);
          AdobeOneUpMultiPageViewPagerController.access$302(AdobeOneUpMultiPageViewPagerController.this, paramAnonymousFloat1);
          AdobeOneUpMultiPageViewPagerController.access$502(AdobeOneUpMultiPageViewPagerController.this, paramAnonymousFloat3);
          if (paramAnonymousFloat1 <= 0.5F) {
            if (_fragmentController.getPreviousState() == AdobeMultiPageViewState.AdobeMultiPageGridView) {
              _fragmentController.displayGridView();
            }
          }
          do
          {
            do
            {
              return;
            } while (_fragmentController.getPreviousState() != AdobeMultiPageViewState.AdobeMultiPageListView);
            _fragmentController.displayListView();
            return;
            if (localView1 != null) {
              ((PhotoView)((RelativeLayout)localView1).getChildAt(0)).getAttacher().setScale(paramAnonymousFloat1, _oneUpViewContext.getResources().getDisplayMetrics().widthPixels, zoom_focusY, false);
            }
          } while (localView2 == null);
          ((PhotoView)((RelativeLayout)localView2).getChildAt(0)).getAttacher().setScale(paramAnonymousFloat1, 0.0F, zoom_focusY, false);
        }
      });
      if ((_asset instanceof AdobeAssetFile))
      {
        localObject = new IAdobeGenericRequestCallback()
        {
          public void onCancellation()
          {
            AdobeOneUpMultiPageViewPagerController.this.handleAssetImageData(null, localAdobeAssetOneUpBaseCellView, localAdobeAssetImageDimensions, paramInt);
          }
          
          public void onCompletion(byte[] paramAnonymousArrayOfByte)
          {
            AdobeOneUpMultiPageViewPagerController.this.handleAssetImageData(paramAnonymousArrayOfByte, localAdobeAssetOneUpBaseCellView, localAdobeAssetImageDimensions, paramInt);
          }
          
          public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
          {
            AdobeOneUpMultiPageViewPagerController.this.handleAssetImageData(null, localAdobeAssetOneUpBaseCellView, localAdobeAssetImageDimensions, paramInt);
          }
          
          public void onProgress(double paramAnonymousDouble) {}
        };
        if (!AdobeUXAssetOneUpViewerActivity.isNetworkAvailable()) {
          break label304;
        }
        localAdobeAssetOneUpBaseCellView.isOnline();
        int j = 1;
        int i = j;
        if (AdobeOneUpMultiPageViewPagerController.this.isReusableWorkerValid())
        {
          BitmapDrawable localBitmapDrawable = ((ReusableImageBitmapWorker)_reusableBitmapCacheWorker.get()).loadImage(AdobeStorageUtils.cacheKeyForAsset(_asset, AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, localAdobeAssetImageDimensions, paramInt));
          i = j;
          if (localBitmapDrawable != null)
          {
            localAdobeAssetOneUpBaseCellView.displayThumbnail(localBitmapDrawable);
            i = 0;
          }
        }
        if (i != 0) {
          ((AdobeAssetFile)_asset).getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, localAdobeAssetImageDimensions, paramInt, (IAdobeGenericRequestCallback)localObject);
        }
      }
      for (;;)
      {
        localView.setId(paramInt);
        paramViewGroup.addView(localView);
        return localView;
        label304:
        localAdobeAssetOneUpBaseCellView.handleNoNetwork();
      }
    }
    
    public boolean isViewFromObject(View paramView, Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if ((paramObject instanceof RelativeLayout))
      {
        bool1 = bool2;
        if (paramView == paramObject) {
          bool1 = true;
        }
      }
      return bool1;
    }
  }
}
