package com.tencent.theme;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.os.SystemClock;
import android.util.Log;
import android.util.SparseArray;
import android.util.TypedValue;

public class e
  extends SparseArray<ColorStateList>
{
  SparseArray<Integer> a;
  SparseArray<ColorStateList> b;
  SkinEngine c;
  
  public e(SkinEngine paramSkinEngine, Resources paramResources, SparseArray<ColorStateList> paramSparseArray, Class paramClass, int paramInt)
  {
    c = paramSkinEngine;
    b = paramSparseArray;
    a = new SparseArray(paramClass.getDeclaredFields().length + 10);
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
            a.put(assetCookie << 24 | data, Integer.valueOf(paramInt));
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
  
  public ColorStateList a(int paramInt)
  {
    Integer localInteger = (Integer)a.get(paramInt);
    if (localInteger == null) {
      return (ColorStateList)b.get(paramInt);
    }
    return c.b(localInteger.intValue());
  }
}
