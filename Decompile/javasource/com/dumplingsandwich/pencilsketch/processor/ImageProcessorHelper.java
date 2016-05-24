package com.dumplingsandwich.pencilsketch.processor;

public class ImageProcessorHelper
{
  private static void findConstants(double[] paramArrayOfDouble1, double[] paramArrayOfDouble2, double[] paramArrayOfDouble3, double[] paramArrayOfDouble4, double[] paramArrayOfDouble5, double[] paramArrayOfDouble6, double paramDouble)
  {
    double d4 = Math.sqrt(6.283186D) * paramDouble;
    double d1 = -1.783D / paramDouble;
    double d2 = -1.723D / paramDouble;
    double d3 = 0.6318D / paramDouble;
    paramDouble = 1.997D / paramDouble;
    double d5 = 1.6803D / d4;
    double d6 = 3.735D / d4;
    double d7 = -0.6803D / d4;
    d4 = -0.2598D / d4;
    paramArrayOfDouble1[0] = (d5 + d7);
    paramArrayOfDouble1[1] = (Math.exp(d2) * (Math.sin(paramDouble) * d4 - (2.0D * d5 + d7) * Math.cos(paramDouble)) + Math.exp(d1) * (Math.sin(d3) * d6 - (2.0D * d7 + d5) * Math.cos(d3)));
    paramArrayOfDouble1[2] = (2.0D * Math.exp(d1 + d2) * ((d5 + d7) * Math.cos(paramDouble) * Math.cos(d3) - Math.cos(paramDouble) * d6 * Math.sin(d3) - Math.cos(d3) * d4 * Math.sin(paramDouble)) + Math.exp(2.0D * d1) * d7 + Math.exp(2.0D * d2) * d5);
    paramArrayOfDouble1[3] = (Math.exp(2.0D * d1 + d2) * (Math.sin(paramDouble) * d4 - Math.cos(paramDouble) * d7) + Math.exp(2.0D * d2 + d1) * (Math.sin(d3) * d6 - Math.cos(d3) * d5));
    paramArrayOfDouble1[4] = 0.0D;
    paramArrayOfDouble3[0] = 0.0D;
    paramArrayOfDouble3[1] = (-2.0D * Math.exp(d2) * Math.cos(paramDouble) - 2.0D * Math.exp(d1) * Math.cos(d3));
    paramArrayOfDouble3[2] = (4.0D * Math.cos(paramDouble) * Math.cos(d3) * Math.exp(d1 + d2) + Math.exp(2.0D * d2) + Math.exp(2.0D * d1));
    paramArrayOfDouble3[3] = (-2.0D * Math.cos(d3) * Math.exp(2.0D * d2 + d1) - 2.0D * Math.cos(paramDouble) * Math.exp(2.0D * d1 + d2));
    paramArrayOfDouble3[4] = Math.exp(2.0D * d1 + 2.0D * d2);
    int i = 0;
    while (i <= 4)
    {
      paramArrayOfDouble4[i] = paramArrayOfDouble3[i];
      i += 1;
    }
    paramArrayOfDouble2[0] = 0.0D;
    i = 1;
    while (i <= 4)
    {
      paramArrayOfDouble1[i] -= paramArrayOfDouble3[i] * paramArrayOfDouble1[0];
      i += 1;
    }
    d2 = 0.0D;
    d1 = 0.0D;
    paramDouble = 0.0D;
    i = 0;
    while (i <= 4)
    {
      d2 += paramArrayOfDouble1[i];
      d1 += paramArrayOfDouble2[i];
      paramDouble += paramArrayOfDouble3[i];
      i += 1;
    }
    d2 /= (1.0D + paramDouble);
    paramDouble = d1 / (1.0D + paramDouble);
    i = 0;
    while (i <= 4)
    {
      paramArrayOfDouble3[i] *= d2;
      paramArrayOfDouble4[i] *= paramDouble;
      i += 1;
    }
  }
  
