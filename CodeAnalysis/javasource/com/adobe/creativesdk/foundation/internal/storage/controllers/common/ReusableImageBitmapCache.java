package com.adobe.creativesdk.foundation.internal.storage.controllers.common;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.util.LruCache;
import java.lang.ref.SoftReference;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public class ReusableImageBitmapCache
{
  private static final Bitmap.CompressFormat DEFAULT_COMPRESS_FORMAT = Bitmap.CompressFormat.JPEG;
  private ImageCacheParams mCacheParams;
  private final Object mDiskCacheLock = new Object();
  private boolean mDiskCacheStarting = true;
  private LruCache<String, BitmapDrawable> mMemoryCache;
  private Set<SoftReference<Bitmap>> mReusableBitmaps;
  
  private ReusableImageBitmapCache(ImageCacheParams paramImageCacheParams)
  {
    init(paramImageCacheParams);
  }
  
  private static RetainFragment findOrCreateRetainFragment(FragmentManager paramFragmentManager)
  {
    RetainFragment localRetainFragment2 = (RetainFragment)paramFragmentManager.findFragmentByTag("ImageCache");
    RetainFragment localRetainFragment1 = localRetainFragment2;
    if (localRetainFragment2 == null)
    {
      localRetainFragment1 = new RetainFragment();
      paramFragmentManager.beginTransaction().add(localRetainFragment1, "ImageCache").commitAllowingStateLoss();
    }
    return localRetainFragment1;
  }
  
  @TargetApi(19)
  public static int getBitmapSize(BitmapDrawable paramBitmapDrawable)
  {
    paramBitmapDrawable = paramBitmapDrawable.getBitmap();
    if (PlatformCommonUtils.hasKitKat()) {
      return paramBitmapDrawable.getAllocationByteCount();
    }
    if (PlatformCommonUtils.hasHoneycombMR1()) {
      return paramBitmapDrawable.getByteCount();
    }
    return paramBitmapDrawable.getRowBytes() * paramBitmapDrawable.getHeight();
  }
  
  public static ReusableImageBitmapCache getInstance(FragmentManager paramFragmentManager, ImageCacheParams paramImageCacheParams)
  {
    RetainFragment localRetainFragment = findOrCreateRetainFragment(paramFragmentManager);
    ReusableImageBitmapCache localReusableImageBitmapCache = (ReusableImageBitmapCache)localRetainFragment.getObject();
    paramFragmentManager = localReusableImageBitmapCache;
    if (localReusableImageBitmapCache == null)
    {
      paramFragmentManager = new ReusableImageBitmapCache(paramImageCacheParams);
      localRetainFragment.setObject(paramFragmentManager);
    }
    return paramFragmentManager;
  }
  
  private void init(ImageCacheParams paramImageCacheParams)
  {
    mCacheParams = paramImageCacheParams;
    if (mCacheParams.memoryCacheEnabled)
    {
      if (PlatformCommonUtils.hasHoneycomb()) {
        mReusableBitmaps = Collections.synchronizedSet(new HashSet());
      }
      mMemoryCache = new LruCache(mCacheParams.memCacheSize)
      {
        protected void entryRemoved(boolean paramAnonymousBoolean, String paramAnonymousString, BitmapDrawable paramAnonymousBitmapDrawable1, BitmapDrawable paramAnonymousBitmapDrawable2)
        {
          if (PlatformCommonUtils.hasHoneycomb()) {}
        }
        
        protected int sizeOf(String paramAnonymousString, BitmapDrawable paramAnonymousBitmapDrawable)
        {
          int j = ReusableImageBitmapCache.getBitmapSize(paramAnonymousBitmapDrawable) / 1024;
          int i = j;
          if (j == 0) {
            i = 1;
          }
          return i;
        }
      };
    }
  }
  
  public void addBitmapToCache(String paramString, BitmapDrawable paramBitmapDrawable)
  {
    if ((paramString == null) || (paramBitmapDrawable == null)) {}
    while (mMemoryCache == null) {
      return;
    }
    mMemoryCache.put(paramString, paramBitmapDrawable);
  }
  
  public void clearCache()
  {
    if (mMemoryCache != null) {
      mMemoryCache.evictAll();
    }
  }
  
  public BitmapDrawable getBitmapFromMemCache(String paramString)
  {
    BitmapDrawable localBitmapDrawable = null;
    if (mMemoryCache != null) {
      localBitmapDrawable = (BitmapDrawable)mMemoryCache.get(paramString);
    }
    return localBitmapDrawable;
  }
  
  public static class ImageCacheParams
  {
    public Bitmap.CompressFormat compressFormat = ReusableImageBitmapCache.DEFAULT_COMPRESS_FORMAT;
    public int compressQuality = 70;
    public int diskCacheSize = 10485760;
    public int memCacheSize = 5120;
    public boolean memoryCacheEnabled = true;
    
    public ImageCacheParams() {}
    
    public void setMemCacheSizePercent(float paramFloat)
    {
      if ((paramFloat < 0.01F) || (paramFloat > 0.8F)) {
        throw new IllegalArgumentException("setMemCacheSizePercent - percent must be between 0.01 and 0.8 (inclusive)");
      }
      memCacheSize = Math.round((float)Runtime.getRuntime().maxMemory() * paramFloat / 1024.0F);
    }
  }
  
  public static class RetainFragment
    extends Fragment
  {
    private Object mObject;
    
    public RetainFragment() {}
    
    public Object getObject()
    {
      return mObject;
    }
    
    public void onCreate(Bundle paramBundle)
    {
      super.onCreate(paramBundle);
      setRetainInstance(true);
    }
    
    public void setObject(Object paramObject)
    {
      mObject = paramObject;
    }
  }
}
