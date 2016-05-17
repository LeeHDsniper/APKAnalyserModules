package com.tencent.mobileqq.activity.aio.audiopanel;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class CircleProgressView
  extends ImageView
{
  private static final int b = 5;
  private static final int c = -15158035;
  private int jdField_a_of_type_Int;
  private Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  private Matrix jdField_a_of_type_AndroidGraphicsMatrix;
  private Paint jdField_a_of_type_AndroidGraphicsPaint;
  private Rect jdField_a_of_type_AndroidGraphicsRect;
  private RectF jdField_a_of_type_AndroidGraphicsRectF;
  private int d;
  
  public CircleProgressView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsMatrix = new Matrix();
    jdField_a_of_type_AndroidGraphicsRectF = new RectF();
    jdField_a_of_type_AndroidGraphicsRect = new Rect();
    jdField_a_of_type_Int = 0;
    d = -1;
    a(paramContext);
  }
  
  private void a(Context paramContext)
  {
    jdField_a_of_type_AndroidGraphicsPaint = new Paint();
    jdField_a_of_type_AndroidGraphicsPaint.setAntiAlias(true);
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    int j = getWidth();
    int k = getHeight();
    int i = paramCanvas.getSaveCount();
    paramCanvas.save();
    if (jdField_a_of_type_AndroidGraphicsBitmap != null) {}
    for (;;)
    {
      try
      {
        Bitmap localBitmap = Bitmap.createBitmap(jdField_a_of_type_AndroidGraphicsBitmap.getWidth(), jdField_a_of_type_AndroidGraphicsBitmap.getHeight(), Bitmap.Config.ARGB_8888);
        if ((jdField_a_of_type_AndroidGraphicsBitmap != null) && (localBitmap != null))
        {
          jdField_a_of_type_AndroidGraphicsRect.set(0, 0, jdField_a_of_type_AndroidGraphicsBitmap.getWidth(), jdField_a_of_type_AndroidGraphicsBitmap.getHeight());
          jdField_a_of_type_AndroidGraphicsPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.CLEAR));
          jdField_a_of_type_AndroidGraphicsRectF.set(0.0F, 0.0F, j, k);
          j = jdField_a_of_type_Int * 360 / 100;
          Canvas localCanvas = new Canvas(localBitmap);
          localCanvas.drawBitmap(jdField_a_of_type_AndroidGraphicsBitmap, null, jdField_a_of_type_AndroidGraphicsRect, null);
          localCanvas.drawArc(jdField_a_of_type_AndroidGraphicsRectF, j - 90, 360 - j, true, jdField_a_of_type_AndroidGraphicsPaint);
          paramCanvas.drawBitmap(localBitmap, null, jdField_a_of_type_AndroidGraphicsRect, null);
          localBitmap.recycle();
          paramCanvas.restoreToCount(i);
          super.onDraw(paramCanvas);
          return;
        }
      }
      catch (OutOfMemoryError localOutOfMemoryError)
      {
        localObject = null;
        continue;
      }
      if (d > 0) {}
      for (float f = d;; f = 2.5F)
      {
        jdField_a_of_type_AndroidGraphicsRectF.set(f, f, j - f, k - f);
        jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.STROKE);
        jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(5.0F);
        jdField_a_of_type_AndroidGraphicsPaint.setColor(-15158035);
        j = jdField_a_of_type_Int * 360 / 100;
        paramCanvas.drawArc(jdField_a_of_type_AndroidGraphicsRectF, 270.0F, j, false, jdField_a_of_type_AndroidGraphicsPaint);
        break;
      }
      Object localObject = null;
    }
  }
  
  public void setProgress(int paramInt)
  {
    jdField_a_of_type_Int = paramInt;
    invalidate();
  }
  
  public void setProgressBitmap(Bitmap paramBitmap)
  {
    jdField_a_of_type_AndroidGraphicsBitmap = paramBitmap;
  }
  
  public void setStrokeWidth(int paramInt)
  {
    d = paramInt;
  }
}
