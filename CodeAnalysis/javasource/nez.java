import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.DashPathEffect;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Align;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Message;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.Toast;
import com.tencent.mobileqq.app.ScreenShot;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.ReportController;
import com.tencent.qphone.base.util.QLog;

public class nez
  extends View
{
  int jdField_a_of_type_Int;
  public Bitmap a;
  final Matrix jdField_a_of_type_AndroidGraphicsMatrix;
  final Paint jdField_a_of_type_AndroidGraphicsPaint;
  public final Rect a;
  boolean jdField_a_of_type_Boolean;
  int jdField_b_of_type_Int;
  final Matrix jdField_b_of_type_AndroidGraphicsMatrix;
  final Paint jdField_b_of_type_AndroidGraphicsPaint;
  final Rect jdField_b_of_type_AndroidGraphicsRect;
  int c;
  int d;
  int e;
  public int f;
  
  public nez(ScreenShot paramScreenShot, Context paramContext)
  {
    super(paramContext);
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsPaint = new Paint();
    jdField_b_of_type_AndroidGraphicsPaint = new Paint();
    jdField_a_of_type_AndroidGraphicsRect = new Rect();
    jdField_b_of_type_AndroidGraphicsRect = new Rect();
    jdField_a_of_type_AndroidGraphicsMatrix = new Matrix();
    jdField_b_of_type_AndroidGraphicsMatrix = new Matrix();
    setLongClickable(true);
  }
  
  public void a(boolean paramBoolean)
  {
    Object localObject;
    if (paramBoolean)
    {
      if (jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidGraphicsBitmap != null) {
        break label242;
      }
      localObject = new Rect();
      jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidViewWindow.getDecorView().getWindowVisibleDisplayFrame((Rect)localObject);
    }
    label236:
    label242:
    for (int i = top;; i = 0)
    {
      if (jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap != null)
      {
        if (jdField_a_of_type_AndroidGraphicsMatrix.isIdentity()) {
          jdField_a_of_type_AndroidGraphicsRect.set(0, i, jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getWidth(), jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getHeight());
        }
      }
      else
      {
        if (jdField_a_of_type_AndroidGraphicsRect.isEmpty())
        {
          jdField_a_of_type_AndroidGraphicsRect.left = getLeft();
          jdField_a_of_type_AndroidGraphicsRect.right = getRight();
          jdField_a_of_type_AndroidGraphicsRect.top = getTop();
          jdField_a_of_type_AndroidGraphicsRect.bottom = getBottom();
        }
        if ((jdField_a_of_type_AndroidGraphicsRect.width() > 0) && (jdField_a_of_type_AndroidGraphicsRect.height() > 0))
        {
          jdField_a_of_type_Boolean = true;
          if (!paramBoolean) {
            break label236;
          }
        }
      }
      for (localObject = "1";; localObject = "0")
      {
        ReportController.b(null, "CliOper", "", "", "0X8005007", "0X8005007", 0, 0, (String)localObject, "", "", "");
        invalidate();
        return;
        jdField_a_of_type_AndroidGraphicsRect.set(i, 0, jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getHeight(), jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getWidth());
        break;
      }
    }
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    Object localObject;
    float f1;
    if (jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidGraphicsBitmap != null)
    {
      jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap = jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidGraphicsBitmap;
      jdField_a_of_type_AndroidGraphicsMatrix.reset();
      localObject = getResources().getDisplayMetrics();
      jdField_a_of_type_AndroidGraphicsMatrix.reset();
      if ((heightPixels == jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getWidth()) && (widthPixels == jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getHeight()))
      {
        jdField_a_of_type_AndroidGraphicsMatrix.postTranslate(-jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getWidth() / 2, -jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getHeight() / 2);
        jdField_a_of_type_AndroidGraphicsMatrix.postRotate(90.0F);
        jdField_a_of_type_AndroidGraphicsMatrix.postTranslate(jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getHeight() / 2, jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getWidth() / 2);
      }
      if (jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap != null) {
        paramCanvas.drawBitmap(jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap, jdField_a_of_type_AndroidGraphicsMatrix, jdField_a_of_type_AndroidGraphicsPaint);
      }
      if ((f == 0) || (f == 100001)) {
        break label833;
      }
      jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(3.0F);
      localObject = jdField_a_of_type_AndroidGraphicsPaint;
      i = e + 1;
      e = i;
      f1 = i;
      ((Paint)localObject).setPathEffect(new DashPathEffect(new float[] { 15.0F, 5.0F, 8.0F, 5.0F }, f1));
      invalidate();
      jdField_a_of_type_AndroidGraphicsPaint.setColor(48689);
      if (jdField_a_of_type_AndroidGraphicsRect.left > jdField_a_of_type_AndroidGraphicsRect.right)
      {
        i = jdField_a_of_type_AndroidGraphicsRect.left;
        jdField_a_of_type_AndroidGraphicsRect.left = jdField_a_of_type_AndroidGraphicsRect.right;
        jdField_a_of_type_AndroidGraphicsRect.right = i;
      }
      if (jdField_a_of_type_AndroidGraphicsRect.top > jdField_a_of_type_AndroidGraphicsRect.bottom)
      {
        i = jdField_a_of_type_AndroidGraphicsRect.top;
        jdField_a_of_type_AndroidGraphicsRect.top = jdField_a_of_type_AndroidGraphicsRect.bottom;
        jdField_a_of_type_AndroidGraphicsRect.bottom = i;
      }
      if ((!jdField_a_of_type_Boolean) || (jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap == null)) {
        break label959;
      }
      jdField_a_of_type_Boolean = false;
    }
    label833:
    label959:
    do
    {
      try
      {
        jdField_a_of_type_AndroidGraphicsBitmap = Bitmap.createBitmap(jdField_a_of_type_AndroidGraphicsRect.width(), jdField_a_of_type_AndroidGraphicsRect.height(), Bitmap.Config.ARGB_8888);
        localObject = new Canvas(jdField_a_of_type_AndroidGraphicsBitmap);
        jdField_b_of_type_AndroidGraphicsMatrix.reset();
        jdField_b_of_type_AndroidGraphicsMatrix.postConcat(jdField_a_of_type_AndroidGraphicsMatrix);
        jdField_b_of_type_AndroidGraphicsMatrix.postTranslate(-jdField_a_of_type_AndroidGraphicsRect.left, -jdField_a_of_type_AndroidGraphicsRect.top);
        if (jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap != null) {
          ((Canvas)localObject).drawBitmap(jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap, jdField_b_of_type_AndroidGraphicsMatrix, jdField_a_of_type_AndroidGraphicsPaint);
        }
        jdField_a_of_type_AndroidGraphicsPaint.setColor(Integer.MIN_VALUE);
        jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.FILL);
        paramCanvas.drawRect(0.0F, 0.0F, getWidth(), getHeight(), jdField_a_of_type_AndroidGraphicsPaint);
        ScreenShot.a(jdField_a_of_type_ComTencentMobileqqAppScreenShot);
        if (jdField_a_of_type_AndroidGraphicsBitmap == null)
        {
          Toast.makeText(jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidContentContext.getApplicationContext(), 2131367881, 1).show();
          return;
          i = getWidth();
          j = getHeight();
          if ((jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsBitmap == null) && (i > 0) && (j > 0)) {}
          try
          {
            jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsBitmap = Bitmap.createBitmap(i, j, Bitmap.Config.ARGB_8888);
            if (jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsBitmap != null)
            {
              localObject = new Canvas(jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsBitmap);
              jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidViewWindow.getDecorView().draw((Canvas)localObject);
              jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap = jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsBitmap;
            }
            jdField_a_of_type_AndroidGraphicsMatrix.reset();
            if ((jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap == null) || (jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getWidth() == i)) {
              break;
            }
            jdField_a_of_type_AndroidGraphicsMatrix.postTranslate(-jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getWidth() / 2, -jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getHeight() / 2);
            jdField_a_of_type_AndroidGraphicsMatrix.postRotate(90.0F);
            jdField_a_of_type_AndroidGraphicsMatrix.postTranslate(jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getHeight() / 2, jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidGraphicsBitmap.getWidth() / 2);
          }
          catch (Throwable localThrowable1)
          {
            for (;;)
            {
              if (QLog.isColorLevel()) {
                QLog.d("mqq", 2, "", localThrowable1);
              }
            }
          }
          jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(1.0F);
          jdField_a_of_type_AndroidGraphicsPaint.setPathEffect(null);
          e = 0;
        }
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.d("ScreenShot", 2, jdField_a_of_type_AndroidGraphicsRect.width() + ":" + jdField_a_of_type_AndroidGraphicsRect.height(), localIllegalArgumentException);
          }
        }
      }
      catch (Throwable localThrowable2)
      {
        for (;;)
        {
          jdField_a_of_type_AndroidGraphicsBitmap = null;
          if (QLog.isColorLevel()) {
            QLog.d("ScreenShot", 2, "", localThrowable2);
          }
        }
        ScreenShot.a(jdField_a_of_type_ComTencentMobileqqAppScreenShot).obtainMessage(2, 0, 0, this).sendToTarget();
        return;
      }
      jdField_a_of_type_AndroidGraphicsPaint.setColor(Integer.MIN_VALUE);
      jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.FILL);
      paramCanvas.drawRect(0.0F, 0.0F, getWidth(), jdField_a_of_type_AndroidGraphicsRect.top, jdField_a_of_type_AndroidGraphicsPaint);
      paramCanvas.drawRect(0.0F, jdField_a_of_type_AndroidGraphicsRect.bottom, getWidth(), getHeight(), jdField_a_of_type_AndroidGraphicsPaint);
      paramCanvas.drawRect(0.0F, jdField_a_of_type_AndroidGraphicsRect.top, jdField_a_of_type_AndroidGraphicsRect.left, jdField_a_of_type_AndroidGraphicsRect.bottom, jdField_a_of_type_AndroidGraphicsPaint);
      paramCanvas.drawRect(jdField_a_of_type_AndroidGraphicsRect.right, jdField_a_of_type_AndroidGraphicsRect.top, getWidth(), jdField_a_of_type_AndroidGraphicsRect.bottom, jdField_a_of_type_AndroidGraphicsPaint);
      jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.STROKE);
      jdField_a_of_type_AndroidGraphicsPaint.setColor(48689);
      paramCanvas.drawRect(jdField_a_of_type_AndroidGraphicsRect, jdField_a_of_type_AndroidGraphicsPaint);
      if (jdField_a_of_type_AndroidGraphicsRect.isEmpty())
      {
        i = getWidth() / 2 - jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth() / 2;
        j = getHeight() / 2 - jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicHeight() / 2;
        k = jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth();
        m = jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicHeight() + j;
        f1 = getResourcesgetDisplayMetricsdensity;
        jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidGraphicsDrawableDrawable.setBounds(i, j, k + i, m);
        jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidGraphicsDrawableDrawable.draw(paramCanvas);
        jdField_b_of_type_AndroidGraphicsPaint.setTextSize(20.0F * getResourcesgetDisplayMetricsscaledDensity);
        jdField_b_of_type_AndroidGraphicsPaint.setAntiAlias(true);
        jdField_b_of_type_AndroidGraphicsPaint.setTextAlign(Paint.Align.CENTER);
        jdField_b_of_type_AndroidGraphicsPaint.setColor(-1);
        jdField_b_of_type_AndroidGraphicsPaint.setShadowLayer(2.0F, 0.0F, 2.0F * f1, Integer.MIN_VALUE);
        paramCanvas.drawText(jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidContentContext.getString(2131367879), getWidth() / 2, m + 26.0F * f1, jdField_b_of_type_AndroidGraphicsPaint);
      }
    } while ((f == 100001) || (f == 0));
    jdField_a_of_type_AndroidGraphicsPaint.setStyle(Paint.Style.FILL);
    int k = jdField_a_of_type_AndroidGraphicsRect.left - jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth() / 2;
    int i = jdField_a_of_type_AndroidGraphicsRect.top - jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicHeight() / 2;
    int m = jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth();
    int j = jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicHeight() + i;
    jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.setBounds(k, i, m + k, j);
    jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.draw(paramCanvas);
    k = jdField_a_of_type_AndroidGraphicsRect.right - jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth() / 2;
    m = jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth() + k;
    jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.setBounds(k, i, m, j);
    jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.draw(paramCanvas);
    i = jdField_a_of_type_AndroidGraphicsRect.bottom - jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicHeight() / 2;
    j = jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicHeight() + i;
    jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.setBounds(k, i, m, j);
    jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.draw(paramCanvas);
    k = jdField_a_of_type_AndroidGraphicsRect.left - jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth() / 2;
    m = jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.getIntrinsicWidth();
    jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.setBounds(k, i, m + k, j);
    jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidGraphicsDrawableDrawable.draw(paramCanvas);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    switch (paramMotionEvent.getAction())
    {
    default: 
      return super.onTouchEvent(paramMotionEvent);
    case 0: 
      jdField_a_of_type_Int = ((int)paramMotionEvent.getX());
      jdField_b_of_type_Int = ((int)paramMotionEvent.getY());
      if (!jdField_a_of_type_AndroidGraphicsRect.isEmpty()) {
        if (jdField_a_of_type_AndroidGraphicsRect.contains(jdField_a_of_type_Int, jdField_b_of_type_Int)) {
          f = 100004;
        }
      }
      for (;;)
      {
        invalidate();
        break;
        if (new Rect(jdField_a_of_type_AndroidGraphicsRect.left - 20, jdField_a_of_type_AndroidGraphicsRect.top - 20, jdField_a_of_type_AndroidGraphicsRect.right + 20, jdField_a_of_type_AndroidGraphicsRect.bottom + 20).contains(jdField_a_of_type_Int, jdField_b_of_type_Int))
        {
          f = 100005;
          jdField_b_of_type_AndroidGraphicsRect.set(jdField_a_of_type_AndroidGraphicsRect);
        }
        else
        {
          jdField_a_of_type_AndroidGraphicsRect.setEmpty();
          f = 100001;
          jdField_a_of_type_AndroidGraphicsPaint.setStrokeWidth(1.0F);
          jdField_a_of_type_AndroidGraphicsPaint.setPathEffect(null);
          ScreenShot.a(jdField_a_of_type_ComTencentMobileqqAppScreenShot, false);
          continue;
          f = 100001;
          ScreenShot.a(jdField_a_of_type_ComTencentMobileqqAppScreenShot, false);
        }
      }
    case 1: 
      if (Math.abs(jdField_a_of_type_AndroidGraphicsRect.width()) < 5) {
        jdField_a_of_type_AndroidGraphicsRect.setEmpty();
      }
      break;
    }
    for (int i = 1;; i = 0)
    {
      if (i == 0)
      {
        f = 100002;
        ScreenShot.a(jdField_a_of_type_ComTencentMobileqqAppScreenShot, true);
      }
      for (;;)
      {
        invalidate();
        break;
        f = 0;
        ScreenShot.a(jdField_a_of_type_ComTencentMobileqqAppScreenShot, false);
      }
      c = ((int)paramMotionEvent.getX());
      d = ((int)paramMotionEvent.getY());
      int j;
      Rect localRect;
      if (f == 100004)
      {
        i = c - jdField_a_of_type_Int;
        j = d - jdField_b_of_type_Int;
        jdField_a_of_type_Int = c;
        jdField_b_of_type_Int = d;
        if ((jdField_a_of_type_AndroidGraphicsRect.left + i >= 0) && (jdField_a_of_type_AndroidGraphicsRect.right + i <= getWidth()))
        {
          localRect = jdField_a_of_type_AndroidGraphicsRect;
          left += i;
          localRect = jdField_a_of_type_AndroidGraphicsRect;
          right = (i + right);
        }
        if ((jdField_a_of_type_AndroidGraphicsRect.top + j >= 0) && (jdField_a_of_type_AndroidGraphicsRect.bottom + j <= getHeight()))
        {
          localRect = jdField_a_of_type_AndroidGraphicsRect;
          top += j;
          localRect = jdField_a_of_type_AndroidGraphicsRect;
          bottom = (j + bottom);
        }
      }
      for (;;)
      {
        jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_a_of_type_AndroidWidgetButton.setVisibility(8);
        jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_b_of_type_AndroidWidgetButton.setVisibility(8);
        jdField_a_of_type_ComTencentMobileqqAppScreenShot.jdField_c_of_type_AndroidWidgetButton.setVisibility(8);
        jdField_a_of_type_ComTencentMobileqqAppScreenShot.d.setVisibility(8);
        invalidate();
        break;
        if (f == 100001)
        {
          jdField_a_of_type_AndroidGraphicsRect.left = jdField_a_of_type_Int;
          jdField_a_of_type_AndroidGraphicsRect.top = jdField_b_of_type_Int;
          jdField_a_of_type_AndroidGraphicsRect.right = c;
          jdField_a_of_type_AndroidGraphicsRect.bottom = d;
        }
        else if (f == 100005)
        {
          i = c - jdField_a_of_type_Int;
          j = d - jdField_b_of_type_Int;
          jdField_a_of_type_AndroidGraphicsRect.set(jdField_b_of_type_AndroidGraphicsRect);
          if (jdField_a_of_type_Int < jdField_a_of_type_AndroidGraphicsRect.left + jdField_a_of_type_AndroidGraphicsRect.width() / 2)
          {
            localRect = jdField_a_of_type_AndroidGraphicsRect;
            left = (i + left);
            jdField_a_of_type_AndroidGraphicsRect.left = Math.max(jdField_a_of_type_AndroidGraphicsRect.left, 0);
          }
          for (;;)
          {
            if (jdField_b_of_type_Int >= jdField_a_of_type_AndroidGraphicsRect.top + jdField_a_of_type_AndroidGraphicsRect.height() / 2) {
              break label812;
            }
            localRect = jdField_a_of_type_AndroidGraphicsRect;
            top = (j + top);
            jdField_a_of_type_AndroidGraphicsRect.top = Math.max(jdField_a_of_type_AndroidGraphicsRect.top, 0);
            break;
            localRect = jdField_a_of_type_AndroidGraphicsRect;
            right = (i + right);
            jdField_a_of_type_AndroidGraphicsRect.right = Math.min(jdField_a_of_type_AndroidGraphicsRect.right, getWidth());
          }
          label812:
          localRect = jdField_a_of_type_AndroidGraphicsRect;
          bottom = (j + bottom);
          jdField_a_of_type_AndroidGraphicsRect.bottom = Math.min(jdField_a_of_type_AndroidGraphicsRect.bottom, getHeight());
        }
      }
    }
  }
}
