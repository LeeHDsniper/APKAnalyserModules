package com.adobe.creativesdk.aviary.panels;

import android.annotation.SuppressLint;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.content.ToolEntry;
import com.adobe.creativesdk.aviary.internal.headless.filters.NativeVignetteToolFilter;
import com.adobe.creativesdk.aviary.internal.utils.BitmapUtils;
import com.adobe.creativesdk.aviary.internal.vo.EditToolResultVO;
import com.adobe.creativesdk.aviary.internal.vo.ToolActionVO;
import com.adobe.creativesdk.aviary.widget.AdobeImageViewVignette;
import com.adobe.creativesdk.aviary.widget.AdobeImageViewVignette.OnVignetteChangeListener;
import com.aviary.android.feather.sdk.R.id;
import com.aviary.android.feather.sdk.R.layout;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.ImageViewTouchBase.DisplayType;
import it.sephiroth.android.library.imagezoom.graphics.FastBitmapDrawable;

public class VignettePanel
  extends AbstractSliderContentPanel
  implements AdobeImageViewVignette.OnVignetteChangeListener
{
  public VignettePanel(AdobeImageEditorController paramAdobeImageEditorController, ToolEntry paramToolEntry)
  {
    super(paramAdobeImageEditorController, paramToolEntry);
  }
  
  @SuppressLint({"InflateParams"})
  protected View generateContentView(LayoutInflater paramLayoutInflater)
  {
    return paramLayoutInflater.inflate(R.layout.com_adobe_image_editor_content_vignette, null);
  }
  
  protected ViewGroup generateOptionView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup)
  {
    return (ViewGroup)paramLayoutInflater.inflate(R.layout.com_adobe_image_bottombar_panel_seekbar, paramViewGroup, false);
  }
  
  public void onActivate()
  {
    super.onActivate();
    Bitmap localBitmap = ((NativeVignetteToolFilter)mFilter).getBitmap();
    ((AdobeImageViewVignette)mImageView).setImageBitmap(mBitmap, localBitmap, null, -1.0F, 8.0F);
    ((AdobeImageViewVignette)mImageView).setOnVignetteChangeListener(this);
    contentReady();
  }
  
  @SuppressLint({"WrongViewCast"})
  public void onCreate(Bitmap paramBitmap, Bundle paramBundle)
  {
    super.onCreate(paramBitmap, paramBundle);
    mImageView = ((ImageViewTouch)getContentView().findViewById(R.id.image));
    mImageView.setDisplayType(ImageViewTouchBase.DisplayType.FIT_IF_BIGGER);
    setValue((((AdobeImageViewVignette)mImageView).getVignetteIntensity() + 100) / 2);
    ((NativeVignetteToolFilter)mFilter).createBitmap(mBitmap.getWidth(), mBitmap.getHeight(), 4);
  }
  
  public void onDeactivate()
  {
    ((AdobeImageViewVignette)mImageView).setOnVignetteChangeListener(null);
    super.onDeactivate();
  }
  
  protected void onDispose()
  {
    ((NativeVignetteToolFilter)mFilter).clearBitmap();
    ((NativeVignetteToolFilter)mFilter).dispose();
    super.onDispose();
  }
  
  protected void onGenerateResult(EditToolResultVO paramEditToolResultVO)
  {
    mPreview = BitmapUtils.copy(mBitmap, mBitmap.getConfig());
    ((AdobeImageViewVignette)mImageView).generateBitmap(mPreview);
    Drawable localDrawable = mImageView.getDrawable();
    if ((localDrawable instanceof FastBitmapDrawable))
    {
      ((FastBitmapDrawable)localDrawable).setBitmap(mPreview);
      ((NativeVignetteToolFilter)mFilter).clearBitmap();
      mImageView.invalidate();
    }
    mEditResult.setActionList(((NativeVignetteToolFilter)mFilter).getActions());
    mEditResult.setToolAction(new ToolActionVO(Integer.valueOf(0)));
    onComplete(mPreview, paramEditToolResultVO);
  }
  
  protected void onSliderChanged(int paramInt, boolean paramBoolean)
  {
    if (paramBoolean) {
      ((AdobeImageViewVignette)mImageView).setVignetteIntensity(paramInt * 2 - 100);
    }
  }
  
  protected void onSliderEnd(int paramInt) {}
  
  protected void onSliderStart(int paramInt) {}
  
  public void onVignetteChange(AdobeImageViewVignette paramAdobeImageViewVignette, Bitmap paramBitmap, RectF paramRectF, int paramInt, float paramFloat)
  {
    if (((NativeVignetteToolFilter)mFilter).renderPreview(paramRectF, paramInt, paramFloat))
    {
      setIsChanged(true);
      mImageView.invalidate();
    }
  }
}
