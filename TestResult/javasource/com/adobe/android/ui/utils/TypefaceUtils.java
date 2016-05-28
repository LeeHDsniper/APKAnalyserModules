package com.adobe.android.ui.utils;

import android.content.res.AssetManager;
import android.graphics.Typeface;
import android.text.TextUtils;
import java.util.HashMap;

public final class TypefaceUtils
{
  private static final HashMap<String, Typeface> S_TYPE_CACHE = new HashMap();
  
  public static Typeface createFromAsset(AssetManager paramAssetManager, String paramString)
  {
    if ((TextUtils.isEmpty(paramString)) || (paramAssetManager == null)) {
      return null;
    }
    Typeface localTypeface = getFromCache(paramString);
    if (localTypeface != null) {
      return localTypeface;
    }
    paramAssetManager = Typeface.createFromAsset(paramAssetManager, paramString);
    putIntoCache(paramString, paramAssetManager);
    return paramAssetManager;
  }
  
  private static Typeface getFromCache(String paramString)
  {
    synchronized (S_TYPE_CACHE)
    {
      paramString = (Typeface)S_TYPE_CACHE.get(paramString);
      return paramString;
    }
  }
  
  private static void putIntoCache(String paramString, Typeface paramTypeface)
  {
    synchronized (S_TYPE_CACHE)
    {
      S_TYPE_CACHE.put(paramString, paramTypeface);
      return;
    }
  }
}
