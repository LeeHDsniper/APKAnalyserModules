package com.dumplingsandwich.pencilsketch.processor;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Color;
import android.graphics.Matrix;
import java.lang.reflect.Array;

public class GrayscaleImageProcessor
{
  public static Bitmap grayscaleBaseSketch(Bitmap paramBitmap)
  {
    int j = paramBitmap.getWidth();
    int k = paramBitmap.getHeight();
    int[] arrayOfInt1 = new int[j * k];
    int[] arrayOfInt2 = new int[j * k];
    paramBitmap.getPixels(arrayOfInt1, 0, j, 0, 0, j, k);
    int i = 0;
    while (i < k * j)
    {
      arrayOfInt1[i] = ((Color.red(arrayOfInt1[i]) + Color.green(arrayOfInt1[i]) + Color.blue(arrayOfInt1[i])) / 3);
      arrayOfInt2[i] = (255 - arrayOfInt1[i]);
      i += 1;
    }
    ImageProcessorHelper.gaussGray(arrayOfInt2, 50.0D, 50.0D, j, k);
    i = 0;
    while (i < k * j)
    {
      int m = Math.min((arrayOfInt1[i] << 8) / (256 - arrayOfInt2[i]), 255);
      arrayOfInt1[i] = Color.rgb(m, m, m);
      i += 1;
    }
    return Bitmap.createBitmap(arrayOfInt1, j, k, Bitmap.Config.ARGB_8888);
  }
  
  public static Bitmap grayscaleCrossHatchSketch(Bitmap paramBitmap1, Bitmap paramBitmap2, float paramFloat)
  {
    int j = paramBitmap1.getHeight();
    int k = paramBitmap1.getWidth();
    Object localObject = paramBitmap2;
    if (k > j)
    {
      localObject = new Matrix();
      ((Matrix)localObject).postRotate(-90.0F);
      localObject = Bitmap.createBitmap(paramBitmap2, 0, 0, paramBitmap2.getWidth(), paramBitmap2.getHeight(), (Matrix)localObject, true);
    }
    paramBitmap2 = Bitmap.createScaledBitmap((Bitmap)localObject, k, j, true);
    localObject = new int[k * j];
    int[] arrayOfInt = new int[k * j];
    paramBitmap1.getPixels((int[])localObject, 0, k, 0, 0, k, j);
    paramBitmap2.getPixels(arrayOfInt, 0, k, 0, 0, k, j);
    int i = 0;
    while (i < j * k)
    {
      int m = (int)(Color.red(localObject[i]) * 0.299D + Color.green(localObject[i]) * 0.587D + Color.blue(localObject[i]) * 0.114D);
      m = (int)(Color.red(arrayOfInt[i]) * (1.0F - paramFloat) + m * paramFloat);
      localObject[i] = Color.rgb(m, m, m);
      i += 1;
    }
    return Bitmap.createBitmap((int[])localObject, k, j, Bitmap.Config.ARGB_8888);
  }
  
  public static Bitmap grayscaleEdgeSketch(Bitmap paramBitmap)
  {
    int n = paramBitmap.getHeight();
    int i1 = paramBitmap.getWidth();
    int[][] arrayOfInt1 = (int[][])Array.newInstance(Integer.TYPE, new int[] { n, i1 });
    int[] arrayOfInt = new int[i1 * n];
    paramBitmap.getPixels(arrayOfInt, 0, i1, 0, 0, i1, n);
    int i = 0;
    int j;
    while (i < n)
    {
      j = 0;
      while (j < i1)
      {
        arrayOfInt1[i][j] = Color.red(arrayOfInt[(i * i1 + j)]);
        j += 1;
      }
      i += 1;
    }
    i = 1;
    while (i < n - 1)
    {
      j = 1;
      while (j < i1 - 1)
      {
        int k = Math.abs(arrayOfInt1[(i + 1)][(j - 1)] + arrayOfInt1[(i + 1)][j] + arrayOfInt1[(i + 1)][(j + 1)] - arrayOfInt1[(i - 1)][(j - 1)] - arrayOfInt1[(i - 1)][j] - arrayOfInt1[(i - 1)][(j + 1)]);
        int m = Math.abs(arrayOfInt1[(i - 1)][(j + 1)] + arrayOfInt1[i][(j + 1)] + arrayOfInt1[(i + 1)][(j + 1)] - arrayOfInt1[(i - 1)][(j - 1)] - arrayOfInt1[i][(j - 1)] - arrayOfInt1[(i + 1)][(j - 1)]);
        m = (int)Math.sqrt(k * k + m * m);
        k = m;
        if (m > 255) {
          k = 255;
        }
        k = 255 - k;
        arrayOfInt[(i * i1 + j)] = Color.rgb(k, k, k);
        j += 1;
      }
      i += 1;
    }
    paramBitmap = (int[][])null;
    return Bitmap.createBitmap(arrayOfInt, i1, n, Bitmap.Config.ARGB_8888);
  }
}
