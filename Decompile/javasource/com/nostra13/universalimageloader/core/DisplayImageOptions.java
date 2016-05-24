package com.nostra13.universalimageloader.core;

import android.content.res.Resources;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import com.nostra13.universalimageloader.core.assist.ImageScaleType;
import com.nostra13.universalimageloader.core.display.BitmapDisplayer;
import com.nostra13.universalimageloader.core.process.BitmapProcessor;

public final class DisplayImageOptions
{
  private final boolean cacheInMemory;
  private final boolean cacheOnDisk;
  private final boolean considerExifParams;
  private final BitmapFactory.Options decodingOptions;
  private final int delayBeforeLoading;
  private final BitmapDisplayer displayer;
  private final Object extraForDownloader;
  private final Handler handler;
  private final Drawable imageForEmptyUri;
  private final Drawable imageOnFail;
  private final Drawable imageOnLoading;
  private final int imageResForEmptyUri;
  private final int imageResOnFail;
  private final int imageResOnLoading;
  private final ImageScaleType imageScaleType;
  private final boolean isSyncLoading;
  private final BitmapProcessor postProcessor;
  private final BitmapProcessor preProcessor;
  private final boolean resetViewBeforeLoading;
  
  private DisplayImageOptions(Builder paramBuilder)
  {
    imageResOnLoading = imageResOnLoading;
    imageResForEmptyUri = imageResForEmptyUri;
    imageResOnFail = imageResOnFail;
    imageOnLoading = imageOnLoading;
    imageForEmptyUri = imageForEmptyUri;
    imageOnFail = imageOnFail;
    resetViewBeforeLoading = resetViewBeforeLoading;
    cacheInMemory = cacheInMemory;
    cacheOnDisk = cacheOnDisk;
    imageScaleType = imageScaleType;
    decodingOptions = decodingOptions;
    delayBeforeLoading = delayBeforeLoading;
    considerExifParams = considerExifParams;
    extraForDownloader = extraForDownloader;
    preProcessor = preProcessor;
    postProcessor = postProcessor;
    displayer = displayer;
    handler = handler;
    isSyncLoading = isSyncLoading;
  }
  
  public static DisplayImageOptions createSimple()
  {
    return new Builder().build();
  }
  
  public BitmapFactory.Options getDecodingOptions()
  {
    return decodingOptions;
  }
  
  public int getDelayBeforeLoading()
  {
    return delayBeforeLoading;
  }
  
  public BitmapDisplayer getDisplayer()
  {
    return displayer;
  }
  
  public Object getExtraForDownloader()
  {
    return extraForDownloader;
  }
  
  public Handler getHandler()
  {
    return handler;
  }
  
  public Drawable getImageForEmptyUri(Resources paramResources)
  {
    if (imageResForEmptyUri != 0) {
      return paramResources.getDrawable(imageResForEmptyUri);
    }
    return imageForEmptyUri;
  }
  
  public Drawable getImageOnFail(Resources paramResources)
  {
    if (imageResOnFail != 0) {
      return paramResources.getDrawable(imageResOnFail);
    }
    return imageOnFail;
  }
  
  public Drawable getImageOnLoading(Resources paramResources)
  {
    if (imageResOnLoading != 0) {
      return paramResources.getDrawable(imageResOnLoading);
    }
    return imageOnLoading;
  }
  
  public ImageScaleType getImageScaleType()
  {
    return imageScaleType;
  }
  
  public BitmapProcessor getPostProcessor()
  {
    return postProcessor;
  }
  
  public BitmapProcessor getPreProcessor()
  {
    return preProcessor;
  }
  
  public boolean isCacheInMemory()
  {
    return cacheInMemory;
  }
  
  public boolean isCacheOnDisk()
  {
    return cacheOnDisk;
  }
  
  public boolean isConsiderExifParams()
  {
    return considerExifParams;
  }
  
  public boolean isResetViewBeforeLoading()
  {
    return resetViewBeforeLoading;
  }
  
  boolean isSyncLoading()
  {
    return isSyncLoading;
  }
  
  public boolean shouldDelayBeforeLoading()
  {
    return delayBeforeLoading > 0;
  }
  
