package com.tencent.theme;

import android.annotation.TargetApi;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.os.SystemClock;
import android.util.Log;
import android.util.LongSparseArray;
import android.util.TypedValue;

@TargetApi(16)
public class d
  extends LongSparseArray
{
  LongSparseArray<Integer> a;
  LongSparseArray<ColorStateList> b;
  SkinEngine c;
  
  public d(SkinEngine paramSkinEngine, Resources paramResources, LongSparseArray paramLongSparseArray, Class paramClass, int paramInt)
  {
    c = paramSkinEngine;
    b = paramLongSparseArray;
    a = new LongSparseArray(paramClass.getDeclaredFields().length + 10);
    long l1 = SystemClock.uptimeMillis();
    paramSkinEngine = new TypedValue();
    try
    {
      for (;;)
      {
        paramResources.getValue(paramInt, paramSkinEngine, true);
        if ((type >= 28) && (type <= 31))
        {
          paramInt += 1;
        }
        else
        {
          if (string.toString().endsWith(".xml")) {
            a.put(assetCookie << 32 | data, Integer.valueOf(paramInt));
          }
          paramInt += 1;
        }
      }
      long l2;
      return;
    }
    catch (Resources.NotFoundException paramSkinEngine)
    {
      if (SkinEngine.DEBUG)
      {
        l2 = SystemClock.uptimeMillis();
        Log.d("SkinEngine", "int ColorStateListPreloadIntercepter cost: " + (l2 - l1));
      }
    }
  }
  
  public Object get(long paramLong)
  {
    Integer localInteger = (Integer)a.get(paramLong);
    if (localInteger == null) {
      return b.get(paramLong);
    }
    return c.b(localInteger.intValue());
  }
}
