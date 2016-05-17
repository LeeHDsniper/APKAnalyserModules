package com.tencent.mobileqq.activity.aio.item;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PaintFlagsDrawFilter;
import android.graphics.Path;
import android.graphics.Path.Direction;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.tencent.ark.ark.Container;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.lang.ref.WeakReference;
import kvc;

public class ArkUIView
  extends View
  implements ArkContainerWrapper.OnArkContainerEventListener, ArkRelativeLayout.LayoutListener
{
  private static Paint jdField_a_of_type_AndroidGraphicsPaint;
  private static PaintFlagsDrawFilter jdField_a_of_type_AndroidGraphicsPaintFlagsDrawFilter = new PaintFlagsDrawFilter(0, 3);
  private static final String jdField_a_of_type_JavaLangString = "ArkApp";
  private float jdField_a_of_type_Float = 1.0F;
  private Bitmap jdField_a_of_type_AndroidGraphicsBitmap;
  private Canvas jdField_a_of_type_AndroidGraphicsCanvas;
  private Path jdField_a_of_type_AndroidGraphicsPath = new Path();
  private Rect jdField_a_of_type_AndroidGraphicsRect = new Rect();
  public WeakReference a;
  private Rect b;
  public WeakReference b;
  private Rect c = new Rect();
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public ArkUIView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    jdField_b_of_type_AndroidGraphicsRect = new Rect();
    if (jdField_a_of_type_AndroidGraphicsPaint == null)
    {
      jdField_a_of_type_AndroidGraphicsPaint = new Paint(1);
      jdField_a_of_type_AndroidGraphicsPaint.setColor(0);
      jdField_a_of_type_AndroidGraphicsPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
    }
    if ((Build.VERSION.SDK_INT <= 18) && (Build.VERSION.SDK_INT >= 11)) {
      setLayerType(1, null);
    }
  }
  
  private boolean b(Rect paramRect)
  {
    ArkContainerWrapper localArkContainerWrapper = (ArkContainerWrapper)jdField_a_of_type_JavaLangRefWeakReference.get();
    if (localArkContainerWrapper == null) {
      return false;
    }
    paramRect = localArkContainerWrapper.b(paramRect);
    float f = localArkContainerWrapper.a();
    int i = (int)(paramRect.width() * f);
    int j = (int)(paramRect.height() * f);
    if ((i <= 0) || (j <= 0))
    {
      QLog.e("ArkUIView.createCanvas.createBitmap failed", 1, String.format("newWidth: %d newHeight:%d", new Object[] { Integer.valueOf(i), Integer.valueOf(j) }));
      return false;
    }
    if ((jdField_a_of_type_AndroidGraphicsBitmap == null) || (c.width() != i) || (c.height() != j))
    {
      c.set(0, 0, i, j);
      if ((jdField_a_of_type_AndroidGraphicsBitmap != null) && (!jdField_a_of_type_AndroidGraphicsBitmap.isRecycled()))
      {
        localArkContainerWrapper.a(jdField_a_of_type_AndroidGraphicsBitmap);
        jdField_a_of_type_AndroidGraphicsBitmap.recycle();
        jdField_a_of_type_AndroidGraphicsBitmap = null;
      }
      try
      {
        jdField_a_of_type_AndroidGraphicsBitmap = Bitmap.createBitmap(i, j, Bitmap.Config.ARGB_8888);
        paramRect = new RectF(0.0F, 0.0F, i, j);
        jdField_a_of_type_AndroidGraphicsCanvas = new Canvas(jdField_a_of_type_AndroidGraphicsBitmap);
        jdField_a_of_type_AndroidGraphicsPath.reset();
        jdField_a_of_type_AndroidGraphicsPath.addRect(paramRect, Path.Direction.CW);
        jdField_a_of_type_AndroidGraphicsPath.addRoundRect(paramRect, jdField_a_of_type_Float * 10.0F, jdField_a_of_type_Float * 10.0F, Path.Direction.CCW);
        localArkContainerWrapper.a(jdField_a_of_type_AndroidGraphicsBitmap);
        return true;
      }
      catch (OutOfMemoryError paramRect)
      {
        QLog.e("ArkUIView.createCanvas.createBitmap", 2, paramRect.getMessage());
        return false;
      }
    }
    return false;
  }
  
  private void d()
  {
    if ((jdField_b_of_type_JavaLangRefWeakReference != null) && (jdField_b_of_type_JavaLangRefWeakReference.get() != null))
    {
      ((View)jdField_b_of_type_JavaLangRefWeakReference.get()).setVisibility(8);
      setVisibility(0);
    }
  }
  
  private void e()
  {
    if ((jdField_a_of_type_JavaLangRefWeakReference != null) && (jdField_a_of_type_JavaLangRefWeakReference.get() != null))
    {
      ArkContainerWrapper localArkContainerWrapper = (ArkContainerWrapper)jdField_a_of_type_JavaLangRefWeakReference.get();
      if ((jdField_a_of_type_AndroidGraphicsBitmap != null) && (!jdField_a_of_type_AndroidGraphicsBitmap.isRecycled())) {
        localArkContainerWrapper.a(jdField_a_of_type_AndroidGraphicsBitmap);
      }
      localArkContainerWrapper.a(null);
      jdField_a_of_type_JavaLangRefWeakReference.clear();
      jdField_a_of_type_JavaLangRefWeakReference = null;
    }
  }
  
  private void f()
  {
    Object localObject;
    ark.Container localContainer;
    if ((jdField_a_of_type_JavaLangRefWeakReference != null) && (jdField_a_of_type_JavaLangRefWeakReference.get() != null))
    {
      localObject = (ArkContainerWrapper)jdField_a_of_type_JavaLangRefWeakReference.get();
      localContainer = ((ArkContainerWrapper)localObject).a();
      if (localContainer != null) {
        break label38;
      }
    }
    label38:
    do
    {
      return;
      if (b(jdField_a_of_type_AndroidGraphicsRect))
      {
        localObject = ((ArkContainerWrapper)localObject).b(jdField_a_of_type_AndroidGraphicsRect);
        localContainer.Paint(jdField_a_of_type_AndroidGraphicsBitmap, left, top, right, bottom);
        return;
      }
    } while ((jdField_a_of_type_AndroidGraphicsBitmap == null) || (jdField_a_of_type_AndroidGraphicsBitmap.isRecycled()) || (jdField_b_of_type_AndroidGraphicsRect.isEmpty()));
    localContainer.Paint(jdField_a_of_type_AndroidGraphicsBitmap, jdField_b_of_type_AndroidGraphicsRect.left, jdField_b_of_type_AndroidGraphicsRect.top, jdField_b_of_type_AndroidGraphicsRect.right, jdField_b_of_type_AndroidGraphicsRect.bottom);
    jdField_b_of_type_AndroidGraphicsRect.setEmpty();
  }
  
  public void a()
  {
    e();
    if (jdField_a_of_type_AndroidGraphicsBitmap != null)
    {
      jdField_a_of_type_AndroidGraphicsBitmap.recycle();
      jdField_a_of_type_AndroidGraphicsBitmap = null;
    }
  }
  
  public void a(Rect paramRect)
  {
    ArkContainerWrapper localArkContainerWrapper = (ArkContainerWrapper)jdField_a_of_type_JavaLangRefWeakReference.get();
    if (localArkContainerWrapper == null) {
      return;
    }
    d();
    paramRect = localArkContainerWrapper.a(paramRect);
    if (!paramRect.equals(jdField_a_of_type_AndroidGraphicsRect))
    {
      jdField_a_of_type_AndroidGraphicsRect.set(paramRect);
      measure(jdField_a_of_type_AndroidGraphicsRect.width(), jdField_a_of_type_AndroidGraphicsRect.height());
      requestLayout();
      return;
    }
    jdField_a_of_type_AndroidGraphicsRect.set(paramRect);
    invalidate(jdField_a_of_type_AndroidGraphicsRect);
  }
  
  public void a(ArkContainerWrapper paramArkContainerWrapper, View paramView)
  {
    e();
    paramView.setOnClickListener(new kvc(this));
    jdField_b_of_type_JavaLangRefWeakReference = new WeakReference(paramView);
    jdField_a_of_type_AndroidGraphicsRect.setEmpty();
    if (paramArkContainerWrapper != null)
    {
      jdField_a_of_type_JavaLangRefWeakReference = new WeakReference(paramArkContainerWrapper);
      paramArkContainerWrapper.a(this);
    }
  }
  
  public void a(boolean paramBoolean)
  {
    ArkContainerWrapper localArkContainerWrapper = (ArkContainerWrapper)jdField_a_of_type_JavaLangRefWeakReference.get();
    if (localArkContainerWrapper == null) {
      return;
    }
    jdField_a_of_type_Float = localArkContainerWrapper.b();
    if ((jdField_a_of_type_AndroidGraphicsBitmap != null) && (!jdField_a_of_type_AndroidGraphicsBitmap.isRecycled())) {
      localArkContainerWrapper.a(jdField_a_of_type_AndroidGraphicsBitmap);
    }
    if (paramBoolean)
    {
      d();
      jdField_a_of_type_AndroidGraphicsRect.set(localArkContainerWrapper.a(localArkContainerWrapper.a()));
      requestLayout();
      a(jdField_a_of_type_AndroidGraphicsRect);
      return;
    }
    c();
  }
  
  public boolean a(Canvas paramCanvas)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if (jdField_a_of_type_AndroidGraphicsBitmap != null)
    {
      bool1 = bool2;
      if (!jdField_a_of_type_AndroidGraphicsBitmap.isRecycled())
      {
        bool1 = bool2;
        if (!jdField_a_of_type_AndroidGraphicsRect.isEmpty())
        {
          jdField_a_of_type_AndroidGraphicsCanvas.drawPath(jdField_a_of_type_AndroidGraphicsPath, jdField_a_of_type_AndroidGraphicsPaint);
          paramCanvas.setDrawFilter(jdField_a_of_type_AndroidGraphicsPaintFlagsDrawFilter);
          paramCanvas.drawBitmap(jdField_a_of_type_AndroidGraphicsBitmap, c, jdField_a_of_type_AndroidGraphicsRect, null);
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public boolean a(Rect paramRect)
  {
    jdField_b_of_type_AndroidGraphicsRect.union(paramRect);
    ArkContainerWrapper localArkContainerWrapper = (ArkContainerWrapper)jdField_a_of_type_JavaLangRefWeakReference.get();
    if (localArkContainerWrapper != null) {
      invalidate(localArkContainerWrapper.a(paramRect));
    }
    return true;
  }
  
  public boolean a(View paramView, MotionEvent paramMotionEvent)
  {
    if ((jdField_a_of_type_JavaLangRefWeakReference != null) && (jdField_a_of_type_JavaLangRefWeakReference.get() != null)) {
      return ((ArkContainerWrapper)jdField_a_of_type_JavaLangRefWeakReference.get()).a(paramView, paramMotionEvent);
    }
    return false;
  }
  
  public void b()
  {
    if ((jdField_b_of_type_JavaLangRefWeakReference != null) && (jdField_b_of_type_JavaLangRefWeakReference.get() != null))
    {
      setVisibility(8);
      View localView2 = (View)jdField_b_of_type_JavaLangRefWeakReference.get();
      localView2.setVisibility(0);
      View localView1 = localView2.findViewById(2131297371);
      localView2 = localView2.findViewById(2131297374);
      requestLayout();
      if (localView1 != null) {
        localView1.setVisibility(0);
      }
      if (localView2 != null) {
        localView2.setVisibility(4);
      }
    }
  }
  
  public void c()
  {
    if ((jdField_b_of_type_JavaLangRefWeakReference != null) && (jdField_b_of_type_JavaLangRefWeakReference.get() != null))
    {
      setVisibility(8);
      View localView2 = (View)jdField_b_of_type_JavaLangRefWeakReference.get();
      localView2.setVisibility(0);
      View localView1 = localView2.findViewById(2131297371);
      localView2 = localView2.findViewById(2131297374);
      requestLayout();
      if (localView1 != null) {
        localView1.setVisibility(4);
      }
      if (localView2 != null) {
        localView2.setVisibility(0);
      }
    }
  }
  
  public void draw(Canvas paramCanvas)
  {
    f();
    a(paramCanvas);
  }
  
  public void finalize()
  {
    if ((jdField_a_of_type_JavaLangRefWeakReference != null) && (jdField_a_of_type_JavaLangRefWeakReference.get() != null) && (jdField_a_of_type_AndroidGraphicsBitmap != null) && (!jdField_a_of_type_AndroidGraphicsBitmap.isRecycled())) {
      QLog.e("ArkApp", 1, "ArkUIView.finalize.mBitmap is not been recycle!!");
    }
    super.finalize();
  }
  
  public void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    paramInt1 = paramInt3 - paramInt1;
    ArkContainerWrapper localArkContainerWrapper;
    if (jdField_a_of_type_AndroidGraphicsRect.width() != paramInt1)
    {
      localArkContainerWrapper = (ArkContainerWrapper)jdField_a_of_type_JavaLangRefWeakReference.get();
      if (localArkContainerWrapper != null) {}
    }
    else
    {
      return;
    }
    jdField_a_of_type_AndroidGraphicsRect.right = (paramInt1 + jdField_a_of_type_AndroidGraphicsRect.left);
    localArkContainerWrapper.a(localArkContainerWrapper.b(jdField_a_of_type_AndroidGraphicsRect));
  }
  
  public void onMeasure(int paramInt1, int paramInt2)
  {
    setMeasuredDimension(paramInt1, jdField_a_of_type_AndroidGraphicsRect.height());
  }
  
  public void onStartTemporaryDetach()
  {
    super.onStartTemporaryDetach();
    e();
  }
}
