import android.content.res.Resources;
import android.graphics.PointF;
import android.graphics.RectF;
import android.util.DisplayMetrics;
import android.view.View;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class mhz
  implements Runnable
{
  public static final int a = 60;
  private float jdField_a_of_type_Float;
  private PointF jdField_a_of_type_AndroidGraphicsPointF;
  private RectF jdField_a_of_type_AndroidGraphicsRectF;
  private boolean jdField_a_of_type_Boolean;
  private int jdField_b_of_type_Int;
  private PointF jdField_b_of_type_AndroidGraphicsPointF;
  private int c;
  private int d;
  
  public mhz(DragFrameLayout paramDragFrameLayout, PointF paramPointF, RectF paramRectF)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_b_of_type_Int = 9;
    c = 20;
    jdField_b_of_type_Int = ((int)(jdField_b_of_type_Int * getResourcesgetDisplayMetricsdensity));
    c = ((int)(c * getResourcesgetDisplayMetricsdensity));
    jdField_a_of_type_AndroidGraphicsPointF = new PointF(x, y);
    jdField_b_of_type_AndroidGraphicsPointF = new PointF(jdField_a_of_type_AndroidGraphicsPointF.x, jdField_a_of_type_AndroidGraphicsPointF.y);
    jdField_a_of_type_AndroidGraphicsRectF = paramRectF;
    jdField_a_of_type_Float = ((float)Math.sqrt(jdField_a_of_type_AndroidGraphicsRectF.width() * jdField_a_of_type_AndroidGraphicsRectF.width() + jdField_a_of_type_AndroidGraphicsRectF.height() * jdField_a_of_type_AndroidGraphicsRectF.height()));
    if (jdField_a_of_type_Float <= 0.01D)
    {
      d = 0;
      return;
    }
    c = ((int)(c * jdField_a_of_type_Float / DragFrameLayout.b(paramDragFrameLayout)));
    jdField_b_of_type_Int = ((int)(jdField_b_of_type_Int * jdField_a_of_type_Float / DragFrameLayout.b(paramDragFrameLayout)));
    d = (-c);
  }
  
  public PointF a()
  {
    return jdField_b_of_type_AndroidGraphicsPointF;
  }
  
  public void a()
  {
    jdField_a_of_type_Boolean = true;
  }
  
  public void run()
  {
    if (jdField_a_of_type_Boolean) {
      return;
    }
    if ((Math.abs(d) < jdField_b_of_type_Int) || (jdField_b_of_type_Int == 0)) {
      if (DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout) == this)
      {
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, null);
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, -1);
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, null);
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout).setVisibility(0);
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, null);
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, false);
      }
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout.invalidate();
      return;
      jdField_b_of_type_AndroidGraphicsPointF.x = (jdField_a_of_type_AndroidGraphicsPointF.x + d * jdField_a_of_type_AndroidGraphicsRectF.width() / jdField_a_of_type_Float);
      jdField_b_of_type_AndroidGraphicsPointF.y = (jdField_a_of_type_AndroidGraphicsPointF.y + d * jdField_a_of_type_AndroidGraphicsRectF.height() / jdField_a_of_type_Float);
      if (d < 0) {
        d = (-d - jdField_b_of_type_Int);
      } else {
        d = (-d + jdField_b_of_type_Int);
      }
    }
  }
}
