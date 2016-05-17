import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.PointF;
import android.graphics.Rect;
import android.view.View;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.List;

public class mhx
  implements Runnable
{
  public static final int a = 40;
  private List jdField_a_of_type_JavaUtilList;
  private int b;
  
  public mhx(DragFrameLayout paramDragFrameLayout, List paramList)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaUtilList = new ArrayList(paramList);
    b = -1;
  }
  
  public Bitmap a()
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (b >= 0)
    {
      localObject1 = localObject2;
      if (b >= DragFrameLayout.a().length) {}
    }
    try
    {
      localObject1 = BitmapFactory.decodeResource(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout.getResources(), DragFrameLayout.a()[b]);
      return localObject1;
    }
    catch (OutOfMemoryError localOutOfMemoryError)
    {
      do
      {
        localObject1 = localObject2;
      } while (!QLog.isColorLevel());
      QLog.e("DragRelativeLayout", 2, "decodeBitmap failed" + localOutOfMemoryError, localOutOfMemoryError);
    }
    return null;
  }
  
  public PointF a()
  {
    PointF localPointF = new PointF();
    if (jdField_a_of_type_JavaUtilList.size() > 0)
    {
      View localView = (View)jdField_a_of_type_JavaUtilList.get(0);
      Rect localRect = new Rect();
      jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout.getGlobalVisibleRect(localRect);
      int i = left;
      int j = top;
      localView.getGlobalVisibleRect(localRect);
      left -= i;
      top -= j;
      right -= i;
      bottom -= j;
      localPointF.set(localRect.centerX(), localRect.centerY());
    }
    return localPointF;
  }
  
  public void run()
  {
    if (jdField_a_of_type_JavaUtilList.size() == 0)
    {
      if (this == DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout)) {
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, null);
      }
      DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, -1);
      if (QLog.isColorLevel()) {
        QLog.d("Drag", 2, "DONE!");
      }
      DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, true);
    }
    for (;;)
    {
      jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout.invalidate();
      return;
      View localView = (View)jdField_a_of_type_JavaUtilList.get(0);
      if (b == DragFrameLayout.a().length)
      {
        jdField_a_of_type_JavaUtilList.remove(0);
        b = -1;
      }
      else
      {
        localView.setVisibility(4);
        b += 1;
      }
    }
  }
}
