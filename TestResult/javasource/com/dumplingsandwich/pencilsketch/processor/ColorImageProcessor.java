package com.dumplingsandwich.pencilsketch.processor;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Color;
import android.graphics.Matrix;
import com.dumplingsandwich.pencilsketch.model.HsvPixel;

public class ColorImageProcessor
{
  public static Bitmap addPhotoFrame(Bitmap paramBitmap1, Bitmap paramBitmap2)
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
    if (i < j * k)
    {
      if (Color.alpha(arrayOfInt[i]) == 0) {}
      for (;;)
      {
        i += 1;
        break;
        localObject[i] = arrayOfInt[i];
      }
    }
    return Bitmap.createBitmap((int[])localObject, k, j, Bitmap.Config.ARGB_8888);
  }
  
  public static Bitmap flipImage(Bitmap paramBitmap, int paramInt)
  {
    Matrix localMatrix = new Matrix();
    Bitmap localBitmap;
    if (paramInt == 2)
    {
      localMatrix.preScale(1.0F, -1.0F);
      localBitmap = Bitmap.createBitmap(paramBitmap, 0, 0, paramBitmap.getWidth(), paramBitmap.getHeight(), localMatrix, true);
    }
    do
    {
      return localBitmap;
      localBitmap = paramBitmap;
    } while (paramInt != 1);
    localMatrix.preScale(-1.0F, 1.0F);
    return Bitmap.createBitmap(paramBitmap, 0, 0, paramBitmap.getWidth(), paramBitmap.getHeight(), localMatrix, true);
  }
  
  public static HsvPixel[] getHsvData(Bitmap paramBitmap)
  {
    int j = paramBitmap.getHeight();
    int k = paramBitmap.getWidth();
    int[] arrayOfInt = new int[k * j];
    HsvPixel[] arrayOfHsvPixel = new HsvPixel[k * j];
    paramBitmap.getPixels(arrayOfInt, 0, k, 0, 0, k, j);
    paramBitmap = new float[3];
    int i = 0;
    while (i < k * j)
    {
      Color.colorToHSV(arrayOfInt[i], paramBitmap);
      arrayOfHsvPixel[i] = new HsvPixel(paramBitmap[0], paramBitmap[1], paramBitmap[2]);
      i += 1;
    }
    return arrayOfHsvPixel;
  }
  
  public static Bitmap replaceIlluminationLayer(HsvPixel[] paramArrayOfHsvPixel, Bitmap paramBitmap)
  {
    int j = paramBitmap.getHeight();
    int k = paramBitmap.getWidth();
    int[] arrayOfInt = new int[k * j];
    paramBitmap.getPixels(arrayOfInt, 0, k, 0, 0, k, j);
    paramBitmap = new float[3];
    int i = 0;
    while (i < k * j)
    {
      paramBitmap[0] = h;
      paramBitmap[1] = s;
      paramBitmap[2] = (Color.red(arrayOfInt[i]) / 255.0F);
      arrayOfInt[i] = Color.HSVToColor(paramBitmap);
      i += 1;
    }
    return Bitmap.createBitmap(arrayOfInt, k, j, Bitmap.Config.ARGB_8888);
  }
  
  public static Bitmap rotateImage(Bitmap paramBitmap, float paramFloat)
  {
    Matrix localMatrix = new Matrix();
    localMatrix.postRotate(paramFloat);
    return Bitmap.createBitmap(paramBitmap, 0, 0, paramBitmap.getWidth(), paramBitmap.getHeight(), localMatrix, true);
  }
}
