package com.tencent.mobileqq.activity.photo;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.media.ExifInterface;
import android.util.DisplayMetrics;
import com.tencent.image.SafeBitmapFactory;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.transfile.bitmapcreator.BitmapDecoder;
import com.tencent.qphone.base.util.QLog;
import java.io.IOException;
import java.net.URL;

public class ThumbDecoder
  implements BitmapDecoder
{
  private float jdField_a_of_type_Float;
  private LocalMediaInfo jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo;
  
  public ThumbDecoder(Context paramContext, LocalMediaInfo paramLocalMediaInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_Float = getResourcesgetDisplayMetricsdensity;
    jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo = paramLocalMediaInfo;
  }
  
  static int a(int paramInt1, int paramInt2, int paramInt3)
  {
    int j = 1;
    int i;
    if (paramInt1 > paramInt2) {
      i = paramInt2;
    }
    while (i > paramInt3 * 2)
    {
      j *= 2;
      i /= 2;
      continue;
      i = paramInt1;
    }
    return a(paramInt1, paramInt2, paramInt3, j);
  }
  
  private static int a(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    paramInt3 = paramInt3 * paramInt3 * paramInt4 * paramInt4;
    while (paramInt1 * paramInt2 > paramInt3 * 4)
    {
      paramInt3 *= 4;
      paramInt4 *= 2;
    }
    return paramInt4;
  }
  
  @Deprecated
  static int a(String paramString)
  {
    try
    {
      paramString = new ExifInterface(paramString);
      if (paramString == null) {
        return 0;
      }
    }
    catch (IOException paramString)
    {
      for (;;)
      {
        if (QLog.isColorLevel()) {
          QLog.e("hehe", 2, "new ExifInterface", paramString);
        }
        paramString = null;
      }
      switch (paramString.getAttributeInt("Orientation", 0))
      {
      case 4: 
      case 5: 
      case 7: 
      default: 
        return 0;
      }
    }
    return 180;
    return 90;
    return 270;
  }
  
  public Bitmap a(URL paramURL)
  {
    Object localObject = jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo;
    if (localObject != null)
    {
      paramURL = new BitmapFactory.Options();
      inJustDecodeBounds = true;
      SafeBitmapFactory.decodeFile(a, paramURL);
      inSampleSize = a(outWidth, outHeight, f);
      inJustDecodeBounds = false;
      int i;
      int k;
      Rect localRect;
      RectF localRectF;
      try
      {
        paramURL = SafeBitmapFactory.decodeFile(a, paramURL);
        if (paramURL == null)
        {
          if (QLog.isColorLevel()) {
            QLog.e("ThumbDecoder", 2, "decode bitmap return null,maybe oom");
          }
          return paramURL;
        }
      }
      catch (OutOfMemoryError paramURL)
      {
        for (;;)
        {
          paramURL.printStackTrace();
          paramURL = null;
        }
        i = URLDrawableHelper.a(a);
        if ((i == 0) && (paramURL.getWidth() == f) && (paramURL.getHeight() == f) && (paramURL.getConfig() == Bitmap.Config.RGB_565)) {
          return paramURL;
        }
        j = paramURL.getWidth();
        k = paramURL.getHeight();
        localRect = new Rect();
        localRectF = new RectF(0.0F, 0.0F, f, f);
        if (j <= k) {
          break label286;
        }
      }
      int j = (j - k) / 2;
      localRect.set(j, 0, j + k, k + 0);
      for (;;)
      {
        localObject = Bitmap.createBitmap(f, f, Bitmap.Config.RGB_565);
        if (localObject == null) {
          break label312;
        }
        new Canvas((Bitmap)localObject).drawBitmap(paramURL, localRect, localRectF, new Paint(6));
        paramURL.recycle();
        paramURL = (URL)localObject;
        if (i == 0) {
          break;
        }
        return FlowThumbDecoder.a((Bitmap)localObject, i);
        label286:
        k = (k - j) / 2;
        localRect.set(0, k, 0 + j, j + k);
      }
    }
    label312:
    return null;
  }
}
