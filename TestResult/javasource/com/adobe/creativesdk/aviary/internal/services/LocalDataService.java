package com.adobe.creativesdk.aviary.internal.services;

import android.content.Intent;
import android.graphics.Bitmap.CompressFormat;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.graphics.Palette;
import android.support.v7.graphics.Palette.Swatch;
import com.adobe.creativesdk.aviary.AdobeImageEditorActivity;
import com.adobe.creativesdk.aviary.internal.AdobeImageEditorController;
import com.adobe.creativesdk.aviary.internal.headless.utils.MegaPixels;
import com.adobe.creativesdk.aviary.internal.utils.ApiHelper;
import com.adobe.creativesdk.aviary.internal.utils.ImageInfo;
import com.adobe.creativesdk.aviary.internal.vo.EditToolVO;
import com.adobe.creativesdk.aviary.log.LoggerFactory.Logger;
import com.adobe.creativesdk.aviary.utils.SharedPreferencesUtils;
import java.util.ArrayList;
import java.util.List;

public final class LocalDataService
  extends BaseContextService
{
  private Uri destImageUri;
  private int mAccentColor;
  private boolean mGetAccentColorEnabled;
  private boolean mGetAccentColorEnabledDirty = true;
  private int mGetAccentColorFromIntent;
  private boolean mGetAccentColorFromIntentDirty = true;
  private boolean mHasAccentColor;
  private boolean mHasAccentColorFromIntent;
  private boolean mHasAccentColorFromIntentDirty = true;
  private ImageInfo mImageInfo;
  private final Intent mOriginalIntent;
  private final List<EditToolVO> mRecipe;
  private Bitmap.CompressFormat outputFormat;
  private final SharedPreferencesUtils preferencesUtils;
  private Uri sourceImageUri;
  
  public LocalDataService(AdobeImageEditorController paramAdobeImageEditorController)
  {
    super(paramAdobeImageEditorController);
    preferencesUtils = SharedPreferencesUtils.getInstance(paramAdobeImageEditorController.getBaseContext());
    paramAdobeImageEditorController = paramAdobeImageEditorController.getBaseActivity().getIntent();
    if (paramAdobeImageEditorController != null) {}
    for (mOriginalIntent = paramAdobeImageEditorController;; mOriginalIntent = new Intent())
    {
      mRecipe = new ArrayList(0);
      return;
    }
  }
  
  private int getAccentColorFromIntent(int paramInt)
  {
    if (mGetAccentColorFromIntentDirty)
    {
      mGetAccentColorFromIntent = mOriginalIntent.getIntExtra("extra-accent-color", paramInt);
      mGetAccentColorFromIntentDirty = false;
    }
    return mGetAccentColorFromIntent;
  }
  
  private boolean hasAccentColorFromIntent()
  {
    if (mHasAccentColorFromIntentDirty) {
      if ((!getAccentColorEnabled()) || (!mOriginalIntent.hasExtra("extra-accent-color"))) {
        break label43;
      }
    }
    label43:
    for (boolean bool = true;; bool = false)
    {
      mHasAccentColorFromIntent = bool;
      mHasAccentColorFromIntentDirty = false;
      return mHasAccentColorFromIntent;
    }
  }
  
  private void setAccentColor(int paramInt)
  {
    mAccentColor = paramInt;
    mHasAccentColor = true;
  }
  
  public void addRecipe(EditToolVO paramEditToolVO)
  {
    mRecipe.add(paramEditToolVO);
  }
  
  public void dispose() {}
  
  public int getAccentColor(int paramInt)
  {
    if (mHasAccentColor) {
      return mAccentColor;
    }
    return getAccentColorFromIntent(paramInt);
  }
  
  boolean getAccentColorEnabled()
  {
    if (mGetAccentColorEnabledDirty) {
      if ((!ApiHelper.AT_LEAST_16) || (!((Boolean)getIntentExtra("extra-enable-auto-accent-color", Boolean.valueOf(true))).booleanValue())) {
        break label44;
      }
    }
    label44:
    for (boolean bool = true;; bool = false)
    {
      mGetAccentColorEnabled = bool;
      return mGetAccentColorEnabled;
    }
  }
  
  public Uri getDestImageUri()
  {
    if ((destImageUri == null) && (mOriginalIntent.hasExtra("output"))) {
      destImageUri = ((Uri)mOriginalIntent.getParcelableExtra("output"));
    }
    return destImageUri;
  }
  
  public ImageInfo getImageInfo()
  {
    return mImageInfo;
  }
  
  public <T> T getIntentExtra(String paramString, T paramT)
  {
    Bundle localBundle = mOriginalIntent.getExtras();
    Object localObject = paramT;
    if (localBundle != null)
    {
      localObject = paramT;
      if (!localBundle.containsKey(paramString)) {}
    }
    try
    {
      paramString = localBundle.get(paramString);
      localObject = paramT;
      if (paramString != null) {
        localObject = paramString;
      }
      return localObject;
    }
    catch (ClassCastException paramString) {}
    return paramT;
  }
  
  public boolean getIntentHasExtra(String paramString)
  {
    return mOriginalIntent.hasExtra(paramString);
  }
  
  public Bitmap.CompressFormat getOutputFormat()
  {
    String str;
    if (outputFormat == null)
    {
      str = (String)getIntentExtra("output-format", Bitmap.CompressFormat.JPEG.name());
      if (str == null) {
        break label40;
      }
    }
    label40:
    for (outputFormat = Bitmap.CompressFormat.valueOf(str);; outputFormat = Bitmap.CompressFormat.JPEG) {
      return outputFormat;
    }
  }
  
  public int getOutputQuality()
  {
    if (getIntentHasExtra("output-quality")) {
      return ((Integer)getIntentExtra("output-quality", Integer.valueOf(97))).intValue();
    }
    return preferencesUtils.getOutputImageQuality();
  }
  
  public int getRequestedMegaPixels()
  {
    int j = ((Integer)getIntentExtra("output-hires-megapixels", Integer.valueOf(-1))).intValue();
    int i = j;
    if (j < 0) {}
    try
    {
      i = preferencesUtils.getOutputImageSize().ordinal();
      return Math.min(i, MegaPixels.Mp30.ordinal());
    }
    catch (Exception localException)
    {
      for (;;)
      {
        localException.printStackTrace();
        i = j;
      }
    }
  }
  
  public boolean hasAccentColor()
  {
    return (getAccentColorEnabled()) && ((hasAccentColorFromIntent()) || (mHasAccentColor));
  }
  
  public void setDestImageUri(Uri paramUri)
  {
    destImageUri = paramUri;
  }
  
  public void setImageInfo(ImageInfo paramImageInfo)
  {
    mImageInfo = paramImageInfo;
    if ((!hasAccentColorFromIntent()) && (getAccentColorEnabled()))
    {
      paramImageInfo = paramImageInfo.getPalette();
      if (paramImageInfo != null)
      {
        paramImageInfo = paramImageInfo.getVibrantSwatch();
        if (paramImageInfo != null) {
          setAccentColor(paramImageInfo.getRgb());
        }
      }
      return;
    }
    logger.warn("accent color already defined!");
  }
  
  public void setSourceImageUri(Uri paramUri)
  {
    try
    {
      sourceImageUri = paramUri;
      return;
    }
    finally
    {
      paramUri = finally;
      throw paramUri;
    }
  }
}
