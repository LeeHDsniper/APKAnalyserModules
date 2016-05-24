package com.adobe.creativesdk.aviary.internal.utils;

import android.graphics.Matrix;

public final class MatrixUtils
{
  public static float[] getScale(Matrix paramMatrix)
  {
    float[] arrayOfFloat = new float[9];
    paramMatrix.getValues(arrayOfFloat);
    return new float[] { arrayOfFloat[0], arrayOfFloat[4] };
  }
  
  public static void mapPoints(Matrix paramMatrix, float[] paramArrayOfFloat)
  {
    float[] arrayOfFloat = new float[9];
    float[] tmp6_5 = arrayOfFloat;
    tmp6_5[0] = 0.0F;
    float[] tmp10_6 = tmp6_5;
    tmp10_6[1] = 0.0F;
    float[] tmp14_10 = tmp10_6;
    tmp14_10[2] = 0.0F;
    float[] tmp18_14 = tmp14_10;
    tmp18_14[3] = 0.0F;
    float[] tmp22_18 = tmp18_14;
    tmp22_18[4] = 0.0F;
    float[] tmp26_22 = tmp22_18;
    tmp26_22[5] = 0.0F;
    float[] tmp30_26 = tmp26_22;
    tmp30_26[6] = 0.0F;
    float[] tmp35_30 = tmp30_26;
    tmp35_30[7] = 0.0F;
    float[] tmp40_35 = tmp35_30;
    tmp40_35[8] = 0.0F;
    tmp40_35;
    paramMatrix.getValues(arrayOfFloat);
    paramArrayOfFloat[0] = (paramArrayOfFloat[0] * arrayOfFloat[0] + arrayOfFloat[2]);
    paramArrayOfFloat[1] = (paramArrayOfFloat[1] * arrayOfFloat[4] + arrayOfFloat[5]);
    if (paramArrayOfFloat.length == 4)
    {
      paramArrayOfFloat[2] = (paramArrayOfFloat[2] * arrayOfFloat[0] + arrayOfFloat[2]);
      paramArrayOfFloat[3] = (paramArrayOfFloat[3] * arrayOfFloat[4] + arrayOfFloat[5]);
    }
  }
}
