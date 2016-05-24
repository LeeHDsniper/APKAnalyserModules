package com.facebook.ads.internal.util;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.BitmapFactory;
import java.io.File;
import java.io.FileOutputStream;

public class m
{
  static Bitmap a(Context paramContext, String paramString)
  {
    return BitmapFactory.decodeFile(new File(paramContext.getCacheDir(), String.format("%d.png", new Object[] { Integer.valueOf(paramString.hashCode()) })).getAbsolutePath());
  }
  
  static void a(Context paramContext, String paramString, Bitmap paramBitmap)
  {
    paramContext = new File(paramContext.getCacheDir(), String.format("%d.png", new Object[] { Integer.valueOf(paramString.hashCode()) }));
    try
    {
      paramContext = new FileOutputStream(paramContext);
      paramBitmap.compress(Bitmap.CompressFormat.PNG, 100, paramContext);
      paramContext.flush();
      paramContext.close();
      return;
    }
    catch (Exception paramContext) {}
  }
}
