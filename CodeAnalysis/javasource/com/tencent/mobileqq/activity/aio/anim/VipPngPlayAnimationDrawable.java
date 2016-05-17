package com.tencent.mobileqq.activity.aio.anim;

import android.content.res.AssetManager;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.util.Utils;
import com.tencent.qphone.base.util.QLog;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;

public class VipPngPlayAnimationDrawable
  extends Drawable
  implements Runnable
{
  static final int jdField_a_of_type_Int = -1;
  private static final String jdField_a_of_type_JavaLangString = "VipPngPlayAnimationDrawable";
  static final int b = 50;
  public static final int c = 101;
  public static final int d = 102;
  public static final int e = 103;
  public static final int f = 0;
  public static final int g = 1;
  public static final int h = 2;
  public Resources a;
  public Bitmap a;
  private Paint jdField_a_of_type_AndroidGraphicsPaint;
  private Rect jdField_a_of_type_AndroidGraphicsRect;
  public Handler a;
  public VipPngPlayAnimationDrawable.DecodeNextFrameTask a;
  public Object a;
  public boolean a;
  public Bitmap b;
  public boolean b;
  public boolean c;
  public boolean d;
  public int i;
  public int j;
  public int k;
  public int l;
  private int m;
  private int n;
  private int o;
  private int p;
  
  public VipPngPlayAnimationDrawable(Resources paramResources)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    i = -1;
    m = -1;
    j = -1;
    n = 0;
    k = 50;
    jdField_a_of_type_AndroidGraphicsRect = new Rect();
    jdField_a_of_type_AndroidOsHandler = new Handler(Looper.getMainLooper());
    jdField_a_of_type_Boolean = true;
    jdField_b_of_type_Boolean = false;
    l = 0;
    c = false;
    d = false;
    jdField_a_of_type_AndroidGraphicsPaint = new Paint(6);
    jdField_a_of_type_AndroidContentResResources = paramResources;
  }
  
  protected int a(int paramInt)
  {
    if (paramInt == n - 1)
    {
      l -= 1;
      return 0;
    }
    return paramInt + 1;
  }
  
  protected Bitmap a(int paramInt1, Object paramObject, int paramInt2)
  {
    BitmapFactory.Options localOptions = new BitmapFactory.Options();
    switch (paramInt1)
    {
    default: 
      return null;
    case 1: 
    case 2: 
      paramObject = (int[])paramObject;
      paramInt1 = paramObject[((paramInt2 + 1) % paramObject.length)];
      return BitmapFactory.decodeResource(jdField_a_of_type_AndroidContentResResources, paramInt1, localOptions);
    }
    paramObject = (String[])paramObject;
    paramObject = paramObject[((paramInt2 + 1) % paramObject.length)];
    inDensity = 320;
    inTargetDensity = jdField_a_of_type_AndroidContentResResources.getDisplayMetrics().densityDpi;
    if (paramObject.startsWith("file:///android_assets/bubbles/")) {
      paramObject = paramObject.substring("file:///android_assets/".length());
    }
    for (paramObject = jdField_a_of_type_AndroidContentResResources.getAssets().open(paramObject);; paramObject = new FileInputStream(paramObject)) {
      return BitmapFactory.decodeStream(paramObject, null, localOptions);
    }
  }
  
  public void a()
  {
    if (jdField_a_of_type_AndroidGraphicsBitmap != null)
    {
      jdField_a_of_type_AndroidGraphicsBitmap.recycle();
      jdField_a_of_type_AndroidGraphicsBitmap = null;
    }
    if (jdField_b_of_type_AndroidGraphicsBitmap != null)
    {
      jdField_b_of_type_AndroidGraphicsBitmap.recycle();
      jdField_b_of_type_AndroidGraphicsBitmap = null;
    }
    if (jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable$DecodeNextFrameTask != null)
    {
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable$DecodeNextFrameTask.cancel(false);
      jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable$DecodeNextFrameTask = null;
    }
    i = -1;
    jdField_a_of_type_Boolean = true;
    j = -1;
    k = 50;
    l = -1;
    d = true;
  }
  
  public void a(int paramInt)
  {
    m = paramInt;
  }
  
  public void a(int paramInt1, int paramInt2)
  {
    n = paramInt1;
    l = paramInt2;
    d = false;
  }
  
  public void a(boolean paramBoolean)
  {
    jdField_b_of_type_Boolean = paramBoolean;
    if (!paramBoolean) {
      super.invalidateSelf();
    }
  }
  
  public void a(String[] paramArrayOfString, int paramInt)
  {
    a(paramArrayOfString, paramInt, true);
  }
  
  public void a(String[] paramArrayOfString, int paramInt, boolean paramBoolean)
  {
    if ((i == 0) && (Arrays.equals((String[])jdField_a_of_type_JavaLangObject, paramArrayOfString))) {
      return;
    }
    for (;;)
    {
      BitmapFactory.Options localOptions;
      try
      {
        a();
        i = 0;
        jdField_a_of_type_JavaLangObject = paramArrayOfString;
        localOptions = new BitmapFactory.Options();
        inJustDecodeBounds = true;
        String str = paramArrayOfString[0];
        if (str.startsWith("file:///android_assets/bubbles/"))
        {
          str = str.substring("file:///android_assets/".length());
          BitmapFactory.decodeStream(jdField_a_of_type_AndroidContentResResources.getAssets().open(str), null, localOptions);
          if (paramBoolean)
          {
            o = Utils.a(outWidth, 320, jdField_a_of_type_AndroidContentResResources.getDisplayMetrics().densityDpi);
            p = Utils.a(outHeight, 320, jdField_a_of_type_AndroidContentResResources.getDisplayMetrics().densityDpi);
          }
          n = paramArrayOfString.length;
          k = paramInt;
          d = false;
          return;
        }
      }
      catch (IOException paramArrayOfString)
      {
        if (QLog.isDevelopLevel()) {
          QLog.e("VipPngPlayAnimationDrawable", 4, "", paramArrayOfString);
        }
        a();
        return;
      }
      BitmapFactory.decodeFile(paramArrayOfString[0], localOptions);
    }
  }
  
  public boolean a()
  {
    return (!d) && (j >= 0);
  }
  
  protected void b()
  {
    if ((i == 1) && (j >= 0)) {
      jdField_a_of_type_AndroidOsHandler.postDelayed(this, k);
    }
    while ((!jdField_a_of_type_Boolean) || (jdField_b_of_type_Boolean)) {
      return;
    }
    jdField_a_of_type_Boolean = false;
    long l1 = SystemClock.uptimeMillis();
    long l2 = k;
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable$DecodeNextFrameTask = new VipPngPlayAnimationDrawable.DecodeNextFrameTask(this, jdField_a_of_type_JavaLangObject);
    jdField_a_of_type_ComTencentMobileqqActivityAioAnimVipPngPlayAnimationDrawable$DecodeNextFrameTask.execute(new Long[] { Long.valueOf(l1 + l2), Long.valueOf(j), Long.valueOf(i) });
  }
  
  public void draw(Canvas paramCanvas)
  {
    if (i == -1) {
      return;
    }
    if (j != -1)
    {
      Rect localRect = super.getBounds();
      int i1 = 0;
      if (c)
      {
        i1 = paramCanvas.save();
        paramCanvas.scale(-1.0F, 1.0F, localRect.centerX(), localRect.centerY());
      }
      if (i != 1) {
        break label109;
      }
      if (c) {
        paramCanvas.restoreToCount(i1);
      }
    }
    if (l == 0)
    {
      if ((102 == m) || (103 == m)) {}
      for (;;)
      {
        super.invalidateSelf();
        d = true;
        return;
        label109:
        if (((i != 0) && (i != 2)) || (jdField_a_of_type_AndroidGraphicsBitmap == null) || (jdField_a_of_type_AndroidGraphicsPaint == null)) {
          break;
        }
        paramCanvas.drawBitmap(jdField_a_of_type_AndroidGraphicsBitmap, null, super.getBounds(), jdField_a_of_type_AndroidGraphicsPaint);
        break;
        a();
      }
    }
    b();
  }
  
  public int getIntrinsicHeight()
  {
    return p;
  }
  
  public int getIntrinsicWidth()
  {
    return o;
  }
  
  public int getOpacity()
  {
    return -3;
  }
  
  public void run()
  {
    if (jdField_b_of_type_AndroidGraphicsBitmap == null) {}
    do
    {
      return;
      jdField_a_of_type_Boolean = true;
      j = a(j);
    } while ((i == -1) || (jdField_b_of_type_AndroidGraphicsBitmap == null) || (jdField_a_of_type_AndroidGraphicsBitmap == jdField_b_of_type_AndroidGraphicsBitmap));
    if (jdField_a_of_type_AndroidGraphicsBitmap != null) {
      jdField_a_of_type_AndroidGraphicsBitmap.recycle();
    }
    jdField_a_of_type_AndroidGraphicsBitmap = jdField_b_of_type_AndroidGraphicsBitmap;
    jdField_b_of_type_AndroidGraphicsBitmap = null;
    super.invalidateSelf();
  }
  
  public void setAlpha(int paramInt)
  {
    if (paramInt != jdField_a_of_type_AndroidGraphicsPaint.getAlpha())
    {
      jdField_a_of_type_AndroidGraphicsPaint.setAlpha(paramInt);
      super.invalidateSelf();
    }
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    jdField_a_of_type_AndroidGraphicsPaint.setColorFilter(paramColorFilter);
    super.invalidateSelf();
  }
  
  public void setDither(boolean paramBoolean)
  {
    jdField_a_of_type_AndroidGraphicsPaint.setDither(paramBoolean);
    super.invalidateSelf();
  }
}
