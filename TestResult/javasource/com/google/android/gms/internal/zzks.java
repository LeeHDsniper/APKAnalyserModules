package com.google.android.gms.internal;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;

public final class zzks
{
  public static Bitmap zza(Bitmap paramBitmap)
  {
    int k = 0;
    if (paramBitmap == null) {
      return null;
    }
    int m = paramBitmap.getWidth();
    int i = paramBitmap.getHeight();
    int j;
    if (m >= i)
    {
      k = (i - m) / 2;
      j = 0;
    }
    for (;;)
    {
      Bitmap localBitmap = Bitmap.createBitmap(i, i, Bitmap.Config.ARGB_8888);
      Canvas localCanvas = new Canvas(localBitmap);
      Paint localPaint = new Paint(1);
      localPaint.setColor(-16777216);
      localCanvas.drawCircle(i / 2, i / 2, i / 2, localPaint);
      localPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
      localCanvas.drawBitmap(paramBitmap, k, j, localPaint);
      return localBitmap;
      j = (m - i) / 2;
      i = m;
    }
  }
  
  private static Bitmap zza(Drawable paramDrawable)
  {
    if (paramDrawable == null) {
      return null;
    }
    if ((paramDrawable instanceof BitmapDrawable)) {
      return ((BitmapDrawable)paramDrawable).getBitmap();
    }
    Bitmap localBitmap = Bitmap.createBitmap(paramDrawable.getIntrinsicWidth(), paramDrawable.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
    Canvas localCanvas = new Canvas(localBitmap);
    paramDrawable.setBounds(0, 0, localCanvas.getWidth(), localCanvas.getHeight());
    paramDrawable.draw(localCanvas);
    return localBitmap;
  }
  
  public static Drawable zza(Resources paramResources, Drawable paramDrawable)
  {
    return new BitmapDrawable(paramResources, zza(zza(paramDrawable)));
  }
}
