package com.adobe.creativesdk.aviary.utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.text.TextUtils;
import android.util.Log;
import com.adobe.creativesdk.aviary.internal.InternalConstants;
import com.adobe.creativesdk.aviary.internal.filters.ToolLoaderFactory;
import com.adobe.creativesdk.aviary.internal.headless.utils.MegaPixels;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SharedPreferencesUtils
{
  public static final String DEFAULT_SIZE_STR = String.valueOf(InternalConstants.DEFAULT_SIZE.ordinal());
  static volatile SharedPreferencesUtils sInstance;
  private final SharedPreferences preferences;
  
  SharedPreferencesUtils(Context paramContext)
  {
    preferences = paramContext.getSharedPreferences("com.aviary.android.feather.standalone", 4);
  }
  
  public static SharedPreferencesUtils getInstance(Context paramContext)
  {
    Object localObject = sInstance;
    if (localObject == null)
    {
      for (;;)
      {
        try
        {
          SharedPreferencesUtils localSharedPreferencesUtils = sInstance;
          localObject = localSharedPreferencesUtils;
          if (localSharedPreferencesUtils == null)
          {
            localObject = new SharedPreferencesUtils(paramContext);
            sInstance = (SharedPreferencesUtils)localObject;
          }
        }
        finally
        {
          continue;
        }
        try
        {
          Log.i("SharedPreferencesUtils", "new SharedPreferencesUtils");
          return localObject;
        }
        finally {}
      }
      throw paramContext;
    }
    return localObject;
  }
  
  public boolean containsSingleTimeKey(String paramString)
  {
    return containsSingleTimeKey(paramString, true);
  }
  
  public boolean containsSingleTimeKey(String paramString, boolean paramBoolean)
  {
    boolean bool = hasKey(paramString);
    if ((!bool) && (paramBoolean)) {
      putBoolean(paramString, true);
    }
    return bool;
  }
  
  public final boolean getBoolean(String paramString, boolean paramBoolean)
  {
    return preferences.getBoolean(paramString, paramBoolean);
  }
  
  public String getCdsContentGroup()
  {
    return getString("aviary.cds.content-group-name", "A");
  }
  
  public long getCdsContentGroupUpdateTime()
  {
    return getLong("aviary.cds.content-group-update-time", 0L);
  }
  
  public long getCdsLastExecutionTime()
  {
    return getLong("aviary.cds.last-execution-time", 0L);
  }
  
  public String[] getDisabledTools()
  {
    return preferences.getString("12.aviary.disabled.tools", "").split(",");
  }
  
  public final int getInt(String paramString, int paramInt)
  {
    return preferences.getInt(paramString, paramInt);
  }
  
  public final long getLong(String paramString, long paramLong)
  {
    return preferences.getLong(paramString, paramLong);
  }
  
  public String[] getOrderedTools()
  {
    String str = preferences.getString("12.aviary.ordered.tools", "");
    if (TextUtils.isEmpty(str)) {
      return ToolLoaderFactory.getAllTools();
    }
    return str.split(",");
  }
  
  public final int getOutputImageQuality()
  {
    return getInt("aviary.output.image.quality", 97);
  }
  
  public MegaPixels getOutputImageSize()
  {
    MegaPixels localMegaPixels;
    if (!hasKey("aviary.output.image.size.2")) {
      localMegaPixels = InternalConstants.DEFAULT_SIZE;
    }
    do
    {
      return localMegaPixels;
      Object localObject1 = preferences.getString("aviary.output.image.size.2", DEFAULT_SIZE_STR);
      int i = 0;
      try
      {
        int j = Integer.parseInt((String)localObject1);
        i = j;
      }
      catch (Throwable localThrowable1)
      {
        for (;;)
        {
          localThrowable1.printStackTrace();
        }
      }
      localObject1 = InternalConstants.DEFAULT_SIZE;
      try
      {
        localMegaPixels = MegaPixels.values()[i];
        localObject1 = localMegaPixels;
      }
      catch (Throwable localThrowable2)
      {
        for (;;)
        {
          localThrowable2.printStackTrace();
        }
        Object localObject2 = localThrowable1;
      }
      if (((MegaPixels)localObject1).ordinal() < InternalConstants.NORMAL_SIZE.ordinal()) {
        return InternalConstants.NORMAL_SIZE;
      }
    } while (localThrowable1.ordinal() <= InternalConstants.ORIGINAL_SIZE.ordinal());
    return InternalConstants.ORIGINAL_SIZE;
  }
  
  public final String getString(String paramString1, String paramString2)
  {
    return preferences.getString(paramString1, paramString2);
  }
  
  public String[] getToolList()
  {
    int i = 0;
    Object localObject1 = ToolLoaderFactory.getAllTools();
    String[] arrayOfString2 = new String[0];
    String[] arrayOfString1;
    Object localObject2;
    if (!hasKey("12.aviary.disabled.tools"))
    {
      arrayOfString1 = arrayOfString2;
      localObject2 = localObject1;
      if (!hasKey("12.aviary.ordered.tools")) {}
    }
    else
    {
      if (hasKey("12.aviary.ordered.tools")) {
        localObject1 = getOrderedTools();
      }
      arrayOfString1 = arrayOfString2;
      localObject2 = localObject1;
      if (hasKey("12.aviary.disabled.tools"))
      {
        arrayOfString1 = getDisabledTools();
        localObject2 = localObject1;
      }
    }
    localObject1 = new ArrayList(Arrays.asList((Object[])localObject2));
    if ((arrayOfString1 != null) && (arrayOfString1.length > 0))
    {
      int j = arrayOfString1.length;
      while (i < j)
      {
        localObject2 = arrayOfString1[i];
        if (((List)localObject1).contains(localObject2)) {
          ((List)localObject1).remove(localObject2);
        }
        i += 1;
      }
    }
    return (String[])((List)localObject1).toArray(new String[((List)localObject1).size()]);
  }
  
  public boolean hasKey(String paramString)
  {
    return preferences.contains(paramString);
  }
  
  public boolean hasOverlayKey(int paramInt)
  {
    return hasKey("aviary.overlay-." + paramInt);
  }
  
  public boolean hasVibrationEnabled()
  {
    return getBoolean("aviary.widget.vibration", true);
  }
  
  public void markOverlayAsRead(int paramInt)
  {
    putInt("aviary.overlay-." + paramInt, 1);
  }
  
  public final void putBoolean(String paramString, boolean paramBoolean)
  {
    SharedPreferences.Editor localEditor = preferences.edit();
    localEditor.putBoolean(paramString, paramBoolean);
    localEditor.apply();
  }
  
  public final void putInt(String paramString, int paramInt)
  {
    SharedPreferences.Editor localEditor = preferences.edit();
    localEditor.putInt(paramString, paramInt);
    localEditor.apply();
  }
  
  public final void putLong(String paramString, long paramLong)
  {
    SharedPreferences.Editor localEditor = preferences.edit();
    localEditor.putLong(paramString, paramLong);
    localEditor.apply();
  }
  
  public final void putString(String paramString1, String paramString2)
  {
    SharedPreferences.Editor localEditor = preferences.edit();
    localEditor.putString(paramString1, paramString2);
    localEditor.apply();
  }
  
  public final void remove(String paramString)
  {
    SharedPreferences.Editor localEditor = preferences.edit();
    localEditor.remove(paramString);
    localEditor.apply();
  }
  
  public void setCdsContentGroup(String paramString)
  {
    putString("aviary.cds.content-group-name", paramString);
  }
  
  public void setCdsContentGroupUpdateTime(long paramLong)
  {
    putLong("aviary.cds.content-group-update-time", paramLong);
  }
  
  public void setCdsLastExecutionTime(long paramLong)
  {
    putLong("aviary.cds.last-execution-time", paramLong);
  }
}
