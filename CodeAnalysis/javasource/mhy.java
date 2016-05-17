import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.PointF;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout;
import com.tencent.mobileqq.activity.recent.cur.DragFrameLayout.IDragViewProvider;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.util.List;

public class mhy
  implements Runnable
{
  public static final int a = 50;
  private PointF jdField_a_of_type_AndroidGraphicsPointF;
  private int b;
  
  public mhy(DragFrameLayout paramDragFrameLayout, PointF paramPointF)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_AndroidGraphicsPointF = new PointF();
    jdField_a_of_type_AndroidGraphicsPointF.set(paramPointF);
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
  
  public void run()
  {
    if (b == DragFrameLayout.a().length)
    {
      if (this == DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout)) {
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, null);
      }
      DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, null);
      if (DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout) == 2) {
        if (DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout) == null) {
          break label224;
        }
      }
    }
    label224:
    for (List localList = DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout).b();; localList = null)
    {
      if ((DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout) != null) && (localList != null) && (localList.size() > 0))
      {
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, 5);
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, new mhx(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, localList));
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, null);
      }
      for (;;)
      {
        jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout.invalidate();
        return;
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, -1);
        if (QLog.isColorLevel()) {
          QLog.d("Drag", 2, "DONE!");
        }
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, true);
        break;
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, -1);
        if (QLog.isColorLevel()) {
          QLog.d("Drag", 2, "DONE!");
        }
        DragFrameLayout.a(jdField_a_of_type_ComTencentMobileqqActivityRecentCurDragFrameLayout, true);
        break;
        b += 1;
      }
    }
  }
}
