package com.adobe.creativesdk.aviary.internal.utils;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;

public final class BitmapUtils
{
  static PorterDuffColorFilter mWhiteMultiplyFilter = new PorterDuffColorFilter(-1, PorterDuff.Mode.MULTIPLY);
  
  public static Bitmap circleMask(Bitmap paramBitmap, float paramFloat)
  {
    Bitmap localBitmap = Bitmap.createBitmap(paramBitmap.getWidth(), paramBitmap.getHeight(), Bitmap.Config.ARGB_8888);
    Canvas localCanvas = new Canvas(localBitmap);
    Shader localShader = createShader(paramBitmap);
    Paint localPaint = new Paint();
    localPaint.setAntiAlias(true);
    localPaint.setShader(localShader);
    localCanvas.drawCircle(paramBitmap.getWidth() / 2, paramBitmap.getHeight() / 2, paramFloat, localPaint);
    return localBitmap;
  }
  
  public static boolean compareBySize(Drawable paramDrawable, Bitmap paramBitmap)
  {
    if ((paramDrawable == null) || (paramBitmap == null)) {}
    while ((paramDrawable.getIntrinsicWidth() != paramBitmap.getWidth()) || (paramDrawable.getIntrinsicHeight() != paramBitmap.getHeight())) {
      return true;
    }
    return false;
  }
  
  public static boolean compareBySize(Drawable paramDrawable1, Drawable paramDrawable2)
  {
    if ((paramDrawable1 == null) || (paramDrawable2 == null)) {}
    while ((paramDrawable1.getIntrinsicWidth() != paramDrawable2.getIntrinsicWidth()) || (paramDrawable1.getIntrinsicHeight() != paramDrawable2.getIntrinsicHeight())) {
      return true;
    }
    return false;
  }
  
  public static Bitmap copy(Bitmap paramBitmap, Bitmap.Config paramConfig)
  {
    int i = paramBitmap.getWidth();
    int j = paramBitmap.getHeight();
    Bitmap.Config localConfig = paramConfig;
    if (paramConfig == null) {
      localConfig = Bitmap.Config.ARGB_8888;
    }
    paramConfig = Bitmap.createBitmap(i, j, localConfig);
    new Canvas(paramConfig).drawBitmap(paramBitmap, new Matrix(), null);
    return paramConfig;
  }
  
  public static void copy(Bitmap paramBitmap1, Bitmap paramBitmap2)
  {
    if ((paramBitmap1.getWidth() == paramBitmap2.getWidth()) && (paramBitmap1.getHeight() == paramBitmap2.getHeight()))
    {
      new Canvas(paramBitmap2).drawBitmap(paramBitmap1, new Matrix(), null);
      return;
    }
    Canvas localCanvas = new Canvas(paramBitmap2);
    Paint localPaint = new Paint();
    localCanvas.drawBitmap(paramBitmap1, null, new Rect(0, 0, paramBitmap2.getWidth(), paramBitmap2.getHeight()), localPaint);
  }
  
  public static Shader createShader(Bitmap paramBitmap)
  {
    return new BitmapShader(paramBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
  }
  
  public static Bitmap extractDrawable(Drawable paramDrawable)
  {
    if ((paramDrawable instanceof BitmapDrawable)) {
      return ((BitmapDrawable)paramDrawable).getBitmap();
    }
    Bitmap localBitmap = Bitmap.createBitmap(paramDrawable.getIntrinsicWidth(), paramDrawable.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
    paramDrawable.draw(new Canvas(localBitmap));
    return localBitmap;
  }
  
  public static Bitmap resizeBitmap(Bitmap paramBitmap, int paramInt1, int paramInt2)
    throws OutOfMemoryError
  {
    return resizeBitmap(paramBitmap, paramInt1, paramInt2, 0);
  }
  
  public static Bitmap resizeBitmap(Bitmap paramBitmap, int paramInt1, int paramInt2, int paramInt3)
    throws OutOfMemoryError
  {
    if ((paramInt2 <= 0) || (paramInt1 <= 0)) {
      throw new IllegalArgumentException();
    }
    int i = paramInt1;
    int j = paramInt2;
    int k = paramBitmap.getWidth();
    int m = paramBitmap.getHeight();
    if ((paramInt3 == 90) || (paramInt3 == 270))
    {
      i = paramInt2;
      j = paramInt1;
    }
    paramInt1 = 0;
    double d;
    Object localObject;
    if ((k > i) || (m > j))
    {
      paramInt1 = 1;
      if (k / i > m / j)
      {
        d = i / k;
        j = (int)(m * d);
        if (paramInt1 == 0)
        {
          localObject = paramBitmap;
          if (paramInt3 == 0) {}
        }
        else
        {
          if (paramInt3 != 0) {
            break label170;
          }
        }
      }
    }
    for (paramBitmap = Bitmap.createScaledBitmap(paramBitmap, i, j, true);; paramBitmap = Bitmap.createBitmap(paramBitmap, 0, 0, k, m, (Matrix)localObject, true))
    {
      localObject = paramBitmap;
      return localObject;
      d = j / m;
      i = (int)(k * d);
      break;
      i = k;
      j = m;
      break;
      label170:
      localObject = new Matrix();
      ((Matrix)localObject).postScale(i / k, j / m);
      ((Matrix)localObject).postRotate(paramInt3);
    }
  }
}
