package com.adobe.creativesdk.foundation.internal.storage.controllers.upload;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.PorterDuff.Mode;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetGenericStaggeredCellView;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetViewUtils;

public abstract class AdobeAssetViewListBaseUploadAssetCellView
  extends AdobeAssetGenericStaggeredCellView
{
  protected ProgressBar _uploadProgressBar;
  private AdobeCCFilesUploadAssetData.UploadStatus _uploadStatus = AdobeCCFilesUploadAssetData.UploadStatus.YetToStart;
  private final float kImageDisabledAlpha = 0.5F;
  
  public AdobeAssetViewListBaseUploadAssetCellView() {}
  
  private void setImageCellProgressState(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (float f = 0.5F;; f = 1.0F)
    {
      setImageAssetAlpha(f);
      return;
    }
  }
  
  private void setProgressColor(int paramInt)
  {
    _uploadProgressBar.getProgressDrawable().setColorFilter(paramInt, PorterDuff.Mode.SRC);
  }
  
  protected void addProgressBarChildRule(RelativeLayout.LayoutParams paramLayoutParams)
  {
    paramLayoutParams.addRule(12);
  }
  
  protected void createAttachProgressBarToView()
  {
    createProgressBar(getRootView().getContext());
    getProgressBarContainer().addView(_uploadProgressBar);
  }
  
  protected void createProgressBar(Context paramContext)
  {
    _uploadProgressBar = new ProgressBar(paramContext, null, 16842872);
    _uploadProgressBar.setProgressDrawable(paramContext.getResources().getDrawable(R.drawable.asset_upload_progress_bar));
    paramContext = new RelativeLayout.LayoutParams(-1, AdobeAssetViewUtils.convertDpToPx(2));
    addProgressBarChildRule(paramContext);
    _uploadProgressBar.setLayoutParams(paramContext);
    _uploadProgressBar.setVisibility(0);
    _uploadProgressBar.setIndeterminate(false);
    _uploadProgressBar.setMax(100);
  }
  
  protected abstract RelativeLayout getProgressBarContainer();
  
  protected void handleDisableChange() {}
  
  protected void handleOnFinishInflate()
  {
    super.handleOnFinishInflate();
    createAttachProgressBarToView();
  }
  
  public void markUpload100Percent() {}
  
  public void markUploadAsInProgress()
  {
    _uploadProgressBar.setVisibility(0);
    setProgressColor(Color.rgb(32, 152, 245));
    setImageCellProgressState(true);
  }
  
  public void markUploadComplete()
  {
    _uploadProgressBar.setVisibility(8);
    setImageCellProgressState(false);
  }
  
  public void markUploadError() {}
  
  public void markUploadQueued()
  {
    markUploadAsInProgress();
    setImageCellProgressState(true);
  }
  
  protected boolean providesSelection()
  {
    return false;
  }
  
  protected void setImageAssetAlpha(float paramFloat)
  {
    if ((_uploadStatus == AdobeCCFilesUploadAssetData.UploadStatus.YetToStart) || (_uploadStatus == AdobeCCFilesUploadAssetData.UploadStatus.InProgress)) {
      paramFloat = 0.5F;
    }
    super.setImageAssetAlpha(paramFloat);
  }
  
  public void setUploadProgres(double paramDouble)
  {
    if (paramDouble >= 100.0D) {}
    for (int i = 1;; i = 0)
    {
      if (i != 0) {
        markUpload100Percent();
      }
      _uploadProgressBar.setProgress((int)paramDouble);
      return;
    }
  }
  
  public void setUploadStatus(AdobeCCFilesUploadAssetData.UploadStatus paramUploadStatus)
  {
    _uploadStatus = paramUploadStatus;
    if (_uploadStatus == AdobeCCFilesUploadAssetData.UploadStatus.YetToStart) {
      markUploadQueued();
    }
    do
    {
      return;
      if (_uploadStatus == AdobeCCFilesUploadAssetData.UploadStatus.Completed)
      {
        markUploadComplete();
        return;
      }
      if (_uploadStatus == AdobeCCFilesUploadAssetData.UploadStatus.Error)
      {
        markUploadError();
        return;
      }
    } while ((_uploadStatus != AdobeCCFilesUploadAssetData.UploadStatus.Started) && (_uploadStatus != AdobeCCFilesUploadAssetData.UploadStatus.InProgress));
    markUploadAsInProgress();
  }
}
