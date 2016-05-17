package com.tencent.mobileqq.activity.photo;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.media.ExifInterface;
import android.util.DisplayMetrics;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.transfile.URLDrawableHelper;
import com.tencent.mobileqq.transfile.bitmapcreator.BitmapDecoder;
import com.tencent.qphone.base.util.QLog;
import java.io.IOException;
import java.net.URL;

public class FlowThumbDecoder
  implements BitmapDecoder
{
  public static float a = 0.0F;
  static final int jdField_a_of_type_Int = -1;
  private static final String jdField_a_of_type_JavaLangString = "FlowThumbDecoder";
  public static float b = 0.0F;
  static final int b = 0;
  public static float c = 0.0F;
  static final int c = 1;
  public static float d = 0.0F;
  static final int d = 2;
  public static float e;
  private Context jdField_a_of_type_AndroidContentContext;
  LocalMediaInfo jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo;
  private float f;
  
  public FlowThumbDecoder(Context paramContext, LocalMediaInfo paramLocalMediaInfo)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    f = getResourcesgetDisplayMetricsdensity;
    if (jdField_a_of_type_Float == 0.0F) {
      throw new RuntimeException("Not init item size...");
    }
    jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo = paramLocalMediaInfo;
    jdField_a_of_type_AndroidContentContext = paramContext;
  }
  
  private static int a(int paramInt1, int paramInt2)
  {
    int i = 1;
    while (paramInt1 > paramInt2)
    {
      i *= 2;
      paramInt1 /= 2;
    }
    return i;
  }
  
  public static int a(LocalMediaInfo paramLocalMediaInfo, int paramInt1, int paramInt2)
  {
    if ((paramInt1 == 0) || (paramInt2 == 0)) {
      return -1;
    }
    if ((jdField_a_of_type_Int == 90) || (jdField_a_of_type_Int == 270)) {}
    for (float f1 = paramInt2 / paramInt1; (Float.compare(f1, e) != -1) && (Float.compare(f1, d) != 1); f1 = paramInt1 / paramInt2) {
      return 0;
    }
    if (Float.compare(f1, e) == -1) {
      return 1;
    }
    return 2;
  }
  
  @Deprecated
  private static int a(String paramString)
  {
    int j = 0;
    int i = 0;
    try
    {
      paramString = new ExifInterface(paramString);
      if (paramString == null)
      {
        j = i;
        return j;
      }
    }
    catch (IOException paramString)
    {
      for (;;)
      {
        QLog.e("hehe", 2, "new ExifInterface", paramString);
        paramString = null;
      }
      i = j;
      switch (paramString.getAttributeInt("Orientation", 0))
      {
      default: 
        i = j;
      }
    }
    for (;;)
    {
      j = i;
      if (!QLog.isColorLevel()) {
        break;
      }
      QLog.i("FlowThumbDecoder", 2, "FlowThumbDecoder rotation " + i);
      return i;
      i = 90;
      continue;
      i = 180;
      continue;
      i = 270;
    }
  }
  
  /* Error */
  protected static Bitmap a(Context paramContext, LocalMediaInfo paramLocalMediaInfo, BitmapFactory.Options paramOptions)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aload_1
    //   4: invokestatic 139	com/tencent/mobileqq/utils/AlbumUtil:a	(Lcom/tencent/mobileqq/activity/photo/LocalMediaInfo;)I
    //   7: istore_3
    //   8: iload_3
    //   9: ifne +19 -> 28
    //   12: aload_1
    //   13: getfield 141	com/tencent/mobileqq/activity/photo/LocalMediaInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   16: aload_2
    //   17: invokestatic 147	android/graphics/BitmapFactory:decodeFile	(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   20: astore 4
    //   22: aload 4
    //   24: areturn
    //   25: astore_0
    //   26: aload_0
    //   27: athrow
    //   28: iload_3
    //   29: iconst_1
    //   30: if_icmpne -8 -> 22
    //   33: aload_1
    //   34: getfield 149	com/tencent/mobileqq/activity/photo/LocalMediaInfo:b	Z
    //   37: ifeq +17 -> 54
    //   40: aload_0
    //   41: invokevirtual 153	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   44: aload_1
    //   45: getfield 156	com/tencent/mobileqq/activity/photo/LocalMediaInfo:jdField_a_of_type_Long	J
    //   48: iconst_1
    //   49: aload_2
    //   50: invokestatic 162	android/provider/MediaStore$Video$Thumbnails:getThumbnail	(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    //   53: areturn
    //   54: aload_1
    //   55: getfield 141	com/tencent/mobileqq/activity/photo/LocalMediaInfo:jdField_a_of_type_JavaLangString	Ljava/lang/String;
    //   58: iconst_1
    //   59: invokestatic 168	android/media/ThumbnailUtils:createVideoThumbnail	(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    //   62: astore_0
    //   63: aload_0
    //   64: astore 4
    //   66: aload_2
    //   67: ifnull -45 -> 22
    //   70: aload_0
    //   71: astore 4
    //   73: aload_0
    //   74: ifnull -52 -> 22
    //   77: aload_2
    //   78: aload_0
    //   79: invokevirtual 174	android/graphics/Bitmap:getHeight	()I
    //   82: putfield 179	android/graphics/BitmapFactory$Options:outHeight	I
    //   85: aload_2
    //   86: aload_0
    //   87: invokevirtual 182	android/graphics/Bitmap:getWidth	()I
    //   90: putfield 185	android/graphics/BitmapFactory$Options:outWidth	I
    //   93: aload_0
    //   94: areturn
    //   95: astore_0
    //   96: aconst_null
    //   97: areturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	98	0	paramContext	Context
    //   0	98	1	paramLocalMediaInfo	LocalMediaInfo
    //   0	98	2	paramOptions	BitmapFactory.Options
    //   7	24	3	i	int
    //   1	71	4	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   12	22	25	finally
    //   12	22	95	java/lang/OutOfMemoryError
  }
  
  public static Bitmap a(Context paramContext, LocalMediaInfo paramLocalMediaInfo, BitmapFactory.Options paramOptions, int paramInt)
  {
    Object localObject = null;
    if (paramInt == 1) {
      inSampleSize = a(outWidth, f);
    }
    int j;
    int k;
    int i;
    try
    {
      for (;;)
      {
        paramOptions = a(paramContext, paramLocalMediaInfo, paramOptions);
        if (paramOptions != null) {
          break;
        }
        if (QLog.isColorLevel()) {
          QLog.e("ThumbDecoder", 2, "decode bitmap return null,maybe oom");
        }
        paramLocalMediaInfo = paramOptions;
        return paramLocalMediaInfo;
        if (paramInt == 2) {
          inSampleSize = a(outHeight, g);
        } else {
          inSampleSize = a(outWidth, f);
        }
      }
    }
    catch (OutOfMemoryError paramContext)
    {
      for (;;)
      {
        paramContext.printStackTrace();
        paramOptions = null;
      }
      j = paramOptions.getWidth();
      k = paramOptions.getHeight();
      i = jdField_a_of_type_Int;
      if ((paramInt == 0) && (i == 0) && (j == f) && (k == g) && (paramOptions.getConfig() == Bitmap.Config.RGB_565)) {
        return paramOptions;
      }
      if (paramInt != 1) {
        break label389;
      }
    }
    if ((i == 90) || (i == 270))
    {
      paramInt = f * k / g;
      j = (j - paramInt) / 2;
      paramContext = new Rect(j, 0, paramInt + j, k);
    }
    for (;;)
    {
      label218:
      Rect localRect = new Rect(0, 0, f, g);
      Bitmap localBitmap = Bitmap.createBitmap(f, g, Bitmap.Config.RGB_565);
      paramLocalMediaInfo = localObject;
      if (localBitmap == null) {
        break;
      }
      new Canvas(localBitmap).drawBitmap(paramOptions, paramContext, localRect, new Paint(6));
      paramOptions.recycle();
      if (i != 0) {}
      for (paramOptions = a(localBitmap, i);; paramOptions = localBitmap)
      {
        paramLocalMediaInfo = paramOptions;
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.i("FlowThumbDecoder", 2, "FlowThumbDecoder src " + paramContext + ", dst " + localRect);
        return paramOptions;
        paramInt = g * j / f;
        k = (k - paramInt) / 2;
        paramContext = new Rect(0, k, j, paramInt + k);
        break label218;
        label389:
        if (paramInt != 2) {
          break label497;
        }
        if ((i == 90) || (i == 270))
        {
          paramInt = g * j / f;
          k = (k - paramInt) / 2;
          paramContext = new Rect(0, k, j, paramInt + k);
          break label218;
        }
        paramInt = f * k / g;
        j = (j - paramInt) / 2;
        paramContext = new Rect(j, 0, paramInt + j, k);
        break label218;
      }
      label497:
      paramContext = null;
    }
  }
  
  public static Bitmap a(Bitmap paramBitmap, int paramInt)
  {
    Object localObject = paramBitmap;
    if (paramInt != 0)
    {
      localObject = paramBitmap;
      if (paramBitmap != null)
      {
        localObject = paramBitmap;
        if (!paramBitmap.isRecycled())
        {
          localObject = new Matrix();
          ((Matrix)localObject).setRotate(paramInt, paramBitmap.getWidth() / 2.0F, paramBitmap.getHeight() / 2.0F);
        }
      }
    }
    try
    {
      Bitmap localBitmap = Bitmap.createBitmap(paramBitmap, 0, 0, paramBitmap.getWidth(), paramBitmap.getHeight(), (Matrix)localObject, true);
      localObject = paramBitmap;
      if (paramBitmap != localBitmap)
      {
        paramBitmap.recycle();
        localObject = localBitmap;
      }
      return localObject;
    }
    catch (OutOfMemoryError paramBitmap)
    {
      throw paramBitmap;
    }
  }
  
  public static void a(LocalMediaInfo paramLocalMediaInfo, int paramInt1, int paramInt2)
  {
    int i = a(paramLocalMediaInfo, paramInt1, paramInt2);
    if (i == 0) {
      if (f <= 0) {
        f = (g * paramInt1 / paramInt2);
      }
    }
    label30:
    do
    {
      do
      {
        do
        {
          break label30;
          do
          {
            return;
          } while (g > 0);
          g = (f * paramInt2 / paramInt1);
          return;
          if (i != 1) {
            break;
          }
          if (f <= 0)
          {
            f = ((int)c);
            return;
          }
        } while (g > 0);
        g = ((int)c);
        return;
      } while (i != 2);
      if (f <= 0)
      {
        f = ((int)b);
        return;
      }
    } while (g > 0);
    g = ((int)b);
  }
  
  public Bitmap a(URL paramURL)
  {
    paramURL = jdField_a_of_type_AndroidContentContext;
    LocalMediaInfo localLocalMediaInfo = jdField_a_of_type_ComTencentMobileqqActivityPhotoLocalMediaInfo;
    int i = URLDrawableHelper.a(jdField_a_of_type_JavaLangString);
    if ((i == 90) || (i == 270)) {
      f = ((int)jdField_a_of_type_Float);
    }
    BitmapFactory.Options localOptions;
    for (g = 0;; g = ((int)jdField_a_of_type_Float))
    {
      localOptions = new BitmapFactory.Options();
      inJustDecodeBounds = true;
      a(paramURL, localLocalMediaInfo, localOptions);
      if ((outWidth != 0) && (outHeight != 0)) {
        break;
      }
      return null;
      f = 0;
    }
    if (QLog.isColorLevel()) {
      QLog.i("FlowThumbDecoder", 2, "FlowThumbDecoder origin w " + outWidth + " h " + outHeight);
    }
    inJustDecodeBounds = false;
    i = a(localLocalMediaInfo, outWidth, outHeight);
    if ((f <= 0) || (g <= 0)) {
      a(localLocalMediaInfo, outWidth, outHeight);
    }
    return a(paramURL, localLocalMediaInfo, localOptions, i);
  }
}