  public boolean shouldPostProcess()
  {
    return postProcessor != null;
  }
  
  public boolean shouldPreProcess()
  {
    return preProcessor != null;
  }
  
  public boolean shouldShowImageForEmptyUri()
  {
    return (imageForEmptyUri != null) || (imageResForEmptyUri != 0);
  }
  
  public boolean shouldShowImageOnFail()
  {
    return (imageOnFail != null) || (imageResOnFail != 0);
  }
  
  public boolean shouldShowImageOnLoading()
  {
    return (imageOnLoading != null) || (imageResOnLoading != 0);
  }
  
  public static class Builder
  {
    private boolean cacheInMemory = false;
    private boolean cacheOnDisk = false;
    private boolean considerExifParams = false;
    private BitmapFactory.Options decodingOptions = new BitmapFactory.Options();
    private int delayBeforeLoading = 0;
    private BitmapDisplayer displayer = DefaultConfigurationFactory.createBitmapDisplayer();
    private Object extraForDownloader = null;
    private Handler handler = null;
    private Drawable imageForEmptyUri = null;
    private Drawable imageOnFail = null;
    private Drawable imageOnLoading = null;
    private int imageResForEmptyUri = 0;
    private int imageResOnFail = 0;
    private int imageResOnLoading = 0;
    private ImageScaleType imageScaleType = ImageScaleType.IN_SAMPLE_POWER_OF_2;
    private boolean isSyncLoading = false;
    private BitmapProcessor postProcessor = null;
    private BitmapProcessor preProcessor = null;
    private boolean resetViewBeforeLoading = false;
    
    public Builder()
    {
      decodingOptions.inPurgeable = true;
      decodingOptions.inInputShareable = true;
    }
    
    public Builder bitmapConfig(Bitmap.Config paramConfig)
    {
      if (paramConfig == null) {
        throw new IllegalArgumentException("bitmapConfig can't be null");
      }
      decodingOptions.inPreferredConfig = paramConfig;
      return this;
    }
    
    public DisplayImageOptions build()
    {
      return new DisplayImageOptions(this, null);
    }
    
    public Builder cacheInMemory(boolean paramBoolean)
    {
      cacheInMemory = paramBoolean;
      return this;
    }
    
    public Builder cacheOnDisk(boolean paramBoolean)
    {
      cacheOnDisk = paramBoolean;
      return this;
    }
    
    public Builder cloneFrom(DisplayImageOptions paramDisplayImageOptions)
    {
      imageResOnLoading = imageResOnLoading;
      imageResForEmptyUri = imageResForEmptyUri;
      imageResOnFail = imageResOnFail;
      imageOnLoading = imageOnLoading;
      imageForEmptyUri = imageForEmptyUri;
      imageOnFail = imageOnFail;
      resetViewBeforeLoading = resetViewBeforeLoading;
      cacheInMemory = cacheInMemory;
      cacheOnDisk = cacheOnDisk;
      imageScaleType = imageScaleType;
      decodingOptions = decodingOptions;
      delayBeforeLoading = delayBeforeLoading;
      considerExifParams = considerExifParams;
      extraForDownloader = extraForDownloader;
      preProcessor = preProcessor;
      postProcessor = postProcessor;
      displayer = displayer;
      handler = handler;
      isSyncLoading = isSyncLoading;
      return this;
    }
    
    public Builder displayer(BitmapDisplayer paramBitmapDisplayer)
    {
      if (paramBitmapDisplayer == null) {
        throw new IllegalArgumentException("displayer can't be null");
      }
      displayer = paramBitmapDisplayer;
      return this;
    }
    
    public Builder imageScaleType(ImageScaleType paramImageScaleType)
    {
      imageScaleType = paramImageScaleType;
      return this;
    }
    
    public Builder resetViewBeforeLoading(boolean paramBoolean)
    {
      resetViewBeforeLoading = paramBoolean;
      return this;
    }
    
    public Builder showImageOnFail(int paramInt)
    {
      imageResOnFail = paramInt;
      return this;
    }
    
    Builder syncLoading(boolean paramBoolean)
    {
      isSyncLoading = paramBoolean;
      return this;
    }
  }
}
