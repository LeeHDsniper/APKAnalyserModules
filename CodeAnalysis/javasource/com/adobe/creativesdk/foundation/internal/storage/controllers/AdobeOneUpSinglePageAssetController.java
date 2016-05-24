package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.util.DisplayMetrics;
import android.view.View;
import com.adobe.creativesdk.foundation.IAdobeGenericCompletionCallback;
import com.adobe.creativesdk.foundation.internal.storage.controllers.common.ReusableImageBitmapWorker;
import com.adobe.creativesdk.foundation.storage.AdobeAsset;
import com.adobe.creativesdk.foundation.storage.AdobeAssetException;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFile;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFileRenditionType;
import com.adobe.creativesdk.foundation.storage.AdobeAssetImageDimensions;
import com.adobe.creativesdk.foundation.storage.IAdobeGenericRequestCallback;
import java.lang.ref.WeakReference;
import uk.co.senab.photoview.IPhotoViewZoomDelegate;
import uk.co.senab.photoview.PhotoViewAttacher;

public class AdobeOneUpSinglePageAssetController
{
  protected AdobeAsset _asset;
  protected int _currentAssetPos;
  protected DisplayMetrics _displayMetrics;
  protected View _mainRootView;
  protected Context _oneUpViewContext;
  private WeakReference<ReusableImageBitmapWorker> _reusableBitmapCacheWorker;
  protected AdobeAssetOneUpSinglePageCellView imageCellView;
  
  public AdobeOneUpSinglePageAssetController() {}
  
  private void handleAssetImageData(byte[] paramArrayOfByte)
  {
    if (_mainRootView == null) {}
    do
    {
      return;
      if (paramArrayOfByte == null)
      {
        imageCellView.handleNoPreview();
        return;
      }
      if (isReusableWorkerValid())
      {
        ((ReusableImageBitmapWorker)_reusableBitmapCacheWorker.get()).loadImageWithData(_asset.getGUID(), paramArrayOfByte, new IAdobeGenericCompletionCallback()
        {
          public void onCompletion(BitmapDrawable paramAnonymousBitmapDrawable)
          {
            if (_mainRootView == null) {}
            do
            {
              return;
              if (paramAnonymousBitmapDrawable == null)
              {
                imageCellView.handleNoPreview();
                return;
              }
              imageCellView.displayThumbnail(paramAnonymousBitmapDrawable);
              paramAnonymousBitmapDrawable = (AdobeAssetFile)_asset;
            } while ((_asset == null) || (!paramAnonymousBitmapDrawable.getType().startsWith("video/")));
            imageCellView.handleVideoFiles();
          }
        });
        return;
      }
      Bitmap localBitmap = null;
      if (paramArrayOfByte != null) {
        localBitmap = BitmapFactory.decodeByteArray(paramArrayOfByte, 0, paramArrayOfByte.length);
      }
      if (localBitmap == null) {}
      imageCellView.displayThumbnail(localBitmap);
      paramArrayOfByte = (AdobeAssetFile)_asset;
    } while ((_asset == null) || (!paramArrayOfByte.getType().startsWith("video/")));
    imageCellView.handleVideoFiles();
  }
  
  private boolean isReusableWorkerValid()
  {
    return (_reusableBitmapCacheWorker != null) && (_reusableBitmapCacheWorker.get() != null);
  }
  
  public void cancelAnyOneUpImageOperation()
  {
    if (isReusableWorkerValid()) {
      ((ReusableImageBitmapWorker)_reusableBitmapCacheWorker.get()).cancelImageLoad(_asset.getGUID());
    }
  }
  
  public void initiateDisplay()
  {
    if ((_asset instanceof AdobeAssetFile))
    {
      IAdobeGenericRequestCallback local3 = new IAdobeGenericRequestCallback()
      {
        public void onCancellation()
        {
          AdobeOneUpSinglePageAssetController.this.handleAssetImageData(null);
        }
        
        public void onCompletion(byte[] paramAnonymousArrayOfByte)
        {
          AdobeOneUpSinglePageAssetController.this.handleAssetImageData(paramAnonymousArrayOfByte);
        }
        
        public void onError(AdobeAssetException paramAnonymousAdobeAssetException)
        {
          AdobeOneUpSinglePageAssetController.this.handleAssetImageData(null);
        }
        
        public void onProgress(double paramAnonymousDouble) {}
      };
      if (!AdobeUXAssetOneUpViewerActivity.isNetworkAvailable()) {
        break label162;
      }
      imageCellView.isOnline();
      int j = 1;
      int i = j;
      if (isReusableWorkerValid())
      {
        Object localObject = ((ReusableImageBitmapWorker)_reusableBitmapCacheWorker.get()).loadImage(_asset.getGUID());
        i = j;
        if (localObject != null)
        {
          imageCellView.displayThumbnail((BitmapDrawable)localObject);
          localObject = (AdobeAssetFile)_asset;
          if ((_asset != null) && (((AdobeAssetFile)localObject).getType().startsWith("video/"))) {
            imageCellView.handleVideoFiles();
          }
          i = 0;
        }
      }
      if (i != 0) {
        ((AdobeAssetFile)_asset).getRenditionWithType(AdobeAssetFileRenditionType.ADOBE_ASSET_FILE_RENDITION_TYPE_PNG, new AdobeAssetImageDimensions(_displayMetrics.widthPixels, _displayMetrics.heightPixels), 0, local3);
      }
    }
    return;
    label162:
    imageCellView.handleNoNetwork();
  }
  
  public void performInitialization(Context paramContext)
  {
    _oneUpViewContext = paramContext;
    _displayMetrics = _oneUpViewContext.getResources().getDisplayMetrics();
    imageCellView = new AdobeAssetOneUpSinglePageCellView();
    imageCellView.setMainRootView(_mainRootView);
    imageCellView.setDisplayMetrics(_displayMetrics);
    imageCellView.setCurrentAssetPos(_currentAssetPos);
    imageCellView.performInitialization(_oneUpViewContext);
    imageCellView.createPhotoTapListenenr();
    imageCellView.getAttacher().setZoomDelegate(new IPhotoViewZoomDelegate()
    {
      public void signalDragDetected(float paramAnonymousFloat1, float paramAnonymousFloat2) {}
      
      public void signalZoomHandled(float paramAnonymousFloat1, float paramAnonymousFloat2, float paramAnonymousFloat3) {}
    });
    imageCellView.initiallizeVideoButton();
  }
  
  public void setAsset(AdobeAsset paramAdobeAsset)
  {
    _asset = paramAdobeAsset;
  }
  
  public void setCurrentAssetPos(int paramInt)
  {
    _currentAssetPos = paramInt;
  }
  
  public void setMainRootView(View paramView)
  {
    _mainRootView = paramView;
    if (_mainRootView == null)
    {
      _oneUpViewContext = null;
      if (imageCellView != null) {
        imageCellView.setContext(null);
      }
    }
  }
  
  public void setReuseableBitmapCacheWorker(ReusableImageBitmapWorker paramReusableImageBitmapWorker)
  {
    if (paramReusableImageBitmapWorker == null) {
      return;
    }
    _reusableBitmapCacheWorker = new WeakReference(paramReusableImageBitmapWorker);
  }
}
