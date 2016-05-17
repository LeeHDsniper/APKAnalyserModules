package com.tencent.mobileqq.activity.recent.cur;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import mhx;
import mhy;
import mhz;

public class DragFrameLayout
  extends FrameLayout
  implements IDragView.OnChangeModeListener
{
  public static final float a = 1.1F;
  public static final int a = -1;
  private static final int[] jdField_a_of_type_ArrayOfInt = { 2130839068, 2130839069, 2130839070, 2130839071, 2130839072 };
  private static final float jdField_b_of_type_Float = 0.3F;
  public static final int b = 0;
  private static final float c = 0.7F;
  public static final int c = 1;
  public static final int d = 2;
  public static final int e = 3;
  public static final int f = 4;
  public static final int g = 5;
  private Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  private Paint jdField_a_of_type_AndroidGraphicsPaint = new Paint();
  private PointF jdField_a_of_type_AndroidGraphicsPointF = new PointF(-1.0F, -1.0F);
  private Rect jdField_a_of_type_AndroidGraphicsRect = new Rect();
  private View jdField_a_of_type_AndroidViewView;
  private DragFrameLayout.IDragViewProvider jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout$IDragViewProvider;
  private final List jdField_a_of_type_JavaUtilList = new ArrayList();
  private mhx jdField_a_of_type_Mhx;
  private mhy jdField_a_of_type_Mhy;
  private mhz jdField_a_of_type_Mhz;
  private Bitmap jdField_b_of_type_AndroidGraphicsBitmap;
  private float d;
  private final int h;
  private final int i;
  private final int j;
  private int k = -1;
  private int l;
  private int m;
  private int n;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public DragFrameLayout(Context paramContext)
  {
    super(paramContext);
    super.setWillNotDraw(false);
    i = ((int)(3.0F * getResourcesgetDisplayMetricsdensity));
    j = ((int)(12.0F * getResourcesgetDisplayMetricsdensity));
    h = ((int)(48.0F * getResourcesgetDisplayMetricsdensity));
  }
  
  public DragFrameLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    super.setWillNotDraw(false);
    i = ((int)(3.0F * getResourcesgetDisplayMetricsdensity));
    j = ((int)(12.0F * getResourcesgetDisplayMetricsdensity));
    h = ((int)(48.0F * getResourcesgetDisplayMetricsdensity));
  }
  
  public DragFrameLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    super.setWillNotDraw(false);
    i = ((int)(3.0F * getResourcesgetDisplayMetricsdensity));
    j = ((int)(12.0F * getResourcesgetDisplayMetricsdensity));
    h = ((int)(48.0F * getResourcesgetDisplayMetricsdensity));
  }
  
  private static Bitmap a(View paramView)
  {
    Object localObject3 = null;
    paramView.setDrawingCacheEnabled(true);
    Bitmap localBitmap = paramView.getDrawingCache();
    Object localObject1 = localObject3;
    if (localBitmap != null) {}
    try
    {
      localObject1 = localBitmap.copy(Bitmap.Config.ARGB_8888, false);
      paramView.setDrawingCacheEnabled(false);
      return localObject1;
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        Object localObject2 = localObject3;
      }
    }
  }
  
  public static DragFrameLayout a(Activity paramActivity)
  {
    ViewGroup localViewGroup = (ViewGroup)paramActivity.getWindow().getDecorView();
    View localView = localViewGroup.getChildAt(0);
    if ((localView != null) && ((localView instanceof DragFrameLayout))) {
      return (DragFrameLayout)localView;
    }
    paramActivity = new DragFrameLayout(paramActivity.getApplication());
    localViewGroup.addView(paramActivity);
    localViewGroup.removeView(localView);
    paramActivity.addView(localView);
    return paramActivity;
  }
  
  private void a(Canvas paramCanvas)
  {
    if (k == -1) {}
    do
    {
      do
      {
        do
        {
          return;
          jdField_a_of_type_AndroidGraphicsPaint.setAntiAlias(true);
          if (l != 0) {
            jdField_a_of_type_AndroidGraphicsPaint.setColor(l);
          }
          while (k == 0)
          {
            paramCanvas.drawBitmap(b, jdField_a_of_type_AndroidGraphicsRect.left, jdField_a_of_type_AndroidGraphicsRect.top, jdField_a_of_type_AndroidGraphicsPaint);
            return;
            if (m == 1) {
              jdField_a_of_type_AndroidGraphicsPaint.setColor(-4797728);
            } else {
              jdField_a_of_type_AndroidGraphicsPaint.setColor(-65536);
            }
          }
          if (k == 1)
          {
            paramCanvas.save();
            f3 = n / 1.5F;
            f2 = n * (0.8F - 0.45F * d / h);
            f1 = f2;
            if (f2 > j) {
              f1 = j;
            }
            f2 = f1;
            if (f1 < i) {
              f2 = i;
            }
            if (QLog.isColorLevel()) {
              QLog.d("Drag", 2, "MODE_DRAG:" + f2 + " for " + d + ", " + h);
            }
            paramCanvas.translate(jdField_a_of_type_AndroidGraphicsRect.centerX(), jdField_a_of_type_AndroidGraphicsRect.centerY());
            paramCanvas.rotate((float)(Math.atan2(jdField_a_of_type_AndroidGraphicsPointF.y - jdField_a_of_type_AndroidGraphicsRect.centerY(), jdField_a_of_type_AndroidGraphicsPointF.x - jdField_a_of_type_AndroidGraphicsRect.centerX()) * 57.29577951308232D) - 90.0F);
            paramCanvas.translate(-f3, -f2);
            a(paramCanvas, f2, f3);
            paramCanvas.restore();
            jdField_a_of_type_AndroidGraphicsPaint.setColor(-16711936);
            paramCanvas.drawBitmap(b, jdField_a_of_type_AndroidGraphicsPointF.x - jdField_a_of_type_AndroidGraphicsRect.width() / 2.0F, jdField_a_of_type_AndroidGraphicsPointF.y - jdField_a_of_type_AndroidGraphicsRect.height() / 2.0F, jdField_a_of_type_AndroidGraphicsPaint);
            return;
          }
          if (k != 3) {
            break;
          }
        } while (jdField_a_of_type_Mhz == null);
        localObject = jdField_a_of_type_Mhz.a();
        jdField_a_of_type_AndroidGraphicsPointF.set((PointF)localObject);
        d = ((float)Math.sqrt((jdField_a_of_type_AndroidGraphicsPointF.x - jdField_a_of_type_AndroidGraphicsRect.centerX()) * (jdField_a_of_type_AndroidGraphicsPointF.x - jdField_a_of_type_AndroidGraphicsRect.centerX()) + (jdField_a_of_type_AndroidGraphicsPointF.y - jdField_a_of_type_AndroidGraphicsRect.centerY()) * (jdField_a_of_type_AndroidGraphicsPointF.y - jdField_a_of_type_AndroidGraphicsRect.centerY())));
        paramCanvas.save();
        float f3 = n / 1.5F;
        float f2 = (1.0F - d / h) * f3;
        float f1 = f2;
        if (f2 > j / 2) {
          f1 = j / 2;
        }
        f2 = f1;
        if (f1 < i) {
          f2 = i;
        }
        paramCanvas.translate(jdField_a_of_type_AndroidGraphicsRect.centerX(), jdField_a_of_type_AndroidGraphicsRect.centerY());
        paramCanvas.rotate((float)(Math.atan2(jdField_a_of_type_AndroidGraphicsPointF.y - jdField_a_of_type_AndroidGraphicsRect.centerY(), jdField_a_of_type_AndroidGraphicsPointF.x - jdField_a_of_type_AndroidGraphicsRect.centerX()) * 57.29577951308232D) - 90.0F);
        paramCanvas.translate(-f3, -f2);
        paramCanvas.restore();
        jdField_a_of_type_AndroidGraphicsPaint.setColor(-16711936);
        paramCanvas.drawBitmap(b, jdField_a_of_type_AndroidGraphicsPointF.x - jdField_a_of_type_AndroidGraphicsRect.width() / 2.0F, jdField_a_of_type_AndroidGraphicsPointF.y - jdField_a_of_type_AndroidGraphicsRect.height() / 2.0F, jdField_a_of_type_AndroidGraphicsPaint);
        postDelayed(jdField_a_of_type_Mhz, 60L);
        return;
        if (k == 2)
        {
          paramCanvas.drawBitmap(b, jdField_a_of_type_AndroidGraphicsPointF.x - jdField_a_of_type_AndroidGraphicsRect.width() / 2.0F, jdField_a_of_type_AndroidGraphicsPointF.y - jdField_a_of_type_AndroidGraphicsRect.height() / 2.0F, jdField_a_of_type_AndroidGraphicsPaint);
          return;
        }
        if (k != 4) {
          break;
        }
      } while (jdField_a_of_type_Mhy == null);
      localObject = jdField_a_of_type_Mhy.a();
      if (localObject != null) {
        paramCanvas.drawBitmap((Bitmap)localObject, new Rect(0, 0, ((Bitmap)localObject).getWidth(), ((Bitmap)localObject).getHeight()), new RectF(jdField_a_of_type_AndroidGraphicsPointF.x - ((Bitmap)localObject).getWidth() / 2.0F, jdField_a_of_type_AndroidGraphicsPointF.y - ((Bitmap)localObject).getHeight() / 2.0F, jdField_a_of_type_AndroidGraphicsPointF.x + ((Bitmap)localObject).getWidth() / 2.0F, jdField_a_of_type_AndroidGraphicsPointF.y + ((Bitmap)localObject).getHeight() / 2.0F), jdField_a_of_type_AndroidGraphicsPaint);
      }
      postDelayed(jdField_a_of_type_Mhy, 50L);
      return;
    } while ((k != 5) || (jdField_a_of_type_Mhx == null));
    Object localObject = jdField_a_of_type_Mhx.a();
    Bitmap localBitmap = jdField_a_of_type_Mhx.a();
    if ((localBitmap != null) && (x > 0.0F) && (y > 0.0F)) {
      paramCanvas.drawBitmap(localBitmap, new Rect(0, 0, localBitmap.getWidth(), localBitmap.getHeight()), new RectF(x - localBitmap.getWidth() / 2.0F, y - localBitmap.getHeight() / 2.0F, x + localBitmap.getWidth() / 2.0F, y + localBitmap.getHeight() / 2.0F), jdField_a_of_type_AndroidGraphicsPaint);
    }
    postDelayed(jdField_a_of_type_Mhx, 40L);
  }
  
  private void a(Canvas paramCanvas, float paramFloat1, float paramFloat2)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Drag", 2, "drawAtOrigion:" + paramFloat1 + ", " + paramFloat2);
    }
    float f1 = paramFloat1 + d;
    float f2 = paramFloat1 / 2.0F;
    float f3 = d;
    float f4 = paramFloat1 / 2.0F;
    float f5 = d;
    float f6 = paramFloat1 / 2.0F;
    float f7 = d;
    float f8 = paramFloat1 / 2.0F;
    float f9 = d;
    paramCanvas.drawCircle(paramFloat2, paramFloat1, paramFloat1, jdField_a_of_type_AndroidGraphicsPaint);
    Path localPath = new Path();
    localPath.moveTo(paramFloat2 + paramFloat1, paramFloat1);
    localPath.cubicTo(paramFloat2 + f6, paramFloat1 + 0.3F * f7, paramFloat2 + f8, paramFloat1 + 0.7F * f9, paramFloat2 + paramFloat2, 0.5F + f1);
    localPath.lineTo(paramFloat2 - paramFloat2, 0.5F + f1);
    localPath.cubicTo(paramFloat2 - f4, paramFloat1 + 0.7F * f5, paramFloat2 - f2, paramFloat1 + 0.3F * f3, paramFloat2 - paramFloat1, paramFloat1);
    paramCanvas.drawPath(localPath, jdField_a_of_type_AndroidGraphicsPaint);
  }
  
  private void a(boolean paramBoolean)
  {
    if (k == -1) {
      l = 0;
    }
    Iterator localIterator = jdField_a_of_type_JavaUtilList.iterator();
    while (localIterator.hasNext()) {
      ((DragFrameLayout.OnDragModeChangedListener)localIterator.next()).a(paramBoolean, m, this);
    }
  }
  
  public int a()
  {
    return k;
  }
  
  public View a()
  {
    return jdField_a_of_type_AndroidViewView;
  }
  
  public void a()
  {
    if (k != -1)
    {
      if (jdField_a_of_type_Mhz != null)
      {
        getHandler().removeCallbacks(jdField_a_of_type_Mhz);
        jdField_a_of_type_Mhz = null;
      }
      if (jdField_a_of_type_Mhy != null)
      {
        getHandler().removeCallbacks(jdField_a_of_type_Mhy);
        jdField_a_of_type_Mhy = null;
      }
      if (jdField_a_of_type_Mhx != null)
      {
        getHandler().removeCallbacks(jdField_a_of_type_Mhx);
        jdField_a_of_type_Mhx = null;
      }
      k = -1;
      a(false);
      b = null;
      jdField_a_of_type_AndroidViewView = null;
    }
  }
  
  public void a(View paramView, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.d("Drag", 2, "onModeChanged:" + paramView);
    }
    l = 0;
    jdField_a_of_type_AndroidGraphicsBitmap = a(paramView);
    if (jdField_a_of_type_AndroidGraphicsBitmap != null)
    {
      l = jdField_a_of_type_AndroidGraphicsBitmap.getPixel(jdField_a_of_type_AndroidGraphicsBitmap.getWidth() / 2, 1);
      if (QLog.isColorLevel()) {
        QLog.d("Drag", 2, "getOrginalCachePixel:" + l);
      }
      Object localObject = new Matrix();
      ((Matrix)localObject).postScale(1.1F, 1.1F);
      b = Bitmap.createBitmap(jdField_a_of_type_AndroidGraphicsBitmap, 0, 0, jdField_a_of_type_AndroidGraphicsBitmap.getWidth(), jdField_a_of_type_AndroidGraphicsBitmap.getHeight(), (Matrix)localObject, true);
      getGlobalVisibleRect(jdField_a_of_type_AndroidGraphicsRect);
      int i1 = jdField_a_of_type_AndroidGraphicsRect.left;
      int i2 = jdField_a_of_type_AndroidGraphicsRect.top;
      paramView.getGlobalVisibleRect(jdField_a_of_type_AndroidGraphicsRect);
      localObject = jdField_a_of_type_AndroidGraphicsRect;
      left -= i1;
      localObject = jdField_a_of_type_AndroidGraphicsRect;
      top -= i2;
      localObject = jdField_a_of_type_AndroidGraphicsRect;
      right -= i1;
      localObject = jdField_a_of_type_AndroidGraphicsRect;
      bottom -= i2;
      i1 = jdField_a_of_type_AndroidGraphicsRect.width();
      i2 = jdField_a_of_type_AndroidGraphicsRect.height();
      localObject = jdField_a_of_type_AndroidGraphicsRect;
      left = ((int)(left - (i1 * 1.1F - i1) / 2.0F));
      localObject = jdField_a_of_type_AndroidGraphicsRect;
      float f1 = right;
      right = ((int)((i1 * 1.1F - i1) / 2.0F + f1));
      localObject = jdField_a_of_type_AndroidGraphicsRect;
      bottom = ((int)(bottom + (i2 * 1.1F - i2) / 2.0F));
      localObject = jdField_a_of_type_AndroidGraphicsRect;
      top = ((int)(top - (i2 * 1.1F - i2) / 2.0F));
      n = ((int)(Math.min(jdField_a_of_type_AndroidGraphicsRect.width(), jdField_a_of_type_AndroidGraphicsRect.height()) * 0.8D));
      if (n > j) {
        n = j;
      }
      jdField_a_of_type_AndroidViewView = paramView;
      k = 0;
      m = paramInt;
      paramView.setVisibility(4);
      invalidate();
      a(false);
      if (QLog.isColorLevel()) {
        QLog.d("Drag", 2, "init:" + jdField_a_of_type_AndroidGraphicsRect);
      }
    }
  }
  
  public void a(DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener)
  {
    if ((paramOnDragModeChangedListener != null) && (jdField_a_of_type_JavaUtilList.contains(paramOnDragModeChangedListener))) {
      jdField_a_of_type_JavaUtilList.remove(paramOnDragModeChangedListener);
    }
  }
  
  public void a(DragFrameLayout.OnDragModeChangedListener paramOnDragModeChangedListener, boolean paramBoolean)
  {
    if ((paramOnDragModeChangedListener != null) && (!jdField_a_of_type_JavaUtilList.contains(paramOnDragModeChangedListener)))
    {
      if (!paramBoolean) {
        jdField_a_of_type_JavaUtilList.add(paramOnDragModeChangedListener);
      }
    }
    else {
      return;
    }
    jdField_a_of_type_JavaUtilList.add(0, paramOnDragModeChangedListener);
  }
  
  public void dispatchDraw(Canvas paramCanvas)
  {
    try
    {
      super.dispatchDraw(paramCanvas);
      a(paramCanvas);
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  public boolean dispatchTouchEvent(MotionEvent paramMotionEvent)
  {
    boolean bool2 = true;
    boolean bool1;
    if (k == -1)
    {
      if ((paramMotionEvent.getAction() == 0) && (QLog.isColorLevel())) {
        QLog.d("Drag", 2, "Host.dispatchTouchEvent: Down At<" + paramMotionEvent.getX() + ", " + paramMotionEvent.getY() + ">");
      }
      bool1 = super.dispatchTouchEvent(paramMotionEvent);
    }
    float f1;
    float f2;
    do
    {
      do
      {
        int i1;
        do
        {
          do
          {
            do
            {
              return bool1;
              f1 = paramMotionEvent.getX();
              f2 = paramMotionEvent.getY();
              i1 = paramMotionEvent.getAction();
              if ((i1 != 3) && (i1 != 1)) {
                break;
              }
              if (k == 0)
              {
                b = null;
                jdField_a_of_type_AndroidViewView.setVisibility(0);
                jdField_a_of_type_AndroidViewView = null;
                k = -1;
                invalidate();
                a(false);
                return true;
              }
              if (k == 1)
              {
                k = 3;
                jdField_a_of_type_AndroidGraphicsPointF.set(f1, f2);
                paramMotionEvent = new RectF(jdField_a_of_type_AndroidGraphicsRect.centerX(), jdField_a_of_type_AndroidGraphicsRect.centerY(), jdField_a_of_type_AndroidGraphicsPointF.x, jdField_a_of_type_AndroidGraphicsPointF.y);
                jdField_a_of_type_Mhz = new mhz(this, new PointF(jdField_a_of_type_AndroidGraphicsRect.centerX(), jdField_a_of_type_AndroidGraphicsRect.centerY()), paramMotionEvent);
                invalidate();
                return true;
              }
              bool1 = bool2;
            } while (k == 3);
            if (k == 2)
            {
              if ((float)Math.sqrt((f1 - jdField_a_of_type_AndroidGraphicsRect.centerX()) * (f1 - jdField_a_of_type_AndroidGraphicsRect.centerX()) + (f2 - jdField_a_of_type_AndroidGraphicsRect.centerY()) * (f2 - jdField_a_of_type_AndroidGraphicsRect.centerY())) < (n + h) / 2)
              {
                b = null;
                jdField_a_of_type_AndroidViewView.setVisibility(0);
                jdField_a_of_type_AndroidViewView = null;
                k = -1;
                a(false);
              }
              for (;;)
              {
                invalidate();
                return true;
                k = 4;
                jdField_a_of_type_AndroidGraphicsPointF.set(f1, f2);
                jdField_a_of_type_Mhy = new mhy(this, jdField_a_of_type_AndroidGraphicsPointF);
              }
            }
            bool1 = bool2;
          } while (k != 4);
          return true;
          bool1 = bool2;
        } while (i1 != 2);
        if ((k == 0) || (k == 1))
        {
          float f3 = (float)Math.sqrt((f1 - jdField_a_of_type_AndroidGraphicsRect.centerX()) * (f1 - jdField_a_of_type_AndroidGraphicsRect.centerX()) + (f2 - jdField_a_of_type_AndroidGraphicsRect.centerY()) * (f2 - jdField_a_of_type_AndroidGraphicsRect.centerY()));
          if (f3 >= n + h)
          {
            d = f3;
            jdField_a_of_type_AndroidGraphicsPointF.set(f1, f2);
            k = 2;
          }
          for (;;)
          {
            invalidate();
            return true;
            if (f3 >= 0.0F)
            {
              d = f3;
              jdField_a_of_type_AndroidGraphicsPointF.set(f1, f2);
              k = 1;
            }
            else
            {
              k = 0;
            }
          }
        }
        bool1 = bool2;
      } while (k == 3);
      bool1 = bool2;
    } while (k != 2);
    jdField_a_of_type_AndroidGraphicsPointF.set(f1, f2);
    invalidate();
    return true;
  }
  
  public void setDragViewProvider(DragFrameLayout.IDragViewProvider paramIDragViewProvider)
  {
    jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout$IDragViewProvider = paramIDragViewProvider;
  }
}
