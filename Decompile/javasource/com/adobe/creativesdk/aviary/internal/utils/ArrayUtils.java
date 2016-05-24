package com.adobe.creativesdk.aviary.internal.utils;

import java.util.List;

public final class ArrayUtils
{
  public static final float[] EMPTY_FLOAT_ARRAY = new float[0];
  
  public static float[] toPrimitive(List<Float> paramList)
  {
    Object localObject;
    if (paramList == null)
    {
      localObject = null;
      return localObject;
    }
    if (paramList.size() == 0) {
      return EMPTY_FLOAT_ARRAY;
    }
    float[] arrayOfFloat = new float[paramList.size()];
    int i = 0;
    for (;;)
    {
      localObject = arrayOfFloat;
      if (i >= paramList.size()) {
        break;
      }
      arrayOfFloat[i] = ((Float)paramList.get(i)).floatValue();
      i += 1;
    }
  }
}
