package com.tencent.theme;

import android.annotation.TargetApi;
import android.content.res.Resources;
import android.util.LongSparseArray;

@TargetApi(16)
class f
  extends d
{
  public f(SkinEngine paramSkinEngine, Resources paramResources, LongSparseArray paramLongSparseArray, Class paramClass, int paramInt)
  {
    super(paramSkinEngine, paramResources, paramLongSparseArray, paramClass, paramInt);
  }
  
  public Object get(long paramLong)
  {
    Object localObject = (Integer)a.get(paramLong);
    if (localObject == null) {
      return b.get(paramLong);
    }
    localObject = c.b(((Integer)localObject).intValue());
    if (localObject != null) {
      return a;
    }
    return null;
  }
}