  public static int gaussGray(int[] paramArrayOfInt, double paramDouble1, double paramDouble2, int paramInt1, int paramInt2)
  {
    int i4 = Math.max(paramInt1, paramInt2);
    double[] arrayOfDouble1 = new double[i4];
    double[] arrayOfDouble2 = new double[i4];
    double[] arrayOfDouble3 = new double[5];
    double[] arrayOfDouble4 = new double[5];
    double[] arrayOfDouble5 = new double[5];
    double[] arrayOfDouble6 = new double[5];
    double[] arrayOfDouble7 = new double[5];
    double[] arrayOfDouble8 = new double[5];
    int[] arrayOfInt1 = new int[i4];
    int[] arrayOfInt2 = new int[i4];
    int[] arrayOfInt3 = new int[4];
    int[] arrayOfInt4 = new int[4];
    double d = paramDouble2;
    int k;
    int i;
    int i2;
    int i1;
    int n;
    int m;
    int i3;
    int j;
    if (paramDouble2 > 0.0D)
    {
      paramDouble2 = Math.abs(paramDouble2) + 1.0D;
      findConstants(arrayOfDouble3, arrayOfDouble4, arrayOfDouble5, arrayOfDouble6, arrayOfDouble7, arrayOfDouble8, Math.sqrt(-(paramDouble2 * paramDouble2) / (2.0D * Math.log(0.00392156862745098D))));
      k = 0;
      for (;;)
      {
        d = paramDouble2;
        if (k >= paramInt1) {
          break;
        }
        i = 0;
        while (i < i4)
        {
          arrayOfDouble1[i] = 0.0D;
          arrayOfDouble2[i] = 0.0D;
          i += 1;
        }
        i = 0;
        while (i < paramInt2)
        {
          arrayOfInt1[i] = paramArrayOfInt[(i * paramInt1 + k)];
          i += 1;
        }
        i2 = 0;
        i1 = paramInt2 - 1;
        n = 0;
        m = paramInt2 - 1;
        arrayOfInt3[0] = arrayOfInt1[0];
        arrayOfInt4[0] = arrayOfInt1[(paramInt2 - 1)];
        i = 0;
        while (i < paramInt2)
        {
          if (i < 4) {}
          for (i3 = i;; i3 = 4)
          {
            j = 0;
            while (j <= i3)
            {
              arrayOfDouble1[n] += arrayOfDouble3[j] * arrayOfInt1[(i2 - j)] - arrayOfDouble5[j] * arrayOfDouble1[(n - j)];
              arrayOfDouble2[m] += arrayOfDouble4[j] * arrayOfInt1[(i1 + j)] - arrayOfDouble6[j] * arrayOfDouble2[(m + j)];
              j += 1;
            }
          }
          while (j <= 4)
          {
            arrayOfDouble1[n] += (arrayOfDouble3[j] - arrayOfDouble7[j]) * arrayOfInt3[0];
            arrayOfDouble2[m] += (arrayOfDouble4[j] - arrayOfDouble8[j]) * arrayOfInt4[0];
            j += 1;
          }
          i2 += 1;
          i1 -= 1;
          n += 1;
          m -= 1;
          i += 1;
        }
        transferGaussPixels(arrayOfDouble1, arrayOfDouble2, arrayOfInt2, 1, paramInt2);
        i = 0;
        while (i < paramInt2)
        {
          paramArrayOfInt[(i * paramInt1 + k)] = arrayOfInt2[i];
          i += 1;
        }
        k += 1;
      }
    }
    if (paramDouble1 > 0.0D)
    {
      paramDouble1 = Math.abs(paramDouble1) + 1.0D;
      if (paramDouble1 != d) {
        findConstants(arrayOfDouble3, arrayOfDouble4, arrayOfDouble5, arrayOfDouble6, arrayOfDouble7, arrayOfDouble8, Math.sqrt(-(paramDouble1 * paramDouble1) / (2.0D * Math.log(0.00392156862745098D))));
      }
      k = 0;
      while (k < paramInt2)
      {
        i = 0;
        while (i < i4)
        {
          arrayOfDouble1[i] = 0.0D;
          arrayOfDouble2[i] = 0.0D;
          i += 1;
        }
        i = 0;
        while (i < paramInt1)
        {
          arrayOfInt1[i] = paramArrayOfInt[(k * paramInt1 + i)];
          i += 1;
        }
        i2 = 0;
        i1 = paramInt1 - 1;
        n = 0;
        m = paramInt1 - 1;
        arrayOfInt3[0] = arrayOfInt1[0];
        arrayOfInt4[0] = arrayOfInt1[(paramInt1 - 1)];
        i = 0;
        while (i < paramInt1)
        {
          if (i < 4) {}
          for (i3 = i;; i3 = 4)
          {
            j = 0;
            while (j <= i3)
            {
              arrayOfDouble1[n] += arrayOfDouble3[j] * arrayOfInt1[(i2 - j)] - arrayOfDouble5[j] * arrayOfDouble1[(n - j)];
              arrayOfDouble2[m] += arrayOfDouble4[j] * arrayOfInt1[(i1 + j)] - arrayOfDouble6[j] * arrayOfDouble2[(m + j)];
              j += 1;
            }
          }
          while (j <= 4)
          {
            arrayOfDouble1[n] += (arrayOfDouble3[j] - arrayOfDouble7[j]) * arrayOfInt3[0];
            arrayOfDouble2[m] += (arrayOfDouble4[j] - arrayOfDouble8[j]) * arrayOfInt4[0];
            j += 1;
          }
          i2 += 1;
          i1 -= 1;
          n += 1;
          m -= 1;
          i += 1;
        }
        transferGaussPixels(arrayOfDouble1, arrayOfDouble2, arrayOfInt2, 1, paramInt1);
        i = 0;
        while (i < paramInt1)
        {
          paramArrayOfInt[(k * paramInt1 + i)] = arrayOfInt2[i];
          i += 1;
        }
        k += 1;
      }
    }
    return 0;
  }
  
  private static void transferGaussPixels(double[] paramArrayOfDouble1, double[] paramArrayOfDouble2, int[] paramArrayOfInt, int paramInt1, int paramInt2)
  {
    int m = 0;
    int k = 0;
    int j = 0;
    int i = 0;
    if (m < paramInt1 * paramInt2)
    {
      double d2 = paramArrayOfDouble1[i] + paramArrayOfDouble2[j];
      double d1;
      if (d2 > 255.0D) {
        d1 = 255.0D;
      }
      for (;;)
      {
        paramArrayOfInt[k] = ((int)d1);
        m += 1;
        k += 1;
        j += 1;
        i += 1;
        break;
        d1 = d2;
        if (d2 < 0.0D) {
          d1 = 0.0D;
        }
      }
    }
  }
}
